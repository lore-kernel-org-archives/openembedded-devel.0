Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id C25386A8C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 20:35:04 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hj3so2579352wib.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 13:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NeQ9zE8iJ+urUK9/0QhUuSERRh8XDkkd5ZcMHP7eT7c=;
	b=lGbhXewHL6wgSkdCs3qRnzigdqBpeKIv9fuYlp4AhF2jPZKOJkiYHELI8m0X3wnDjJ
	e8k7buCil38+T7+qnbrOzssqJIbeWsr7EKmEpBn/OnGGzQ/20qau90+9vhu2FNeQsoc0
	SjvDDWj5rjUIW+y8m4Ql7KXzWbCTCJzqe1S3VgZAqSHePxTWZsneI73NNl5y3Dx65fCO
	yOi56c+6u0B6Z+dmjpS1p4hBYXTVK2PB57YzvA9kyPshlcK3qx/xn1cMx2I9HWbg57a+
	AqN6P5seWjNaOyOJNtxIZZ659IpvKhe4uKxYhStwDmJQk5FqUkGId0Nb5W70JAIjUptb
	R9Dg==
X-Received: by 10.180.11.176 with SMTP id r16mr5753922wib.58.1371501305354;
	Mon, 17 Jun 2013 13:35:05 -0700 (PDT)
Received: from mizar.localdomain
	(host253-191-dynamic.56-82-r.retail.telecomitalia.it.
	[82.56.191.253]) by mx.google.com with ESMTPSA id
	dz8sm24600208wib.11.2013.06.17.13.35.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 13:35:04 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 22:34:49 +0200
Message-Id: <a5d41692ceab0b0de03360c9e36d8417666708e9.1371499248.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 6/9] linux-yocto-tiny-kexecboot: add custom SUMMARY
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
X-List-Received-Date: Mon, 17 Jun 2013 20:35:05 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb
index c4f7f20..78858a3 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb
@@ -1,4 +1,5 @@
 require recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+SUMMARY = "Yocto tiny kernel embedding a minimalistic kexecboot initramfs"
 
 PACKAGES = ""
 PROVIDES = ""
-- 
1.8.1.5


