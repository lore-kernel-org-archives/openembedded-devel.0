Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED255C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 09:39:35 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.48])
 by mx.groups.io with SMTP id smtpd.web11.4999.1677058766821953833
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 01:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector2 header.b=c4ShWz9i;
 spf=pass (domain: witekio.com, ip: 40.107.20.48, mailfrom: hsimeliere.opensource@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NG/YwbHsoPqwxfgBTOPe8Qi/radKN8k9kcvTWHjNsZdGPtOSNembrPJfZx/e3MDxn4ZkW+vSlDtZDoaF8aiV+ziBRLUQijMwBF/Fd5a7gEZ/nCS1Wx+VY3z06cvI3EynCRdCxZYgyMDnvHdzG9oG4pSkacYcqSyGC07TUZVRE8YWqi20NTMt+RU6YpACAa+w3jysw56yI0Q+p3HHPPjxb1vW7zj3vh+vwpz0lW5ITGv4Xexv3Qf9FTmGXymNHHCWIQtO/DF2YMzai46f8QFbjmzYfOto9ofjIRobw/vMxhBnP/oD2YseyLJEdpOBWbzGxcnL88b6Z4K7TDaSwmhdcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9HNTHH27kEI4pr3YtgeaiPcuQvZJboAXfFdZm/u3Ck=;
 b=F3AiUM9ijmCBLspyE6OvgUFvVUJK+CUPn2xzQRAF+g2kpd34w5smv3pio7D1uikd7GqnprKvU0knomRZnDla6hoKLp+Qei4Fqrg6aSFys6r61J4Lxg6LbMsHWWHsQLPBVJXTTDVHN9TEho/AORek11MBQoS0TaKk1qaHdZBApQp0uzQ6iFd1bFFYYsuYngNRyAh1IsE4dq3ui/a6OlE6G9cMypqJmFxGhK137mHlaS1e5SKUgjxi2vAr+h2oqp67w7yk52pqjzZr08ngkyb/BsjA/tkDIObdcgKJM541Gwn32IS5MQgc12iAS95XmvTvyM5zl5GacCsPzC206Xe2vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9HNTHH27kEI4pr3YtgeaiPcuQvZJboAXfFdZm/u3Ck=;
 b=c4ShWz9iZDSJfuq/B3TtPTNA7Y+0h2Ho+zN+YtwkJlRReRWt2dQcH5h+i9XAR5Z5edafEgnWsv+a/ou1BdX1vRY+kIyA0ZyZm3i1TlOZr41IC1ywxO60knKS+2jhKIOxUT+QW7PcWIPoJYwVxJRsCX3CSovKZNfznmfYJuUthuZ4Q+a4cbKWR3Km/aiKwuyhyzRxIxoc+XLOeKNReOUxh60sLAdAXA4Fk30d72hLKhz9d41/NWlXZOEhn51gAV5toUsxvQsXj0QiMqrxbVFn5FoDenmT+HYjiYywwInrPwG9NB29LqcyUxpRbhjcgBqdq2nVUC5n7hwBZPl1UVqUow==
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by AS8P192MB2021.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:56d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.17; Wed, 22 Feb
 2023 09:39:23 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322%8]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 09:39:23 +0000
From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][dunfell][PATCH 2/2] openvpn: upgrade 2.4.9 ->
 2.4.12
Thread-Topic: [meta-networking][dunfell][PATCH 2/2] openvpn: upgrade 2.4.9 ->
 2.4.12
Thread-Index: AQHZRqEtcgrBrndRPkGnEf5NNDaBfK7atY9Z
Date: Wed, 22 Feb 2023 09:39:23 +0000
Message-ID: 
 <PR3P192MB071407F89FE9B7A1AA8EE484DAAA9@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
References: 
 <PR3P192MB0714ED9A8AE4A3E5FAA10143DAAA9@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PR3P192MB0714ED9A8AE4A3E5FAA10143DAAA9@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P192MB0714:EE_|AS8P192MB2021:EE_
x-ms-office365-filtering-correlation-id: dbde6f23-e74e-4dee-376b-08db14b8ae3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SucldhdmsOJ37nH+ReIr5b+Eltp/36F/Jj8vpZv7F5RjXFc4PUgmYDgQhlHf0Fzh+5bLKnUSMoedOYRp2fL0l3E+9V5oSw0+iY5ihf24NDpvF3RmxXhA1ThLcjNzT3my8NWVD/YiA7/WVyb4YqNdhHycbJ3HwFf1H5hMV/1uzfN6sQwEkkB/gbS+DyT1GZdUZ7ga4iWq8bB3xGoOcA6E6rNHW0PxXNHSrUMQ5n6RFkhzZ0JC5doL2G+QG95kqAZ45YFhL5p3J0HsX4aA16vGnNhgJmsFYDQqyWvl2lBB/tAG1jm171lH6NNKz8QQwFwdae1NXbyGXER3WCWBwlmm7L4bmeSfAZ1mfFpcNJxsWgH3TMY6wC30dtZ1fqd18MgPzMihNcxlK+ihLMXHf89U2H3ID6kGsTD+0u99C6ZEXxZKAG8VzaaLAXFEdq+qj+jgU7AhySikDsdaLYnJuMZ/i0oUOwDHU4rYUH/rU0chKRKyTZu5uG8rU42g/8HoopC8KwGjvMrRR2/jVycj/4noIKu94xBtXDkRoSwq5dNss9KCz0eWctElfZw4Y+gc4pEhDCNHbHSvAqpUEvKw8VrvGIXF4iBySuDL98kBlxgtGCd7kSkBRZCa6McDJ8vSqr1JWkbg42nYMcHMgMiNmZa7M6+ypZBbBe70EqujNtHFE5wWA/4E4z22kxJ39dEGRs19
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39840400004)(396003)(136003)(376002)(451199018)(33656002)(83380400001)(316002)(76116006)(7696005)(71200400001)(186003)(41300700001)(2940100002)(55236004)(26005)(9686003)(52536014)(8936002)(2906002)(38070700005)(86362001)(5660300002)(478600001)(6506007)(66476007)(66446008)(64756008)(66556008)(91956017)(38100700002)(122000001)(55016003)(6916009)(66946007)(8676002)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?pDylzVWADCsDmiNpNSToSbrQrKthYv0Kz4cbGTuFfxc3KL679IbUg1hybc?=
 =?iso-8859-1?Q?PYtWIQq3Q6LdZoKzgjEpHFUtZVxfHDpCot2dKvbL17YxLj5xXJ70q7k9tt?=
 =?iso-8859-1?Q?KCvqVfT1T466E34Mdn01kkA9z/B8LuQGvUrVm5iAPgTcKZBakwrJNvOGDK?=
 =?iso-8859-1?Q?Q/epAdPoLv1ZFsUrva/b/TVgFU48Lt6faFXv/TWocZzb23TK4VLhBzci+R?=
 =?iso-8859-1?Q?LLvaxzPDjvwX2Lc4JTBpvjDHB+A5RDCTOQgnAXHDoZJaemS2LcukD1IWvp?=
 =?iso-8859-1?Q?WADqdBhHJ/1MM7jvqB/SlXoD8PhYfISXU90pBB+LfdnVP2bcJpKVW6o3zW?=
 =?iso-8859-1?Q?WnDmbegIXiilalvKS4L7MaUn6HtrSsALxlbYjDNShoxYDESdvYQZpdC/54?=
 =?iso-8859-1?Q?l4sTbbTejeF36dOtdgO6RIUDE5EXro6X3sISP60t45FMmyeVAilkrdtqlQ?=
 =?iso-8859-1?Q?LULEqvYbagyDiL4RRXaAV+AhHu6IKsjWJVw6OGlBO4NIaa65x+bJvv8f47?=
 =?iso-8859-1?Q?jmjaqTBqlmGIcZnE6+IlzeyRHmpJuZc3prxAjVNdF+zkGs3MqoRuu/TF5e?=
 =?iso-8859-1?Q?OSQnY91WIsvSHUtVGyX77jm2mmIRpqOUgJ3d9g39/WM1OX08FDDTL1LMxI?=
 =?iso-8859-1?Q?Ms3L8m3uAvjvpF4rdKiOJAyYXA7BDKb//9hPEc7vYjELDRTkRT0oQVd6w+?=
 =?iso-8859-1?Q?GUxuEz3ZoXL62qVqS8H6T/NyIzc6PoDOOu8B7mZfwJfyIv+vVPcquUz/ow?=
 =?iso-8859-1?Q?KXzJJLvi8qKnW+36E8A12IxUIHpnMrrSNm0emttajtbjBbj8zBT9b64lnz?=
 =?iso-8859-1?Q?SkQKE4s/nINofz1fOwldE7dgX8qCUErB1f7KzX6TOC7Ya/5GdyJsveJeq3?=
 =?iso-8859-1?Q?Hr/9oMPb9ZyNGrg/IyzlpafF8pFjfdQWqkJzs/p5QdlSsdWbfN6l/QeqVT?=
 =?iso-8859-1?Q?a0QMHS9Dr7FSLtWAqXOpfLx3iRgNHbc4M6sdE1t51ifoNQiQOzFRtg1aHi?=
 =?iso-8859-1?Q?fdKJQP4Fe7kTjNpvDmYl+FaOLCWcIrPbsgcWEIxW84h98rWZe7YPSNL6Yy?=
 =?iso-8859-1?Q?6uyxtactsTe061E93tGAaCw7x9eiFZaQLNYSfujwJMD/Tn0dkyKbBmNTi/?=
 =?iso-8859-1?Q?1zOJ1quelr/X5fZNPn5uClRIpB3bzyn88yo+6pZ03mDQlvPe2qXaGwWRQ2?=
 =?iso-8859-1?Q?EtJcX1Fp/87k6GGbjIw1lOtdg+gXkjg3WqFIPsbgl93BUrOYM1vDm48eLt?=
 =?iso-8859-1?Q?rNuGr7gN2oYUnme7IlHEMIUPuVbdj9JY3MEqtN+Com/hTgereToFR/uuES?=
 =?iso-8859-1?Q?2PM4NeuBfHI07nWHo+lPT4GuKqVnK9bFX6FmCpYGIgf0Rdde27xJgLqllZ?=
 =?iso-8859-1?Q?INP8d5qAM3m21dwmR0TUtPJUYTGHAOwxSvCGeAwymKPTLfg6Fe2bKcuL/A?=
 =?iso-8859-1?Q?wCnoUOy0crXuBvy1x+xbynO+aRcBCZVqm3tKLQn9kPfrmXjNsXN9oQspl/?=
 =?iso-8859-1?Q?t2eVSxXumxemQ5xNlQI2nCpfCw+9iEM+/JuIqSoI2WQrMsAe2SOy7p/Uhm?=
 =?iso-8859-1?Q?rWq9Vd9RBwY3uOYzaupWmggYyhWYV0ungJBLigpaPvPLm/UE/wsmqDlbY8?=
 =?iso-8859-1?Q?cZ4UyKyj825gH6jMNoaunMSc4qyVCqhogI?=
Content-Type: multipart/alternative;
	boundary="_000_PR3P192MB071407F89FE9B7A1AA8EE484DAAA9PR3P192MB0714EURP_"
MIME-Version: 1.0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dbde6f23-e74e-4dee-376b-08db14b8ae3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 09:39:23.2333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54zWF/BwP2sZYx6syyQQ7cgAOVCsIT6SD8HsiAnpTDna4dYCuzFX5e/MBOrYDRR1FPG1Gci3PI66wcN2AfrP+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P192MB2021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 09:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101205

--_000_PR3P192MB071407F89FE9B7A1AA8EE484DAAA9PR3P192MB0714EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Fixes below CVEs:
* CVE-2022-0547
* CVE-2020-15078

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../openvpn/{openvpn_2.4.9.bb =3D> openvpn_2.4.12.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.4.9.bb =3D> open=
vpn_2.4.12.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb b/met=
a-networking/recipes-support/openvpn/openvpn_2.4.12.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.4.12.bb
index 4820d3d96..55e66036b 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.12.bb
@@ -14,8 +14,8 @@ SRC_URI =3D "http://swupdate.openvpn.org/community/releas=
es/${BP}.tar.gz \

 UPSTREAM_CHECK_URI =3D "https://openvpn.net/community-downloads"

-SRC_URI[md5sum] =3D "52863fa9b98e5a3d7f8bec1d5785a2ba"
-SRC_URI[sha256sum] =3D "46b268ef88e67ca6de2e9f19943eb9e5ac8544e55f5c1f3af6=
77298d03e64b6e"
+SRC_URI[md5sum] =3D "e83d430947fb7c9ad1a174987317d1dc"
+SRC_URI[sha256sum] =3D "66952d9c95490e5875f04c9f8fa313b5e816d1b7b4d6cda3fb=
2ff749ad405dee"

 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not fo=
r openvpn.
 CVE_CHECK_WHITELIST +=3D "CVE-2020-7224 CVE-2020-27569"
--
2.39.2


--_000_PR3P192MB071407F89FE9B7A1AA8EE484DAAA9PR3P192MB0714EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
Fixes below CVEs:
<div dir=3D"ltr">
<div>* CVE-2022-0547</div>
<div>* CVE-2020-15078</div>
<div><br>
</div>
<div>Signed-off-by: Hugo SIMELIERE &lt;hsimeliere.opensource@witekio.com&gt=
;</div>
<div>---</div>
<div>&nbsp;.../openvpn/{openvpn_2.4.9.bb =3D&gt; openvpn_2.4.12.bb} &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; | 4 ++--</div>
<div>&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)</div>
<div>&nbsp;rename meta-networking/recipes-support/openvpn/{openvpn_2.4.9.bb=
 =3D&gt; openvpn_2.4.12.bb} (95%)</div>
<div><br>
</div>
<div>diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb =
b/meta-networking/recipes-support/openvpn/openvpn_2.4.12.bb</div>
<div>similarity index 95%</div>
<div>rename from meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb</=
div>
<div>rename to meta-networking/recipes-support/openvpn/openvpn_2.4.12.bb</d=
iv>
<div>index 4820d3d96..55e66036b 100644</div>
<div>--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb</div>
<div>+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.12.bb</div>
<div>@@ -14,8 +14,8 @@ SRC_URI =3D &quot;http://swupdate.openvpn.org/commun=
ity/releases/${BP}.tar.gz \</div>
<div>&nbsp;</div>
<div>&nbsp;UPSTREAM_CHECK_URI =3D &quot;https://openvpn.net/community-downl=
oads&quot;</div>
<div>&nbsp;</div>
<div>-SRC_URI[md5sum] =3D &quot;52863fa9b98e5a3d7f8bec1d5785a2ba&quot;</div=
>
<div>-SRC_URI[sha256sum] =3D &quot;46b268ef88e67ca6de2e9f19943eb9e5ac8544e5=
5f5c1f3af677298d03e64b6e&quot;</div>
<div>+SRC_URI[md5sum] =3D &quot;e83d430947fb7c9ad1a174987317d1dc&quot;</div=
>
<div>+SRC_URI[sha256sum] =3D &quot;66952d9c95490e5875f04c9f8fa313b5e816d1b7=
b4d6cda3fb2ff749ad405dee&quot;</div>
<div>&nbsp;</div>
<div>&nbsp;# CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN clie=
nt, not for openvpn.</div>
<div>&nbsp;CVE_CHECK_WHITELIST +=3D &quot;CVE-2020-7224 CVE-2020-27569&quot=
;</div>
<div>-- </div>
<div>2.39.2</div>
<div><br>
</div>
</div>
</body>
</html>

--_000_PR3P192MB071407F89FE9B7A1AA8EE484DAAA9PR3P192MB0714EURP_--

