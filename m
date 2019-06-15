Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8EF7CC09
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:48 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f21so3420475pgi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Xau82ud8s61fc7nEWZbA1mhCdS0uKt7agL7ku/0C6Jc=;
	b=iZ9i+WSbqu2Wtz01hEgI+bfA9Ln/fxwz+NWHKLgCFY4HqDM+8Mfu+omKL+L0RtqvHT
	//59o2ykgKwv5Y5e/Dkpifk7PFFOyxg3AAaAooJK0Ml45DFeNklwedGdi9Cm+vNlZBST
	SZCbvglIE8BG2NU6xaBx+iUPq8Y42t7CuJCPrD0sCPTki6hP3h84zUKjC7dEgAO3yPxq
	LGhM6kzfMKgl0HCQlLg5GMO/776SvfZFrJnbOpViLfoKed+gGB4QjUe1f13SZ4w3bCgS
	1DH/5nIiCLoKzXo77nvgZKfRFvqij9mUlgLELYpR/rwirOd/p6ZgIBdUzmL/S7zm4IHm
	cSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Xau82ud8s61fc7nEWZbA1mhCdS0uKt7agL7ku/0C6Jc=;
	b=jlUPh+GCm20mjjnJWD3ZmlGLU4nsVHnk54vvL5zGNDwcnKf6F0FB+SrskawMuGYk/v
	49jKk8OOsQOHjMp1ASzIPXRd9+ryWn8maJmBZXdGi39P9nv0etTufhHYhCRY1Q8wG4EO
	UgjfQ8OzqL+7DMs/iE4gI1kRG79srKNAKYC+EoOcVeJzBaqoMcNQGQ+zVKAEWRSve5uw
	CBxmbZdnbd9iB7gy2MLYP/j8Wep5LvDgwv2UgpDbGlHLKFOwMwTXK9SzKwQdjumDhKqF
	Ss85XpNFyCqeyy2TTNTVTwHvlWLfTeDvpmb0VhGPeifHWkbEemWUrNU1B53LmElOGUjT
	7Nmw==
X-Gm-Message-State: APjAAAU/xKw74R0xj3ez0t3TQJUlSXkgAUMLHw+Q47Oo+FCOBIBGCPbK
	nZ/W+zyBJ79Aa7Z04EbXYnxuqZWK
X-Google-Smtp-Source: APXvYqzsJypZqKtWJGPTliy11OIVa4JE+e11JQYKEXX8Bz2WxOENX1mjHUiJB7/0RSpjGH035JcRxg==
X-Received: by 2002:a63:2bc4:: with SMTP id r187mr6157105pgr.304.1560621469945;
	Sat, 15 Jun 2019 10:57:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:24 -0700
Message-Id: <06ec57f7cbbbad226afdd623e7ecb32bb7bc2fd7.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 20/23] crash: do not use unstable github archive tarballs
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:49 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

Since commit [21f84fc insane: add sanity checks to SRC_URI] applied
in oe-core, do not use unstable github archive tarballs

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/crash/crash_7.2.5.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.5.bb b/meta-oe/recipes-kernel/crash/crash_7.2.5.bb
index 0b23356..e124db1 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.5.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.5.bb
@@ -12,8 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "zlib readline coreutils-native"
 
-SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
-           http://ftp.gnu.org/gnu/gdb/gdb-7.6.tar.gz;name=gdb;subdir=${BP} \
+S = "${WORKDIR}/git"
+SRC_URI = "git://github.com/crash-utility/${BPN}.git \
+           http://ftp.gnu.org/gnu/gdb/gdb-7.6.tar.gz;name=gdb;subdir=git \
            file://7001force_define_architecture.patch \
            file://7003cross_ranlib.patch \
            file://0001-cross_add_configure_option.patch \
@@ -25,8 +26,7 @@ SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;download
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
            "
-SRC_URI[md5sum] = "3f6e18d38821bb326700f1d6d43bcaec"
-SRC_URI[sha256sum] = "114a83ca27c91e4321f6399d637a9d2270f72b9327e56d687c5fb139e903069b"
+SRCREV = "c0a2fc9d322cf0c5f569ce54e9201d2f586edb0c"
 
 SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
 SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
-- 
2.7.4


