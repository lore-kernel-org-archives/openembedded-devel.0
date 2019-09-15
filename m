Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 45A527EC5D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:42:30 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id q64so21489270ljb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=1vT1aleywnWbMsC6qIwiCqcE5Mq653/RIUsDnom0iaY=;
	b=KlL59+cy/WN5kTdOS95keitzvgH2pP+ErU8JxSbZdYrnbGLd5vqJPGv2tqJmK/ukr/
	6FAyqRYKfne/wRE5CqCpGxC5P72V7PGV5rPKlFyOI8yZSaZIlZYxCD7fCuRUtBt9kt74
	2AMQE92rmrpBkSyxGc/Ng+OMEbTLZHQdG2z3W7Frw8NgpOoeSp9J1xrIaJjsKWP4lD3a
	7UKdBi1QKGWXcIOHSlixZJ1BDt4vboBVNxnqh1gOWdql27hXJURe7r30y0jM8xZpfbh8
	xIR+KLb3yQFmfPkhEwFel3il/sIQrcNr7GNrkVcxmQAmr1/UUpGTiyrB8x7kgVhMspG9
	lRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1vT1aleywnWbMsC6qIwiCqcE5Mq653/RIUsDnom0iaY=;
	b=FV9jTtosA1uZNn9+KtpjAmGmJRPcIVzAqzL0hI4jAA6DlLj6028bswvXR71VeYYOkZ
	/hGrC4R/bYfcC1aCignI7UqoaYf1cNNT9olPPk0lRdyXXdpGKQw6/aRE0ABqfda/Agl0
	Hh0yUsKVRah+fqPfkFR7Nq5V1+xtengalQ07OV52RX6sgmyNWQ+LEuW5qlOG/hgRW1ba
	cjouJIxjQF1wexdBj2Plk/vTipBJy2+Zc4PCWQ1yvXFh8PHJveLSlPS7oEwmezBvf0ZD
	y53bAgJWkJb/zgsZ6asNhSP1cTnaScazmORou8dxF+PqQbbQqyCoz4NbshjqPFuzBKti
	k/6w==
X-Gm-Message-State: APjAAAVfjSqmVprKlhWpJAwL3GfBZ+6I7NqESnIEichnFFIsz3DagvYE
	8M5BTkbFUJ6g+IkabXQiv9SD71LjDzU=
X-Google-Smtp-Source: APXvYqy9L7vUQH8u6Ot6+z2P+3K7jBHlCOYcfjvXdPWGAajVf0DVoSgwlHL+CINeZ1pUIwLTLTT+nQ==
X-Received: by 2002:a2e:9241:: with SMTP id v1mr5540785ljg.148.1568590950638; 
	Sun, 15 Sep 2019 16:42:30 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	m21sm8624396lfh.39.2019.09.15.16.42.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:42:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:42:28 +0200
Message-Id: <20190915234228.13416-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libbytesize: update to 2.1
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
X-List-Received-Date: Sun, 15 Sep 2019 23:42:30 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001-fix-out-of-tree-build-failure.patch  | 37 -------------------
 ...{libbytesize_2.0.bb => libbytesize_2.1.bb} |  6 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libbytesize/files/0001-fix-out-of-tree-build-failure.patch
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.0.bb => libbytesize_2.1.bb} (87%)

diff --git a/meta-oe/recipes-support/libbytesize/files/0001-fix-out-of-tree-build-failure.patch b/meta-oe/recipes-support/libbytesize/files/0001-fix-out-of-tree-build-failure.patch
deleted file mode 100644
index 3f42c25d7..000000000
--- a/meta-oe/recipes-support/libbytesize/files/0001-fix-out-of-tree-build-failure.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 55802fd187b844f0c114c1657b18482bfc80ec51 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 2 Jul 2019 02:52:31 +0000
-Subject: [PATCH] fix out of tree build failure
-
-Since commit [116da95 Add the '--version' option to bs_calc.py] applied,
-while build out of tree, there is a install failure
-...
-|install -m0755 ../../git/tools/bs_calc.py /usr/bin/bscalc
-|install: cannot stat '../../git/tools/bs_calc.py': No such file or directory
-...
-
-The generated bs_calc.py locates in builddir rather than srcdir
-
-Upstream-Status: Submitted [https://github.com/storaged-project/libbytesize/pull/59]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- tools/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 08223a8..ae22fed 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -5,7 +5,7 @@ dist_man1_MANS = bscalc.man
- 
- install-exec-local:
- 	install -d ${DESTDIR}${bindir}
--	install -m0755 ${srcdir}/bs_calc.py ${DESTDIR}${bindir}/bscalc
-+	install -m0755 ${builddir}/bs_calc.py ${DESTDIR}${bindir}/bscalc
- 
- uninstall-local:
- 	rm ${DESTDIR}${bindir}/bscalc
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.0.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb
similarity index 87%
rename from meta-oe/recipes-support/libbytesize/libbytesize_2.0.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb
index 74f1800d1..07bf1faae 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.0.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb
@@ -9,10 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "92c00638a6f846df5c40dbb690f9fcf998ad6df2"
-SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master \
-           file://0001-fix-out-of-tree-build-failure.patch \
-"
+SRCREV = "9ecc1042109528051983261ffd491d45e7c471e1"
+SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master"
 
 inherit gettext autotools python3native
 
-- 
2.17.1


