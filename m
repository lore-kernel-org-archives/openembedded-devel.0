Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2046CC83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 12:53:48 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web10.13172.1752238418917506184
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 05:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=J+BTKe42;
 dkim=pass header.i=@bmw.de header.s=selector1 header.b=ntWmnQdS;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752238419; x=1783774419;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tkrwouaN7vQnLhgnAgfZ8Jt1OkBELhtdJgPM9Jx36YU=;
  b=J+BTKe42PVWnBfFQUV8caT7mWH5rfF0x3kddDtQVAGV0Kot/pB/twB8o
   gtWGXvZquJH/gEVLes3a03zsDXiRKikva7r+hBz+9PxlPr1O6PN1hqB9j
   3LOzs5NieZH5MSiFX2sznwSTqjyn8ODNrFApDRs9eyjQZejZOMoZt3U2Y
   E=;
X-CSE-ConnectionGUID: 7k0cJ4QBQHmpfVAYNZG7XA==
X-CSE-MsgGUID: XNh7Mh+JTTmgi6sdMENVxQ==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 14:53:34 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw4.muc with
 ESMTP/TLS; 11 Jul 2025 14:53:34 +0200
Received: from smucmp15a.bmwgroup.net (HELO smucmp15a.europe.bmw.corp)
 ([10.30.13.135]) by esabb6.muc with ESMTP/TLS; 11 Jul 2025 14:53:34 +0200
Received: from smucmp15h.europe.bmw.corp (2a03:1e80:a15:58f::1:4f) by
 smucmp15a.europe.bmw.corp (2a03:1e80:a15:58f::1:68) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 14:53:34 +0200
Received: from smucdzmp14.europe.bmw.corp (192.109.190.59) by
 smucmp15h.europe.bmw.corp (10.30.13.142) with Microsoft SMTP Server
 (version=TLS; Fri, 11 Jul 2025 14:53:34 +0200
Received: from outbound.mail.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.59) with Microsoft SMTP Server
 (version=TLS; Fri, 11 Jul 2025 14:53:34 +0200
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com (2603:10a6:10:43a::13) by
 DB3PR09MB6203.eurprd09.prod.outlook.com (2603:10a6:10:42a::5) with
 Microsoft SMTP Server (version=TLS; Fri, 11 Jul 2025 12:53:31 +0000
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779]) by DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779%6]) with mapi id 15.20.8857.026; Fri, 11 Jul 2025
 12:53:31 +0000
X-CSE-ConnectionGUID: 1+7u4VB7SUuvJ3L2dWUBuA==
X-CSE-MsgGUID: hs1plMfFSIaFxFCtKOm9fg==
X-CSE-ConnectionGUID: rf0pef+jRcCz+RQpIbXKZQ==
X-CSE-MsgGUID: GNpmudCORguDGJnUp/aXSQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qE9eBxZ5zNFgUrXLOEd/ya/qCxMlH89hugbInw/bG+EKIXHuKUR+iuxHN2dZSppCKD/ISBx2jwRyrrPyD9lVFKARB2eQPgl8smdxXOmlShybiD8GJG4I8J8ELz876ofVEou9+kYSnM4n7/+163UzFKv8EegxyiGF8jnQP1xn9pqBtfVcpq6B/3z4ft4b33N18E1JlJtH7LNSk5ORqodq/UUhbbm74bq9u1whAnclp2BQb1I4Of7ci1DXVRT5nZq5wh+R0uVv6yo6Crmvru7jqBPdoon/3THaGdZiDO3LYlAgqjmaDdekUC0FAa+mbOT0o4GlK+NbzaMl/MTsRxt7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkrwouaN7vQnLhgnAgfZ8Jt1OkBELhtdJgPM9Jx36YU=;
 b=RjlHd4vVLqC5FEmXVwh42VLux+o2ROpkMee2T3AsYKosJ2Q7EtnjSqolGDimVjwYLFxMLbUP+4lepe6w5BFRfuSBTKidCQNktrQu5nf2MUWGhYu4trHpsEbvSP1HMXgXNdVKbZh5Vvtn7FxFPobImvF1RHmz13KN30mQkM4v31yTd6jovGUljBpbqegdhd+XgGAu4Wpw3e44Ij+elGZy70OpaAoaQUTNe4vXXBLz5JkhVxurSvOx0d9cQeozktfnuqabucIWYA8PDMy5R8Uuh8dGPUUeArQ1GM9iZ7IP/LynV2E1jzuDelMbJ20dYu/JWdLHQJOVof+/RS5ga78z/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkrwouaN7vQnLhgnAgfZ8Jt1OkBELhtdJgPM9Jx36YU=;
 b=ntWmnQdSnLKErFvPAMagAKqhM/dTqh/WAHS7NZIwt0/502MI4cvHYael3FDnUlK6Hepw/hrYXCJ8NipFsiagpZiaNTonMcrk9xGqSm9wRB0RWpOhtUAMW7esN+ph1QM5tTZEVjg8aV7S7UqTpt6QIPLeq/Eg6RwfG/kbedQfo77w1U/oXx5vMiSdIFhL42X9b/Gybh9I8rDU+9EgAdHG7iVhB5Q/UJFRLKwE8J7pH2H24KamgGyToqdDVVOLoOOYu7tKp3ugZ1FNoYbYsRxzNaatvtkU9KCXLxEHZc0AMvacjl+6YXYfkjOXG6+zWbB5cgCn3nJcSiLtE6aNJIKRRg==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: "martin.jansa@gmail.com" <martin.jansa@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 10/10] [RFC] vulkan-cts: upgrade 1.4.2.1 ->
 1.4.3.1
Thread-Topic: [oe] [meta-oe][PATCH 10/10] [RFC] vulkan-cts: upgrade 1.4.2.1 ->
 1.4.3.1
Thread-Index: AQHb8krT+Z225IRXmU2X/lqMvsQfLbQsuGQAgAAnmiE=
Date: Fri, 11 Jul 2025 12:53:31 +0000
Message-ID: <DB3PR09MB620201E29FFC898EA3D19F44EA4BA@DB3PR09MB6202.eurprd09.prod.outlook.com>
References: <20250711100052.255467-1-Moritz.Haase@bmw.de>
 <20250711100052.255467-11-Moritz.Haase@bmw.de>
 <CA+chaQckg=5Q4KfAB7T+6e6vLLc-5zGxpvVCCfz0_i3Z7=uD_w@mail.gmail.com>
In-Reply-To: <CA+chaQckg=5Q4KfAB7T+6e6vLLc-5zGxpvVCCfz0_i3Z7=uD_w@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR09MB6202:EE_|DB3PR09MB6203:EE_
x-ms-office365-filtering-correlation-id: 84a73ca7-4399-40ea-011a-08ddc079f079
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?nHZqKvrCanQnaKJp1XLvclsV8bhc2gF+163Bjn5cv6jj171/kzp1MGWveb?=
 =?iso-8859-1?Q?SUfc8hMKknWG6t0esgSF0OoKYkPlO8xdq4/WATz8+Fobk7SmnDWG/Sy2CZ?=
 =?iso-8859-1?Q?S5r1mKLOwtSlQmD9+gvYetJKYBvwV4kSZd+J87DjiisRsLKl4+MlNRszLk?=
 =?iso-8859-1?Q?+LcT6Nt6GC3142+oBdVH1c11yiUWWk2TyueZDt58La8PS+Vcc/PYpXD2wQ?=
 =?iso-8859-1?Q?YQcF8eKunSkfqkBpXJQDHRw3RNACIY2hLhu5SaD/S6LFiVgGqTOvoChug0?=
 =?iso-8859-1?Q?rvWHbcDu3ZIkUsLYK4mhvVG8g47NTq0cFkA5hgBy8etayPPNlx/VaKELnW?=
 =?iso-8859-1?Q?diG77T8aXKJL+SCbYXqujMmCS6XK7oFFSnLyW3zdxebg4neupUNUNtR/2G?=
 =?iso-8859-1?Q?w4Cu/JePxHnPZVFLdlRBz4jx05YepK3FEbXtHV0gGs0HED8eMn1ug+gXdP?=
 =?iso-8859-1?Q?vd90NKlsa8K6L6BbAP6r6Qi3k2lBXNPxawJRMhDI+w3g1vTWPVQ+3xcud4?=
 =?iso-8859-1?Q?j+lE72+DDYZnPYO5oNIUHzxdjOfGFIhYBFXU2KykAl9hmmv8EFtH9munwp?=
 =?iso-8859-1?Q?b9I9klXGx3pQ34yXnvBUqmupEJv1gKzp68RKR/Mg7GFNtMeK+WL14VQD4+?=
 =?iso-8859-1?Q?cnODmOg9V2iSdTIF/ls/W2oNJu4EUc9fZTWqnyGPmkbSL7mJqZcDauiWb2?=
 =?iso-8859-1?Q?VHUExemPkH1lqiAOAKTWdSEjZKosxHXritFzRJeYPCx8rfVe6qazCL3vZN?=
 =?iso-8859-1?Q?lSrWOcNzGGeQ6p9oBiWCjT8HYTw1zGfY0cwoshP9zzByXiWFtJEotuhAS0?=
 =?iso-8859-1?Q?os+VLUwXziU4OzmxcCmAwsOf+Ny8Jg6Q85liHU5SA+X6Hg/RUe8+7d9/5F?=
 =?iso-8859-1?Q?FcQFwmJf1WXrjwlGBGazYkgmUCY1O5rbfcOTGm6z8ZQsWemYMRTD1eBHf6?=
 =?iso-8859-1?Q?wkGXxm9Y39lEVrBXra+DUKiScqsm3Yu3FQQG5UX277H/VAwMbBtLbHGYTd?=
 =?iso-8859-1?Q?OrEm6D4G/8TPddl2jIrEr2gQzyfd10LLIJ9h2yW51VTEmHdVzMSNo+gBPg?=
 =?iso-8859-1?Q?Ih20562AnraZ27T2a6LS0TkAwJEQQF9RuCrOdiREBWEYbpuBdg3TRsraRs?=
 =?iso-8859-1?Q?c208wky1Zu/S+MORtU+MxUtnUOpaQuBJ3TbaAe8SgFCMFv5YvjfIFbaBze?=
 =?iso-8859-1?Q?w0NIj6WFbU6HPQCYUvGNjLgnvMCcZYsCPeJ4/psMdutFJHxT4lJmU3LT6I?=
 =?iso-8859-1?Q?lT0exANgKDnI9d+fraHP6mvXVnyn3EORrLD3DRlalikZ6F+PjiFHfUZoox?=
 =?iso-8859-1?Q?rbjkw5yLITMnv1Z932T2zGZjSH/88QTxYCyb7UlUsjOXsV9XVZFy/EaDSS?=
 =?iso-8859-1?Q?OFX0WSl07I4NE2EvUCgnPtmhRLIGSksAy9D5l+g2Otl1+f3xAxAq039sJX?=
 =?iso-8859-1?Q?LJCDKUpmyAlhrwOjvLh/Y9i/lqjRet5TbAfq6xxqSJVgjPtf38zKek6BJC?=
 =?iso-8859-1?Q?I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR09MB6202.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XqL2ZJIwdWEgsm2Xjur8hVD3v52EClTD9QzRzoh96pbtLQsyWC1U0O5UEH?=
 =?iso-8859-1?Q?vxwJUKCvi+TyVyVwvrFpKD7qBxxmYnoU2Z4z+0I95fleQ53Ouqs2uFXXUo?=
 =?iso-8859-1?Q?xAvsa2/4ycyx48Q5V8u1q4jjo2xtoaMG0iH0w8OUQ4U606SYTCm1QhYYFU?=
 =?iso-8859-1?Q?hCHP1Tb7be3C7dv0XkSBYJkIYy4ghs6glBgQE5uN0isaMlLylQRbgTkEB5?=
 =?iso-8859-1?Q?ZK2T0c9xZC86aVdTM14yGJ5P+zb8oydsxsabI5SjAYZU8N/ThR89Zvt0Hc?=
 =?iso-8859-1?Q?NnlMi9jncKRImKwiKDBfSzCRrrsNsXFtfmZEJlRk0UI6ZAPsGxA6djk6H+?=
 =?iso-8859-1?Q?zb5R7x5IJkdWYYYNfVUIvxvsORPLHTA7T8eGEX8SmCh4//J7neuW1bahNE?=
 =?iso-8859-1?Q?/ZpAlNhAqqbATWHClrsE0cjKAwZZZ7KhljX3hmddCYCTXAbuoOV8nDAuGm?=
 =?iso-8859-1?Q?dgkRbFQ1/B9q7TwraRVMXk2bP142qADuMbeCANOEh3UL2BSBsvtcPovPqp?=
 =?iso-8859-1?Q?wqSr7AdYxTJmrHnwDUWJK8Zss2uZkbonOpP6+HgUdFeyIoGDnM4qLXmgNz?=
 =?iso-8859-1?Q?e+LqFKRgPr07+yfwriFl0R+Pft1kt/yMSQ0pE7xaLgqeSyNiP83vbWa61d?=
 =?iso-8859-1?Q?NS4wjA1XUhog+tB1erHzfvV2OdtZCWc6sVv57L1Qana8dGOX0gj7JKTOxo?=
 =?iso-8859-1?Q?GOjrCbV2XcExyzvKE7uHZSqkkr3VEEBlneMCSHJKVhCsGCOQThMTwYlu2i?=
 =?iso-8859-1?Q?bOhFBOTPOUXMNs3+ecXlhLB4njbNXUccC5hypBu0baUNw2EPBPPZHrSbuU?=
 =?iso-8859-1?Q?Z1+JsDIUqfBhd1yrySzXVt/sYyMihPqyD2SDg0ubVJfOqQWTCbazQ2yPpS?=
 =?iso-8859-1?Q?z/A6FLyVDePgon/q4JNhjqjKi7DaYZTev92aHjVU8m3Uj0xzpNzIRWPvyE?=
 =?iso-8859-1?Q?83WLYiUXvWtslevEnuf24oeEkIoJaUKnK0u6OUlFnNVqmTFDo6HdPPY2Lp?=
 =?iso-8859-1?Q?zodlfxz+sZ7ntO4K1Lu/KZtcjsJeTJoY78zT3Vbg3673hr/WjWeiEcuT6R?=
 =?iso-8859-1?Q?yQW59MKQ15JyWNdgYD1p1IsHHerHz5t633EhT18X6vPEEAegxY8NVmuY9O?=
 =?iso-8859-1?Q?7uVokS4q6ZT7OQbeB0HguzJiSEo9usIKKk3/1WaDokCcCa1X0OcvihEj04?=
 =?iso-8859-1?Q?k+pAIV94MmgVQkSCMRLXZzhcposyRTSTCQ0yU5nRN4s8tfluXHYobXO4sO?=
 =?iso-8859-1?Q?6ZH3tkcrhbkh0Y1n+lixYnjN3o0gJCxvcL3VwFCTxLG5dQ6z9UnclnPefE?=
 =?iso-8859-1?Q?dw9RYdsRyiNhvhqPvZS7FkTKOx8DE62QEgshfZxkgEepR1DDICPMXs8CuD?=
 =?iso-8859-1?Q?OjXBNms3ddUssxSuR7R66Sp8XgSq/wfwBaJdmeEmJDQlIfWsSeSldJQLan?=
 =?iso-8859-1?Q?0fuggi0jJ3z4OzRVv/LbSMkpJj2nuLp2TSCwf7CPHjE2QZNLr91yIYtYVy?=
 =?iso-8859-1?Q?XbiTyBGOJ1AB4cLMilPbawTuYhFpArbSa4yPB9q6hX80U+nzMK/BgCGBT+?=
 =?iso-8859-1?Q?wgLb9NO+fdsskLG3ak0DvhHCiHWlfpBjgu+EHljdNY0E+uL576uSObv8LP?=
 =?iso-8859-1?Q?tM2FPmFjmN5WPP1ECTWVkIXE7PBOiJkGgD?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR09MB6202.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a73ca7-4399-40ea-011a-08ddc079f079
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 12:53:31.4489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Ix+bhPlhG68M/S5jn/P2CeAzN3yxstWqvpYygjdVR5As9IFTsmzlAbBbXIPBFuFjeWI12VFjTXshw1T0Ntfgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR09MB6203
X-OriginatorOrg: bmw.de
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 12:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118448

Hi Martin,=0A=
=0A=
> Isn't it because in this change you have (probably accidentally)=0A=
> changed the destsuffix in SRC_URI?=0A=
=0A=
awesome, thanks! Totally missed that. I updated the file using=0A=
=0A=
    bitbake -c refresh_srcuri vulkan-cts=0A=
=0A=
but the script is broken, as it wasn't adapted to recent UNPACKDIR changes=
=0A=
apparently. The SRC_URI entries were only updated manually in [0]. After=0A=
adapting the script, the build passes. Will send v2 tomorrow.=0A=
=0A=
Moritz=0A=
=0A=
[0]: https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-=
graphics/vk-gl-cts/vulkan-cts-sources.inc?h=3Dmaster-next&id=3Dfc78d37ff0ce=
9e0d60455465851dbe4e86d7a8b3=0A=

