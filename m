Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id C2EFB601F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 20:57:42 +0000 (UTC)
Received: by pdjn11 with SMTP id n11so464511pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 13:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ajddk1lY+QBXjg4ZfGidgk2LDPOE6m9GAijgQwhZf8Y=;
	b=n131CYFQidlhWsKabiO5RAWn5xle+q+r2mEk3zbKuPegTSb6Vc1zOHnuldBVvbCFZt
	os44MPO8yWCBNxlKt/Xyn2Rld9wCMwJu+LeB+fsJumELcxSNDFB7W/9zfQXukQ6pRZNu
	ix/O3MTupn2SzEuvY48626Y+9Ral8juHFA14lDTOQmq/jGBOrWJefe7D+JtS9e2JnWHV
	6kPx+tl/3XQCkG4xFQH7nhvRSR5Bky2wTl2kOVaCdrcIfJOLkZMm37ao+r7EhtQLuA+/
	siW3HVhtLWBOY4BRhWWm1ieZqwIDOtWHbjdTVKVqGsg7h2cRYTHKifxA7NOPRPILlroJ
	18Vg==
X-Received: by 10.68.68.203 with SMTP id y11mr4313138pbt.34.1433451463375;
	Thu, 04 Jun 2015 13:57:43 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ku10sm4754171pab.3.2015.06.04.13.57.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 13:57:42 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:57:31 -0700
Message-Id: <1433451451-8465-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAMKF1srvUs9pVeS7T0zd8QpCAwCjTTR-uryJxRNmuPGNFh2sSQ@mail.gmail.com>
References: <CAMKF1srvUs9pVeS7T0zd8QpCAwCjTTR-uryJxRNmuPGNFh2sSQ@mail.gmail.com>
Subject: [meta-oe][PATCH v2 3/7] klibc.inc: use x86 over-ride instead of i486/i586/i686/pentium
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
X-List-Received-Date: Thu, 04 Jun 2015 20:57:52 -0000

32bit x86 is covered by the x86 over-ride, so duplicate over-rides for
i486/i586/i686/pentium are not required.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 9f445e1..a707ed5 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -44,10 +44,6 @@ KLIBC_ARCH_armeb = "arm"
 KLIBC_ARCH_mipsel = "mips"
 KLIBC_ARCH_x86 = "i386"
 KLIBC_ARCH_x86-64 = "x86_64"
-KLIBC_ARCH_i486 = "i386"
-KLIBC_ARCH_i586 = "i386"
-KLIBC_ARCH_i686 = "i386"
-KLIBC_ARCH_pentium = "i386"
 KLIBC_ARCH_powerpc = "ppc"
 KLIBC_ARCH_powerpc64 = "ppc64"
 THIS_LIBKLIBC = "libklibc (= ${PV})"
-- 
1.9.1


