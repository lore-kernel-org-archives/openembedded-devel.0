Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id A02956A441
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 23:16:39 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so1879401eaj.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 16:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zhXPB9DqWX27YqPlLUbhCsbRUt2eIgkr9jjtoJT4am4=;
	b=XlYwZXyxD8a5rcOy8KiSEo6j22eZgI8rIIl2fXQ+pBQqdhS6qf5PMumA27THaivhg/
	acWzvQwpzaiqYbM8FEdkaRTMZ8ZdPLLsSBZIiXY/o9H5yaa5jC4vtEGC877ZUjQljsUI
	uOn2QGSZL5g/ljd7IG0/3kPX/xiySM6QGnGyGQV7Sd1ROqMC7UaLGOCWKU91BolQ1qov
	ZtBB87Sc+hiJjjnyGoLUKIWtgGD5eWM0r9ae11XMLH1XgLf7BEbDbsQBazqA2Ob2DBiW
	uIRYOJSUFfzOR95NbGGdAGWKnNd9YWbCHoF1AK/NUBYPdIWZl0t3wHzRvDhBn0DqtZlz
	s2Mg==
X-Received: by 10.14.177.199 with SMTP id d47mr23112990eem.14.1380410201101;
	Sat, 28 Sep 2013 16:16:41 -0700 (PDT)
Received: from mizar.localdomain
	(host172-229-dynamic.20-79-r.retail.telecomitalia.it.
	[79.20.229.172]) by mx.google.com with ESMTPSA id
	r48sm32759342eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 28 Sep 2013 16:16:40 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2013 01:16:33 +0200
Message-Id: <1380410193-10260-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] kexecboot-klibc: remove stale bbappend
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
X-List-Received-Date: Sat, 28 Sep 2013 23:16:40 -0000

The recipe is now using BBCLASSEXTEND = "klibc"

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend

diff --git a/recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend b/recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend
deleted file mode 100644
index 61ba802..0000000
--- a/recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-require kexecboot-handhelds.inc
-- 
1.8.1.5


