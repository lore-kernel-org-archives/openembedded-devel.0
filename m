Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC3075080
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 15:27:09 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id l41-v6so3198447wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OhhZM1JJnNK75qxJNc7dKWG4PRLbChdFb+BhHro8yyo=;
	b=Lsjfl+hqnmJJdEd0ia+AOKqUYbB3x2CQG9Bw5eKfxJSg2Q/4bKb0USmVDY+W9BP/k8
	sONPNAHJQE7eCDoMqS4cwfrzMZX7yphQGmcp72DsMqtzN/VQYfTzSyaTMwpfJB8U2VLp
	IByzZxIiQCLbe3xObG+ZY4Udovu6bQNCc8mnXOuEZu471g3l2BhXhXL2zTC8DDZ36fv4
	y/oWm9XDMYxLyVccYjLZD6NSjL98WJOB2yInppvzT18sW3FIQlAumAPZTqLN6JQcxo39
	nfc+lpfGt0ch1gCiJBiz5rNvAEDyitGUJr17BgaeBTfWe9T6Exom/Q6RxDy9k2qx8iZn
	fj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OhhZM1JJnNK75qxJNc7dKWG4PRLbChdFb+BhHro8yyo=;
	b=IX0jVpkyFZOp9PJpQyVNH0XoHrET3xyHMMMclrwnMYjmGkCn9XZOlRsb0D8DFlCfJh
	Bps7rye9udj8+SuoiYsnhqWfob0ZIWnin0o0DzKn/k9827gkvl3qGxQ+KdiyR4dMY6Z4
	Rlafj1e0PWyhsZ/AV4MfNqnXqDYIYgH2Ta286dG3rHInGdqUuXxoY8cW7/7hpoaa4Wsp
	HIXb1eVjKwCOHFOT9v2M1CClGiJCTDkWEGY7GicGsgS94m8WB5i6E1T0V/K+4ejvirQx
	ogPsQK++IWQexyzBFC0V1sOaepsyJcvADYjIIN+6pnQMSv50YdQTfsyV1ZZ++Z3bPbnL
	k/jA==
X-Gm-Message-State: APt69E3kq4bfEcrKaYFadQRt2bMKsU09WfBncMmfYH14PbtNs301wIiW
	qtJtgPkz2eUUduy/QvHdmk0MWg==
X-Google-Smtp-Source: ADUXVKJuK1bc2ofLAsGduCTQ+up7anHoPQlCDkUMEcZy5/oOUzbm10dlJa43oOZ2wsXKGwbqsog2dw==
X-Received: by 2002:adf:ee91:: with SMTP id
	b17-v6mr3205614wro.21.1528903629748; 
	Wed, 13 Jun 2018 08:27:09 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l67-v6sm4091982wmb.22.2018.06.13.08.27.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Jun 2018 08:27:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jun 2018 15:27:07 +0000
Message-Id: <20180613152707.12491-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][meta-oe] libqb: Fix build with gold
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
X-List-Received-Date: Wed, 13 Jun 2018 15:27:09 -0000

* since the upgrade to 1.0.3 more specifically since this commit:
  https://github.com/ClusterLabs/libqb/commit/20246f544f74866885f4d9491f74152bd95e7786#diff-67e997bcfdac55191033d57a16d1408a
  it was failing to build with gold
* add --enable-nosection-fallback to work around the issue

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libqb/libqb_1.0.3.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb b/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
index 73cea5e398..d857344e3f 100644
--- a/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
@@ -18,6 +18,14 @@ SRC_URI = "git://github.com/ClusterLabs/${BPN}.git \
           "
 S = "${WORKDIR}/git"
 
+# otherwise do_configure fails
+# configure:21609: checking whether linker workaround for orphan sections usable
+# configure:21639: i586-oe-linux-gcc  -m32 -march=i586 --sysroot=WORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot -o conftest  -O -fno-omit-frame-pointer -g -feliminate-unused-debug-types -fdebug-prefix-map=WORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0=/usr/src/debug/libqb/1.0.3+gitAUTOINC+c235284b5f-r0 -fdebug-prefix-map=WORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot= -fdebug-prefix-map=WORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot-native=  -pipe  -pthread -D_REENTRANT  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,conftest.ld conftest.c  >&5
+# WORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot-native/usr/bin/i586-oe-linux/../../libexec/i586-oe-linux/gcc/i586-oe-linux/8.1.0/ld: error: conftest.ld: SECTIONS seen after other input files; try -T/--script
+# WORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot-native/usr/bin/i586-oe-linux/../../libexec/i586-oe-linux/gcc/i586-oe-linux/8.1.0/ld: internal error in write_sections, at ../../gold/reloc.cc:791
+# collect2: error: ld returned 1 exit status
+EXTRA_OECONF_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' --enable-nosection-fallback', '', d)}"
+
 CFLAGS += "-pthread -D_REENTRANT"
 do_configure_prepend() {
     ( cd ${S}
-- 
2.17.1


