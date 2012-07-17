Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr7Dk-00055T-46
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 14:49:44 +0200
Received: by wgbds1 with SMTP id ds1so3007992wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 05:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=HziqfmVwMc9dP6y1/nNh34zMiVSOIapKrXULRn1dlUM=;
	b=iVA2AC3jNNSsu+rokslt9WBkwrTmYXLQ2JNoFJdLyjL985vY44V/EdwQAgeEWeo0Uf
	/EljIvTGXwnfOQSnR+n/yEMvgwwyEJ4r/JBMSw3UjvrW2+AVIeFTieVq4R432v5Tsmtv
	iHlrEcNxiGmlDX/aP7x9wfDaWckrc+12OgLcQrcA3hPzfVU+g8rBVAGHrcsVOyuG0uml
	QHIWbWVwjjtkkeBCWp7cq8jK82rw9t6sxL0hJoImMaB9zVKiovatfb2iEsz2kJowjG+B
	HIuv6hyQhBo7AiQY67l223LwvXtmd3cS6rz8xkrjeYUxy/niZIPkLyUhuVuzdfaXqzNh
	i52Q==
Received: by 10.180.84.104 with SMTP id x8mr3944468wiy.20.1342528704801;
	Tue, 17 Jul 2012 05:38:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm26846698wiz.1.2012.07.17.05.38.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 05:38:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 14:37:58 +0200
Message-Id: <1342528680-6336-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120716175038.GL3729@jama.jama.net>
	<1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 5/7] kernel.bbclass: Dont package kxgettext.o
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
X-List-Received-Date: Tue, 17 Jul 2012 12:49:44 -0000

From: Khem Raj <raj.khem@gmail.com>

kxgettext.o is generated when building ppc kernels
so we end up with packaging errors like

> ERROR: QA Issue: Architecture did not match (20 to 62) on
> /work/virtex5-poky-linux/linux-xilinx-2.6.38-r00/packages-split/kernel-dev/usr/src/kernel/scripts/kconfig/kxgettext.o

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index de43550..433dd30 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -196,7 +196,7 @@ kernel_do_install() {
 	# during do_package for cross-compiled platforms
 	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
 	           arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
-		   scripts/kconfig/conf.o"
+		   scripts/kconfig/conf.o scripts/kconfig/kxgettext.o"
 	for entry in $bin_files; do
 		rm -f $kerneldir/$entry
 	done
-- 
1.7.8.6



