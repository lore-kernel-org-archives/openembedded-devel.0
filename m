Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0DB6F368
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 16:31:14 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id uo5so8369959pbc.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 08:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7vN5ActLZxIzqLuWpU1hqE9iiaGHwYFlVLw8/lENhhI=;
	b=OXjp7nsf3f9e957iCqiFGN54UCFTgkiQPCNUyj2pbVlSfES0shTgO6+skSQJZCfCy6
	K9tOhbWQlDi0Vakv89TRA95Pm8F90K/ejl/Loj0SjfOxQ1w3tWPbsKsUgLZh1sFW2Zms
	aRV/o6l6EKFj7LItMFJB//gJUvRYRKAMKdsr7eya3oGOc47dUTAryKkx0ZzWM/OUEAe+
	zugccTiX2xCJLnQ29sYoQkgMHlKVQg44XWvCOhBBLiN+zz+RPgqTrSHyAI2uGAG+zA6o
	0gCrAhqrpCdqo7uZEfYDmapH/9eo2TtllCQte6GCbH8d0SAdxOaQ/YKS1sL8NkIhElE7
	luag==
X-Received: by 10.68.143.34 with SMTP id sb2mr563480pbb.135.1393345876103;
	Tue, 25 Feb 2014 08:31:16 -0800 (PST)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	eb5sm146677117pad.22.2014.02.25.08.31.14 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 08:31:15 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2014 08:32:53 -0800
Message-Id: <1393345975-20556-2-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1393345975-20556-1-git-send-email-ticotimo@gmail.com>
References: <1393345975-20556-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-multimedia][PATCH 1/3] libdvdcss: update to 1.2.13
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
X-List-Received-Date: Tue, 25 Feb 2014 16:31:16 -0000

From: Tim Orling <TicoTimo@gmail.com>

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb

diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
new file mode 100644
index 0000000..42a704e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "libdvdcss is a simple library designed for accessing DVDs like a block device without having to bother about the decryption."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+PR = "r2"
+
+SRC_URI = "http://download.videolan.org/pub/libdvdcss/${PV}/libdvdcss-${PV}.tar.bz2"
+
+inherit autotools
+
+EXTRA_OECONF = " --disable-doc "
+
+SRC_URI[md5sum] = "53cfc52a60a156763c425572e5179273"
+SRC_URI[sha256sum] = "84f1bba6cfef1df87f774fceaefc8e73c4cda32e8f6700b224ad0acb5511ba2c"
-- 
1.8.3.2


