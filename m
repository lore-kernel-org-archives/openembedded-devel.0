Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Ubfsp-0007gA-Pa
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 May 2013 01:40:52 +0200
Received: by mail-ee0-f52.google.com with SMTP id d41so3281327eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 16:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=N8QdivHedgxnA1X5bnsjDmCaW+7yglx2dgq6GEgJRW4=;
	b=NhFiZhofyuO2bBJRbMdiLZCKIbt/UJS6/y4pgkYmV6nenD57XmnhUWm55QIRzMj+rg
	XO+1NO1HT4un+x0zu7+hemirznMQ9Fh3ATwApOQYw7vA9dmFdtmHmE9VDNouRsxvoZwa
	1pl94cyx6AJst/rfVQ1a1FhDqpq95frlL8Sxs3cuK3pdDGQ3h5+wFo2HUrD0jbegr9XQ
	frGI1IIkwq2Foa+dEiPjFiWo1Aro16Jw2pEYbves6wyxssk1HaG7qz22KC7C9OUhC9/+
	ZvI6pPS+m+3HmuzYoJya+Ft2cci2czoxXsZZax0vnmIWnWjO24y5MVfJ6GLT/A2V0e/f
	j5yg==
X-Received: by 10.15.24.72 with SMTP id i48mr50829409eeu.37.1368400963167;
	Sun, 12 May 2013 16:22:43 -0700 (PDT)
Received: from mizar.localdomain
	(host170-249-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.249.170]) by mx.google.com with ESMTPSA id
	w43sm19120109eeg.14.2013.05.12.16.22.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 16:22:42 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 May 2013 01:22:20 +0200
Message-Id: <0f8fd45196d367089545e44660d85ce167799831.1368400320.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1368400320.git.andrea.adami@gmail.com>
References: <cover.1368400320.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1368400320.git.andrea.adami@gmail.com>
References: <cover.1368400320.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 1/4] initramfs-kexecboot(-klibc)-image: Drop legacy export of IMAGE_BASENAME
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
X-List-Received-Date: Sun, 12 May 2013 23:40:54 -0000

* We used to export this in the days an external script handled the image
* generation. This is no longer the case and hence we no longer need
* this export.
* As committed in oe-core with 919613c0e75362ee0eace99b51cc77d34a05372f

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb       | 2 --
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
index e706ea8..dbe5583 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -16,8 +16,6 @@ IMAGE_INSTALL = "kexec kexecboot mtd-utils-ubifs"
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
 
-export IMAGE_BASENAME = "initramfs-kexecboot-image"
-
 IMAGE_LINGUAS = ""
 IMAGE_LOGIN_MANAGER = ""
 IMAGE_INIT_MANAGER = ""
diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
index e4e52cf..37349e1 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -1,5 +1,3 @@
 require initramfs-kexecboot-image.bb
 
 IMAGE_INSTALL = "kexec-klibc kexecboot-klibc ubiattach-klibc"
-
-export IMAGE_BASENAME = "initramfs-kexecboot-klibc-image"
-- 
1.8.1.5



