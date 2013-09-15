Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 22C576C7AB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 16:15:46 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so1538906eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KJxUfaCCeY4aM0afTqVaR9D5s8QduQkK2aNsqp1iOOk=;
	b=Yhvntyk+5E1apVcSaJJQpQjAjbbGopKKHpEo8YyQY/QPtzwqH4aPadgxhK4V267O2k
	f/7uOivtLJEbL4TEh16Bz4OCfUoGNkzZBkNN+u8aJrBE5cXYOVkL99eSn6yoG3Vf8rEH
	XOikUqhhR1cyon3Ve9DVKuawbaMRC+CiNnU94c+mCwwFuhn9U1An3h2h/dDuqDCYjNsL
	b9I4LhnFz8DhM+4ueCD7kQv3ujhzfLz73COhEvvlIZo1gU7Y+7Ezs4rlJj4nFEGhD/ZA
	15BplN7ALwhX1weqRcOOYmGlkGp8S3bMS+JNc6HoY9ZKD1m8nyG6hBOmc+2SGDr5CrHD
	JMmw==
X-Received: by 10.14.39.73 with SMTP id c49mr115225eeb.61.1379261748328;
	Sun, 15 Sep 2013 09:15:48 -0700 (PDT)
Received: from mizar.localdomain
	(host50-7-dynamic.20-79-r.retail.telecomitalia.it. [79.20.7.50])
	by mx.google.com with ESMTPSA id
	r48sm34004501eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 15 Sep 2013 09:15:47 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Sep 2013 18:15:16 +0200
Message-Id: <1379261716-7617-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1379261716-7617-1-git-send-email-andrea.adami@gmail.com>
References: <1379261716-7617-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 3/3] linux-yocto-tiny-kexecboot: move from 3.8 to 3.10
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
X-List-Received-Date: Sun, 15 Sep 2013 16:15:47 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...x-yocto-tiny-kexecboot_3.8.bb => linux-yocto-tiny-kexecboot_3.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-initramfs/recipes-kernel/linux/{linux-yocto-tiny-kexecboot_3.8.bb => linux-yocto-tiny-kexecboot_3.10.bb} (90%)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
similarity index 90%
rename from meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb
rename to meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
index 686cc3d..9f9808e 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
@@ -1,4 +1,4 @@
-require recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+require recipes-kernel/linux/linux-yocto-tiny_3.10.bb
 SUMMARY = "Yocto tiny kernel embedding a minimalistic kexecboot initramfs"
 
 PACKAGES = ""
-- 
1.8.1.5


