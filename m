Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.11814.1616960969726878995
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 12:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hKq6vgr7;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id l1so3380215plg.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Mar 2021 12:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qstzv64bMQeKQ2b0TH3qN5mP2ik7OfOuAYB96bUvYRs=;
        b=hKq6vgr70+X8NuhZ/o9LoxSC3clLt6X4WYEddVaasXY4JXWJuStRVvtLZ0WIsVUGjd
         uj4dF1p3dzvHAMJMg82uQza4iHP/BiUqwSVwTVorq1kwhJGxSQqQfK5rwy9Wf431eXQq
         vHb+7L1q5gAj2GLzsts/tvonk1C9LWzKaKyUPwpkupMVHvm8ghuzFZrU7sbsR9f+lsub
         IZPmUS0vZ8ByNrLllswcw1GD48VQz4c6eMOjZoeQUjA0HN0cONaXE9qIxdNp6L9617Ae
         JA3/52apYIjD3pDqJXiDK67xyjg/+50Xtb69vYOQGg3quAYONH7yl2avQYbCq6QbXkuR
         GKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qstzv64bMQeKQ2b0TH3qN5mP2ik7OfOuAYB96bUvYRs=;
        b=VqgsYY8c+6QwmW75uKW+OEWx3eolhSwLTGZWsLI/O79Lwr+8UpGuUnJxvPhsLL+E1X
         nN1FWUKzEtj83wlu7TkqLuNkurD385xM5ggvUJHre4HC9QT2D0ov5EdvYaH6UHmc3zAB
         f22gOJjHgoaRj6/xgQAkMhD2GW+SW6FPT13+9bT8ccmATgjRSRh41yEqE2JbKBFUccbl
         Lo7GsWV4qRbOqUJWfDD2hDBVlHLOG+c+MlyJxEDVWsdWB/HO6Y7L7WEACAo0GoHke6hu
         8O38Yq3hRETxI3eYJ/9XBhsSUEyxaV8Y4X0kn2Ty/HyCvamCTsF72njHAqSCkIyykaZM
         Rd6w==
X-Gm-Message-State: AOAM5305EBgLDPeml6lSLLLHYNzc140D700mejeDxi2ucH6MGEGsioSD
	fSheCNBtzsr4XrzTQqlnzDLTsiakvERS5w==
X-Google-Smtp-Source: ABdhPJxgpDWjiQ/21E82Uqht4kLbn1yMec713X8DFWuK+qC8z3ndV6+mSI2Hblvf8HcPczHdFfWJ/w==
X-Received: by 2002:a17:90b:10a:: with SMTP id p10mr23214697pjz.148.1616960968877;
        Sun, 28 Mar 2021 12:49:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id x7sm15525056pfp.23.2021.03.28.12.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 12:49:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] libcamera: Update the patch to upstreamed one
Date: Sun, 28 Mar 2021 12:49:26 -0700
Message-Id: <20210328194926.784584-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-variable-to-avoid-range-loop-warni.patch | 155 +++++++++++++-----
 1 file changed, 117 insertions(+), 38 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-uv=
cvideo-Use-auto-variable-to-avoid-range-loop-warni.patch b/meta-multimedia/=
recipes-multimedia/libcamera/libcamera/0001-uvcvideo-Use-auto-variable-to-a=
void-range-loop-warni.patch
index 4ca412c695..86e469bf7e 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-uvcvideo-=
Use-auto-variable-to-avoid-range-loop-warni.patch
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-uvcvideo-=
Use-auto-variable-to-avoid-range-loop-warni.patch
@@ -1,38 +1,117 @@
-From 767267ef69c001870d41caf9c60dd7fec89b0a13 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 3 Mar 2021 15:11:46 -0800
-Subject: [PATCH] uvcvideo: Use auto variable to avoid range loop warnings
-
-With c++17 loop range bases are defined where copy is obvious since
-iterator returns a copy and not reference, gcc11 will emit a warning
-about this
-
-uvcvideo.cpp:432:33: error: loop variable 'name' of type 'const string&' {=
aka 'const std::__cxx11::basic_string<cha
-r>&'} binds to a temporary constructed from type 'const char* const' [-Wer=
ror=3Drange-loop-construct]
-|   432 |         for (const std::string &name : { "idVendor", "idProduct"=
 }) {
-|       |                                 ^~~~
-
-Therefore making it explicit is better
-
-Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamer=
a-devel/2021-March/017966.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libcamera/pipeline/uvcvideo/uvcvideo.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp b/src/libcamera/=
pipeline/uvcvideo/uvcvideo.cpp
-index 031f96e2..ef23ece7 100644
---- a/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp
-+++ b/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp
-@@ -429,7 +429,7 @@ std::string PipelineHandlerUVC::generateId(const UVCCa=
meraData *data)
-=20
- 	/* Creata a device ID from the USB devices vendor and product ID. */
- 	std::string deviceId;
--	for (const std::string &name : { "idVendor", "idProduct" }) {
-+	for (const auto name : { "idVendor", "idProduct" }) {
- 		std::ifstream file(path + "/../" + name);
-=20
- 		if (!file.is_open())
---=20
-2.30.1
-
+Delivered-To: raj.khem@gmail.com=0D
+Received: by 2002:a05:620a:20d3:0:0:0:0 with SMTP id f19csp2716715qka;=0D
+        Sat, 27 Mar 2021 19:58:30 -0700 (PDT)=0D
+X-Google-Smtp-Source: ABdhPJwyDnjZqZmFqHVShb/5/RoVkJ4Avv5bcnyuo85vIRR2vJDQ=
F+QBZpQpEWHgx5GuEuwLVSC+=0D
+X-Received: by 2002:a05:6512:22d0:: with SMTP id g16mr12125441lfu.650.1616=
900310724;=0D
+        Sat, 27 Mar 2021 19:58:30 -0700 (PDT)=0D
+ARC-Seal: i=3D1; a=3Drsa-sha256; t=3D1616900310; cv=3Dnone;=0D
+        d=3Dgoogle.com; s=3Darc-20160816;=0D
+        b=3DbZlu68tossyE2YcGkt0HzIhqTUroWDT/EgJvAiQBgZ6bPzMJ+wjwWp3LzViqOx=
iRPQ=0D
+         r0cFyme7CJ9YRf2TLmpjGuv2RPQ+EkrtFdlB7i65nhDrwvBoxt78vF2tUoDgVLL1Y=
rU9=0D
+         wKgHPtBjtDcDveOXKQJH2j5HRwiBjCXlPRBhlSxV8kJPBj//dRaKm0MsxfiW/IgyN=
1tZ=0D
+         FFxfe4Lk1Awm8ZKAklhdKMly3MFA6IbnjwNcN/84a0R/0+PLu9X8XIR6+CnrfqSgW=
OBx=0D
+         zsV8p3HuVQTpX7Hhnkiz7PYudHsJJ/7KXeXTP6s9NNnZGu9A6U/E6VOob5BSm9DDI=
A5z=0D
+         4AnA=3D=3D=0D
+ARC-Message-Signature: i=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dgoo=
gle.com; s=3Darc-20160816;=0D
+        h=3Dcontent-transfer-encoding:mime-version:message-id:date:subject=
:cc=0D
+         :to:from:dkim-signature;=0D
+        bh=3DfbAn+wsNks5BGTY34H4T90NDFJaNV4nnt9vc9DBFaWQ=3D;=0D
+        b=3DmLZNiQR/CdgcVTAc7OQmK0ZYTVpofG/EOqTIi2NYIYFhanWhatYY9Hx2xwxIp6=
kQ5R=0D
+         n0uXh5tLth6aPYD09z3YcXYasEIszBKwoNUFjRA85lFm3d5/J2S1wC5rBy25QeCDO=
g57=0D
+         QdzYrTBX2QGRHGQKauEnX5FLDTT+I53sPa87TyvxUKBS+lTAbJig70KfmL7FJIEWT=
1ZI=0D
+         CZKCErYFlQTGNnwM0CYVXyHv54D2tA25veHQIJN8KK+XObNWuAY3rYpqKoUpOP4vp=
SPi=0D
+         MXJWAV4L6NZEShWvwJiC4Zdy2xFzXASX27CAKIsX6T5Rub03grVTg6WVt9bChK1x5=
jeg=0D
+         A2Yw=3D=3D=0D
+ARC-Authentication-Results: i=3D1; mx.google.com;=0D
+       dkim=3Dpass (test mode) header.i=3D@ideasonboard.com header.s=3Dmai=
l header.b=3DMniKswyT;=0D
+       spf=3Dpass (google.com: domain of laurent.pinchart@ideasonboard.com=
 designates 213.167.242.64 as permitted sender) smtp.mailfrom=3Dlaurent.pin=
chart@ideasonboard.com=0D
+Return-Path: <laurent.pinchart@ideasonboard.com>=0D
+Received: from perceval.ideasonboard.com (perceval.ideasonboard.com. [213.=
167.242.64])=0D
+        by mx.google.com with ESMTPS id v18si12339470ljj.208.2021.03.27.19=
.58.30=0D
+        for <raj.khem@gmail.com>=0D
+        (version=3DTLS1_3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256/256);=
=0D
+        Sat, 27 Mar 2021 19:58:30 -0700 (PDT)=0D
+Received-SPF: pass (google.com: domain of laurent.pinchart@ideasonboard.co=
m designates 213.167.242.64 as permitted sender) client-ip=3D213.167.242.64=
;=0D
+Authentication-Results: mx.google.com;=0D
+       dkim=3Dpass (test mode) header.i=3D@ideasonboard.com header.s=3Dmai=
l header.b=3DMniKswyT;=0D
+       spf=3Dpass (google.com: domain of laurent.pinchart@ideasonboard.com=
 designates 213.167.242.64 as permitted sender) smtp.mailfrom=3Dlaurent.pin=
chart@ideasonboard.com=0D
+Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57=
])=0D
+	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11F12332;=0D
+	Sun, 28 Mar 2021 04:58:28 +0200 (CEST)=0D
+DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/simple; d=3Dideasonboar=
d.com;=0D
+	s=3Dmail; t=3D1616900309;=0D
+	bh=3DBwCg4h9N9fJysbMT1Yjbazbp7zTImD9mkWJSjCKzCmg=3D;=0D
+	h=3DFrom:To:Cc:Subject:Date:From;=0D
+	b=3DMniKswyT+aUtPgeMFeLqW6cRMFsPRN4W1XtVDA6pqI0QTSSx5koEuzSfEybjs6Qbp=0D
+	 ZdQar1r5nBIRCg9uq85YoLKoFeT7WN4PrwnRYPwaYGAFHfV44rDrq4RBe3VOIb+85W=0D
+	 tKn4HEzjlFelrImVbeymBsgpVhITveSVH1MdYRsE=3D=0D
+From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>=0D
+To: libcamera-devel@lists.libcamera.org=0D
+Cc: Khem Raj <raj.khem@gmail.com>=0D
+Subject: [PATCH v2] libcamera: pipeline: uvcvideo: Avoid reference to temp=
orary object=0D
+Date: Sun, 28 Mar 2021 05:57:41 +0300=0D
+Message-Id: <20210328025741.30246-1-laurent.pinchart@ideasonboard.com>=0D
+X-Mailer: git-send-email 2.28.1=0D
+MIME-Version: 1.0=0D
+Content-Transfer-Encoding: 8bit=0D
+=0D
+From: Khem Raj <raj.khem@gmail.com>=0D
+=0D
+A range-based for loop whose range expression is an array of char=0D
+pointers and range variable declaration is a const reference to a=0D
+std::string creates a temporary string from the char pointer and binds=0D
+the range variable reference to it. This creates a const reference to a=0D
+temporary, which is valid in C++, and extends the lifetime of the=0D
+temporary to the lifetime of the reference.=0D
+=0D
+However, lifetime extension in range-based for loops is considered as a=0D
+sign of a potential issue, as a temporary is created for every=0D
+iteration, which can be costly, and the usage of a reference in the=0D
+range declaration doesn't make it obvious that the code isn't simply=0D
+binding a reference to an existing object. gcc 11, with the=0D
+-Wrange-loop-construct option, flags this:=0D
+=0D
+uvcvideo.cpp:432:33: error: loop variable 'name' of type 'const string&' {=
aka 'const std::__cxx11::basic_string<cha=0D
+r>&'} binds to a temporary constructed from type 'const char* const' [-Wer=
ror=3Drange-loop-construct]=0D
+|   432 |         for (const std::string &name : { "idVendor", "idProduct"=
 }) {=0D
+|       |                                 ^~~~=0D
+=0D
+To please the compiler, make the range variable a const char *. This may=0D
+bring a tiny performance improvement, as the name is only used once, in=0D
+a location where the compiler can use=0D
+=0D
+	operator+(const std::string &, const char *)=0D
+=0D
+instead of=0D
+=0D
+	operator+(const std::string &, const std::string &)=0D
+=0D
+Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
+Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>=0D
+=0D
+Use a const char * type instead of auto, and update the commit message=0D
+accordingly.=0D
+=0D
+Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>=0D
+---=0D
+ src/libcamera/pipeline/uvcvideo/uvcvideo.cpp | 2 +-=0D
+ 1 file changed, 1 insertion(+), 1 deletion(-)=0D
+=0D
+diff --git a/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp b/src/libcamera/=
pipeline/uvcvideo/uvcvideo.cpp=0D
+index 031f96e28449..b6c6ade5ebaf 100644=0D
+--- a/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp=0D
++++ b/src/libcamera/pipeline/uvcvideo/uvcvideo.cpp=0D
+@@ -429,7 +429,7 @@ std::string PipelineHandlerUVC::generateId(const UVCCa=
meraData *data)=0D
+ =0D
+ 	/* Creata a device ID from the USB devices vendor and product ID. */=0D
+ 	std::string deviceId;=0D
+-	for (const std::string &name : { "idVendor", "idProduct" }) {=0D
++	for (const char *name : { "idVendor", "idProduct" }) {=0D
+ 		std::ifstream file(path + "/../" + name);=0D
+ =0D
+ 		if (!file.is_open())=0D
+-- =0D
+Regards,=0D
+=0D
+Laurent Pinchart=0D
+=0D
--=20
2.31.1

