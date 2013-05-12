Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Ubfsx-0007hC-5f
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 May 2013 01:41:03 +0200
Received: by mail-ee0-f45.google.com with SMTP id l10so1506641eei.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 16:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=pFTiz6i9oWf3EfXK1KIG3j0jUKRrX58/++W7iX3zYpQ=;
	b=hjyLgMssIhfJpnM8ZVqY+KUrZBUSWcN8WCZZpQOoWBc3AkU2Y8HZW7WM4S3SZJBDhK
	4iSJovKx2eYMWUYwCqtazukWVNuHg2S0ueZHF7KkDQFj6ZNOOGJXIrABxRDpn8noR71l
	3KCIkUgRLa6QC5dTJah2UsiEuRmmfLHIN0y2F4hODktjTK0tol5Epy9TI2B7hUmhqIDw
	XXHGiswIDQqLwc35vBOLJ5HkrihSWTXatoNLVf0CmPtSarFX2BldWM1hAXg3paF7+iEK
	hg4FBXnW1S1dMUpot3q+WBc5LQhTdOsNh7e56bRc8eKOGkBZOEYE/52jESQBM76xcVe4
	F7CA==
X-Received: by 10.14.221.67 with SMTP id q43mr25490704eep.1.1368400970578;
	Sun, 12 May 2013 16:22:50 -0700 (PDT)
Received: from mizar.localdomain
	(host170-249-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.249.170]) by mx.google.com with ESMTPSA id
	w43sm19120109eeg.14.2013.05.12.16.22.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 16:22:50 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 May 2013 01:22:22 +0200
Message-Id: <4c3bc3dac2b40382d3320c13f77f076680e409de.1368400320.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1368400320.git.andrea.adami@gmail.com>
References: <cover.1368400320.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1368400320.git.andrea.adami@gmail.com>
References: <cover.1368400320.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 3/4] klibc: fix KLIBCARCH for x86-64, powerpc and powerpc64
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
X-List-Received-Date: Sun, 12 May 2013 23:41:07 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index a4937fa..4d5f6c4 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -16,10 +16,13 @@ KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
 KLIBC_ARCH_mipsel = 'mips'
 KLIBC_ARCH_x86 = 'i386'
+KLIBC_ARCH_x86-64 = 'x86_64'
 KLIBC_ARCH_i486 = 'i386'
 KLIBC_ARCH_i586 = 'i386'
 KLIBC_ARCH_i686 = 'i386'
 KLIBC_ARCH_pentium = 'i386'
+KLIBC_ARCH_powerpc = 'ppc'
+KLIBC_ARCH_powerpc64 = 'ppc64'
 
 export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
 
-- 
1.8.1.5



