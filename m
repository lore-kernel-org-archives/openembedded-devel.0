Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRTaH-0002IB-Uf
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 21:27:02 +0200
Received: by werb13 with SMTP id b13so1011992wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 12:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1z87lAM9RxJPdnXJKqVgRXMO0x36t1XGf2/rHSaivgY=;
	b=Xkx4VEsrxqXqfi/Obka8SLJ6VF/O3I+jWwFvRBgoLnImEPSoo9apToDQQVTwSqpgU2
	3ky43rXoz0w8C/oXdpqWtg+I6gNyZEHPlrl5ZqUf9glbt4igewEhN0rV0JJBUlPRPA19
	WZ43sKnQQz4BSXXRjQt5RJhHrye7hFZ3f6E438zCWdGqa1QcoN+mBgKvqQaJL6vT64GV
	bBBNpcBGBB1upyMsPXSdTdIKf79ko+rQk0/RqzroORKczAuZ6sfTEAcRGCprbccxd6DX
	HAzX1ppqhw5bDoyVJCfy15dzzMTSnENA0upA2nVZejrDTnslfJCY9ZGzASmk6QHzwfp4
	3cyA==
Received: by 10.180.78.105 with SMTP id a9mr7937619wix.20.1336418231344;
	Mon, 07 May 2012 12:17:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f19sm37029204wiw.11.2012.05.07.12.17.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 12:17:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 21:17:01 +0200
Message-Id: <675fd0d4926f10fb8409a05d802f3d6908bd559e.1336418115.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1336417488.git.Martin.Jansa@gmail.com>
References: <cover.1336417488.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1336418115.git.Martin.Jansa@gmail.com>
References: <cover.1336418115.git.Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][meta-efl][meta-gpe][PATCH 6/7] kernel.bbclass: move kernel-vmlinux up in PACKAGES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2012 19:27:02 -0000

From: Christopher Larson <kergoth@gmail.com>

If KERNEL_IMAGETYPE is vmlinux, the expectation is most likely that there will
be no kernel image package, but we still want a vmlinux package for debugging,
so move kernel-vmlinux in front of kernel-image in PACKAGES.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 98320fe..66398ef 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -252,7 +252,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
-PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-vmlinux kernel-misc"
+PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-misc"
 FILES = ""
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
-- 
1.7.8.6



