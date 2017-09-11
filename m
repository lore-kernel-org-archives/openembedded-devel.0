Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4E72271BE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:11:05 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id t3so4756481pgt.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7DS0D4q5Ww+eVOHcKM/SegVUual6GbPhuB4jSVdDbbM=;
	b=H1f+iEg7PE3DOq74iPPFUQomxsEzKUIL0H1tPhObrkRiulJVlc+ApwCuMFFKH9YlV3
	GHdtGV/TigBNtfAblyC3nAKXO8falyRvAiSqHTiuGtNoTI4xSD0fqIwzoyUXWRuxO/q4
	3LblQmLhP1fWneVrjhX0HcxkD2CYeh2XdNIwGQiP4dYRNai9JUNpEPCcD9yyjXW8bTFM
	asC53uwA98L/owLKcUpr7pve4v8z2SlbgbeBTl2/gzQU43r1It3rSx7YrOUyrsinvy1u
	gbVIrCwr7vH7ZjW7B2EkDmfU3nLElJejJWtQrGMvZOl8Y/iU9LIaTkgH5ClCZmezpDl1
	9Bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7DS0D4q5Ww+eVOHcKM/SegVUual6GbPhuB4jSVdDbbM=;
	b=n83jJPMXJLiZtaW8P6DxpvDwhP22eydynyRnB8r6SOvaV/oEUKbc9bdueGVeHPwRP7
	6isuTo8dXroQYrgHj0XE6kur2pMo/ySYWgHOhBeQUn2GT2ELcPyvLc0i77M0jtlt5GW/
	M6Zp1mJVHlg+pk7TZQec48gjQxTMBvxKgC4oL1lmgnyA7xhYJw2ETSdPSLJEfChCft4g
	SSUpbpVeqaELqVDAbXCP4DB/bRIjbRmnaR933Hapk2rfEw/AEeXlED4ivd2AP9U1NFUE
	LNWG1cfdGTDb6SvhngrOOgEEj04JJgikAYD+4jyG7CazupwhONMZ7iJ33aX4LaoP9Pc+
	Yx8w==
X-Gm-Message-State: AHPjjUjrcUxEy7sCQGPWswg8dweX5fTZwFUp5UtdNTULLNOAUA1o2R9b
	SarpLgFIGPhNCfbC
X-Google-Smtp-Source: ADKCNb6s/cwdN5Q7rpvzgiOHePnLd//mgrDEOE6G0/cYK6ivMDGGOTE3F14MYFmqT2aNvXuwJWVtBQ==
X-Received: by 10.84.229.75 with SMTP id d11mr13832959pln.411.1505142666206;
	Mon, 11 Sep 2017 08:11:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	75sm4374067pfx.145.2017.09.11.08.11.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 08:11:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Sep 2017 08:10:53 -0700
Message-Id: <20170911151056.4577-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911151056.4577-1-raj.khem@gmail.com>
References: <20170911151056.4577-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 2/5] xfsdump: Upgrade to 3.1.7
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
X-List-Received-Date: Mon, 11 Sep 2017 15:11:06 -0000

Fix build on musl
Point to new SRC_URI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-c99-defined-int64_t-instead-of-__int64_t.patch | 28 ++++++++++++++++++++++
 .../xfsdump/{xfsdump_3.1.6.bb => xfsdump_3.1.7.bb} |  7 +++---
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-Use-c99-defined-int64_t-instead-of-__int64_t.patch
 rename meta-filesystems/recipes-utils/xfsdump/{xfsdump_3.1.6.bb => xfsdump_3.1.7.bb} (81%)

diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-Use-c99-defined-int64_t-instead-of-__int64_t.patch b/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-Use-c99-defined-int64_t-instead-of-__int64_t.patch
new file mode 100644
index 000000000..1fe1bde8b
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-Use-c99-defined-int64_t-instead-of-__int64_t.patch
@@ -0,0 +1,28 @@
+From f1e822d546e08cc195eaeb38ca172bd0c3800aa9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Sep 2017 07:48:48 -0700
+Subject: [PATCH] xfsdump: Use c99 defined int64_t instead of __int64_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ common/hsmapi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common/hsmapi.c b/common/hsmapi.c
+index 6054773..0709dbe 100644
+--- a/common/hsmapi.c
++++ b/common/hsmapi.c
+@@ -585,7 +585,7 @@ HsmModifyExtentMap(
+ 	struct getbmapx	*bmap)
+ {
+ 	dmf_f_ctxt_t	*dmf_f_ctxtp = (dmf_f_ctxt_t *)contextp;
+-	__int64_t	length;
++	int64_t		length;
+ 
+ 	if (bmap[0].bmv_entries <= 0) {
+ 		return 1;	/* caller must already be at EOF */
+-- 
+2.14.1
+
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.7.bb
similarity index 81%
rename from meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
rename to meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.7.bb
index d1033cff1..0ac991b23 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.7.bb
@@ -10,16 +10,17 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=15c832894d10ddd00dfcf57bee490ecc"
 DEPENDS = "xfsprogs attr"
 
-SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
            file://remove-install-as-user.patch \
            file://0001-Include-fcntl.h-for-O_EXCL.patch \
            file://0002-Replace-__uint32_t-with-uint32_t.patch \
            file://0003-replace-use-of-SIGCLD-with-SIGCHLD.patch \
            file://0004-include-limit.h-for-PATH_MAX.patch \
            file://0005-include-sys-types.h-for-u_int32_t-in-attr-attributes.patch \
+           file://0001-xfsdump-Use-c99-defined-int64_t-instead-of-__int64_t.patch \
            "
-SRC_URI[md5sum] = "50353cd4f4b435685955363e6044f4d1"
-SRC_URI[sha256sum] = "7f78c11ca527477d90e5e62b0778f3ad96f2b71c19173044e9aca9515fff42d0"
+SRC_URI[md5sum] = "c6e91f2ac8b76c796db2d236f5ca5947"
+SRC_URI[sha256sum] = "99e6d4df257ebc6d29ca9e970ca20672c2ea03481ad949bc68f98de3e4d56dce"
 
 inherit autotools-brokensep
 
-- 
2.14.1


