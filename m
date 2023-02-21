Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907DAC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 17:52:08 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.45])
 by mx.groups.io with SMTP id smtpd.web11.49532.1677001925508388864
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 09:52:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector2 header.b=T0/cYqsR;
 spf=pass (domain: witekio.com, ip: 40.107.14.45, mailfrom: hsimeliere.opensource@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHfjqGAADUHQR2z0bSQhPfIN8Rh/ncCER7u7dVYrMOP9wN5Pxp8cbNwHFQfF6k8U8uNa1FhyTD56fMRrahnLFxJTf0LHMN/AFelOHfKaQACnFHu7hjrSKcr8pBPjuAb9IBqgf5phwTh2eYBwrITfLRVYRi2QFpxxLDlG5tFdnI/kI7uthsTUtOKbwY02Pl9GMaNMbBQ/jvcPXduy7m7fH9mo108SdnhRxXR1DmDUbpsAAaupl/a18JmhTHT36Rxl67MUCSqqqiL02UdtZkFYn4UWmD/Q0ov3ocDtQ+OwRdKB9dYcujQOMSNgPJ616GZTcyHH6pMKN3veORoQOIjLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rf/BPxF2bhGE/9TilANdvPteSrKJPMDGyvjkB49qieI=;
 b=QsLYK/Zg9WjejE4esMICm9Fvi9oqPGcCBo4ire7YHls1wkI8a+yB9ZmzvKwiVsBdtDv6PMZDhgqAWVF4IVRETm53bQdiq4x+HX4NasMm/HqyInkp9UfTHYoSj/KtrE1HRhY6Q3OjXPdguuAv1A0sV2WgGQSvhI4R+kh04Hq5KtM8jai7MGPMb1NxITw3XaVKERh8Bl+IWuWejuVCHAKob2FFXQDDDWHTuKPbR4i/5bCVmC1pVhYNueIp8A2EoRUV4xJKGLAoWCIM5qfNSQ4TnKa2N2JBYOr6b5FoVCWvouswup0NZAo0RIz4t+bh/iKUbKdsfP5mo8O9TNBfW+Lcew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rf/BPxF2bhGE/9TilANdvPteSrKJPMDGyvjkB49qieI=;
 b=T0/cYqsRRipqQYXgZ38u7vG/r39D80GTEzWVTk9KWBrqUmWtSgm6bZ6KE9VxFuIeTVJhJHZoHOBaaR8nW71rTXoO4D/iWblLY3EMOs/jHkJotTuFu/N9MRfhtf24XX1i6Q1JuTgRcSNi70od8Wvdz8iO2Bg9XEEMVMUL2SiUzUNO0Xun8aWcLnpDCqyP2ql9+prLSBOeuk8NK+b2gLyzaygiVtk2pF+pOZANP4YfDpcphQzZ1kcz8C3QfBDGdvIa/KHPy/uJxIe66H8nD6eVIFvU5IsgUTQJcHYGiXGZBC2wIyBf6owhC/l9I1ZCpEHsxD1q/TH5VFSJaPg7fDCv8g==
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by DB5P192MB2198.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:48c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.15; Tue, 21 Feb
 2023 17:52:01 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322%7]) with mapi id 15.20.6134.017; Tue, 21 Feb 2023
 17:52:01 +0000
From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][dunfell][PATCH 1/2] zeromq: upgrade 4.3.2 -> 4.3.3
Thread-Topic: [meta-oe][dunfell][PATCH 1/2] zeromq: upgrade 4.3.2 -> 4.3.3
Thread-Index: AdlGGatDY7TETaqlSg+biHq2lD+VUgAApY4AAAALqnAAACmk4A==
Date: Tue, 21 Feb 2023 17:52:01 +0000
Message-ID: 
 <PR3P192MB0714A952029F3C52BF24712ADAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
References: 
 <PR3P192MB07147F5AED87B5910212E896DAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
 <PR3P192MB0714EDE5FDDFCA103DD8151DDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
 <PR3P192MB0714EF98477EEC643F6472BCDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PR3P192MB0714EF98477EEC643F6472BCDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P192MB0714:EE_|DB5P192MB2198:EE_
x-ms-office365-filtering-correlation-id: 698f3b7b-9cb4-43d3-69df-08db143455f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +M3JnfRnxae5F3jswdMV5BPfmQRZ9ZDu4AhCBoi/7ub00oRn0yhZYySg8YDU9lF/XROND+KcF6g9kC4NQVz9NuyBElOQ+BhKTM7R/m7ZRvl9l3y6EDnEzfnMVBz07b6Gv9O/9QIc8RjsW9E4IW1hJSBVBInOfTIasyU8rK2AYfJ0DqXmC8KPyMxF/bTFbrL1J0Nk3oWcq4RAfxkBADS8FX0Tp8DQeOlGp1GdYrO+hrN/E5qEoQgzQmfrtnSsuMbFhuwW0zS7aJKDdnV9xfdM8pBr7QnPsHrTi72x4UcAFEo7VJsaEiDDFcj+WrxTcjWyM40zlLYiYIzNhl6iyb/nd2N9ePqPRDFyjmH8i127ax9fzgPP8W3vC1kOtC3WdtIpLDb8hBvJYm01q18M9Yc9rZPvmyPpfSK0TQeMy1Zo5M3chKMzvpNFJm25Jn99ZSmWyooiOncaOC7ricFm8FZw1j1hsBVvbegJwZdmor7er7+MPn2G10gq698zT8Jyp0+Rl5oSh7RIyr9Ut812L2SEk7lwqkTQa3oM77JrM5ArWlWMupLrbwBkNdbfAxLYNLCPbp+Fd4cYwHdNGWHHwCtE8jBqm+bAoheX2ayVZuSHCuVR6ZX0KEWkxxylX9ko4/5aPWrCwQvHD7AMebTOMJHCLwrwMo68z16/Z0+A1IkVHkr4vK4VjbQ2ZBpkO9cOH8W4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(39840400004)(396003)(376002)(136003)(366004)(346002)(451199018)(83380400001)(38100700002)(38070700005)(8936002)(122000001)(66946007)(5660300002)(2906002)(166002)(2940100002)(86362001)(33656002)(55016003)(66556008)(7696005)(478600001)(66476007)(66446008)(8676002)(76116006)(71200400001)(9686003)(6506007)(41300700001)(64756008)(186003)(6916009)(316002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?e5CTgLnyjYn72rVnQvKhWlk6sKJUWqpIwMCrjKp5E25khuQHDFg2ucFazJIr?=
 =?us-ascii?Q?/sAQuDZ+1NXtrjAhKpmk3YSP0idD8TzDK/px6kFWgEp+mG1R2gIU+FSlpVOX?=
 =?us-ascii?Q?KxJMk9PuZ0RVMMDDYm5SiRnB8EC7fBclptv4jUILnEknVHdl7d1zVraUQZBL?=
 =?us-ascii?Q?k2aH1As9eo9NiSB8T4Xp+3yVt7KrvkA9aPL7dmmlLQ2sbW/ZaEoFrqQ5Ig52?=
 =?us-ascii?Q?OwN07f3y2uRMsPLMp5cWvJhP3ofOprdD2TwEgy7rWbg7Aj2f04F0d9Z5Sxi1?=
 =?us-ascii?Q?VBRBXkJrm7LZwhMs/klH+qayQ+qLRQjDSlCWod6OfgpYHy0nl3Khn3hmevtl?=
 =?us-ascii?Q?aeNB5/gy4fXmzHoYlx7psOi4Jzu6GOJ1tO/cK2nMNJ8S7oDtyt5MXwyqNypi?=
 =?us-ascii?Q?BEJCnNobWkRFiM2fMPUxUA8/Hwn22bWn+yKYpxvNovcRXmZdNtaiNNI03Y8L?=
 =?us-ascii?Q?divS08Z512EQOOGE9oJ7vO709oXkw8GEGoZSjTG2+ZV6sKmr03IaaOqXMI0g?=
 =?us-ascii?Q?9DvGezBLYFCT7H8hHl/gkf9fb+VB+0MAvhLT0ckHPdSnpgKZuWn0DcaabYrn?=
 =?us-ascii?Q?75jO0gvO5DioZfolMH0rKhrz7EJIPHWnVu8YO8nYr4EEsvqoP2X6PmUH9svn?=
 =?us-ascii?Q?wIymvcR1uzrZ4CB3SCzkA67LLpipIT31tNOLXqd13nBkOKA5qHXQnlOmfgfl?=
 =?us-ascii?Q?NTTBm34eKy4picflifI6DX5FzFlvPyNDMjavYgKsf5l1TB39g3BTQ9QTbckY?=
 =?us-ascii?Q?XQKsp0RvkR34IUcCxUjxtGluugFPZ+TOzYP62OsOJY1d3Q7vM5krLQFgBUni?=
 =?us-ascii?Q?Ti1BhRZtltEyxBKgLjBuBpUkaQc8PndpVIbaxK0YNp85XnestK+IM6T4/j6W?=
 =?us-ascii?Q?VyojIGa/OWDsoXevLMjpVtQ/s1eYkcHMFZzZrnlLg1BUJFop+bikN8pSUqiM?=
 =?us-ascii?Q?BXaVuSP6PgQW5H6CQc7GlQWiSMGILrfnJlH6asgkaeTvuSxYiDomDMv/9Jch?=
 =?us-ascii?Q?njghxImhGTPWT7i1rSbJc4BOS7eVuCoveYrDckAdQVBRui2YBHYW1qoipdcA?=
 =?us-ascii?Q?DHxH6+9/6v8qzSXM2UULykGWdnj6SFAWUtb5ZamX5EhMbrx5Sep7pR2YU4Os?=
 =?us-ascii?Q?js5/siMy0KrrHxcYuYCAiM7wgjdnQH6euW0Y/gaIsqDWKY4Fw9tQNH9pw2yO?=
 =?us-ascii?Q?tZYxTcJx5ChLTlFY4J85MjAhJlQztfVaYUT7/3mpBgUR2K7hCE3LeDWsAxVz?=
 =?us-ascii?Q?V4gLehoRaBlHm4OZFdXm+LE5vo1pR74NI40JsejWbyhF72IGZaIuPy0ubeEI?=
 =?us-ascii?Q?oIyflUpfU4r4Levj4NxM2EPRDUdIrNrmSqIhj3RT2mdvpcctwKP8SY8Gk7K8?=
 =?us-ascii?Q?0TfB5lohb5aHms/jNGcAtlCfquFclhi8JuFsqzWZtT3dAkp0nUN8L6SfPPXu?=
 =?us-ascii?Q?AgjPFXHFOcYdUo0RGiTMpZtkSjRObjSI1NkmtYJb4TcKL+gSkY43hEaquhNT?=
 =?us-ascii?Q?ULmdRs454BSh0mozjV8lfTz98547kJn6UrYwAyMmdxrfuSNxM17fP1k+kcEW?=
 =?us-ascii?Q?yjQSvTLB3FldNTsoWfjFTsHtg+6dUD8BTgt6Ef8xinkn+v1AXvjYK3WTT21G?=
 =?us-ascii?Q?EHzmyYs2u6cTimNf5VUnI4kYeipKA5p+1TMlNKOjEp7n?=
Content-Type: multipart/alternative;
	boundary="_000_PR3P192MB0714A952029F3C52BF24712ADAA59PR3P192MB0714EURP_"
MIME-Version: 1.0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 698f3b7b-9cb4-43d3-69df-08db143455f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 17:52:01.5237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrD2GG4XmyKAuYd0d4iOyJZHuLXDzu2YY2hH5U0pJwlFjXgsXEIV0rASzx+k6LwAFT2jkSGyLCDiY833liAjIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P192MB2198
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 17:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101192

--_000_PR3P192MB0714A952029F3C52BF24712ADAA59PR3P192MB0714EURP_
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


--_000_PR3P192MB0714A952029F3C52BF24712ADAA59PR3P192MB0714EURP_
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

--_000_PR3P192MB0714A952029F3C52BF24712ADAA59PR3P192MB0714EURP_--

