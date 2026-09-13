Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC504C88E63
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 19:06:00 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4792.1789326353689949554
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 12:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=izoiQvaQ;
 spf=pass (domain: siemens.com, ip: 52.101.65.19, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IS0qcolSz382Eda723fYsM4uMKgHUPe/Svs6b6UWtqu3XzNfqEj5d+Pk0mExYaLgwNMPiCcbDrX0xnTGYEuwVZmjn0sjeT3+L+nV/T5v0q6s/n3yVj+97GQKIiL5WOqSyg6uOR+hlAZ4gbzEBkTAKNjGxnTcyjY3IUo3UCBToynr1eBJaGTKVQu+Pr4y+wOOyHpq/COrxbfUYUhBGCL0OWV04UA/9l8dDQ6+hwFpSju0+noTcZJvjaqCvJC9ib09H2IH3YuQf9gmnRvt4uAXicYj80y8vSqvMf0x2sXSGVArs1UA8pUOlPdAhX98+ZHND+8Vgd165VUv2o3jfUYZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge8+vf/wIu24Y9yoJtJVxpF1Tu0LyRvYb8BsnGar1pA=;
 b=bOiz7cX4Dc1C3dEUwbNrRSRBqc7Zr1IRM6xrG6DG9S24845FKz+AjZ2rNPoXYLUAFfHKq1cWx1X/o8idnAgrOiit8Ofyt0Kc09IVy2RMh/Er6dsA17/SrBbLgKutvBqJ/sVln2IwLVs9P4uVXPnoN67HhXnl+WpiTaQa3xw1NhcdTuBk+sQZR7ObMbS0BV3TyjnSMomjQ1xL2tgLNQ4xIYbdorHkNutf4LIhxkWegKctOlRwo8md/Z0/lpI9mMutrJXXu9tqUHv1j/iA3MGpXFV/J3RD8zearllt4m/UjrLF17DNwdWBsNdJ3/1BpOqGssnW1Kiw1g8hUQ9+mhg/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ge8+vf/wIu24Y9yoJtJVxpF1Tu0LyRvYb8BsnGar1pA=;
 b=izoiQvaQ51jglWEQbgJbTrK4x5DVYA+DJmBM444/PRMITHZd+Tu20rKy3O1ckz73wfxFYF/gTSR528kf6zLnzzjwqX4pIOxzD8IkSP6ru4WJNGymyvQKc992qBHi/UlTjU72VZsHfdx7Zv5j0EmSCNnAM1at1G6wzOdKXmBfPTy9TThTZ5fT4T2aJv6WfWQbXngFefoqNHAcq18WHqy+SqSIehlwTY7o8zlbUIMQv/wnqWpocjGV8iEZ7iLcD061ff7rbpXk7uIr6sDk8z+LtBKaUo4NrPxi3x1M3TFApOaBnFAj9U3J6u/eAn8dNc9bF8ZmcohZCvuQMvLhl0LWqQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DU0PR10MB7264.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:447::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 19:05:49 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 19:05:49 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [meta-oe][PATCH 2/4] msgpack-c: upgrade 6.1.0 -> 7.0.2
Thread-Topic: [meta-oe][PATCH 2/4] msgpack-c: upgrade 6.1.0 -> 7.0.2
Thread-Index: AQHdQ5Pe+YvdpBAae0OCZcAKKHQB0rbM3mKw
Date: Sun, 13 Sep 2026 19:05:49 +0000
Message-ID: 
 <AS8PR10MB50734418CD4AACC11763F2CDFDBC2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260913152253.3201491-1-peter.marko@siemens.com>
 <20260913152253.3201491-2-peter.marko@siemens.com>
In-Reply-To: <20260913152253.3201491-2-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=25b0919e-7a42-4b60-b3fa-5d696561ea62;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-13T19:04:58Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DU0PR10MB7264:EE_
x-ms-office365-filtering-correlation-id: f8bb3500-6a57-4325-8e57-08df11ca0612
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|4143699003|6133799003|3023799007|22082099003|18002099003|55112099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: 
 bqFICdo4h6r8O4sa1ZKrcYCuiyEZTFRNAhIdvex+HzGDH70uQauz9Fd+2zafvy7x0RzriO9vcyXZS9cNITT2EXsAA8HLFFZK7DBgBw+uDx+QmghvHmNROIwG+MgjuNuar3k0iB/BBXeebSlS4Ys+KXVtVYzbb/8Z/BI8LLJj0BIWTE2Fwp3LHS6gNpctkqjqGykGHhZklGVtPmTH54TuapkxWU2g9dQmu5+wECldnm23MI50itBGAl3H03844nreUcQz4PH4WCH4D0hKRgxve5BBGjJ0sq1a1VDYVYRQ0vjGM/TIVeYk8oXLPYpAqrxiK2HjYIOmaJ5LzM5rR5bkvYGYi3zMGnfXG+MILzsJkRFI/XHQ9xccGQPYBBEu8KVwRT9FE0L9nW4mxTT4cN6vNPAjae44HAjMd9hc09/e1Nv9nNQP+sdJYIPjI1sAukhhlD5/eomT3BrNNll6nnpYhZl/UIzUR+EJ4hCl+S5Yu/Zl/fRpl/MJvCOH9JbYUz51kOiLd7hMzBFPlGAUxw82hX3xAph+yZzg7YIKiZONG0rsiuJLBV46RtrqOuvu2e+WrcNW78bKS/PRBb1kI4M+W5OSKWpOXupGtrXe/GDaDpRVfLbgH6MToMmGgecjWNfzths7MSVamtRWFNiBV6yx/OYIp0AF6tWoh5OfJzHMBTzQCh4GhZFI7UTdy11gUmQN01SAANWyEnT1GyswkWa5MkqSJh57W4JbtC8RedkpvXg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003)(55112099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?s1GPrAdd5ZFMk76IWdcWNu/Nq6OiFJY0tiBdN5o/MIMfAYDIgR1K9cLNhPtg?=
 =?us-ascii?Q?cIkdy4a8eJYTYf/uZitTPLVxHb/VM9ixSLQJZvHr2vETnkD3YIO6Kpy92zH0?=
 =?us-ascii?Q?tIGqt8oTFDteUxzF+C3H5t/lk3r8gAdXw9yseQ1B7d/Wvsxo9IFItkcz3MTS?=
 =?us-ascii?Q?r4h6emv5v1YYWWENjS8jysp9whrqkQsihK/JS2PQ1Ygct41otD3K/Tz5xOnR?=
 =?us-ascii?Q?k8JflDz0UPX40abomwNOdyR/CZe6oh3KwakfFBT1vJQ+0rmAb66Cei9Me/uM?=
 =?us-ascii?Q?auBq+IDP0iWokNnGzt4HzlSR6CY/2F4OqqclQ8SMao17DDxLsPwrjIvFUcH1?=
 =?us-ascii?Q?6IjnzKYCYIl68B1F9GtpGQ+yZFSJVTgu0RoZm+37ZgpcndcQXQP076lqz19F?=
 =?us-ascii?Q?Sp50ksLhO2HrixJuFSO32r+zFbnEURTs+/kGROGSo5RKpixJngjyjfBTvRBy?=
 =?us-ascii?Q?Kd4KQ934xvp1CGl2dEifkOOfOERETlMJjzWhofrX+xekY8cAbNskjZRPZWmH?=
 =?us-ascii?Q?ZdnwOVO8vccNwKhRF6RY8KKEXRgsOo1bWz1Rom8JzBuZA2FCz6OhlU7Pna1N?=
 =?us-ascii?Q?jq5PIebuh3pbA6gOq/eqa0XNMu8GShBeg3u9pu9ZCpJUXATh/ec7U2leI1/5?=
 =?us-ascii?Q?RuWfKhJMlYL2Bx8tZj2YYGT4hhZDoU/8cR2J+f9aCYwBpjdF2UB3bJlp5UYq?=
 =?us-ascii?Q?Nv1dlHQSqkKuGf8blqHuJof8ObHENET0V3Nci4Z+BCbTETu15Y5qDoc8csfm?=
 =?us-ascii?Q?BRlwHL7XcfrsAaK7SDMT+pWYhoOe6N/9vE/Sfbnph0cw1nsbWbRwu2oO+qt+?=
 =?us-ascii?Q?LOFVwc/NFi1KyAWFcsSG7X1bDfq9SE/tIeAvxryLHsp+Dir6eAamL4rfuhJB?=
 =?us-ascii?Q?MrgL5dW0Rjh1U5/1+MwYcLBlbsvASG0AEGBrI6wUmkF/tSSxwLbjDIF1GfYc?=
 =?us-ascii?Q?iSC8iZvyPnbMm3j48t7O0phWBIwMFflknhYO/0Y/A86YQBdxeY4hP1y7kLjD?=
 =?us-ascii?Q?1yNXZ0+bnHynWvf56YKUCzSoxZg2epjWgqTblzpTPb9u9kAvzvXyod+2Y9jE?=
 =?us-ascii?Q?fQg5tlCPMbjWIWiP4qi0IXIYF9S18rQOHKaIAu5+4aZ/ZW8DboFG2KIlAQ8Q?=
 =?us-ascii?Q?uusU5fp7JRk8uwqBTjEO246+BW+a2j+MNinVWvj3FTWLyKy8S/yCw4h9cMBF?=
 =?us-ascii?Q?MnNBQzlS21kTAZ6TGCcgHj3nOsrc+ryRMZO79HlIps02Oi67bVoRhhN09qJM?=
 =?us-ascii?Q?q6+tydxCawmtlN98UBP7MNB0dGQ9TARYEP2ZZttEPvLsYAWYh+MiVkH8jE21?=
 =?us-ascii?Q?JXF8UoTmmjA4yUUqtAkplZYTvtwnvy8KdAQnZ95FMASs5LBvWeatL3CknjzX?=
 =?us-ascii?Q?0pW4NHP6bEwbpZjz6AamRd87NJnZq2r006RFTmLbIAqwXu16dI8Z55uZq3Ex?=
 =?us-ascii?Q?F6trHmfRyTkb+9O9aJpR0nkp1GLgp4k/IkpCRKoUavXTMC9yReImbMl0c0n1?=
 =?us-ascii?Q?hHpcLZNa70JHIwovxFq/3WTt1aHDZ3AtjNP6RXriSX8fEEFsHukN/jZy9j8p?=
 =?us-ascii?Q?o5fOjGNBXokAmCgUD7ttUMTNsv1A6sNN2rE1dmK3C98bKw7P/NYqewKnBAVL?=
 =?us-ascii?Q?AZsJV8NFuqXtm9rSl5YHvvb2thdcEt14WezPbQBBcA7ub95n+lZlWGDyoXnd?=
 =?us-ascii?Q?ChaAOnSBkKqc+I2HRmNC6ITMon/LM2RTpGsAJN7EafPO9ZUoZBe0xxyx5B2l?=
 =?us-ascii?Q?efG+Op985A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bb3500-6a57-4325-8e57-08df11ca0612
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2026 19:05:49.2538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ur9qyFcHkbQZVflCRxRf590X7f6gOP0wpwwXYKyNPaeut9F9Ptb1hoJTm9fp0yeWLjXKL6PcNo92z3yYqVgafw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7264
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 19:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130003


> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Sunday, September 13, 2026 5:23 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [meta-oe][PATCH 2/4] msgpack-c: upgrade 6.1.0 -> 7.0.2
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Handles CVE-2026-72854 (in 7.0.2).
>=20
> Release notes:
> * https://github.com/msgpack/msgpack-c/releases/tag/c-7.0.0
>     Refine CI (#1152)
>   << breaking changes >>
>     Updated cmake minimum required to 3.5-4.0 (#1160)
>=20
> * https://github.com/msgpack/msgpack-c/releases/tag/c-7.0.1
>   Set INSTALL_INTERFACE to CMAKE_INSTALL_INCLUDEDIR (#1177)
>=20
> * https://github.com/msgpack/msgpack-c/releases/tag/c-7.0.2
>   Fix integer overflow on msgpack_unpacker_expand_buffer(). (#1182)
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../msgpack/{msgpack-c_6.1.0.bb =3D> msgpack-c_7.0.2.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/msgpack/{msgpack-c_6.1.0.bb =3D> msgpack=
-
> c_7.0.2.bb} (93%)
>=20
> diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb b/meta-
> oe/recipes-devtools/msgpack/msgpack-c_7.0.2.bb
> similarity index 93%
> rename from meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb
> rename to meta-oe/recipes-devtools/msgpack/msgpack-c_7.0.2.bb
> index 1061c37345..b5ff5d9780 100644
> --- a/meta-oe/recipes-devtools/msgpack/msgpack-c_6.1.0.bb
> +++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_7.0.2.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://NOTICE;md5=3D7a858c074723608e08614061dc044352 \
>                     "
>=20
>  SRC_URI =3D "git://github.com/msgpack/msgpack-c;branch=3Dc_master;protoc=
ol=3Dhttps"

I forgot to add ";tag=3D" to SRC_URI, v2 (just for this patch) incoming.

Peter

> -SRCREV =3D "445880108a1d171f755ff6ac77e03fbebbb23729"
> +SRCREV =3D "e17beb371b59459a13b48e166a11e123bda5bf93"
>=20
>  UPSTREAM_CHECK_GITTAGREGEX =3D "c-(?P<pver>\d+(\.\d+)+)"
>=20

