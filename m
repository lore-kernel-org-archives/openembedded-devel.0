Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE88C64ED6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 09:36:06 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.60])
 by mx.groups.io with SMTP id smtpd.web10.4964.1677058560175320989
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 01:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector2 header.b=cGr+QP/p;
 spf=pass (domain: witekio.com, ip: 40.107.105.60, mailfrom: hsimeliere.opensource@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSastOae2neAxaOECzDDfgRhFzvxCYQsVUuTzqTmwfM0lrrK/zyTgEG1eeyQTpoaIH64MheM0XX+dWeCRcqPKVGmgKLQ1hVa6jIu7VpmV65t275VNLI35E/vWKAXwX18TX6D9+Jj3dDT6QlBJN1M05UkisF4UXL8pv6exbUb6z5xoEQwo/c7mK3vYkrwz2NTl9JxW3APvAnoE4YXjqLdG82yRsvnQcuay5Zp28nGyYCCBxfLc/gyBLcLVP4kbC9qTQ7OjenvdCoKJ3mFbSxrZiaKPC8VzWtezLTjg2INsr555SkO1ZG7V6UuImkjuBbwSNLj4b/L0e3gNOiTIOw1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2j0jVSo1QGu45ITN+cSkuB4hM2Rv5LWFJgAEWbHmC2I=;
 b=mCvz6F7oLo1OItYGOCNp3mB8HRJr6eO5U2kqb1pvzu8OiDrcfBV5rKOOFNFROMWqys2QlZiueh9GtiIqllnaq1pHOeJ4UASBP1sPwyhJ+OMyY9ylyyz6qck4mFQEFqS+VEVtjjECsm8SYUUs4XtRDeRMiddZdP6Z7MG/RzbT4QtcnDo5GkQc2My4CaKnulNerLIAi21r7edhgA+Xp01IWlAoo6zjfg9qF+5I+B6++jiwcMXFoBjhgGqQ/VjckAB2eKQZ5wWjU3jAtpyw5H/AHBuEOpFz2D0ODqbYRFeHwA2GvbsxUbLVBbymCKwU4C2pUv+zLBKbZWRgEb4pkwAXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j0jVSo1QGu45ITN+cSkuB4hM2Rv5LWFJgAEWbHmC2I=;
 b=cGr+QP/pidCSag6GU24yfedoLZzNSQ3cgIRxX7IOmDhqMX/5fby/cqQC/WfkYgaebWx8XidtUTlVWLmt7gyAqTMpemAsfSRX0QKuPEvQIOZjkXJKEuiVm7pvmpeRBRhkYkNIFcFJGM8UKE5e33qePxj7DgY3bZmIGTe6vt0Dc2Pu/k2ewfix6xAiF0edmVxGHwSIKwYreomTOzR604Iisx2COaZ8bpLu1St1RtYhEBaCkfDPyMO+GvV+1d1K66ej1Kuo4TP6hlNfRyM4vVhs6ynYqjUuCNiJCPVn8kenZQWA2OQjb0LMS8bvpU555A0xbQpqSWeoquAicVHdROkQkQ==
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by GV1P192MB1932.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.15; Wed, 22 Feb
 2023 09:35:56 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322%8]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 09:35:56 +0000
From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][dunfell][PATCH 1/2] openvpn: add CVE-2020-7224 and
 CVE-2020-27569 to  allowlist
Thread-Topic: [meta-networking][dunfell][PATCH 1/2] openvpn: add CVE-2020-7224
 and CVE-2020-27569 to  allowlist
Thread-Index: AQHZRqC8jbwzqFxXCE2ZkGes0Mujpw==
Date: Wed, 22 Feb 2023 09:35:55 +0000
Message-ID: 
 <PR3P192MB0714217AA7E122207C9CD858DAAA9@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P192MB0714:EE_|GV1P192MB1932:EE_
x-ms-office365-filtering-correlation-id: a0b0ddce-9e34-4395-b8f3-08db14b832a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wIEwzlA6pcMn5LavHGWeCX5ocTCldPBtRFDQ36riCIj67ryFcx46DIrHoao5nHpIXnkxM/52y87YUcupOdcsqXgu4rdVTNROk7yICfPsMLSzIeBoyOGSyQtRKZb/xSVEXNi2jm/OQOOkHZd3lHVIIH5l2ka3808Xua0CcNwVYjcuErTLpFdZAqsT8WyRYjC9qnd9v9Jr6WXa4ZCQ6hpklo764UyZFokSVs2lEpqS5vtvIawkEYxIVUg9J8vsUAtJxnWu3XncoyFPT6CDD27bV/nqZscugIRxRPvzQzVtvWBFUclFQkDmzO4DsfqGrWD4T6SK4MnCzwXziGzIkle92CYtvdDqxCjjOJvNAM7lxkmX7kttZEoKed1YIVs8b3VyaRvBIMlo2DFspFmLnZ/DZnUxmmNX+Jo5LsFOUgePE+XNFAbPhu5a45YFykOsrwddl7iDfiy7ONFIaEI0yxmjO0sJ2wPKCyY6Tp6UQ6M08TiiQ5en3nZQ6bxqPX+qT92Iad6D2y5ljOFgMPkEuEOqog3+Stpp72S1x2mWAgTLH+jdlLoGBnCYq81xQfikltTfT6A80ekeJ6cX9zX94YR6ZEVEiUcuYAwhkzfI7CVPsopmJAkTWak3OOg+besk53dsZdvjt96Usta2A5HZxRLJNXMQ4vflinNbkzPyuay9dTF2/SL8vZ+pDwtL4MTU993w
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(39840400004)(396003)(136003)(376002)(366004)(346002)(451199018)(38070700005)(19627405001)(83380400001)(55016003)(33656002)(7696005)(186003)(38100700002)(316002)(8936002)(86362001)(122000001)(478600001)(26005)(71200400001)(55236004)(66446008)(6506007)(91956017)(66946007)(66476007)(66556008)(76116006)(9686003)(8676002)(6916009)(41300700001)(2906002)(52536014)(5660300002)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?g2jtXWuNjVjQll51Oz54mGdYgaqvGbJaLbHwApVhFg7bW3XxHtoleiclY8?=
 =?iso-8859-1?Q?ixdwQJaDr6aMlJpH8/0JcfmcWCMcHI39qgAwHrw8q/m2N6ehe4IZeNLaqB?=
 =?iso-8859-1?Q?0AWtV9dYKeFEpV7wU9OvWuPD/AfxZMBeJE9MFohTh2usl97NpbKm7ulH4E?=
 =?iso-8859-1?Q?CWqzwto2A8P5tAzDp2+rSxXzTEICeF3clVvpZpIJirEMKRmv83wJPGSmqi?=
 =?iso-8859-1?Q?zP4b4fTCxntMQdAEI3dhE81fk0oVHOubTYfVZbLw4n5jMbLUeZQw4vWm9b?=
 =?iso-8859-1?Q?R2UsetT9lvZPnzhDcv0+OYfC5ysEhdJcqvS/fLKfQ8P2alc29fIZ9qSuy4?=
 =?iso-8859-1?Q?PH5yhu5DSavonpqeyiqKwQt4Z1PEmGs8CfDIDdvGtLpFn/YiEQ9zZK2gpW?=
 =?iso-8859-1?Q?zFomzpR63NmPaRKesEnQ8kbSmJoeHb92hU3NLIPKBXijMAt2JHVJ9OuxZG?=
 =?iso-8859-1?Q?XRrENzRUxAEOeWayV6bKuQW8/NnHhSdfrCOT5n5nS3r/voDMjn90Ms0xG4?=
 =?iso-8859-1?Q?0+H0v1CWWdP9Wb3PK4KaAKDSFphJTZtRsfTMpaTiFhOnNAHOIMTDuEHaqT?=
 =?iso-8859-1?Q?v95kmHWZh+mi/XKhMJbKVUEOiR5zx3bTjpwJ2iLOrjaV2XMqqHfhpvEG3M?=
 =?iso-8859-1?Q?9miNAs2edb15dgK4A+U22uZOoVRsKJF/LYb7ItQQ8E/JR2h7M6T0AXsEQF?=
 =?iso-8859-1?Q?0rsRXlFdwbAIc6jPUKUijM0EseCIFh8aS8ACnptts5Jdnbvvy6egAHbA/Y?=
 =?iso-8859-1?Q?r/4CVicu8PfjbMnN5zPUg/DLzp2YVeCpw9eJypW7+0uyIDkahb+/rlW69H?=
 =?iso-8859-1?Q?QfuUWjZK8ygeoNLw7MGZ/s6tuoT/Ttd4UylxZHE4QM30K+WYb1JHO8XbJO?=
 =?iso-8859-1?Q?lEqzBukGHeKz1+ogVotk92PaUXQ1/eWXip1PnqEl3PuL5b2AH9rpCOGYng?=
 =?iso-8859-1?Q?mnWHAt3orx0ipaUoBW7X/QAawe4E3Jo3pUXIvGujt1wVQR4V5Iy3l1u8LE?=
 =?iso-8859-1?Q?LR2+4KngX+SIvt2JYLrr4sSqz7Zs7Kn3MQUiX1MnibbD9X46dERYoj150A?=
 =?iso-8859-1?Q?QPlFq/dh6e6MeSPaba9NbUDwiCH0Md/Nix9WYV3nh4nrTOOqVZmSLvsUxn?=
 =?iso-8859-1?Q?zz45x6GQT60sTXrAFZ7kCGvz8MhJth/IMlCZ9mmH0WWu5hTRCJeeq3y9e2?=
 =?iso-8859-1?Q?nvvjrtp6fOZKwr1sh346hJtfMH5Fjvx1nzlD6QDNBpH/mdAGtBIdqCE4WC?=
 =?iso-8859-1?Q?Q++za+9lXFWVM0oYLxB2OdEzqP3/jPagQqiLwJxQZb2ugpYpXSyOf69RYs?=
 =?iso-8859-1?Q?NkQVV0g3Y6UsB5thWTU6EQVTo4f0hRXXXMRcIYpah4TBW2oQjZZQV852+E?=
 =?iso-8859-1?Q?fLmYIscrt8dkfcrNWlwqfDsTgaj/fYq0aReGQ1lkLYXkLI5EN+WYH2572t?=
 =?iso-8859-1?Q?jyQ+q1ov25rkXM7/Jddke9WaWrn1BevxGdhFWiElovlCnOGNKKS+c5KOLO?=
 =?iso-8859-1?Q?vVACoGHEi+pHJC/m30qhKjryvB7+SId8zeV/p1Nl97E2vM0lqFQ/BlT3yh?=
 =?iso-8859-1?Q?esZHTT7EgC9Rd5Dt6TW4IB1vVWiQgPbuXQE/I6F0SQCoEE4ccCz7R76ZRu?=
 =?iso-8859-1?Q?Mxqy2uPuMcg1Ls/uRQnYxq0elkn+Tz2Mhs?=
Content-Type: multipart/alternative;
	boundary="_000_PR3P192MB0714217AA7E122207C9CD858DAAA9PR3P192MB0714EURP_"
MIME-Version: 1.0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b0ddce-9e34-4395-b8f3-08db14b832a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 09:35:55.9094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uc6YKX/4y7FNTi7m2J+vKNJg+SNIARSSqjWGW3yqh+908B3uUoz5JlUcBFksZ2gG0DkfaYfcoB0XT8gFqP/PnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB1932
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 09:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101204

--_000_PR3P192MB0714217AA7E122207C9CD858DAAA9PR3P192MB0714EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client,
not for openvpn.

Signed-off-by: Akifumi Chikazawa <chikazawa.akifu@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(upstream from commit d49e96aac4616c439a2d778b95a793037dac884e)
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb b/met=
a-networking/recipes-support/openvpn/openvpn_2.4.9.bb
index 529e3912b..4820d3d96 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb
@@ -17,6 +17,9 @@ UPSTREAM_CHECK_URI =3D "https://openvpn.net/community-dow=
nloads"
 SRC_URI[md5sum] =3D "52863fa9b98e5a3d7f8bec1d5785a2ba"
 SRC_URI[sha256sum] =3D "46b268ef88e67ca6de2e9f19943eb9e5ac8544e55f5c1f3af6=
77298d03e64b6e"

+# CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not fo=
r openvpn.
+CVE_CHECK_WHITELIST +=3D "CVE-2020-7224 CVE-2020-27569"
+
 SYSTEMD_SERVICE_${PN} +=3D "openvpn@loopback-server.service openvpn@loopba=
ck-client.service"
 SYSTEMD_AUTO_ENABLE =3D "disable"

--
2.39.2


--_000_PR3P192MB0714217AA7E122207C9CD858DAAA9PR3P192MB0714EURP_
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
<div class=3D"elementToProof">
<div id=3D"Signature">
<div class=3D"ContentPasted0">CVE-2020-7224 and CVE-2020-27569 are for Avia=
trix OpenVPN client,
<div class=3D"ContentPasted0">not for openvpn.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Signed-off-by: Akifumi Chikazawa &lt;chikazaw=
a.akifu@fujitsu.com&gt;</div>
<div class=3D"ContentPasted0">Signed-off-by: Khem Raj &lt;raj.khem@gmail.co=
m&gt;</div>
<div class=3D"ContentPasted0">(upstream from commit d49e96aac4616c439a2d778=
b95a793037dac884e)</div>
<div class=3D"ContentPasted0">Signed-off-by: Hugo SIMELIERE &lt;hsimeliere.=
opensource@witekio.com&gt;</div>
<div class=3D"ContentPasted0">---</div>
<div class=3D"ContentPasted0">&nbsp;meta-networking/recipes-support/openvpn=
/openvpn_2.4.9.bb | 3 +++</div>
<div class=3D"ContentPasted0">&nbsp;1 file changed, 3 insertions(+)</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">diff --git a/meta-networking/recipes-support/=
openvpn/openvpn_2.4.9.bb b/meta-networking/recipes-support/openvpn/openvpn_=
2.4.9.bb</div>
<div class=3D"ContentPasted0">index 529e3912b..4820d3d96 100644</div>
<div class=3D"ContentPasted0">--- a/meta-networking/recipes-support/openvpn=
/openvpn_2.4.9.bb</div>
<div class=3D"ContentPasted0">+++ b/meta-networking/recipes-support/openvpn=
/openvpn_2.4.9.bb</div>
<div class=3D"ContentPasted0">@@ -17,6 +17,9 @@ UPSTREAM_CHECK_URI =3D &quo=
t;https://openvpn.net/community-downloads&quot;</div>
<div class=3D"ContentPasted0">&nbsp;SRC_URI[md5sum] =3D &quot;52863fa9b98e5=
a3d7f8bec1d5785a2ba&quot;</div>
<div class=3D"ContentPasted0">&nbsp;SRC_URI[sha256sum] =3D &quot;46b268ef88=
e67ca6de2e9f19943eb9e5ac8544e55f5c1f3af677298d03e64b6e&quot;</div>
<div class=3D"ContentPasted0">&nbsp;</div>
<div class=3D"ContentPasted0">+# CVE-2020-7224 and CVE-2020-27569 are for A=
viatrix OpenVPN client, not for openvpn.</div>
<div class=3D"ContentPasted0">+CVE_CHECK_WHITELIST +=3D &quot;CVE-2020-7224=
 CVE-2020-27569&quot;</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">&nbsp;SYSTEMD_SERVICE_${PN} +=3D &quot;openvp=
n@loopback-server.service openvpn@loopback-client.service&quot;</div>
<div class=3D"ContentPasted0">&nbsp;SYSTEMD_AUTO_ENABLE =3D &quot;disable&q=
uot;</div>
<div class=3D"ContentPasted0">&nbsp;</div>
<div class=3D"ContentPasted0">-- </div>
<div class=3D"ContentPasted0">2.39.2</div>
<div><br class=3D"ContentPasted0">
</div>
<meta name=3D"ProgId" content=3D"Word.Document">
<meta name=3D"Generator" content=3D"Microsoft Word 15">
<meta name=3D"Originator" content=3D"Microsoft Word 15">
<link rel=3D"File-List" href=3D"Hugo%20Simeli=E8re%20(hsimeliere@witekio.co=
m)_fichiers/filelist.xml"><link rel=3D"Edit-Time-Data" href=3D"Hugo%20Simel=
i=E8re%20(hsimeliere@witekio.com)_fichiers/editdata.mso"><!--[if !mso]>=0A=
<style>=0A=
v\:* {behavior:url(#default#VML);}=0A=
o\:* {behavior:url(#default#VML);}=0A=
w\:* {behavior:url(#default#VML);}=0A=
.shape {behavior:url(#default#VML);}=0A=
</style>=0A=
<![endif]--><!--[if gte mso 9]><xml>=0A=
 <o:OfficeDocumentSettings>=0A=
  <o:AllowPNG/>=0A=
 </o:OfficeDocumentSettings>=0A=
</xml><![endif]--><link rel=3D"themeData" href=3D"Hugo%20Simeli=E8re%20(hsi=
meliere@witekio.com)_fichiers/themedata.thmx"><link rel=3D"colorSchemeMappi=
ng" href=3D"Hugo%20Simeli=E8re%20(hsimeliere@witekio.com)_fichiers/colorsch=
ememapping.xml"></div>
</div>
</div>
</body>
</html>

--_000_PR3P192MB0714217AA7E122207C9CD858DAAA9PR3P192MB0714EURP_--

