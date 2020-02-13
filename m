Return-Path: <scott.branden@broadcom.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8695360BB6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 19:35:47 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q8so3564804pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 11:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=zXIGmLivW9tD6gmLRd9iaqUH20zXeOA3B1TOXqrH4BM=;
	b=RLcf8ccjV1GF+vTHPXDRoBlCQj7GNJS26SX6QTtp/Kk6LJYGedNnPGEmeizZs/id+b
	iSjhiJzVxHFKIIdRkgAR/jpt575COTHBcu+6eqNLO41i0DYgnzQgJpZD4wCJexY8yxb8
	+jJNq4dJsQpFd6NbTWmu7Ea/NNTCUgcnRFk8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zXIGmLivW9tD6gmLRd9iaqUH20zXeOA3B1TOXqrH4BM=;
	b=t/62Pr19cLWlw3xJEA5ElRRz7FtjutCP2+T2bbdResfcCHstxgfDmUkehsbXvKP4pE
	9LtgGXLeyzIqXSq9sJLs2oH3G0GXuob9cxHvi+euQpckp/KNaDzfzg/8P+J11PnGuMUd
	J/foqsuEWBjF1urxCmN0+LaDonv1W1nmUMP0ptmENLyYPwXW3lMb9mzsSbih9Z3N+cPY
	dWmkgJsfJ/NbPDr0SFsPG4Vd8gmBKWpYQy2yvg5q4vqYw/0c96yWEMFCBJyau2vKn9hx
	DvkIdGMlHKIVoTxg2FhEkSQxxDBsDhZSs8GJQ2Lew5wNZvGUgQupRzNZhUjUs4Loae+e
	lRgA==
X-Gm-Message-State: APjAAAXB/hCSa7b2eNToJ8RiatZRdgQ+UF7T9BR4poHnDWWqGJcxfPjk
	nhvyeaToq0IZYksLzvv5hpURwC130KCULM5D/nN8zperW0vkRoSUYz2pgxRDfmqdgxSd21ZQyOT
	xSmPCQOhIF4OCA+VABvJeoS4SnVa09iBFt6UhifEq5NNuYg3Y6Ppm5QkbxCGkEhUDXcMKm1CKTD
	0sSZQN9GEie5GFBDMu2Y9nIMHNlj+I
X-Google-Smtp-Source: APXvYqyo/liKFmoufTXpewg9EafFSmLaS2+BUMlLsLrvA1eyPAnqtFTaxbRSkIEdEqtvyMW9DQ+lpA==
X-Received: by 2002:a63:2309:: with SMTP id j9mr19629011pgj.54.1581622548335; 
	Thu, 13 Feb 2020 11:35:48 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	x132sm4091434pfc.148.2020.02.13.11.35.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 11:35:47 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Feb 2020 11:35:36 -0800
Message-Id: <20200213193536.23301-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] x265: add x265 recipe
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
X-List-Received-Date: Thu, 13 Feb 2020 19:35:47 -0000

Add x265 recipe for latest tag of Release_3.2 branch (3.2.1).

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 .../recipes-multimedia/x265/x265_3.2.1.bb     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb

diff --git a/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
new file mode 100644
index 0000000000..68c1a55c8c
--- /dev/null
+++ b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "H.265/HEVC video encoder"
+DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
+HOMEPAGE = "http://www.videolan.org/developers/x265.html"
+
+LICENSE = "GPLv2"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
+
+DEPENDS = "nasm-native gnutls zlib libpcre"
+
+SRC_URI = "http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz"
+
+S = "${WORKDIR}/x265_${PV}/source"
+
+SRC_URI[md5sum] = "94808045a34d88a857e5eaf3f68f4bca"
+SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc"
+
+inherit lib_package pkgconfig cmake
+
+AS[unexport] = "1"
+
+COMPATIBLE_MACHINE = "^$"
+COMPATIBLE_MACHINE_x86 = ".*"
+COMPATIBLE_MACHINE_x86-64 = ".*"
-- 
2.17.1


