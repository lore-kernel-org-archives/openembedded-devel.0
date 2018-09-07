Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id B2CE57979C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 18:58:52 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w11-v6so15947184wrc.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 11:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OhhZM1JJnNK75qxJNc7dKWG4PRLbChdFb+BhHro8yyo=;
	b=LAZ85ev12w1iCpibtMdXZCsSAQg8VZjP8fegj15/55hhgWWe271zXyH/P/IZuAZK2v
	AzhII2dGIKOOXIG+Jbk71btjRLpoI+8I8BOnZtraNaxlBvBvMh6CpgotTdS9vFvYqBV4
	pyJ8lt8jXc9NQotZNK+J2++0xLf+oZvZsZ4eEHLOyNkMbPc7bnQj7pl7w7B0DqF4NiJu
	JKUn6ZA0QhPbaVnhALPH1sgLVgdRU6h+Z0as34blk72JcWs4TXwmBPd4P7+FjCrb/1m4
	tfJjYQBZ0z8BaQbEcTWvsbNDd4dCNQEOTkFGjl94P13EGUrQm6QEVVk4DnRpMYYyj9Hs
	8YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OhhZM1JJnNK75qxJNc7dKWG4PRLbChdFb+BhHro8yyo=;
	b=aJGOViS5Oy+Kk32J2cjrTChxeDeobD9agMMJy2Z7RUDf7UzBZarXsSHucwLU9dmR3s
	ZLx0zbH4ky963qMeBIcVltFaN+FyhRPCwwW4G7Uj/50y0huKpfrrTkTK+r+578OgAcDG
	Yv8TMXSmtnkgSx8d2brt7BkplLhSAlpQt+qj1x3K/Vsl1KHNVg3hxQGypSC2jHsut3QC
	VKOYN6XKrou/bOfsLN3x2Q9L9KS4POTlA5GgylymWJokytW6FBHzR5MWQfABRUROX+Ko
	8EOerX2EZrt+KaZN2NofohpDlGa2YlJbs2DSsyG8P3x26Al33Mu98xLHCBefyuQb/Z8L
	QHZA==
X-Gm-Message-State: APzg51D+dwm5iHtdyeXUnidLKQrdbWThxC3Ig8Boy8UOZQRtGcznkxZV
	3SDOOB1FyMHleNWIiTu6RzT3msZ9
X-Google-Smtp-Source: ANB0VdYc4ELFetTFLJZZUHCikP+FlIn6IZx2ylyY5N8EjMuSLXAtesJSvbO6M94TX6oE0pjfU4Ca1g==
X-Received: by 2002:adf:b357:: with SMTP id
	k23-v6mr7295296wrd.207.1536346733263; 
	Fri, 07 Sep 2018 11:58:53 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t25-v6sm6601462wmh.15.2018.09.07.11.58.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 07 Sep 2018 11:58:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 18:58:51 +0000
Message-Id: <20180907185852.28479-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][sumo][PATCH 1/2] libqb: Fix build with gold
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
X-List-Received-Date: Fri, 07 Sep 2018 18:58:53 -0000

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


