Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA7B78082
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:58 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id s66so6946907pfs.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1Rwa+Aq3OuumzTpbsAJ4omRPUb61oZrJlzZvl/twI/g=;
	b=BiqZoBITquBqEpN7OjzDgHDaYeK/QPgsbnlXXsrtgrH/NrpRLGRz2M8LUrZ3qDTu/w
	82BWsu41Zklw6KghwzrME3mRC8p+zCiPBUMNm82WZHwmOHCG2O3mecKDY8FsUp89FhyU
	mzjqgTNIF9OcvHPt8ePKI7rpsLSWQlWuO1fPGO97EkyyAuWOONuvdCDMySU+029cgHEk
	pZYfuWp4yqx3RgT+1XrCjBwGI/HOUF5tPBxCuhMsd77BwDoqIVXb8D+AU0yE1AZFm3Ba
	RPjO4LIvgqkg1iKFk1EFT03gn8g4LWVCwnG3CcMgRnZNo688ks/jzrmEZjElATyLDuF+
	OBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1Rwa+Aq3OuumzTpbsAJ4omRPUb61oZrJlzZvl/twI/g=;
	b=Hxkx6OgXzdc2GI2UIRgp91muzWndmm9/sk9EL5AHLy9AyaoSWkEVhuvCAk/LM2pPM/
	binlAZW0GvOFE5Tl4nMk9tD0awhZq4uUFksnqjrC4lM7S4xc383W+ZULUS9EWiXi7dse
	4DFZgqaPW0dlkDpyxBF+1VLdnG7ZmtVnwyl6uGQSMfIqVoVlZkqrzR9Bjl+2WtxXcTg1
	qLIIOdpxN0oB0VbBDLN2UIlIhCGHiISDX6jBuG4GxJyIvar7lY0lKfK2Et8VqvQEifzs
	bNfkwPEQ87Dx+AYuH4HlSnaeYL26IyKv/s3nTYcKcKSJRhuJUPuVt4STA61kdjiznGtT
	nLTw==
X-Gm-Message-State: AKS2vOy0VIrky41gfyKLODG0xXIimJzSrDC95+e3UJSTgXdJJ2APzM3k
	v12sZ2wO1UHlUjGv
X-Received: by 10.84.140.107 with SMTP id 98mr9077003pls.97.1498615739155;
	Tue, 27 Jun 2017 19:08:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:19 -0700
Message-Id: <20170628020819.17047-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628020819.17047-1-raj.khem@gmail.com>
References: <20170628020819.17047-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 13/13] aufs-util: Upgrade to 3.18
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
X-List-Received-Date: Wed, 28 Jun 2017 02:08:58 -0000

Fix out of tree build, helps building with devtool

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 50d8b909a..1e8677574 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 DEPENDS = "aufs-util-native"
 DEPENDS_class-native = ""
 
-SRCREV = "b59a2167a135ceea37581ee33997de278cf8a30a"
-SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs3.14 \
+SRCREV = "bdfcc0dcfc6113146e928f85145dbd2cf9b0e080"
+SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs3.18 \
            file://aufs-util-don-t-strip-executables.patch \
            file://aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch \
            file://aufs_type.h \
@@ -34,7 +34,7 @@ do_configure_append () {
 
 do_configure_append_class-target () {
     for i in ver c2sh c2tmac; do
-        cp ${STAGING_BINDIR_NATIVE}/aufs-util-${PV}/$i ./
+        cp ${STAGING_BINDIR_NATIVE}/aufs-util-*/$i ${B}
     done
 }
 
-- 
2.13.2


