Return-Path: <Radoslav.Pesek@kistler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE43CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 14:54:44 +0000 (UTC)
Received: from esa.hc1803-32.eu.iphmx.com (esa.hc1803-32.eu.iphmx.com [194.165.193.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.558.1779202480237167898
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 07:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@kistler.com header.s=selector1 header.b=c9KmrAqv;
 dkim=pass header.i=@kistlerinstrumente.onmicrosoft.com header.s=selector1-kistlerinstrumente-onmicrosoft-com header.b=LgcwUIZF;
 spf=pass (domain: kistler.com, ip: 194.165.193.227, mailfrom: radoslav.pesek@kistler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=kistler.com; i=@kistler.com; l=19223; q=dns/txt;
  s=selector1; t=1779202480; x=1810738480;
  h=from:to:subject:date:message-id:mime-version;
  bh=tWdzQUXsunNeI+RI46h+Dhw73mmwHxZsYG0w2yt7sQ4=;
  b=c9KmrAqvwm/7b50Pffn4fFu+42dOUmch4AA6sOBpIuMHGCKW3dTFEplU
   OcgZuMFzIyQIqDcC7Vv/w2R1/ZDPvU6QsS8vrBvBIC/mSpfVjtIuk4S/2
   i7Mxy5iGE+VnVD72xmh+s1GgXgw9HPq6EVmIrbumyXVlXlfrRqcqrHxZG
   jtoMJhJbgvkPoXaTDp7nRuq91oUTO+Q++Vi/6ELWawdQ/FOxBP/jrf0Z4
   dYhbl3VmGRsQdUKuIIpy/p1oOZ8SIP8gGF0mBCRyYpqKIKzpzAV6SAxwq
   xPZcdubzpZTxcBC/HI9wIHAbo0BUJa2SAZPQnVGa077RIOW5XrE5dtIr+
   w==;
X-CSE-ConnectionGUID: sf/sXtHJQ+2S9ZvyiLLzKg==
X-CSE-MsgGUID: P2w18i/+R/OTAI4tn/CNog==
Received: from unknown (HELO sl-win-seppm-1.int.kistler.com) ([91.223.79.46])
  by ob1.hc1803-32.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 16:54:38 +0200
Received: from sl-win-seppm-1 (localhost [127.0.0.1])
	by sl-win-seppm-1.int.kistler.com (Postfix) with SMTP id 4gKd4G3ys7z1LvY
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 16:54:38 +0200 (CEST)
Received: from esa.hc1803-32.eu.iphmx.com (esa.hc1803-32.eu.iphmx.com [194.165.205.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sl-win-seppm-1.int.kistler.com (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 16:54:38 +0200 (CEST)
X-CSE-ConnectionGUID: Iwu4UX8fTlKIb2JlTaA9Yw==
X-CSE-MsgGUID: Qqu9KA4URkuN1Xd+TfanQg==
X-IronPort-RemoteIP: 40.107.159.124
X-IronPort-MID: 6262797
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Received: from mail-norwayeastazon11023124.outbound.protection.outlook.com (HELO OSPPR02CU001.outbound.protection.outlook.com) ([40.107.159.124])
  by ob1.hc1803-32.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 16:54:37 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8WEVWEwyl8DsUylm/ApGMxGTurrZECneeHpujYlCqFxCeVhvrlPJkZT3RXjttDCvqwcq0gAnxE0ijCjxEPPEiNLFf7yLxSiRYIGcKMWMRjspW4FbErQlrc3dxTTXwwR4nhZMHIsn0X0TneP33LEBZW60blr5i0KIilkJM+sOp0j/yLJU1+pRWJwgmJOfW8Cg5PZPXIqdMrsL9ZXrPiPQ1CoNviKtGIEy2X9W35SthtaSs53uuiafLA9XnGm46K80GrHafORUt9VfrPLIzg9pa3mkRl2QKa8xFPDMKMlRVSpi60I5zxY1ByJspJwe0LlRRIxE1xJCElNwxfREC8bww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWdzQUXsunNeI+RI46h+Dhw73mmwHxZsYG0w2yt7sQ4=;
 b=MA0w34RAp77DwyfYzTP63fJxkodtcqza4FVxpQ4pq03E7mcLf2YagpoBJ9vL0ASBxMHhPk//NSEf3njeDPYQJdNOQgKCmYCqNYn3Ra/qJFD39GDLTgkWPfah0IwkA0A3p9r/Cv0fKd0i0hayXSFaGiqIV3MxiZlCmgupFXk65JARY8jYLsBqdretaUic27B310c2Bdz2h15btTznkbGhRE4AO6mVSuVxTj8rJm+dkuDPOzYju6DTFacE9Y8tFajUnEP/VHPhR5unduDTd6zUKaDoQUOXH/gj8hctsAxT/PQQOOm3AoQpnNAQWk2QYFVJT0m1kVtjOngmrNhTV5sp+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kistler.com; dmarc=pass action=none header.from=kistler.com;
 dkim=pass header.d=kistler.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kistlerinstrumente.onmicrosoft.com;
 s=selector1-kistlerinstrumente-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWdzQUXsunNeI+RI46h+Dhw73mmwHxZsYG0w2yt7sQ4=;
 b=LgcwUIZFXMKQtFYLOyov8uBkGE2ZNJwuogzUbSWr0FRibPi3lxPBDJ92XJEkI+GglfPoWPqGTNe+ko38vQSwuqnvh/0Qjq0F/MwnRiCjgpZJYSsD2NXvmV/zEsS5YWLVAenKU5INEuNE/KARaEEbxtI84jy04gqFonsKq/sdC3E=
Received: from DB9P190MB1275.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:229::13)
 by PA4P190MB1072.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 14:54:34 +0000
Received: from DB9P190MB1275.EURP190.PROD.OUTLOOK.COM
 ([fe80::7599:fd9d:fa2b:6706]) by DB9P190MB1275.EURP190.PROD.OUTLOOK.COM
 ([fe80::7599:fd9d:fa2b:6706%4]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 14:54:34 +0000
From: =?Windows-1252?Q?Pe=9Aek_Radoslav?= <Radoslav.Pesek@kistler.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: git clone git://git.openembedded.org/meta-openembedded times out
Thread-Topic: git clone git://git.openembedded.org/meta-openembedded times out
Thread-Index: AQHc558b1Hj12UgLBUK3ptjmtdsR/g==
Date: Tue, 19 May 2026 14:54:34 +0000
Message-ID: 
 <DB9P190MB1275448B0CF656B13CA2F62D9D002@DB9P190MB1275.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kistler.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P190MB1275:EE_|PA4P190MB1072:EE_
x-ms-office365-filtering-correlation-id: f75ba0f8-619e-4e8a-f2ed-08deb5b68a85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|6049299003|376014|13003099007|4053099003|38070700021|8096899003|18002099003|56012099003|3023799003;
x-microsoft-antispam-message-info: 
 QFGbbs5/5mqJ6FgnS88a5FeJDOye/CoZdDE1Jm6xdjf5QybYpJ1bgNh7LeS2VbTcO+RMOz8cU6eX1KKA3BRF3UG1Q61FqLD8Yv7gjXNLUIUAxwuhtNtpNEHuiO1N1+hnVpORrn9VXUCTU4bxcAvKEqi8XDGRrxoa7LOMRn5PQDo36QdCSHpoeAY2iYEPoCSiCVVAEkhb0p9zhPjWJFm1b9y4EOg4kOrsnM2lkpyEArcPcyD93ltL9IMu/xBg8bEnt+gZl+E4Tv31bAKY0DI8Qs+GT7LvU3GF+32MpHu90SDyTHGrnS237QIGVt7NwVLSeOUeSwHW6cuy+Y+uclyuy6rXJbvN4rZIGwg8y38ZRuQIKRRQPqddsl2eAyAzAUfM00qYWOmbEUlaFzoJWLohk6HDG2iatPbd4vv/WOdtl9QSU+MLpyHT6wfyhlRdRTgrRvjMD/RetOHT5ll429txAXLuK/oGNnE0X/8MJetvhgIDyaFR7A5232xT2kWdIBoFKnUQxIKo2uOUo1uynt7UXVu/7QnR/dBA684EuVoQXUTk7EdbiUYw5KRPu6ZULq1Ym9CJkFBHliBcdqxgvpcq2vO6qg67wUG5mAbSr6U/rQ+j9Qbksy38me9Y6+25q3m5GU0oSSqR0e36kzXxquwqjf5uvQIEbn52gaoSpNoSzVSPjmh7qLx8OCQbr+jkD9zK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P190MB1275.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(6049299003)(376014)(13003099007)(4053099003)(38070700021)(8096899003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?X+2Xb7YsGMArJllDeyUkWjz/tnIqSyQF2Zr2E8d2WRiTmE176Uuq4kT3?=
 =?Windows-1252?Q?Kgj3Yttws2WIAiDdW3vPMliCbGiqtPH6+0mfzzRPgI0BqGcwL9hwNFMG?=
 =?Windows-1252?Q?MLaF7GZtuLrlBpiP0BiALxXQlwJQEOwMhpXZ/3giUixg+9dEcKb3wD+c?=
 =?Windows-1252?Q?HVlWGiYyEPUlHtyVZd4yAGKPViLL+dyoE2CtbpNkyBdIGcevvR33eZkL?=
 =?Windows-1252?Q?HrqFyifiOH2RbNWsx0nJCn7oJc5aVr4rk3PEZQrHJsJAxVS1D0HCuKp3?=
 =?Windows-1252?Q?O6S9Z6T/nXJVzO6ptzLonIPXKU+dShyKILtDO/TdjJenGT21qSoYvsXD?=
 =?Windows-1252?Q?eOvrG/gt9YQQFu0AibwpbBo5NV1BG0ETSPpB136VY5hUuDi/YY4zanuP?=
 =?Windows-1252?Q?FcfGRl3Qsm1ugfhKqTFEWwf13bC6YerhkAFswbKkr3znkarMbQ5MFz9m?=
 =?Windows-1252?Q?11RSqnQ2L0C4Nr3g4yjONDUv2JQPs2ZMFtbYXYcAHrGvTDUR6cizLcEU?=
 =?Windows-1252?Q?EfEr0RDdL5I0j3f0ge8ZpGwayNdsd5D64RQv7DVCtVj5SKX9EVl/cDcy?=
 =?Windows-1252?Q?euqE2QEqAkQJEymVLdZYrME0XaryPoUmyVNoHV/FedAL7rXWuYCmXl7+?=
 =?Windows-1252?Q?ssigQ04r0FEj6lgHMH3OJGaULyvgriygaUsSFQY7wVMrg6zdz6qz4w2n?=
 =?Windows-1252?Q?rSXKHEoF3iJnZr8KGgtjB1CW8HLP1YzYr8931g7SC+A9zJ5VEhmIhM/O?=
 =?Windows-1252?Q?vv8+RgOfYKMg0BEA8FbdUGZCJnOOCmDDG2JgEyx3xlNVREbGEWnd5r4Z?=
 =?Windows-1252?Q?SsBRN+f5vrJys+1RnfCEgs+wGYZYSHz+bEdO14rjFmGWlvT9DCu0xYoI?=
 =?Windows-1252?Q?/Cwt+bU7fdRGm9TUUi6oiCyCjBrcfSDRFOy1Iv3WGedmSE6wwk4kCwSI?=
 =?Windows-1252?Q?TCJxmQdWKtEcSL7zRd/dng221tokf7whX9RyKORY9goMImpMyO0nZDTe?=
 =?Windows-1252?Q?W7czQoTNY1z9HtpHY6beDfzLDEiB7oWOhJIJ2tWJ2LKhYC3VoV1zCOm8?=
 =?Windows-1252?Q?KrYSHjOfDzWAHLvF5FGMEo92FSDJEqRItY93q/8afIhvKpV+JySdCeH0?=
 =?Windows-1252?Q?rMi5PJ8bfVTeb68wtYRZV11TLV9cFkaJI72dEhtxeafJUyh3whB8lkpa?=
 =?Windows-1252?Q?rtq1Cga1T5wCyl7MCHNGcTxedKhJ6mzjc6g8WN91BcL7FgH/Atgw7mC9?=
 =?Windows-1252?Q?NChMTJxWOai8LQYpWKnbhyglGIibnT0uZ39i1U6Fd4s+Ojrd2HbJzMNW?=
 =?Windows-1252?Q?epHQ5rI9zp6fC/0wZ3gQLIzgNEN/g6jD9E5GdmexP3n6ekwP8+G1UpYU?=
 =?Windows-1252?Q?ezWar5a+dqiATPdaXx+J3+/PlVBJk+MUxe8dZrG8uD6T0tud6kZqrZPu?=
 =?Windows-1252?Q?LSknn5PvF8UR58IPnhlKYndZxxxyJO7pQMpGL0fuOG1iei31erVhK7aE?=
 =?Windows-1252?Q?4A6UNUbt9ZE78akMPQgWJ3E4KMhltOCgTZJRyR00qHj7Vl62jiZAZ+ML?=
 =?Windows-1252?Q?NqePa8IJ5GCajN3uzAUcgsHSUa6y7T4GECm0NrrswSqOhSSNXXI/54B5?=
 =?Windows-1252?Q?ECU3RQPrFYSh99A7CFmwhYnoI6HX9G+4g0GLvqawXdCJeWDM5nfUBTEm?=
 =?Windows-1252?Q?MkE3FwKImUkHMh2xpDJD5/HnCX+QkPneyVcqulCr0gb+IFVuFG0JPDI/?=
 =?Windows-1252?Q?iyXW9Feuw1cf3DhD7IxxyFakuK7q9iozW6Gt347u98JiMFQHdNjz2kM0?=
 =?Windows-1252?Q?9ijmosTUr6UXsSyMbgyu6OLK88kuuah6OTab55Y0SSzVU239lNYPgYDw?=
 =?Windows-1252?Q?rIMIvXdq/04nNQ=3D=3D?=
Content-Type: multipart/related;
	boundary="_005_DB9P190MB1275448B0CF656B13CA2F62D9D002DB9P190MB1275EURP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	UFivOgdCOje3HGKlSk2IUU8KPzlM2TmAYjTqtwPDECL4RFuFNRtudv+Os02G/ffeADA9+JVJjT2rv/Oaq/0Y+RUZSKxKmUKjdGn/HmBEDRFJykQ60dttT2+wcbOmLXlMPyiUwfSCaeATJZtre5HVuR5VbnIMQqsjtaseR4TnTwzrCbqXSTvbf4bnMOTxbV81Ak+x64FVKlSN/45ABNTlXRgZPP/fSggHfgGgBFwOeNDTn5/EYetF+k2vgH87dxp5qSFMqcSD+dgJdsK3SyGV3o9pKhdci7qPqzJXbAQlIDtGz5enwqRsP/I+e050HasbcKKgbfpijL7xF+DGK/H3Vg==
X-OriginatorOrg: kistler.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P190MB1275.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f75ba0f8-619e-4e8a-f2ed-08deb5b68a85
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 14:54:34.5261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 913b01a8-b729-4ffe-a3e6-dbf8f9ce11e5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRbHMf99Isq8jQV2Qf/U9HG6DMf7UqkKE9M3sUPNGRd+/h2/+r1waukp5b4R4nIVHP96Gh79xq/z0JTkJ/dVZmAhdoA/l8wenp4yQwUB0/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P190MB1072
X-SM-outgoing: yes
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 14:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127104

--_005_DB9P190MB1275448B0CF656B13CA2F62D9D002DB9P190MB1275EURP_
Content-Type: multipart/alternative;
	boundary="_000_DB9P190MB1275448B0CF656B13CA2F62D9D002DB9P190MB1275EURP_"

--_000_DB9P190MB1275448B0CF656B13CA2F62D9D002DB9P190MB1275EURP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,

Not sure this is the right place to ask, but I'm trying to clone meta-opene=
mbedded via git protocol and it times out:

$ git clone git://git.openembedded.org/meta-openembedded
Cloning into 'meta-openembedded'...
fatal: unable to connect to git.openembedded.org:
git.openembedded.org[0: 104.18.9.166]: errno=3DConnection timed out
git.openembedded.org[1: 104.18.8.166]: errno=3DConnection timed out
git.openembedded.org[2: 2606:4700::6812:9a6]: errno=3DNetwork is unreachabl=
e
git.openembedded.org[3: 2606:4700::6812:8a6]: errno=3DNetwork is unreachabl=
e

My colleague tried it form other network with the same result. It's happeni=
ng since at least last friday. HTTPS works.

Is this some issue on your side?

Thank you,


Radoslav Pe=9Aek
Software Developer


Kistler Bratislava, s.r.o.

Einsteinova 33, 851 01 Bratislava, Slovakia
Direct +421232272948, Main Office +421 2 32 272 900
radoslav.pesek@kistler.com<mailto:radoslav.pesek@kistler.com>, www.kistler.=
com<https://www.kistler.com/> , Contact Service<mailto:Service@kistler.com?=
subject=3DService%20request>




[cid:1e6c6b6d-6ab2-4bcb-bb9b-244b6afd416e]<https://www.linkedin.com/company=
/kistler> [cid:0fc4f4b0-727d-406c-bb35-41d3eecc291b] <https://www.youtube.c=
om/KistlerGroup>

Confidentiality Notice: This e-mail is privileged and confidential and for =
the use of the addressee only. Should you have received this e-mail in erro=
r please notify us by replying directly to the sender or by sending a messa=
ge to info@kistler.com<mailto:info@kistler.com>. Unauthorised dissemination=
, disclosure or copying of the contents of this e-mail, or any similar acti=
on, is prohibited.


--_000_DB9P190MB1275448B0CF656B13CA2F62D9D002DB9P190MB1275EURP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Hello,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Not sure this is the right place to ask, but I'm trying to clone meta-opene=
mbedded via git protocol and it times out:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 &quot;Aptos_EmbeddedFont&quot;, &quot;Aptos_MSFontService&quot;, monospace=
; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 &quot;Aptos_EmbeddedFont&quot;, &quot;Aptos_MSFontService&quot;, monospace=
; font-size: 12pt; color: rgb(0, 0, 0);">
$ git clone git://git.openembedded.org/meta-openembedded</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 &quot;Aptos_EmbeddedFont&quot;, &quot;Aptos_MSFontService&quot;, monospace=
; font-size: 12pt; color: rgb(0, 0, 0);">
Cloning into 'meta-openembedded'... &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 &quot;Aptos_EmbeddedFont&quot;, &quot;Aptos_MSFontService&quot;, monospace=
; font-size: 12pt; color: rgb(0, 0, 0);">
fatal: unable to connect to git.openembedded.org: &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 &quot;Aptos_EmbeddedFont&quot;, &quot;Aptos_MSFontService&quot;, monospace=
; font-size: 12pt; color: rgb(0, 0, 0);">
git.openembedded.org[0: 104.18.9.166]: errno=3DConnection timed out&nbsp;</=
div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 &quot;Aptos_EmbeddedFont&quot;, &quot;Aptos_MSFontService&quot;, monospace=
; font-size: 12pt; color: rgb(0, 0, 0);">
git.openembedded.org[1: 104.18.8.166]: errno=3DConnection timed out &nbsp;<=
/div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 &quot;Aptos_EmbeddedFont&quot;, &quot;Aptos_MSFontService&quot;, monospace=
; font-size: 12pt; color: rgb(0, 0, 0);">
git.openembedded.org[2: 2606:4700::6812:9a6]: errno=3DNetwork is unreachabl=
e</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 &quot;Aptos_EmbeddedFont&quot;, &quot;Aptos_MSFontService&quot;, monospace=
; font-size: 12pt; color: rgb(0, 0, 0);">
git.openembedded.org[3: 2606:4700::6812:8a6]: errno=3DNetwork is unreachabl=
e</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
My colleague tried it form other network with the same result. It's happeni=
ng since at least last friday. HTTPS works.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Is this some issue on your side?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Thank you,</div>
<div id=3D"Signature">
<table id=3D"x_0.2l02a4iem1w" style=3D"width: 100%;" cellspacing=3D"0" cell=
padding=3D"0">
<tbody>
<tr>
<td style=3D"vertical-align: top; width: 100%;">
<div style=3D"font-family: Arial; font-size: 13.3333px;"><br>
<br>
</div>
</td>
</tr>
<tr>
<td style=3D"vertical-align: top; width: 100%;">
<div style=3D"font-family: Arial;"><span style=3D"font-size: 13.3333px;">Ra=
doslav Pe=9Aek</span><span style=3D"font-size: 10pt;"><br>
</span><span style=3D"font-size: 13.3333px;">Software Developer<br>
</span><span style=3D"font-size: 10pt;"></span></div>
</td>
</tr>
<tr>
<td style=3D"vertical-align: top; width: 100%;">
<p style=3D"margin: 0px; font-family: Arial; font-size: 10pt;"><b><br>
</b></p>
<p style=3D"margin: 0px; font-family: Arial; font-size: 10pt;"><b>Kistler B=
ratislava, s.r.o.</b></p>
<p style=3D"margin: 0px;"><span style=3D"font-family: Arial; font-size: 13.=
3333px;">Einsteinova 33, 851 01 Bratislava, Slovakia</span><span style=3D"f=
ont-family: Arial;"><br>
</span><span style=3D"font-family: Arial; font-size: 10pt;">Direct +4212322=
72948, Main Office&nbsp;+421 2 32 272 900<br>
<a href=3D"mailto:radoslav.pesek@kistler.com" style=3D"margin-top: 0px; mar=
gin-bottom: 0px;">radoslav.pesek@kistler.com</a>,
<a href=3D"https://www.kistler.com/" style=3D"margin-top: 0px; margin-botto=
m: 0px;">www.kistler.com</a> ,</span><span style=3D"font-family: Arial;">&n=
bsp;</span><span style=3D"font-family: Arial; font-size: 10pt;"><a href=3D"=
mailto:Service@kistler.com?subject=3DService%20request" style=3D"margin-top=
: 0px; margin-bottom: 0px;">Contact
 Service</a></span><span style=3D"font-family: Arial;"><br>
<br>
</span></p>
</td>
</tr>
<tr>
<td style=3D"vertical-align: top; width: 100%;">
<div style=3D"font-family: Arial; font-size: 10pt;"><br>
</div>
</td>
</tr>
<tr>
<td style=3D"vertical-align: top; width: 100%;">
<div style=3D"font-family: Arial; font-size: 10pt;"><br>
<br>
</div>
</td>
</tr>
<tr>
<td style=3D"vertical-align: top; width: 100%;"><span style=3D"font-family:=
 Arial; font-size: 10pt;"><a href=3D"https://www.linkedin.com/company/kistl=
er"><img size=3D"0" data-outlook-trace=3D"F:1|T:1" src=3D"cid:1e6c6b6d-6ab2=
-4bcb-bb9b-244b6afd416e"></a>&nbsp;<a href=3D"https://www.youtube.com/Kistl=
erGroup"><img size=3D"0" data-outlook-trace=3D"F:1|T:1" src=3D"cid:0fc4f4b0=
-727d-406c-bb35-41d3eecc291b"></a><br>
<br>
</span></td>
</tr>
<tr>
<td style=3D"vertical-align: top; width: 100%;">
<div style=3D"font-family: Arial; font-size: 10pt;">Confidentiality Notice:=
 This e-mail is privileged and confidential and for the use of the addresse=
e only. Should you have received this e-mail in error please notify us by r=
eplying directly to the sender or
 by sending a message to <span style=3D"background-color: rgb(255, 255, 255=
);"><a href=3D"mailto:info@kistler.com" style=3D"background-color: rgb(255,=
 255, 255);">info@kistler.com</a></span>. Unauthorised dissemination, discl=
osure or copying of the contents of this
 e-mail, or any similar action, is prohibited.&nbsp;</div>
</td>
</tr>
</tbody>
</table>
<p style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Arial; font-s=
ize: 10pt;">
<br>
</p>
</div>
</body>
</html>

--_000_DB9P190MB1275448B0CF656B13CA2F62D9D002DB9P190MB1275EURP_--

--_005_DB9P190MB1275448B0CF656B13CA2F62D9D002DB9P190MB1275EURP_
Content-Type: image/png;
	name="C2_signature_linkedin_32x32_f1efba09-495c-4d39-8102-95da4a96e1ae.png"
Content-Description: 
 C2_signature_linkedin_32x32_f1efba09-495c-4d39-8102-95da4a96e1ae.png
Content-Disposition: inline;
	filename="C2_signature_linkedin_32x32_f1efba09-495c-4d39-8102-95da4a96e1ae.png";
	size=338; creation-date="Tue, 19 May 2026 14:53:24 GMT";
	modification-date="Tue, 19 May 2026 14:53:24 GMT"
Content-ID: <1e6c6b6d-6ab2-4bcb-bb9b-244b6afd416e>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAAPRJREFUeNpiZChfyUBLwMRAYzBqwQiwgAWrqIGUQL2LtgAH28Kz9xec
fUB9C9bHWisIcgMZDkqiQJISO7AHEcR0TDbVLHjw/iucveHaU+oHkeGkXQXWakDGgXuvLzz7QIkF
jGSXRQ5KYhDGhefvP3z/TZoP9qc5QqIXCBxnHThw7xWySOGWC+A0xgrhfvjxu3DzeVwJgZx80O9j
ADcdCIDs+aFmcA/RKqPl26hSzYILzz8INq5nrFg14egtuGCAljTVLGjccxUSq0AGTcoieJrBk3hG
i+vRCgdYvCDSzI9fWEUgAFga0qqwG43kUQvoZgFAgAEAz4lY/FLrGEEAAAAASUVORK5CYII=

--_005_DB9P190MB1275448B0CF656B13CA2F62D9D002DB9P190MB1275EURP_
Content-Type: image/png;
	name="C2_signature_youtube_32x32_f3658c26-c91c-42e6-8f20-1b5580333dd8.png"
Content-Description: 
 C2_signature_youtube_32x32_f3658c26-c91c-42e6-8f20-1b5580333dd8.png
Content-Disposition: inline;
	filename="C2_signature_youtube_32x32_f3658c26-c91c-42e6-8f20-1b5580333dd8.png";
	size=5199; creation-date="Tue, 19 May 2026 14:53:24 GMT";
	modification-date="Tue, 19 May 2026 14:53:24 GMT"
Content-ID: <0fc4f4b0-727d-406c-bb35-41d3eecc291b>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAAAxHpUWHRSYXcgcHJvZmlsZSB0eXBl
IGV4aWYAAHjabVBbDsQgCPznFHsEBLR4HPvYZG+wx18UbNpmJ3EEhowIHN/PG14dlAQkL1pqKWiQ
KpWaBYqONjihDB6gkCy/1eEUyEpsN3uqJfpnPZ0GfjWL8sVItxDWu1Al/PVhFC9zn6jHexjVMGJy
IYVB829hqbpcv7AeeIf6gU60RdvcwyOXxba3Z3uHiQ5OjMbM4gNwPwzcTEjGyDaURXnEZfCcxBby
b08T8AMBOllY0KenQwAAAYRpQ0NQSUNDIHByb2ZpbGUAAHicfZE9SMNAHMVf00pFqw52EHHIUJ3s
okUcpYpFsFDaCq06mFz6BU0akhQXR8G14ODHYtXBxVlXB1dBEPwAcXVxUnSREv+XFFrEeHDcj3f3
HnfvAKFZZaoZmANUzTLSibiYy6+KwVf0w49BBBCTmKknM4tZeI6ve/j4ehflWd7n/hwDSsFkgE8k
nmO6YRFvEM9sWjrnfeIwK0sK8TnxpEEXJH7kuuzyG+eSwwLPDBvZ9DxxmFgsdbHcxaxsqMQx4oii
apQv5FxWOG9xVqt11r4nf2GooK1kuE5zDAksIYkURMioo4IqLERp1Ugxkab9uId/1PGnyCWTqwJG
jgXUoEJy/OB/8Ltbszg95SaF4kDPi21/jAPBXaDVsO3vY9tunQD+Z+BK6/hrTWD2k/RGR4scAUPb
wMV1R5P3gMsdYORJlwzJkfw0hWIReD+jb8oDw7dA35rbW3sfpw9AlrpavgEODoGJEmWve7y7t7u3
f8+0+/sBjONysYpC4c4AAA5DaVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVn
aW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/Pgo8eDp4bXBtZXRhIHhtbG5z
Ong9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJYTVAgQ29yZSA0LjQuMC1FeGl2MiI+CiA8cmRm
OlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1u
cyMiPgogIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiCiAgICB4bWxuczp4bXBNTT0iaHR0
cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIKICAgIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMu
YWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiCiAgICB4bWxuczpzdFJlZj0i
aHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIKICAgIHhtbG5z
OmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIKICAgIHhtbG5zOkdJTVA9Imh0
dHA6Ly93d3cuZ2ltcC5vcmcveG1wLyIKICAgIHhtbG5zOnRpZmY9Imh0dHA6Ly9ucy5hZG9iZS5j
b20vdGlmZi8xLjAvIgogICAgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAv
IgogICB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjgwNjM1MUY0N0EzNzExRUU4RUI3ODg5Q0RF
QTgyNzU3IgogICB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjg2MDM4Njc4LTMwMGYtNGZiMy1h
MzAwLWY4MTVmMzVhY2FkYyIKICAgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOmM2
N2Q3YTk2LWE1NzAtNDE3OS1iNjQ4LWRjNGJmODcxZDczZiIKICAgZGM6Rm9ybWF0PSJpbWFnZS9w
bmciCiAgIEdJTVA6QVBJPSIyLjAiCiAgIEdJTVA6UGxhdGZvcm09IldpbmRvd3MiCiAgIEdJTVA6
VGltZVN0YW1wPSIxNjk5MDIwMzY2NDcwNTk2IgogICBHSU1QOlZlcnNpb249IjIuMTAuMzQiCiAg
IHRpZmY6T3JpZW50YXRpb249IjEiCiAgIHhtcDpDcmVhdG9yVG9vbD0iR0lNUCAyLjEwIgogICB4
bXA6TWV0YWRhdGFEYXRlPSIyMDIzOjExOjAzVDE1OjA2OjA0KzAxOjAwIgogICB4bXA6TW9kaWZ5
RGF0ZT0iMjAyMzoxMTowM1QxNTowNjowNCswMTowMCI+CiAgIDx4bXBNTTpIaXN0b3J5PgogICAg
PHJkZjpTZXE+CiAgICAgPHJkZjpsaQogICAgICBzdEV2dDphY3Rpb249InNhdmVkIgogICAgICBz
dEV2dDpjaGFuZ2VkPSIvIgogICAgICBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOmU2YThlOGNi
LTg0YjMtNGIzMy1iNWU0LTI1ZDA2OTJmMThhYyIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0i
R2ltcCAyLjEwIChXaW5kb3dzKSIKICAgICAgc3RFdnQ6d2hlbj0iMjAyMy0xMS0wM1QxNTowNjow
NiIvPgogICAgPC9yZGY6U2VxPgogICA8L3htcE1NOkhpc3Rvcnk+CiAgIDx4bXBNTTpEZXJpdmVk
RnJvbQogICAgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpGRDE5MkYyNzQ1NzUxMUVFQjI2N0Q4
OTI0OUU4RTgyQyIKICAgIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RkQxOTJGMjY0NTc1MTFF
RUIyNjdEODkyNDlFOEU4MkMiLz4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94
OnhtcG1ldGE+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAKPD94cGFja2V0IGVuZD0idyI/Pv9bARQAAAAJcEhZcwAALiMAAC4jAXilP3YAAAAHdElN
RQfnCwMOBgYXVzDcAAADP0lEQVRIx+2WvYpWVxSG3/Vzznx++WGcTMBAakVkwMpb0dJGSG4hXbp0
uQAvwEBaC69hsBMRO3UQQgoDOt+cs/dea70pRgMpJERIEZhV7e5ZvKz3YUvhvx3FBeAC8D8ACEq2
AAoQQ8HSAIOoLoAYEhARAAEXMcEsYnG+mBjERCxFYUhDwcRw3q2SLQQuAkME4SYtOU+FYXLt1vLd
7e31q3X5az84pPmyb9tpk+yWVsJpaei9dm9r99Z+f+PPTnD/gT0/xlRtYM8kki4BAAlQkJDCpvuU
wO7oZhtvOhuZJJnJdjbYOdYig9lZg6xGdrLYski28WZ3dDOB7lNhkxAKElBVXQ0CIdIia4NLd2/P
dXmCY9EOBDXnPcMUnsL3sRopE6BFiVJiYK7Ll+7erg0skkiBrAZV1ajalAIVGGqCFXLjqM9AnmGv
5hxuYQwQgUDBQm2gRIoRuhZyM6JP6DPkxhFWqElgALUpjSp1+FolLrPhtNLVeXClMMI+RyhNiiMk
kdjc+6l+e1m+lkWQKu61MRpscqIweHDF1U8rZ4O4rFUOR7hSpAGcQPhQ9FcvWFnZmOTgKbmMPsj1
m0Nu9vnjz8k/SC5ndUqyRzCTxcr+6sVQEM4JDaBIuCKAnEH1DhT2Vkc7ec3GxkFyZWeSjSzGF3MJ
whHfXuWvv7BWBgeZLBbZ2E5er47CXgeonjPiH4tG8K+3iHxKLz8a0fnuvc4jauRy5SvOX/7riAhf
ALrQ8E5A9Tp+vLA3kp3BkXU2eFaDvPdDvX6ZXDLHWsUiI1mDWVlc2Ov4MdXfCWigywIQjgFQtYAG
0GwAfPSwkYx3zORo5GC1TK58yyDHOZiZY9QuuLK3RjaSjx4OgGYNKICqA1BXXbUAdUyVxAZ8+mTu
gG3Rtfuc5SkuCoNRkF45QT+cqcLWyeeBuYNPn2CDSjomQFctV/2oKlYuZGYmM9mXwc7sn6AKoQKY
o/oH2QmGyrVb6/d3Ntev1v6hHhxCfbevn82XopqXl1D/Ljt5doL7D/j8GFP1wfey0xnoKEHItoAA
aAjYMJSBIjugFAOgSAEDE8WImWJdUUCJlRjFhmgZhiFgNARQQMi2BHLxL7oAXADwJ46f8hyBkiKm
AAAAAElFTkSuQmCC

--_005_DB9P190MB1275448B0CF656B13CA2F62D9D002DB9P190MB1275EURP_--

