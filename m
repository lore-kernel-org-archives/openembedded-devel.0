Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id E0F026EE5C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 05:38:15 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id x10so470383pdj.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 21:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V53qoicCvIlyXwrX+FqwIGb4JOmPtm7Gqs/c6T7/eg8=;
	b=ZR4/oNtYUpA2sE5F2oFVebOuP8mL0YxwRbiaMI/3yiwgrm5SM+ftoro46vGnm18Gyc
	5nNiKKl6zI0Cv5vpIuADfGYho2B2sTl3DfJIxnZ81fM+ZEpIP+MKjxq4AiAw7o/nWj7D
	H00P2scsUhb9ps0CXKWNcNKItzpeVbXb+N99lEjInohxLj0GOmT9qnosYeuDzulHn9gM
	OEZ8wCsYDz2TAxfuiHmqQ8tL5T6cYM6OxGY4EW/x14wblpKAMYqW/zTiuCsUvj7rZNH5
	7Hgh1CDGuxO4obCxqhAuD+sptoy5WQMqxtqRk5QV5/meEJDxexjvArYSEUC3u0DpFHyy
	tbWQ==
X-Received: by 10.67.22.100 with SMTP id hr4mr6309113pad.112.1393393096660;
	Tue, 25 Feb 2014 21:38:16 -0800 (PST)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	vx10sm158944384pac.17.2014.02.25.21.38.14 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 21:38:15 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2014 21:39:55 -0800
Message-Id: <1393393197-23806-2-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1393393197-23806-1-git-send-email-ticotimo@gmail.com>
References: <1393393197-23806-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-multimedia][PATCH v2 1/3] libdvdcss: update to 1.2.13
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
X-List-Received-Date: Wed, 26 Feb 2014 05:38:16 -0000

From: Tim Orling <TicoTimo@gmail.com>

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../vlc/{libdvdcss_1.2.10.bb => libdvdcss_1.2.13.bb}                 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/vlc/{libdvdcss_1.2.10.bb => libdvdcss_1.2.13.bb} (71%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.10.bb b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
similarity index 71%
rename from meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.10.bb
rename to meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
index 1a0b7b8..1a316d3 100644
--- a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.10.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "libdvdcss is a simple library designed for accessing DVDs like a block device without having to bother about the decryption."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r1"
 
 SRC_URI = "http://download.videolan.org/pub/libdvdcss/${PV}/libdvdcss-${PV}.tar.bz2"
 
@@ -9,5 +8,5 @@ inherit autotools
 
 EXTRA_OECONF = " --disable-doc "
 
-SRC_URI[md5sum] = "ebd5370b79ac5a83e5c61b24a214cf74"
-SRC_URI[sha256sum] = "2394a75013ab66b592d8c91d53529ede392bc9faee37fe279bd29b455eff2220"
+SRC_URI[md5sum] = "53cfc52a60a156763c425572e5179273"
+SRC_URI[sha256sum] = "84f1bba6cfef1df87f774fceaefc8e73c4cda32e8f6700b224ad0acb5511ba2c"
-- 
1.8.3.2


