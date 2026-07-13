Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B48AC43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 16:23:39 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96.1783959815889427505
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2026 09:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=lN9TRcv3;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout08.t-online.de (Postfix) with SMTP id AEFE4ECD4;
	Mon, 13 Jul 2026 18:23:19 +0200 (CEST)
Received: from [192.168.178.63] ([84.163.43.133]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wjJR7-09iU9g0; Mon, 13 Jul 2026 18:23:17 +0200
Date: Mon, 13 Jul 2026 18:23:12 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] libcamera: add libdrm dependency
To: kieran.bingham@ideasonboard.com
Cc: openembedded-devel@lists.openembedded.org,
	"Kieran Bingham via lists.openembedded.org"
	<kieran.bingham=ideasonboard.com@lists.openembedded.org>
Message-Id: <O6G4IT.2K2BXOEJZR5O@t-online.de>
In-Reply-To: <178393909487.727359.6008456952924140739@ping.linuxembedded.co.uk>
References: <20260713091756.66416-1-f_l_k@t-online.de>
	<178393909487.727359.6008456952924140739@ping.linuxembedded.co.uk>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-9fzGsWlaCSMH0QayUzSO"
X-TOI-EXPURGATEID: 150726::1783959797-977FDA18-C2863EC4/0/0 CLEAN NORMAL
X-TOI-MSGID: cd6aeea2-c71f-4f57-a58b-968a0f4ad4a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1783959799; i=f_l_k@t-online.de;
	bh=jIs9CS++fuQEW+QHELUXE8QWTnzSNvLJalOkgOQ3jCw=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=lN9TRcv3KEwDp5+l4sBk7Cn1il3wBu1pNlImy2zGuQHhaFqNEUmP2FWy4Qbsk+0w+
	 9XJl8Fhr8WoFwYm5Bfpm3f6omS4S5VTe9fxXlhrjuEFWzP1iGWXupEZKlttpGZX2qH
	 IWgY7BD+u5JpLTQMqobAglgZgk4u8eSvm8sk5cWtOWIyNpqDnvtlCmMz4tXSnLzuCq
	 fzT4OTQL11aciVwt6OjqYyR/fGWlTMASbvVEGNDr3ZhcEX+UnDndgeifS1/uMlC65I
	 WV9wPJGYOBCJyVnVAPOIe/FxUYDOjZV1uYkFc/UuV5aNh3p137p7oCHu+ejkgR0HZO
	 oX+kG2xjxuMGg==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 16:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128158

--=-9fzGsWlaCSMH0QayUzSO
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 13. Jul 2026 um 11:38:14 +01:00:00 schrieb Kieran Bingham via 
lists.openembedded.org 
<kieran.bingham=ideasonboard.com@lists.openembedded.org>:
> Perhaps rather than add an incorrect dependency, we could backport the
> patch for the recipe or bump to libcamera-0.7.2?

That sounds reasonable. I have updated libcamera to v0.7.2 and now 
libyuv seems to be a requirement. It was formerly added by the 'virtual'
PACKAGECONFIG where I have no idea what this is for but removing this 
PACKAGECONFIG  and adding libyuv to DEPENDS fixes the build.
Since you know about libcameras dependencies: Is this the right thing 
to do or am I missing something about 'virtual'?

0.7.2 builds for me like this:

diff --git 
a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb 
b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
similarity index 97%
rename from 
meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
rename to 
meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
index 2b351a39be..4b5e735a37 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
@@ -13,11 +13,11 @@ SRC_URI = " \
         
git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v${PV 
<git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v$%7BPV>} 
\
 "

-SRCREV = "183e37362f57ff3ce7493abf0bc6f1b57b931f55"
+SRCREV = "191e202178f02430b5942397c70d215cdd2056fa"

 PE = "1"

-DEPENDS = "python3-pyyaml-native python3-jinja2-native 
python3-ply-native python3-jinja2-native udev gnutls chrpath-native 
libevent libyaml"
+DEPENDS = "python3-pyyaml-native python3-jinja2-native 
python3-ply-native python3-jinja2-native udev gnutls chrpath-native 
libevent libyaml libyuv"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase 
qtbase-native', '', d)}"

 PACKAGES =+ "${PN}-compliance ${PN}-gst ${PN}-pycamera"
@@ -38,7 +38,6 @@ PACKAGECONFIG[raspberrypi] = ",,libpisp"
 PACKAGECONFIG[sdl] = 
"-Dcam-output-sdl2=enabled,-Dcam-output-sdl2=disabled,virtual/libsdl2"
 PACKAGECONFIG[unwind] = 
"-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 PACKAGECONFIG[vimc] = ",,"
-PACKAGECONFIG[virtual] = ",,libyuv libjpeg-turbo"

 ARM_PIPELINES = "imx8-isi,mali-c55,simple,uvcvideo"
 # Raspberry Pi requires the meta-raspberrypi layer



--=-9fzGsWlaCSMH0QayUzSO
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Mo, 13. Jul 2026 um 11:38:14 +01:00:=
00 schrieb Kieran Bingham via lists.openembedded.org &lt;kieran.bingham=3Di=
deasonboard.com@lists.openembedded.org&gt;:<br><blockquote type=3D"cite"><d=
iv class=3D"plaintext" style=3D"white-space: break-spaces;">Perhaps rather =
than add an incorrect dependency, we could backport the
patch for the recipe or bump to libcamera-0.7.2?</div></blockquote><div><br=
></div><div>That sounds reasonable. I have updated libcamera to v0.7.2 and =
now libyuv seems to be a requirement. It was formerly added by the 'virtual=
'</div><div>PACKAGECONFIG where I have no idea what this is for but removin=
g this PACKAGECONFIG &nbsp;and adding libyuv to DEPENDS fixes the build.</d=
iv><div>Since you know about libcameras dependencies: Is this the right thi=
ng to do or am I missing something about 'virtual'?</div><div><br></div><di=
v>0.7.2 builds for me like this:</div><div><br></div><div><div>diff --git a=
/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb b/meta-mul=
timedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb</div><div>similarit=
y index 97%</div><div>rename from meta-multimedia/recipes-multimedia/libcam=
era/libcamera_0.7.1.bb</div><div>rename to meta-multimedia/recipes-multimed=
ia/libcamera/libcamera_0.7.2.bb</div><div>index 2b351a39be..4b5e735a37 1006=
44</div><div>--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0=
.7.1.bb</div><div>+++ b/meta-multimedia/recipes-multimedia/libcamera/libcam=
era_0.7.2.bb</div><div>@@ -13,11 +13,11 @@ SRC_URI =3D " \</div><div>&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"git://git.libcamera.org/libcamera/li=
bcamera.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV">git://git.libcame=
ra.org/libcamera/libcamera.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV=
</a>} \</div><div>&nbsp;"</div><div>&nbsp;</div><div>-SRCREV =3D "183e37362=
f57ff3ce7493abf0bc6f1b57b931f55"</div><div>+SRCREV =3D "191e202178f02430b59=
42397c70d215cdd2056fa"</div><div>&nbsp;</div><div>&nbsp;PE =3D "1"</div><di=
v>&nbsp;</div><div>-DEPENDS =3D "python3-pyyaml-native python3-jinja2-nativ=
e python3-ply-native python3-jinja2-native udev gnutls chrpath-native libev=
ent libyaml"</div><div>+DEPENDS =3D "python3-pyyaml-native python3-jinja2-n=
ative python3-ply-native python3-jinja2-native udev gnutls chrpath-native l=
ibevent libyaml libyuv"</div><div>&nbsp;DEPENDS +=3D "${@bb.utils.contains(=
'DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"</div><div>&nbsp;<=
/div><div>&nbsp;PACKAGES =3D+ "${PN}-compliance ${PN}-gst ${PN}-pycamera"</=
div><div>@@ -38,7 +38,6 @@ PACKAGECONFIG[raspberrypi] =3D ",,libpisp"</div>=
<div>&nbsp;PACKAGECONFIG[sdl] =3D "-Dcam-output-sdl2=3Denabled,-Dcam-output=
-sdl2=3Ddisabled,virtual/libsdl2"</div><div>&nbsp;PACKAGECONFIG[unwind] =3D=
 "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,libunwind"</div><div>&nbsp;P=
ACKAGECONFIG[vimc] =3D ",,"</div><div>-PACKAGECONFIG[virtual] =3D ",,libyuv=
 libjpeg-turbo"</div><div>&nbsp;</div><div>&nbsp;ARM_PIPELINES =3D "imx8-is=
i,mali-c55,simple,uvcvideo"</div><div>&nbsp;# Raspberry Pi requires the met=
a-raspberrypi layer</div></div><div><br></div></div>
--=-9fzGsWlaCSMH0QayUzSO--


