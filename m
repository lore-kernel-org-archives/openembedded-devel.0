Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E796CC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 18:30:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.62])
 by mx.groups.io with SMTP id smtpd.web10.48633.1677001647397782261
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 09:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector2 header.b=dBFJamcC;
 spf=pass (domain: witekio.com, ip: 40.107.22.62, mailfrom: hsimeliere.opensource@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiO5vXuvhCa4EJRx6prEmrDR37/i1AJ0mAonu0E5Gl77m75hV0a1Z0ZmMSYnWdV9o7BqQZk7ypaq1mtb+V0VkK4+W8V/x32ugSX4UVONwRFLVNb7LI+vfz4BWzov5v4jvvXOvfU9K2PsnNJ/3v0nqHf9wi6MmPk4taWUVtuzvMepM4Ft4m2MbxKSMyhqd2eLQH3nGEyvWZ0A7NsBTPvTQSQye/l450LRPi/RHAe7+SjxEvqLL2Na1O7wGetH+4bfF6tCKSfZowqrlBcgti9sVc2X7+mbJi/1Dq2dip/zFy5Y9LvYQxrOvERBzwqw802CRP64eXHtyAk/T+Fsue8HTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTmC/f/+iEKVOP/GijehM2BG7nNfCEIP3GGcb40DyKM=;
 b=j/Xz5FieZ1SaiyPbegXcCzY23BfYUc+gVvRf+U2POg1sn0gBikgE3n4EctKlrewXI8GjUs8KU+LFEZW0Z+YYOgyMkDuX++RXv8Cks55pIy4VwjenShIpOnl5iQWNmL/TpTXhbj6wHNe/9BABwcVymS2IXYzlWnzZO6Zq8Lo9QFGD6td4CBfkNF0ZHlWhbE9OeDkDG96KrER6bmsgWHbgNZo7arN5h+gh6tFc98FYStm6d9qKrWe3fUqDoySgPNZagkAcvxu+NaaJrUAC4jIJ/4pkkTCo/ftoiQ6I9JICPDKroUjUYba78LnE1t0Lg4VtWXQ2Ay/ejthXACYuLPy+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTmC/f/+iEKVOP/GijehM2BG7nNfCEIP3GGcb40DyKM=;
 b=dBFJamcCY6/TZrMF6RrrRjXfFA5xzxI8qr6hTLR/DNDlMq0RIikB2Eu0suPPxJITv/eAwlWWVQrCzWBosoFq0xG+OmxqsC3QVCVIswnCR5xo4SV/bdP1ED4vMhWd6+43dQ3lJq/GCUwdoxsHvQD9SSs/kQfqfCakidT13VBl/3Z8LilNRhXkjx7wGZQ4C2SQFXqC3b7D/9mxD5fRgrlJ7TkgFEAhsJnnGHSVot4R/19XM894/FcITsjGmTBsdBOvLqyA8nrBEHcKlwEWgq7Zu18fkFlDSr6aJDbzaiTueyPZbZS1Gu323cVKtUHYmOknZtJa8I/mw6yur7/SRurX7A==
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by DB9P192MB1708.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:393::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.15; Tue, 21 Feb
 2023 17:47:24 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322%7]) with mapi id 15.20.6134.017; Tue, 21 Feb 2023
 17:47:24 +0000
From: "Hugo Simeliere" <hsimeliere.opensource@witekio.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][dunfell][PATCH 1/2] zeromq: upgrade 4.3.2 -> 4.3.3
Thread-Topic: [meta-oe][dunfell][PATCH 1/2] zeromq: upgrade 4.3.2 -> 4.3.3
Thread-Index: AdlGGatDY7TETaqlSg+biHq2lD+VUgAApY4AAAALqnA=
Date: Tue, 21 Feb 2023 17:47:24 +0000
Message-ID: 
 <PR3P192MB0714EF98477EEC643F6472BCDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
References: 
 <PR3P192MB07147F5AED87B5910212E896DAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
 <PR3P192MB0714EDE5FDDFCA103DD8151DDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PR3P192MB0714EDE5FDDFCA103DD8151DDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P192MB0714:EE_|DB9P192MB1708:EE_
x-ms-office365-filtering-correlation-id: 993cee82-b17a-4143-6540-08db1433b0ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FLldLobR9k25rBwvGbc0bTM9GvpLa6L2DtFHSCBxg/dBc8bKdAtqEuS23WYIKBzLTimz424K1oQ0Zz47WHz5fLdGXzDKDXKD63aE5RF4sa3DEgMZ5lFApY7iYXan4DcmTqMxC8SrrNODQByRuqhGsiQ3pUlPO2waBlk59bcqFO84GO6SXv5nFfJMspMpPXLB1gSRul6N0as3QkG6nJtq2L9OOgqYkpVwOUrx8Jpi+uXyEfVqPlK2AGXXtii/s+88Q7Tt58BM5cqaPhoIBG9hxiQPg6z6AeEYtfmUET39k7Rss+jx1aPTd1usdc2gAviQ0qNwXDVLDzSm047MBl50WkCJ3lyNvmTa4vYyuQG6x5pSz6FUphEvmLVliooV1OYKAFbKfxdXtD+ZwoWNrZUojPJxO5+VYYGK3IOWiJkWNx/nHazh8hf42NF5228M8F/ng5u0Mp8pW8wb8AVj3srBbbZmSL+78FEUVwCmYWEaZNxCBXcsFKdCe4cmRhPVCWkStPyN62B24kK9dHWfp7HZNwbYKYHSw1qD409xWbqJCvUU6tb101cJEUuCqKqbLQXO0b2at2I/H00wNEY2zyeJLcQMqU3uZJ24OvzSLiwL+3apXkePUV4Hlpp3Q78LZGQBaBFsf7tEoC3w59DwL/Z6KiRSZFSl0vssKBDcp/5IUDwpVBsnNJWfGiwF1ls2jL2e
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(39840400004)(346002)(136003)(366004)(451199018)(86362001)(83380400001)(38070700005)(38100700002)(2906002)(122000001)(5660300002)(8936002)(55016003)(166002)(33656002)(6506007)(7696005)(66556008)(66476007)(76116006)(52536014)(66446008)(64756008)(186003)(41300700001)(2940100002)(8676002)(6916009)(71200400001)(9686003)(316002)(478600001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?n9DpFM6Y+3INgS/kN7ckoL8zNDbnDsoWYwNmzVhkrGDovTbjCSI04pmouay1?=
 =?us-ascii?Q?3oQ1DYSq5PKpD5JfQDr0KO6PGtFuw+zbbiVpwktLQi8A4YsYQMtjITu8dUMk?=
 =?us-ascii?Q?1haOJ/NbGVV+ULEauj51qXulEE/Vw3Yi6XiQMThvcurbJnVp5yHhxq7owW9h?=
 =?us-ascii?Q?Q4IjLYMwItibR6GE+xVPN8xd/n8XN60+30ctSsTMJI+/N6/Nf43nqiji2vzA?=
 =?us-ascii?Q?fHvs7y53L4h/XOw+DMYnVk78ZmEQowosv9zIRQ6sKlAyBi1XHC6DeV1qGkbM?=
 =?us-ascii?Q?e908aOlpybSC5EWJzoD/0eBiWvQ8yCoqSSHW3QdLx8vzNifG2mXBCNj2xsDH?=
 =?us-ascii?Q?UkQmUoGxF686Nts0FbAyCJc1iPHTln7TPMnDq1RYi0aOUzOEQ3eNfHJtDtAU?=
 =?us-ascii?Q?HLSPHz3HZJEorPIPgIyF2GXU5gN0L4CBMamKmzDCwWkcIe3aqKbjDiRFwyGT?=
 =?us-ascii?Q?HSiOQipHLOluBdyMDi3Jf4RTA4YElj0sXyis1LlSF4KNsi8zPNWnVceqX4sZ?=
 =?us-ascii?Q?Q8/AebrNRGnYytQMr+nPaR8qIGgJA9Phbxhue/FcnU9U49Rcoghk63fjp4fq?=
 =?us-ascii?Q?pM7BiayA5jgu3Dm8szULPHSP//XYVHuYNnMrqon7G6z4vVKdkcrzKt+hkYA1?=
 =?us-ascii?Q?uczQnD5EfszMziCSX8HBVWjD3ojrsvnqycbpHY8jrGdJr15acHkqsImPPv5p?=
 =?us-ascii?Q?wC1kcCfI9NnBRDkHi0vnoTicJj/r+vFGrSBKUsy0LgfB+VwsZ/1PXP54xv+d?=
 =?us-ascii?Q?YlDHTzmBKhRR7cHO0dMNQJ99Y5IE0IWfZHifKDCQBEFeTzw3xNB2a2cxuSbe?=
 =?us-ascii?Q?vDNNLg5qdamQ5qIg4WuirmMdqNjw0vjmrCPaOFBcrl7xhgtr7vbMpFCToDaG?=
 =?us-ascii?Q?HZM8CLdkzWLJthJrHDg+dO7X7gbkMoa4jvEw9WSTAKG1FgWSnphfLJM7WXCY?=
 =?us-ascii?Q?WCjafHfPVP6BttktORxYhjmZC6S3uJjsAFMazBcO1B4Ns9O5LAHrBfzWYDzO?=
 =?us-ascii?Q?oAxflMMa3NJaGm4ZcQln6Lb/In6Kv6UjsAD1sFnlVhXZBcTOIvNH4K3J9j0o?=
 =?us-ascii?Q?6RRF4HMKmnLAo/8wpELqNj92K0GK9Plbuc+Ga+2OAkudBR0MBmz+ypEGTlP/?=
 =?us-ascii?Q?vEM8/myjGAsTHFnXF3TcACBR66zsya++56VJBNx/QzWh8CVB3e8bRSMCTb3g?=
 =?us-ascii?Q?L53nE8Pjq47eocrvyJ9IezNPc4SteSu1nUZFX4aKL9upOepB5aWBzUcStq7a?=
 =?us-ascii?Q?dMejN5ndA5zHf2v9qZfYkzCH6jxps9a1rl+H/3OGaXb/nghNA3BCRUf5ni7m?=
 =?us-ascii?Q?qqJ8Qnpl/7vNcK1yStNFU4wXmNAsVTBuFe1y/JSuITQ9pyYBZ9hwcX74Mrpb?=
 =?us-ascii?Q?nOIRshVzJjoBha77FjJxjWoJOHVj4ywExw4w01aXJ7boydFI2Wsl1i1wWXzd?=
 =?us-ascii?Q?2jVNMPgKIdT18J/j5AC8mkxkRTIDJWl4X1gBHmeRPH8PAvWVlVnpBJHtHvM1?=
 =?us-ascii?Q?FFynh9re2eBHgpJE4nAQWyS+UyjfatAMLdk7SlI9uOOWamf0F4Eq/7v9p8nf?=
 =?us-ascii?Q?LZphn1EcnM6usAer3/L78AX6Nvqqio8i2WCVJB51F3oNBrvkUxXtutBIFrj4?=
 =?us-ascii?Q?3hKDYgVrbapY0audMy1haiBr+vEzFLzhaT7ZX1pjJTvt?=
MIME-Version: 1.0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 993cee82-b17a-4143-6540-08db1433b0ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 17:47:24.6627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: df9/Z5qS+aJ0HO1vJB7E1SMEnC3NjmhAh8dmN3RK62DATQApdRkYWJ0tyLZkHDuASUv6a8/XOQh0LxOxssCBGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1708
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_PR3P192MB0714EF98477EEC643F6472BCDAA59PR3P192MB0714EURP_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 18:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101194

--_000_PR3P192MB0714EF98477EEC643F6472BCDAA59PR3P192MB0714EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Refresh the following patch:
0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com<mailto:zangrc.fnst@=
cn.fujitsu.com>>
Signed-off-by: Khem Raj <raj.khem@gmail.com<mailto:raj.khem@gmail.com>>
(cherry picked from commit 117b3f95507b464aafe6a1948cf4a79f26194acb)
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com<mailto:hsi=
meliere.opensource@witekio.com>>
---
...void-host-specific-path-to-libsodium.patch | 19 +++++++++++++------
.../{zeromq_4.3.2.bb =3D> zeromq_4.3.3.bb}      |  4 ++--
2 files changed, 15 insertions(+), 8 deletions(-)
rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.2.bb =3D> zeromq_4.3=
.3.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-=
Avoid-host-specific-path-to-libsodium.patch b/meta-oe/recipes-connectivity/=
zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patc=
h
index eb3dee4d3..3b0300c8a 100644
--- a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-h=
ost-specific-path-to-libsodium.patch
+++ b/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-h=
ost-specific-path-to-libsodium.patch
@@ -1,6 +1,7 @@
+From 24ad50286a87833329213dc0b0e68c21aeeee95f Mon Sep 17 00:00:00 2001
From: Niko Mauno <niko.mauno@vaisala.com<mailto:niko.mauno@vaisala.com>>
-Date: Wed Apr 22 09:00:00 2020 +0300
-Subject: CMakeLists.txt: Avoid host-specific path to libsodium
+Date: Wed, 22 Apr 2020 09:00:00 +0300
+Subject: [PATCH] CMakeLists.txt: Avoid host-specific path to libsodium

 Avoid propagating full build host specific path to generated
ZeroMQTargets.cmake when building with libsodium, which changes the
@@ -17,10 +18,16 @@ Upstream-Status: Pending

 Signed-off-by: Niko Mauno <niko.mauno@vaisala.com<mailto:niko.mauno@vaisal=
a.com>>

+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e92141d..d0775c1 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
-@@ -1210,7 +1210,7 @@
-   target_link_libraries(libzmq ${OPTIONAL_LIBRARIES} ${CMAKE_THREAD_LIBS_=
INIT})
+@@ -1428,7 +1428,7 @@ if(BUILD_SHARED)
+   endif()

    if(SODIUM_FOUND)
-    target_link_libraries(libzmq ${SODIUM_LIBRARIES})
@@ -28,8 +35,8 @@ Signed-off-by: Niko Mauno <niko.mauno@vaisala.com<mailto:=
niko.mauno@vaisala.com>>
      # On Solaris, libsodium depends on libssp
      if(${CMAKE_SYSTEM_NAME} MATCHES "SunOS")
        target_link_libraries(libzmq ssp)
-@@ -1240,7 +1240,7 @@
-   target_link_libraries(libzmq-static ${OPTIONAL_LIBRARIES} ${CMAKE_THREA=
D_LIBS_INIT})
+@@ -1473,7 +1473,7 @@ if(BUILD_STATIC)
+   endif()

    if(SODIUM_FOUND)
-    target_link_libraries(libzmq-static ${SODIUM_LIBRARIES})
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb b/meta-oe/=
recipes-connectivity/zeromq/zeromq_4.3.3.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
index 02a4c04fd..a10500475 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
@@ -10,8 +10,8 @@ SRC_URI =3D "http://github.com/zeromq/libzmq/releases/dow=
nload/v${PV}/zeromq-${PV}
     file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch=
 \
     file://run-ptest \
"
-SRC_URI[md5sum] =3D "2047e917c2cc93505e2579bcba67a573"
-SRC_URI[sha256sum] =3D "ebd7b5c830d6428956b67a0454a7f8cbed1de74b3b01e5c33c=
5378e22740f763"
+SRC_URI[md5sum] =3D "78acc277d95e10812d71b2b3c3c3c9a9"
+SRC_URI[sha256sum] =3D "9d9285db37ae942ed0780c016da87060497877af45094ff9e1=
a1ca736e3875a2"

 UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/libzmq/releases<https://=
github.com/$%7bBPN%7d/libzmq/releases>"

--
2.25.1


--_000_PR3P192MB0714EF98477EEC643F6472BCDAA59PR3P192MB0714EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Source Sans Pro";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Source Sans Pro",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Source Sans Pro&quo=
t;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">Refresh the following patch:<o:p></o:p></p>
<p class=3D"MsoNormal">0001-CMakeLists-txt-Avoid-host-specific-path-to-libs=
odium.patch<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:za=
ngrc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">(cherry picked from commit 117b3f95507b464aafe6a1948=
cf4a79f26194acb)<o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Hugo SIMELIERE &lt;<a href=3D"mailto:=
hsimeliere.opensource@witekio.com">hsimeliere.opensource@witekio.com</a>&gt=
;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">...void-host-specific-path-to-libsodium.patch | 19 +=
++++++++++++------<o:p></o:p></p>
<p class=3D"MsoNormal">.../{zeromq_4.3.2.bb =3D&gt; zeromq_4.3.3.bb}&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 ++--<o:p></o:p></p>
<p class=3D"MsoNormal">2 files changed, 15 insertions(+), 8 deletions(-)<o:=
p></o:p></p>
<p class=3D"MsoNormal">rename meta-oe/recipes-connectivity/zeromq/{zeromq_4=
.3.2.bb =3D&gt; zeromq_4.3.3.bb} (87%)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-oe/recipes-connectivity/zeromq/fil=
es/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch b/meta-o=
e/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific=
-path-to-libsodium.patch<o:p></o:p></p>
<p class=3D"MsoNormal">index eb3dee4d3..3b0300c8a 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-oe/recipes-connectivity/zeromq/files/0001=
-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/meta-oe/recipes-connectivity/zeromq/files/0001=
-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -1,6 +1,7 @@<o:p></o:p></p>
<p class=3D"MsoNormal">+From 24ad50286a87833329213dc0b0e68c21aeeee95f Mon S=
ep 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@va=
isala.com">niko.mauno@vaisala.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">-Date: Wed Apr 22 09:00:00 2020 +0300<o:p></o:p></p>
<p class=3D"MsoNormal">-Subject: CMakeLists.txt: Avoid host-specific path t=
o libsodium<o:p></o:p></p>
<p class=3D"MsoNormal">+Date: Wed, 22 Apr 2020 09:00:00 +0300<o:p></o:p></p=
>
<p class=3D"MsoNormal">+Subject: [PATCH] CMakeLists.txt: Avoid host-specifi=
c path to libsodium<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;Avoid propagating full build host specific pat=
h to generated<o:p></o:p></p>
<p class=3D"MsoNormal">ZeroMQTargets.cmake when building with libsodium, wh=
ich changes the<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -17,10 +18,16 @@ Upstream-Status: Pending<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;Signed-off-by: Niko Mauno &lt;<a href=3D"mailt=
o:niko.mauno@vaisala.com">niko.mauno@vaisala.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">+---<o:p></o:p></p>
<p class=3D"MsoNormal">+ CMakeLists.txt | 4 ++--<o:p></o:p></p>
<p class=3D"MsoNormal">+ 1 file changed, 2 insertions(+), 2 deletions(-)<o:=
p></o:p></p>
<p class=3D"MsoNormal">+<o:p></o:p></p>
<p class=3D"MsoNormal">+diff --git a/CMakeLists.txt b/CMakeLists.txt<o:p></=
o:p></p>
<p class=3D"MsoNormal">+index e92141d..d0775c1 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/CMakeLists.txt<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/CMakeLists.txt<o:p></o:p></p>
<p class=3D"MsoNormal">-@@ -1210,7 +1210,7 @@<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp; target_link_libraries(libzmq ${OPTIONA=
L_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})<o:p></o:p></p>
<p class=3D"MsoNormal">+@@ -1428,7 +1428,7 @@ if(BUILD_SHARED)<o:p></o:p></=
p>
<p class=3D"MsoNormal">+&nbsp;&nbsp; endif()<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;if(SODIUM_FOUND)<o:p></o:p><=
/p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; target_link_libraries(libzmq ${S=
ODIUM_LIBRARIES})<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -28,8 +35,8 @@ Signed-off-by: Niko Mauno &lt;<a h=
ref=3D"mailto:niko.mauno@vaisala.com">niko.mauno@vaisala.com</a>&gt;<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # On Solaris, libsodi=
um depends on libssp<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(${CMAKE_SYSTEM_NAM=
E} MATCHES &quot;SunOS&quot;)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; target_li=
nk_libraries(libzmq ssp)<o:p></o:p></p>
<p class=3D"MsoNormal">-@@ -1240,7 +1240,7 @@<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp; target_link_libraries(libzmq-static ${=
OPTIONAL_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})<o:p></o:p></p>
<p class=3D"MsoNormal">+@@ -1473,7 +1473,7 @@ if(BUILD_STATIC)<o:p></o:p></=
p>
<p class=3D"MsoNormal">+&nbsp;&nbsp; endif()<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;if(SODIUM_FOUND)<o:p></o:p><=
/p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; target_link_libraries(libzmq-sta=
tic ${SODIUM_LIBRARIES})<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-oe/recipes-connectivity/zeromq/zer=
omq_4.3.2.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb<o:p></o:=
p></p>
<p class=3D"MsoNormal">similarity index 87%<o:p></o:p></p>
<p class=3D"MsoNormal">rename from meta-oe/recipes-connectivity/zeromq/zero=
mq_4.3.2.bb<o:p></o:p></p>
<p class=3D"MsoNormal">rename to meta-oe/recipes-connectivity/zeromq/zeromq=
_4.3.3.bb<o:p></o:p></p>
<p class=3D"MsoNormal">index 02a4c04fd..a10500475 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3=
.2.bb<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3=
.3.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"FR">@@ -10,8 +10,8 @@ SRC_URI =3D &quo=
t;http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR">&nbsp;&nbsp;&nbsp;&nbsp; </span><a=
 href=3D"file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.p=
atch">file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patc=
h</a> \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://run-ptest=
">file://run-ptest</a> \<o:p></o:p></p>
<p class=3D"MsoNormal">&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[md5sum] =3D &quot;2047e917c2cc93505e2579bcb=
a67a573&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[sha256sum] =3D &quot;ebd7b5c830d6428956b67a=
0454a7f8cbed1de74b3b01e5c33c5378e22740f763&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+SRC_URI[md5sum] =3D &quot;78acc277d95e10812d71b2b3c=
3c3c9a9&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+SRC_URI[sha256sum] =3D &quot;9d9285db37ae942ed0780c=
016da87060497877af45094ff9e1a1ca736e3875a2&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https:=
//github.com/$%7bBPN%7d/libzmq/releases">https://github.com/${BPN}/libzmq/r=
eleases</a>&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.25.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PR3P192MB0714EF98477EEC643F6472BCDAA59PR3P192MB0714EURP_--

