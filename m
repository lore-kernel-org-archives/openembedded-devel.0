Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id BC21C60304
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 20:35:05 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ey16so2741672wid.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 13:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=twRnAlE1G8zNKUi/M6bmmD2lLIgeo5M/cyLwR4MzmGo=;
	b=eb5ICJaSRY7hLHZxlaMrgyg/WWppA/qdrwoSsumDW06XKD6/yTnd6baWjjiO4sd0vT
	92SgATISpi8zsUhoN51nvNKAgwSyfLWKm+ij130PPXiVyuXWZ33GMktZCi43z7YmlmrP
	KAhVr4rNVth+aHzyNJpfUAduRMyi6h1ujReXMmdmFY6Hr+uActHn91DXCjREIXlW03Gz
	CXtLNoWZa0dPsOOC9k4Td7BSDHmI0gxd+PDF0gyBQI3XorF7ovc1bsRULcGiD7AO+GtY
	bloO8vmH2z5pT32abx+m7bQRGDd99ACNFqu32ESOnimnPDch9uBRogwDuJG2iXV0947m
	IT9Q==
X-Received: by 10.194.9.70 with SMTP id x6mr8820300wja.19.1371501306427;
	Mon, 17 Jun 2013 13:35:06 -0700 (PDT)
Received: from mizar.localdomain
	(host253-191-dynamic.56-82-r.retail.telecomitalia.it.
	[82.56.191.253]) by mx.google.com with ESMTPSA id
	dz8sm24600208wib.11.2013.06.17.13.35.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 13:35:05 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 22:34:50 +0200
Message-Id: <de297f30c621c66590b55ecd9422a5df3c6b7f25.1371499248.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 7/9] klibc(-static)-utils: add SUMMARY
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jun 2013 20:35:06 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb | 1 +
 meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb
index ffad585..a3f9ec3 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb
@@ -14,3 +14,4 @@ FILES_${PN} = ""
 
 require klibc-utils.inc
 require klibc.inc
+SUMMARY = "klibc utils for initramfs statically compiled"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb
index 96fd19e..c77e041 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb
@@ -14,3 +14,4 @@ FILES_${PN} = ""
 
 require klibc-utils.inc
 require klibc.inc
+SUMMARY = "klibc utils for initramfs"
-- 
1.8.1.5


