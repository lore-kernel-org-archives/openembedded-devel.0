Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19882C43217
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:06:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.1940.1668024363739790777
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:06:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qlwnF3IN;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id bk15so27498111wrb.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 12:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi7pzNKhesbjwj9cx8rNhcaezhsd6W6LiZjx/6lqqZM=;
        b=qlwnF3IN+B5FzOZZ9lf+A0VKJPKFdwR1g7C0tBbee9Dp6EqTC1fkXKqNZRj+Q0Aid/
         LRSzTUEEp30dHleXONJSS5ckyQRNYpWTzdNIi8me3hSDI5FsTYrqaDiZRI9dAiWgtxc+
         dRr6YGN6SUBAAAiPS7+IA4Cv0GOW4ut0yObHHkM1JZ+S6B9h2h6gEh4pcHKK+QEvZJxo
         w/jqN5iWAe1N7e8uZQqtGz5yr8XZNs8Bj8mJ+O0maff9IKYO3Myvxb+qhTM150afkwkp
         4bwetyal78n0xkjX28nHZUmWXLHGf55+e14Z4bNorK9f+GG8yBdu054aMHF/7xf5NwcY
         AcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mi7pzNKhesbjwj9cx8rNhcaezhsd6W6LiZjx/6lqqZM=;
        b=8Jpkgs9Uy+3EnOQGf+vpzGNRNdFGlHwqH621aqhgiC941k3e9YvAFA623qxOxzTfeH
         7sseMr7Ow8c+s0rGksCitNE3+I88eBl0A+4/lRzFSoFr2hWMfcejB2oIwfULtnDwU3Ys
         i/FN2ai/3/M31VgyaDTAywywxT9psJsxhKp4rqT9gbariXKzPeC6PIhdfC0PFPq27Kpt
         cYkUn+kbHpaHgBxrE9K3IS1Xwi3qa9AON7tdgAVVUVKu8Irqoqyy7o9knGhWhy/I1Eqx
         PQVQjePC8jNXfj3bpyg8LFt8zHvVZ8SMLz5bBVfeWT2xyQb3q7J/8QovUlMfsvRra5at
         coYw==
X-Gm-Message-State: ACrzQf3JHsNv/n8oo+wI9/mUBoQSdhDPOZp4oZyy5X4WpuGu6+wOozja
	AbXTbJLI7Vbagl1osiv04CUfIXmcCO4=
X-Google-Smtp-Source: AMsMyM60hhTkFeZfXaeHpTXgkguaRjx4RwLj1VfC0pC6SaboBa32KPDprXQ75WZoacRF3kc8D+CfSQ==
X-Received: by 2002:adf:e74c:0:b0:22a:34a4:8831 with SMTP id c12-20020adfe74c000000b0022a34a48831mr917381wrn.199.1668024362077;
        Wed, 09 Nov 2022 12:06:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q12-20020a5d61cc000000b002238ea5750csm16532548wrv.72.2022.11.09.12.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 12:06:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] lirc: correctly use PYTHONPATH
Date: Wed,  9 Nov 2022 21:05:58 +0100
Message-Id: <20221109200558.2034000-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221109200558.2034000-1-alex@linutronix.de>
References: <20221109200558.2034000-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 20:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99509

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ot-clobber-PYTHONPATH-from-build-env.patch | 55 +++++++++++++++++++
 .../recipes-connectivity/lirc/lirc_0.10.2.bb  | 21 +++----
 2 files changed, 66 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
new file mode 100644
index 000000000..089ed23c7
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
@@ -0,0 +1,55 @@
+From 5e3b74927b4fef03d91518d235e9e3ba8cd7ab2e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 9 Nov 2022 20:49:41 +0100
+Subject: [PATCH] Makefile.am: do not clobber PYTHONPATH from build environment
+
+This environment variable has special significance for python,
+and so lirc's variable has to be named something else.
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Makefile.am       | 2 +-
+ pylint.mak        | 2 +-
+ tools/Makefile.am | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6718af1..fae423e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -128,7 +128,7 @@ endif
+ 
+ pylint: .phony
+ 	$(MAKE) -C tools pylint
+-	-PYTHONPATH=$(PYTHONPATH) $(PYLINT) --rcfile=pylint.conf \
++	-PYTHONPATH=$(LIRCPYTHONPATH) $(PYLINT) --rcfile=pylint.conf \
+ 	--msg-template='$(pylint_template)' $(py_PYTHON)
+ 
+ pep8: $(py_PYTHON)
+diff --git a/pylint.mak b/pylint.mak
+index bf427ab..2692951 100644
+--- a/pylint.mak
++++ b/pylint.mak
+@@ -1,5 +1,5 @@
+ PYTHONPATH1      = $(abs_top_srcdir)/python-pkg/lirc:
+ PYTHONPATH2      = $(abs_top_srcdir)/python-pkg/lirc/lib/.libs
+-PYTHONPATH       = $(PYTHONPATH1):$(PYTHONPATH2)
++LIRCPYTHONPATH   = $(PYTHONPATH1):$(PYTHONPATH2)
+ PYLINT           = python3-pylint
+ pylint_template  = {path}:{line}: [{msg_id}({symbol}), {obj}] {msg}
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 85d1fd0..96b17f8 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -142,7 +142,7 @@ force-pylint: .phony
+ 
+ pylint: .pylint-stamp
+ .pylint-stamp: $(py_sources)
+-	-PYTHONPATH=$(PYTHONPATH) $(PYLINT) --rcfile=../pylint.conf \
++	-PYTHONPATH=$(LIRCPYTHONPATH) $(PYLINT) --rcfile=../pylint.conf \
+ 	--msg-template='$(pylint_template)' $? && touch $@
+ 
+ .phony:
+-- 
+2.30.2
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
index 234d347af..458d9d7cd 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
@@ -11,16 +11,17 @@ DEPENDS = "libxslt-native alsa-lib libftdi libusb1 libusb-compat jack portaudio-
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
-    file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
-    file://fix_build_errors.patch \
-    file://0001-mplay-Fix-build-with-musl.patch \
-    file://lircd.service \
-    file://lircd.init \
-    file://lircexec.init \
-    file://lircd.conf \
-    file://lirc_options.conf \
-    file://lirc.tmpfiles \
-"
+           file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
+           file://fix_build_errors.patch \
+           file://0001-mplay-Fix-build-with-musl.patch \
+           file://lircd.service \
+           file://lircd.init \
+           file://lircexec.init \
+           file://lircd.conf \
+           file://lirc_options.conf \
+           file://lirc.tmpfiles \
+           file://0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch \
+           "
 SRC_URI[sha256sum] = "3d44ec8274881cf262f160805641f0827ffcc20ade0d85e7e6f3b90e0d3d222a"
 
 SYSTEMD_PACKAGES = "lirc lirc-exec"
-- 
2.30.2


