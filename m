Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5497460D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 22:25:57 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id c9-v6so1529794pgf.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 15:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M8s7IJ8vtqxHna9T517Q2Bvlb1YZNMsb/pdkuJTW8f4=;
	b=UvTQ1Wjiw3pupF+BKcYZ2kagG4FFDT2+iAxdfbD6apkAJe0rHOMrBb7rNae5M+g9HD
	VDN9Cb+Ny/ELjxjpWVrJ8tTwF3F95ju27SqpV05uHuGT9Yno1GXyq2PMDeldnlMy5JYe
	/OQCEXSBBuOFPfKL6WbPt8/5Aw9D95kRex+V7IWbBO8x9Nr4nAQeBCNu4RgjQ4NwthVC
	PTTzkCUBohNHPXlSYKsTph08r4k7x4DI8HFE8kRtQ/j+2Vy5ekjqdzQCPMUpHdqRIecR
	UbY2SsuBtOePHmLb8NJ0E3Y+sXUGZWlbvpr3yGokV3K0vRvcLmKlLjjufVlbfqX9rYUk
	0i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M8s7IJ8vtqxHna9T517Q2Bvlb1YZNMsb/pdkuJTW8f4=;
	b=LLHHj5x4xytxp+wzZrFTsZSJqY5jXgsuwquHEXiIBc9sVLSNogdS3fmV1QSTobXoWp
	ohus+qOtlpLNlSqZ2bvNudeznJoUY4ENgvpA+P/9zcKDRoZJDqOrm7J9nON3ZRnDoJ1G
	1qh4a8O734WPXDT9ulEFMpMcwm/tuTQtUWlm7UIj34D7zDzrLvvmRSQVPIondSK2DFai
	ZcyhqXM5D1qg83t4E7IKk161ZhYcUJAUIbe+nU5b/dP7rSXY7n9BnBpyNcpnURVemmEv
	oOEO9u7ES5wIJJoP8BlREr+NhSgeWtOp3jP97g0XXcN++U5S+EobX+UNYUpvh8vq4505
	R4Ng==
X-Gm-Message-State: APt69E1zDWDkIdWMaXq4NL60+Z/Hj2cd+xyuPBF3RnMTrCwfGZpDHgSv
	NIVgZdfK9KJGWZI7QRvqbuqrBg==
X-Google-Smtp-Source: AAOMgpceHW1UArrk47wZeFAGMyZ32l9RtW+Sehsb2L28hupGkVAncKE5wzsWo9+WSPlCLzJqw6oHbQ==
X-Received: by 2002:a62:d39b:: with SMTP id
	z27-v6mr2192798pfk.182.1530138358835; 
	Wed, 27 Jun 2018 15:25:58 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	s14-v6sm7392673pfh.116.2018.06.27.15.25.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jun 2018 15:25:58 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jun 2018 15:25:52 -0700
Message-Id: <1530138352-3714-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] mosquitto: minor recipe cleanups
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2018 22:25:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 - Passing prefix, mandir and localedir via the Make command line
   allows patching of config.mk to be dropped.

 - The variable PREFIX isn't used anywhere in the mosquitto 1.4.15
   Makefiles, so doesn't need to be passed on the Make command line.
   That means the default do_compile() from base.bbclass can be used
   and the recipe specific do_compile() can be dropped.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...llow-prefix-mandir-localedir-from-environ.patch | 35 ----------------------
 .../mosquitto/mosquitto_1.4.15.bb                  | 24 ++++++++-------
 2 files changed, 13 insertions(+), 46 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch b/meta-networking/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch
deleted file mode 100644
index a5aa277..0000000
--- a/meta-networking/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0be38301249d797ec1f59071cc868ceda6d4720a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
-Date: Tue, 12 Apr 2016 12:50:32 +0100
-Subject: [PATCH 1/2] config.mk: allow prefix / mandir / localedir from
- environment
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-We want to control them using OE environment variables.
-
-Upstream-Status: Inappropriate [embedded-specific]
-Signed-off-by: André Draszik <andre.draszik@jci.com>
----
- config.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/config.mk b/config.mk
-index 71f17e5..81d9702 100644
---- a/config.mk
-+++ b/config.mk
-@@ -249,7 +249,7 @@ ifeq ($(WITH_DOCS),yes)
- endif
- 
- INSTALL?=install
--prefix=/usr/local
--mandir=${prefix}/share/man
--localedir=${prefix}/share/locale
-+prefix?=/usr/local
-+mandir?=${prefix}/share/man
-+localedir?=${prefix}/share/locale
- STRIP?=strip
--- 
-2.15.1
-
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
index 8dd2124..f451687 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=62ddc846179e908dc0c8efec4a42ef20 \
 DEPENDS = "uthash"
 
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
-           file://0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch \
            file://0002-uthash-remove-in-tree-version.patch \
            file://mosquitto.service \
            file://mosquitto.init \
@@ -27,20 +26,23 @@ PACKAGECONFIG ??= "ssl uuid"
 PACKAGECONFIG[dns-srv] = ",,c-ares"
 PACKAGECONFIG[ssl] = ",,openssl"
 PACKAGECONFIG[uuid] = ",,util-linux"
-EXTRA_OEMAKE = "${@bb.utils.contains('PACKAGECONFIG', 'dns-srv', 'WITH_SRV=yes', 'WITH_SRV=no', d)} \
-                STRIP=/bin/true \
-                WITH_DOCS=no \
-                ${@bb.utils.contains('PACKAGECONFIG', 'ssl', 'WITH_TLS=yes WITH_TLS_PSK=yes', 'WITH_TLS=no WITH_TLS_PSK=no', d)} \
-                ${@bb.utils.contains('PACKAGECONFIG', 'uuid', 'WITH_UUID=yes', 'WITH_UUID=no', d)}"
 
-export LIB_SUFFIX="${@d.getVar('baselib', True).replace('lib', '')}"
+EXTRA_OEMAKE = " \
+    prefix=${prefix} \
+    mandir=${mandir} \
+    localedir=${localedir} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'dns-srv', 'WITH_SRV=yes', 'WITH_SRV=no', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'ssl', 'WITH_TLS=yes WITH_TLS_PSK=yes', 'WITH_TLS=no WITH_TLS_PSK=no', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'uuid', 'WITH_UUID=yes', 'WITH_UUID=no', d)} \
+    STRIP=/bin/true \
+    WITH_DOCS=no \
+"
 
-do_compile() {
-    oe_runmake PREFIX=${prefix}
-}
+export LIB_SUFFIX = "${@d.getVar('baselib', True).replace('lib', '')}"
 
 do_install() {
-    oe_runmake install DESTDIR=${D}
+    oe_runmake 'DESTDIR=${D}' install
+
     install -d ${D}${libdir}
     install -m 0644 lib/libmosquitto.a ${D}${libdir}/
 
-- 
1.9.1


