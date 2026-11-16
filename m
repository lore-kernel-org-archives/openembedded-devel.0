Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23383.1794818147046756462
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 00:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm1 header.b=YEJoFp8d;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=bWuQZdpR;
 spf=pass (domain: zhukoff.net, ip: 202.12.124.138, mailfrom: pavel@zhukoff.net)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailflow.stl.internal (Postfix) with ESMTP id 17FBF1302E96
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 03:35:46 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 16 Nov 2026 03:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1794818145; x=1794825345; bh=hS
	WNqs4j6a7guGDcjRCZz5bvU2MD9xr2tzcWDOhPhhc=; b=YEJoFp8djaMKBwGcdl
	Fc4WyvMaw19pG7kVvmHlpx0d3w18Z25VeUijhfOkgf+zl5kOrclzMkBGmPa0UxQo
	V+L2vmDTfdnc970fjRZKdEgKfdau6Zw/IpsUmBWINezXQ1hxX0d/JHyo2I6E3wYD
	QiUWeNwuaOxkNSCA6lETKenViJmPUW7Dy4RkeXCJdM2UlJs9T8UdyBUH06Ip4OOb
	xbJO59yNwRk7aexpZ7XRE5tcsVUuUzc3tKcRik0ZwucY1f2PxV3Doc4laVj6CHs1
	lwcB1XcfzaQ6f8X7yES53U6pfi4/fW969s7am4LZ2ZVIkX0ZbUOR9K09RjNUTH87
	nPBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1794818145; x=1794825345; bh=hSWNqs4j6a7guGDcjRCZz5bvU2MD
	9xr2tzcWDOhPhhc=; b=bWuQZdpROfFE4zw6xP7lQLCrUQfqMX8ECpSalGwqv2Z6
	h/7Ja49wFRRdTqThs9QJe+yexazJ1rILiivXWlQeUjTrzK9UPzzvSx3B339yLk9P
	QIUVrfN1npeDm7W8/nFtexfEvLnOPjZ8FJZQOuQP4q9hv491L81ShWd7vlaMX6DW
	5qMhYHtoE5jJUXX1T2zG4eBxpjHuLMD7Q20SivaX9W6DUMt+8afU+8Ou0uCLL70D
	HeWZsCUMWtTeYVvyC2eL2m5qwk9SwPn57CcmwwPcAJcXwIvhN0mCp3VxxoE8/xOL
	/a1uNKj9lRRnWIiFEeTSFOg+mgkTyWqXDXKYLL8hSg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=zhukoff.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794818145; d=zhukoff.net;
	mf=PHBhdmVsQHpodWtvZmYubmV0Pg==;
	rt=PG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg==;
	s=fm1:rsa-sha256:NHB7A5i+ywhnZJ7/8yCwBCiHxpiDWo8MqwljwoTWN/sz11F
	87GTEnF0SSj1XeESQxbXnNOoVXfMp0tZZmKWuraNPHOtpxUmouSY+HE/PVPTsxNx
	38HCOPEsJI3uHa1UVIm1ffhxTMRwj6KV+ZJFDEkP2Ryb4hKeUvASdRfIcKBajj+z
	PfyRVLdLExqnMk/sw7/ZLaMZvrPWQukmfvoKX38ZowUqBRhq8vId3/fieAQkdwN2
	Du8Tg6pLfPGV+5C7Y1h6v1d0nF83CIYH+JOUIhfO83NuL0EQKro4sxi7Lqe9Qrbw
	mzkG7kIyXq3Hu1B1Z4X1+bvUrq+UXEy8U2oBY4w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:AO8blgUkAyAuleUKAffnlwqq4FDLFUwxSGfSj0hRVW8=:fNAhRkbgUg9nVdrzPLSxh09JT5XlAjzG5HK2R1TH/co=;
X-ME-Sender: <xms:YcD6auHXMNcVdQhMF96CPdD0vQL7xpqCFVegubi_UuQrWNHx-TqE5w>
    <xme:YcD6alWwv3sjTpr1idZ9h8Ki3cH6RYLV69RiwNSy4tVyH7aJAXz3vX-vBYrKsPoUX
    MDs98p0zbz8gSgtkkuACZqlEegK8-H4bCrp2iv7wa6b6NeZS44qhD9E>
X-ME-Received: <xmr:YcD6alxor2HePGaAhMIXIpPhy4YPwFxWofDKDzmzrinKKE3fhnThO-iHO7su1N-wEbV7jsQ>
X-ME-Proxy-Cause: dmFkZTEaTLPZUSSF32M/tW8kgZ/hl9u0cpjXvpZpNbOngBPKPnZG0b4+aNu2hvS0G7BYAJ
    8fsHggwPsam265gk3oNm9FD8IAyAoAPvUCJpf5NyrrvGMUN78RHP9j21x9KEmUlzERcUIr
    PzG9BCbiq1yyqmKG6cLZ42wlJkanAqZP3X9M+VSt00QNpfOnbxfEb0bgDSnkt11TGfQOfx
    lnJYEaTYCDXhpwWkESb31XiQ1sUiXiDFBaNp8ezcUN851St/weGESTMOG8bQnA7S83aUVu
    QkRV/Xc/uJ/TWmSSNucCZYl0WjVsaoftfEiW+iJJEfbHy6xgPrzNKmsQxmn9jK1aUb5KY9
    UWDDsCES18dUzopsM29v+PChYb3PH+7NP8iB2aTfNMfnx+Ibiyl0LN8fHIl1LoPODcvbxQ
    A/RAzqk3c5jJjeNwupu4rHi/tnp/i6/fCm4f6agfT1cr6MQityumj+d9WKyHeM8cowwqGO
    e13sLDIVk+Qa5tJp+dY3AHILsf3f8tKBcHCaOqxDVyAsX9cLQRFatUUEPZpuD3me/89CC/
    TkEL8Kqx0w4Tj/9gDpamUq6ZDHpKTsMM9hRo5F1QFw0eVhqvG6Qml/4+PIUvLKie0iPdjj
    ucm+FIYbS/cWy5a4ZDuUNsGjOsjLCZZKCQLSjQAndADLCQs8pIfZlFs4m1GA
X-ME-Proxy: <xmx:YcD6ajNgHFS6usBEHnTeKcNsolXJ9irO0JR-n2pBelAooJJZhAInHg>
    <xmx:YcD6am5FTSFHYhDnIxnyBaF2mDkzlvMre6ChBVwGgH6wKEAhXA5lDw>
    <xmx:YcD6akNPR51ZVFU1rYNy7Bqp77q3GFxFbzrnljmM00klQpX4hJGcRg>
    <xmx:YcD6akmk6w_nvAzf2KH3DLWS5RP3Bcwp7s5o-3Q3QSGSNWG8fZsMiw>
    <xmx:YcD6an56wLNDzNISBTVJfCT5lhDKcVF_F1td9mJScQa27v4KMYVq0uzN>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 03:35:44 -0500 (EST)
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: openembedded-devel@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [meta-oe][PATCH] libcamera: upgrade 0.7.2 -> 0.8.0
Date: Mon, 16 Nov 2026 09:35:33 +0100
Message-ID: <20261116083536.1130487-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 08:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132453
Content-Type: text/plain; charset="utf-8"

The abi-compliance checker reports both ABI and API updates
in this release, as expected so the SONAME is increased to 0.8.

Validating ABI compatibility between v0.7.2 and v0.8.0
Binary compatibility: 97.4%
Source compatibility: 82.4%
Total binary compatibility problems: 30, warnings: 14
Total source compatibility problems: 170, warnings: 17

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 ...camera-egl-Don-t-redefine-EGL_NO_X11.patch | 46 -------------------
 ...{libcamera_0.7.2.bb => libcamera_0.8.0.bb} |  9 +---
 2 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.7.2.bb => libcamera_0.8.0.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch
deleted file mode 100644
index eace529b06..0000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 998b5c7ee5cabd51292ac216ccb390c35f989a78 Mon Sep 17 00:00:00 2001
-From: Joel Winarske <joel.winarske@linux.com>
-Date: Mon, 12 Oct 2026 18:20:01 -0700
-Subject: [PATCH] libcamera: egl: Don't redefine EGL_NO_X11
-
-Mesa built without the X11 platform exports -DEGL_NO_X11 via egl.pc
-Cflags, from mesa!2226 (19.3) until mesa!18848 (22.3) moved Xlib
-inclusion behind USE_X11. This affects non-glvnd builds, where egl.pc
-comes from Mesa rather than libglvnd, e.g. the PowerVR mesa-pvr (22.1)
-used on StarFive JH7110.
-
-The -D defines the macro as 1, so the unconditional empty define in
-egl.h is a redefinition, which is an error with -Werror:
-
-  include/libcamera/internal/egl.h:23:9: error: 'EGL_NO_X11' redefined [-Werror]
-
-The define is still needed for EGL headers predating
-KhronosGroup/EGL-Registry#130, which otherwise pull in Xlib.h, so only
-define it when it isn't already set.
-
-Upstream-Status: Submitted [https://patchwork.libcamera.org/patch/28452/]
-
-Signed-off-by: Joel Winarske <joel.winarske@linux.com>
-Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
-Reviewed-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>
----
- include/libcamera/internal/egl.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/libcamera/internal/egl.h b/include/libcamera/internal/egl.h
-index 1e31d490b..aeb4da80d 100644
---- a/include/libcamera/internal/egl.h
-+++ b/include/libcamera/internal/egl.h
-@@ -20,7 +20,9 @@
-  * Workaround for build issues on Mesa <= 22.2, see
-  * https://github.com/KhronosGroup/EGL-Registry/pull/130
-  */
-+#ifndef EGL_NO_X11
- #define EGL_NO_X11
-+#endif
- 
- #define EGL_EGLEXT_PROTOTYPES
- #include <EGL/egl.h>
--- 
-2.56.0
-
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.8.0.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.8.0.bb
index 624ca1e33e..257db1f052 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.8.0.bb
@@ -10,12 +10,11 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRC_URI = " \
-        git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v${PV} \
+        git://gitlab.freedesktop.org/camera/libcamera.git;protocol=https;branch=master;tag=v${PV} \
         file://0001-ipa_data_serializer-Mark-vector-readPOD-overload-as-m.patch \
-        file://0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch \
 "
 
-SRCREV = "191e202178f02430b5942397c70d215cdd2056fa"
+SRCREV = "df8e348d64b4932a0676256ed24f0da3ee9438bc"
 
 PE = "1"
 
@@ -65,10 +64,6 @@ RDEPENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayla
 
 inherit meson pkgconfig python3native
 
-do_configure:prepend() {
-    sed -i -e 's|py_compile=True,||' ${S}/utils/codegen/ipc/mojo/public/tools/mojom/mojom/generate/template_expander.py
-}
-
 do_install:append() {
     chrpath -d ${D}${libdir}/libcamera.so
     chrpath -d ${D}${libexecdir}/libcamera/v4l2-compat.so
-- 
2.56.0

