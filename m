Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr7DE-0004nv-LK
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 14:49:12 +0200
Received: by bkcik5 with SMTP id ik5so224907bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 05:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=y4GN4mmlel2g2RjC6hsGJeuEn+g0FtE4PNIIwR+Vi8A=;
	b=Tg3GC6FwbAgdh8gA+ggANkskg0jpccpXWQfQy8qrUPA+yUcsWDOhlOsCfQS3TqbUxo
	wHyOPCudAkrIUImJlyf09ZJjXVv7Zd3qR9JiF+bW9Pe4i6/ZDEAdV2I2+gdOSgvjucQq
	ypco/1L5StQpKtxaOzdcOSWzZmprME08LrgYGE8rXsyVnvNtRJhFuQW3oMLRcGCJuSx9
	OsEqbUprD+ypWq0EAmHEgSDejkTo1yPi5BODS1qyR73yTwXqHi6+HDiWyhcBTmJyi2vs
	3gccWDPEF6afMI+nRD29QkWT3FsZHesoCbS3nau3lXpJDOqjgKs/84tsj/aHosaroB4/
	tqIg==
Received: by 10.204.157.156 with SMTP id b28mr1132265bkx.27.1342528673403;
	Tue, 17 Jul 2012 05:37:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o4sm9880127bkv.15.2012.07.17.05.37.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 05:37:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 14:37:54 +0200
Message-Id: <1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120716175038.GL3729@jama.jama.net>
References: <20120716175038.GL3729@jama.jama.net>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 1/7] kernel: save $kerndir/tools and $kerndir/lib from pruning
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
X-List-Received-Date: Tue, 17 Jul 2012 12:49:12 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

The kernel source tree in the sysroot has all unecessary source
code removed. The existing use case is to support module building
out of the sysroot, but as more toolsa are moved into the kernel
tree itself there are new use cases for the kernel sysroot source.

To avoid putting dependencies on the kernel, and to be able to
individually build and package these tools out of the source tree,
we can save $kerndir/tools and $kernddir/lib from being removed.
This enables tools like perf to be built our of the kernel source
in the sysroot, without significantly increasing the amount of
source in the sysroot.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index b30ed36..a784f08 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -178,7 +178,7 @@ kernel_do_install() {
 	#
 	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
 	make -C $kerneldir _mrproper_scripts
-	find $kerneldir -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
+	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
 	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
 
 	# As of Linux kernel version 3.0.1, the clean target removes
-- 
1.7.8.6



