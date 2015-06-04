Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 43C6B757ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:21:30 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so145655524igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y282riFanRUQYwzonk9nYL0xmif5pFOGPQdFr4Tx8w0=;
	b=V4K1+Pdzax8ixp6qC1+9hdAjYSQtpJFJP129nI4K3xZx63dej47KDZ5q/0HUn8x4g9
	8F9RQJQt+YzrbFv63EJRpPADVlHSbkikb0S9gCUoWs7BPuos+q161BZuNMllxwIR/9C9
	skMt9k2xrf2kAJ6+y4uZ9TNm1bfCIxr3wnHbK3QCu0CYgzY7cKcqR+fswwbLevNaYO8+
	wRZ5baE1MX9aVEK6NRJZwyienCBWcwMnGdTkxIzMCqlDpj+bT4zqbumS3+UGoMXReMGQ
	1xsCyrwEKxBFAcV0V9Wp4rKTbZx+/SZLAqzNVU8MRYFJiB/tE4veyezbQa2Lgv+x31Ru
	e0ZA==
X-Received: by 10.50.25.162 with SMTP id d2mr7367180igg.11.1433445691540;
	Thu, 04 Jun 2015 12:21:31 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	je10sm9950529igb.15.2015.06.04.12.21.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:21:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:21:02 -0700
Message-Id: <1433445666-7207-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
References: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 3/7] klibc.inc: use x86 over-ride instead of i486/i586/i686
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
X-List-Received-Date: Thu, 04 Jun 2015 19:21:33 -0000

32bit x86 is covered by the x86 over-ride, so duplicate over-rides for
i486/i586/i686 are not required.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 9f445e1..41b0b29 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -44,9 +44,6 @@ KLIBC_ARCH_armeb = "arm"
 KLIBC_ARCH_mipsel = "mips"
 KLIBC_ARCH_x86 = "i386"
 KLIBC_ARCH_x86-64 = "x86_64"
-KLIBC_ARCH_i486 = "i386"
-KLIBC_ARCH_i586 = "i386"
-KLIBC_ARCH_i686 = "i386"
 KLIBC_ARCH_pentium = "i386"
 KLIBC_ARCH_powerpc = "ppc"
 KLIBC_ARCH_powerpc64 = "ppc64"
-- 
1.9.1


