Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4CAC5608A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 20:35:02 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id f11so2789597wgh.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 13:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Wksn4YO7cLuomW8eIXtgTEDF0m3+2TKjrSIvEAXXlIg=;
	b=EjLcpzscIAZL26lliqc+424E7RlN2b2ayLfatj/RBeekkdtXv8cTsV7QBivKwM/jfQ
	4zh6Oy0klfvEOEshXpNi56Y19/XT0nUoOlyCUk1KWKtwtdaCexJQSOevQxdMGmF/Lv5O
	Fygl++yo1mbwmD2UnQj4xfmFBWcF6brRvjUJ1IARTH6DOir9qVyN02cdRoEZxURRknLv
	48i+tB+L5T0beUPfXb5yrFfFnO+T3C0QibSAj7A8DJqwkDNgK15YQuwLFIFjRTr7BSmH
	uIFzl2ZSnKoxdCQAtDGefMSCpct2eY0G6mqBqZkC5JfBBZRlmX3vOWo+/ISzc4RsM1Dp
	1fiw==
X-Received: by 10.194.235.161 with SMTP id un1mr9008044wjc.6.1371501302864;
	Mon, 17 Jun 2013 13:35:02 -0700 (PDT)
Received: from mizar.localdomain
	(host253-191-dynamic.56-82-r.retail.telecomitalia.it.
	[82.56.191.253]) by mx.google.com with ESMTPSA id
	dz8sm24600208wib.11.2013.06.17.13.35.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 13:35:02 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 22:34:47 +0200
Message-Id: <5593f9d23c6364b5c16125ec3de77eeea896c01b.1371499248.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 4/9] ubi-utils-klibc: add SUMMARY and DESCRIPTION
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
X-List-Received-Date: Mon, 17 Jun 2013 20:35:02 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
index e00fc30..3039eb7 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
@@ -1,4 +1,5 @@
-DESCRIPTION = "Tools for managing memory technology devices."
+SUMMARY = "UBI utils statically compiled against klibc"
+DESCRIPTION = "Small sized tools from mtd-utils for use with initramfs."
 SECTION = "base"
 DEPENDS = "zlib lzo e2fsprogs util-linux"
 HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-- 
1.8.1.5


