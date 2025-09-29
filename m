Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24941CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:56 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.52861.1759151087880841199
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=huZ2mu3v;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3e44f22f15so190989666b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151086; x=1759755886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkvULeQV4gaKDQfzCB6i8fUJDsYIHPvlYq9oXpKWw3c=;
        b=huZ2mu3vQkZWXeW3AbtOM43zu9oOvbj9nyInJLF8egryKJk94jvPt0E+hwMS7ZeAdo
         m8/I7jH/inVVdycN/gEzRnS9IR/tIjv9/taHIWeNNp08aOg5Ne0bjycoUuDvbi/uXf8U
         bXmFPHypGCnRAsfRPPZoW+J1KadI+5HJcKbEdRdtu+K61YBzhO2GPoYvgN3D78mdhChL
         idCmlYh5cjMC+9/K+jyuCu+oIJr9AQ+CyZBnyqYuSgDZiFWXemkaMMRQh/SNM29ldBCg
         CK3ed5F5vuRi6YIJPveByxYA7rOfU7+ongBPmKiTJ31qk8RVVdnVhblVrJ4ilc9V2IIs
         B8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151086; x=1759755886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkvULeQV4gaKDQfzCB6i8fUJDsYIHPvlYq9oXpKWw3c=;
        b=BxyUXfIlxjqbYyxLxXpaIpy+U81abMvux+5q55ETmbqmcrqHpjpXfi+poY1pyjBdsS
         gGlQuaXnd5gDbiIZqNhcD7rMFLexV4NvKwXDBKf4AUDBRJU34URPOkpcf+UQzDH11np2
         Bs63yY/8JaAq8rlgvsWhA641YK4r0L5tVBioY/L3JvBl2NEXshNfr/8QWr8t7rQKqTYl
         rgQazxBosSwaT5OXtm9PYbmaPGPBy8wI1Hy5yoycEO9xYxA62/SQVY3k+DRrog/11iCb
         wbwIK6vwy6G1kPTXAk/Ko1dSYew1pU/t2O9CLEuea0LFbJzBT6FohzmInkKtIan7hl7W
         00pw==
X-Gm-Message-State: AOJu0Ywyg4eXAblqsXn3uyGWn0e8cukEDQz+DUNI8lrtKx0SnWxPn8eR
	fnNFbU4HbaSxNcVdMrwWk8YY+AqSdf+4cnxjuoBO4eztSLnFTb0x/ska5cJgpw==
X-Gm-Gg: ASbGncuew0GGkPSS/4HIxBd7/gURVgAZID1Ov+WiPY7j7IFQSuIvTYGojOM5Fqki8pp
	5ZW6X26CuHikWD7TGTc5fYmYKP+HR0DzDyFPMIoVA587JRzuhCKiZNQ7Lm0y2SFrx70UGi1w3/o
	g8Jxen+bRRtFyAXfnR+O1C9Fxf4IaLENdpzSDeXvwoegovuVhbfXgXzkJZCScYgBFGPtO7Bqb7+
	BlvaU3SQutkBLjjcPWQKeNRyCpVBWC/IpWQb/KfMLXxXjkHMsGMnQMA3FJEOsNUDDar9XzgXmbP
	Udr1M98pJjca5k17fQdW8HVgNKNYb05exxjq8QvLCSo1wGFtvO8ujTQdzkhDcVDWu5Gjes+Ov9w
	1mOiK7/oVsDXY6Y64L0X1/9c39b1uN+Q=
X-Google-Smtp-Source: AGHT+IGPB3a6QfhnGuWGbWcGHbieQGBAzeqWDLh4flb0QPGSsQqL8VdoVvAS63/BPr/dJSiQNDoBzg==
X-Received: by 2002:a17:907:3f9e:b0:b3e:5f20:888d with SMTP id a640c23a62f3a-b3e5f20dac2mr522697066b.27.1759151086005;
        Mon, 29 Sep 2025 06:04:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 21/22] recipes: Remove double protocol= from SRC_URIs
Date: Mon, 29 Sep 2025 15:04:24 +0200
Message-ID: <20250929130425.2912077-22-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120034

From: Peter Kjellerstedt <pkj@axis.com>

With the exception of paho-mqtt-cpp, the double protocol= attributes
were added to the SRC_URIs when protocol=https was added to all SRC_URIs
fetching from github.com in commit b402a3076f (recipes: Update SRC_URI
branch and protocols).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2e0a581bee7fc15a78f6e19ba1e596930edee414)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/unbound/unbound_1.15.0.bb       | 2 +-
 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb  | 2 +-
 .../recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb   | 2 +-
 meta-oe/recipes-core/emlog/emlog.inc                            | 2 +-
 meta-oe/recipes-core/mdbus2/mdbus2_git.bb                       | 2 +-
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb                   | 2 +-
 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb   | 2 +-
 meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb         | 2 +-
 meta-oe/recipes-extended/mraa/mraa_git.bb                       | 2 +-
 meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb               | 2 +-
 meta-oe/recipes-extended/upm/upm_git.bb                         | 2 +-
 meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb            | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.15.0.bb b/meta-networking/recipes-support/unbound/unbound_1.15.0.bb
index e5b649164d..64a70dc6af 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.15.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.15.0.bb
@@ -9,7 +9,7 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
-SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master;protocol=https \
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master \
 	file://0001-contrib-add-yocto-compatible-init-script.patch \
 "
 SRCREV = "c29b0e0a96c4d281aef40d69a11c564d6ed1a2c6"
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
index 7a65582dbe..6578bcfeb7 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
     file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
 "
 
-SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http;branch=master;protocol=https"
+SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=https;branch=master"
 
 SRCREV = "4157a27d39f1dd5b95750ecb6acd1481432785d8"
 
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
index a9e16fa045..27c0de4744 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
     file://about.html;md5=dcde438d73cf42393da9d40fabc0c9bc \
 "
 
-SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=http;branch=master;protocol=https \
+SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=master \
            file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch \
 "
 SRCREV = "33921c8b68b351828650c36816e7ecf936764379"
diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index 9d48e9cba3..2194b2e536 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -3,7 +3,7 @@ most recent (and only the most recent) output from a process"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=http;branch=master;protocol=https"
+SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=https;branch=master"
 SRCREV = "aee53e8dee862f35291242ba41b0ca88010f6c71"
 PV = "0.70+git${SRCPV}"
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
index 07c5cc9394..c6db78b4ab 100644
--- a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
+++ b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "readline"
 
 PV = "2.3.3+git${SRCPV}"
 
-SRC_URI = "git://github.com/freesmartphone/mdbus.git;protocol=http;branch=master;protocol=https \
+SRC_URI = "git://github.com/freesmartphone/mdbus.git;protocol=https;branch=master \
            file://0001-Fix-arguments-in-GLib.DBusSignalCallback-for-Vala-0..patch \
            "
 SRCREV = "28202692d0b441000f4ddb8f347f72d1355021aa"
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 72bec301fb..6350619fb2 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -14,7 +14,7 @@ PV = "7.91+git${SRCPV}"
 SRCREV = "c22d359433b333937ee3d803450dc41998115685"
 
 DEPENDS = "elfutils"
-SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http;protocol=https \
+SRC_URI = "git://github.com/sparkleholic/ltrace.git;protocol=https;branch=master \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-replace-readdir_r-with-readdir.patch \
            file://0001-Use-correct-enum-type.patch \
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
index 464d25ad08..3b7453536b 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b19ee058d2d5f69af45da98051d91064"
 SECTION = "Development/Libraries"
 DEPENDS = "swig-native python3 sblim-cmpi-devel"
 
-SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=http;branch=master;protocol=https \
+SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=https;branch=master \
            file://cmpi-bindings-0.4.17-no-ruby-perl.patch \
            file://cmpi-bindings-0.4.17-sblim-sigsegv.patch \
            file://cmpi-bindings-0.9.5-python-lib-dir.patch \
diff --git a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
index d003279966..39d6459227 100644
--- a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
+++ b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
 PV = "2.3.6+git${SRCPV}"
 
-SRC_URI = "git://github.com/snarlistic/jpnevulator.git;protocol=http;branch=master;protocol=https"
+SRC_URI = "git://github.com/snarlistic/jpnevulator.git;protocol=https;branch=master"
 SRCREV = "bc1d4f6587a4a4829b5d55e3ca7ad584da6de545"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 2a50550a0e..f1cdf66fc2 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=91e7de50a8d3cf01057f318d72460acd"
 SRCREV = "7786c7ded5c9ce7773890d0e3dc27632898fc6b1"
 PV = "2.2.0+git${SRCPV}"
 
-SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=http;branch=master;protocol=https \
+SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
            file://0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch \
            file://0001-include-Declare-gVERSION-global-as-extern.patch \
            "
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
index d953c11ee8..27247e6001 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
@@ -10,7 +10,7 @@ SRCREV = "3af04acd38bbc61bbdcdd931dcf234c971aa5336"
 PV = "1.8.0"
 
 SRC_URI = "\
-    git://github.com/oetiker/rrdtool-1.x.git;branch=master;protocol=http;;protocol=https \
+    git://github.com/oetiker/rrdtool-1.x.git;protocol=https;branch=master \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 61e2e38b05..aff73de6c6 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "libjpeg-turbo mraa"
 SRCREV = "5cf20df96c6b35c19d5b871ba4e319e96b4df72d"
 PV = "2.0.0+git${SRCPV}"
 
-SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=http;branch=master;protocol=https \
+SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
            file://0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch \
            file://0001-Use-stdint-types.patch \
            file://0001-initialize-local-variables-before-use.patch \
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
index 0bc03941fa..ceff54f46a 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5486c0df458c74c85828e0cdbffd499e"
 
 SRCREV = "cc05b288b6d1660ab04c6cf01173f1bb62e6f5dd"
 SRC_URI = " \
-    git://github.com/baldurk/${BPN}.git;protocol=http;branch=v1.x;protocol=https \
+    git://github.com/baldurk/${BPN}.git;protocol=https;branch=v1.x \
     file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
 "
 S = "${WORKDIR}/git"

