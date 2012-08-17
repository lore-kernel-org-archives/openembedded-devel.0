Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1T2VFQ-0002Pn-9D
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Aug 2012 00:42:32 +0200
Received: by weyr6 with SMTP id r6so2885398wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2012 15:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=PEnEi7J0vYpFUkjBHcs1uYt60RFFaCTMtGDwtxdxT8s=;
	b=tPUbEYDTE81ruLv73gpLtv2FPpnq9wS/Adb1eog7/EBqDuxUa2womo+YvaLma7g1FH
	zuEc2KnbIHzjcoVqiedqQ1nGeseDMbMCtQiaN6KeJI/kpWvIRdn2vm52HT4J0DVDxvhD
	iH1cZ31fjYyC/7mB2+XIv8OCyWIR9oGMSqbCghPKTDFVPmojveQEEJ4e4Qk51onnOS5+
	Tcp59RYwtZiZ12uZuMR/0+uAnkrh3J5BO7VnGG7nC2/KxGEHndcDMTOLIOpUXihNV9R9
	ChmBDkbKKiXbrrjxBM+xkpmmazsS9ErbsY1ELPBJV48wOYMTQniE9boOIFNLsfQHu5/I
	zL5g==
Received: by 10.180.106.97 with SMTP id gt1mr8381347wib.5.1345242633068;
	Fri, 17 Aug 2012 15:30:33 -0700 (PDT)
Received: from mizar.localdomain
	(host178-223-dynamic.7-79-r.retail.telecomitalia.it. [79.7.223.178])
	by mx.google.com with ESMTPS id w7sm12355943wiz.0.2012.08.17.15.30.31
	(version=SSLv3 cipher=OTHER); Fri, 17 Aug 2012 15:30:32 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2012 00:30:28 +0200
Message-Id: <1345242628-5064-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH] linux-yocto: use LZMA for Zaurus collie
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
X-List-Received-Date: Fri, 17 Aug 2012 22:42:32 -0000

* this way we save more than 500KiB, important when you have just 14MiB !

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto/collie/collie.cfg |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto/collie/collie.cfg b/recipes-kernel/linux/linux-yocto/collie/collie.cfg
index ad709c5..4cc5f56 100644
--- a/recipes-kernel/linux/linux-yocto/collie/collie.cfg
+++ b/recipes-kernel/linux/linux-yocto/collie/collie.cfg
@@ -43,8 +43,8 @@ CONFIG_LOCALVERSION=""
 CONFIG_HAVE_KERNEL_GZIP=y
 CONFIG_HAVE_KERNEL_LZMA=y
 CONFIG_HAVE_KERNEL_LZO=y
-CONFIG_KERNEL_GZIP=y
-# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_GZIP is not set
+CONFIG_KERNEL_LZMA=y
 # CONFIG_KERNEL_LZO is not set
 CONFIG_DEFAULT_HOSTNAME="(none)"
 CONFIG_SWAP=y
-- 
1.7.8.6



