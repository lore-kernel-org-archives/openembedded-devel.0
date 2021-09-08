Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.11950.1631110808592632751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KngJ2Lu3;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id b6so3538716wrh.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Sep 2021 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Q6TsunVzOZPQxrbiX0yOLIuQAwJZPC+PkS8cny0No4=;
        b=KngJ2Lu3zybH2q62zrGCPZDk07CTk9auhvjkK9Bh6tbzKfnL4fiPO8yH5J7we7mh/z
         GYL1QmpjuHauZ3Gpe1JofAM/aKwUBt8B+E4vo8hzF4cq8evZbZ85Vp3WhRQzdTXx0MCP
         +LYSd6XvX4dRRNNf4j4YhlUkIDWZdRt388Z1Xk0CwDnZve/Hf6ayigCeMId+NZPe7Ko+
         WGzWFGUsNCjc+p74CYxHO0A/uNvprJGaLZr3Ud8FSsGv9km/ZU4PTYTjdJJgKTmORMIA
         /txiS5QOhUx0rvi+kopu7Orzp1oWXOmKxpOgM6Laayr9vIbGcJoeFt7tjsXeg7FrNxLP
         sEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Q6TsunVzOZPQxrbiX0yOLIuQAwJZPC+PkS8cny0No4=;
        b=MxMfgtVgVW/+ypqfo9L7foAJz505qsDpMT8++Vb5brfPYVqyph20Kbxkgf/WJ9R2cU
         Wm/LlEilo0vC7Wc91NeZKB8xvXnkHbfV3ZQc+BwMtm9MYxjiMWqLoVv6vVd/cGW2ygjz
         D4AdA/tFDyDBICETvBv+4pSSpOXAobot8yV1T+Gs9Dh16AZ/H92YojZ0kVxozR0pRrew
         BMe1rvl0EVLs8Z+aVMyfg/qSDMbZ3BtcXCVCnsTMJBwFbLTDccfb7fZUD2NIJUGA//FZ
         sN1gNOGP4ilNEkcevnzm2gFnIXY7oBbzn7MILXlHSknNxgAEyr3nxigy7LEhdTJHBD6R
         6dwA==
X-Gm-Message-State: AOAM532XEla1MMCZpFtYs8uPPwR8GURJ8lfebUAzKy/Hi31Oco55CYRP
	C8udr5Ot3ZKvXtvMHCN1OyM26e7WE60=
X-Google-Smtp-Source: ABdhPJxf4dub/sux0zfZaKPoVwn19PRUDvPpSdeQdyApdNKUFgezlhOtQkwVxNtJFftURm3dCBxf8g==
X-Received: by 2002:adf:c14c:: with SMTP id w12mr4477021wre.115.1631110807075;
        Wed, 08 Sep 2021 07:20:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id t7sm2553710wrq.90.2021.09.08.07.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 07:20:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] msgpack-c: update 3.2.1 -> 4.0.0, add msgpack-cpp
Date: Wed,  8 Sep 2021 16:19:55 +0200
Message-Id: <20210908141958.866476-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream has split the C and C++ versions into separate
components so add the recipe for CPP flavour.

The only consumer in meta-oe, tmate, still builds fine.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 ...{msgpack-c_3.2.1.bb => msgpack-c_4.0.0.bb} |  5 ++---
 .../msgpack/msgpack-cpp_4.0.2.bb              | 22 +++++++++++++++++++
 3 files changed, 25 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/msgpack/{msgpack-c_3.2.1.bb => msgpack-c_4.0.0.bb} (83%)
 create mode 100644 meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index c36feb334..d56e3d302 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -278,6 +278,7 @@ RDEPENDS:packagegroup-meta-oe-devtools ="\
     capnproto-compiler \
     mpich \
     msgpack-c \
+    msgpack-cpp \
     mercurial \
     nodejs \
     openocd \
diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_3.2.1.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb
similarity index 83%
rename from meta-oe/recipes-devtools/msgpack/msgpack-c_3.2.1.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb
index 5224f32b0..1bb371add 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_3.2.1.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb
@@ -9,10 +9,9 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
 
 PV .= "+git${SRCPV}"
 
-SRC_URI = "git://github.com/msgpack/msgpack-c \
+SRC_URI = "git://github.com/msgpack/msgpack-c;branch=c_master \
            "
-# cpp-3.2.1
-SRCREV = "8085ab8721090a447cf98bb802d1406ad7afe420"
+SRCREV = "a9a48cea3a78ba661ee8096b5dab456361b0ff23"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
new file mode 100644
index 000000000..f66a00bd8
--- /dev/null
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "MessagePack implementation for C and C++"
+DESCRIPTION = "MessagePack is an efficient binary serialization format. It's like JSON. but fast and small"
+HOMEPAGE = "http://msgpack.org/index.html"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
+                    file://COPYING;md5=0639c4209b6f2abf1437c813b208f2d3 \
+                    file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
+                   "
+
+PV .= "+git${SRCPV}"
+
+SRC_URI = "git://github.com/msgpack/msgpack-c;branch=cpp_master \
+           "
+SRCREV = "3bdbf0d2ee75d46d71afa691a594777d89a22cf7"
+
+DEPENDS += "boost"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.20.1

