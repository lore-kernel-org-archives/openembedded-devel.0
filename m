Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1TsCyp-0004Vq-Jg
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 14:43:23 +0100
Received: by mail-wg0-f42.google.com with SMTP id dr1so2264964wgb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 05:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=3ViQagTr8R/fQ5t6eiMhGXjRH7pzACz7u3f286R/jEw=;
	b=YpAf8bV15E7lVfJdzNRGRv9hClhEb0aH8ZnTizPZlLC1nttenPJjAs6W/QsbK0n3bG
	76ebvH5VXVMLtxoVkXeqLtUM8xtueDyEYxPuQOypuqA/UPoBF+JAZQwitC04uK8cMHlB
	9OU+cAH6SToiZfhwNY3VWX0dIvvNLh46APRQKO4/La3TkqfIkx6/7kmWFFJQbeM2cAAP
	nBD25/v5SQcUFGiIqrCH8rwoLBon67CglV0XilbCEmU1xxng4S77hmuOHrqnVV4vJJUo
	HRH1UCfiUWZ/M64d8CAaYU9MWj8WRhTSJzU4d0SBgWgtzqhyfURD/F5euujNpweWUI4P
	RgFA==
X-Received: by 10.180.75.208 with SMTP id e16mr9404497wiw.3.1357565278357;
	Mon, 07 Jan 2013 05:27:58 -0800 (PST)
Received: from quad.modzo.koansoftware.com
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id fv2sm12183074wib.4.2013.01.07.05.27.56
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 07 Jan 2013 05:27:57 -0800 (PST)
From: koansoftware@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Jan 2013 14:30:17 +0100
Message-Id: <1357565417-21325-1-git-send-email-koansoftware@gmail.com>
X-Mailer: git-send-email 1.8.0.3
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [meta-oe][PATCH] kernel.bbclass: kernel_do_install fails with 2.6 kernel recipes
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
X-List-Received-Date: Mon, 07 Jan 2013 13:43:27 -0000

From: Marco Cavallini <m.cavallini@koansoftware.com>

 * old 2.6.x kernels don't have $kerneldir/tools directory
 * so we got this error:
 * sed: can't read ...SNIP...linux/2.6.30-r0/image/usr/src/kernel/tools/perf/Makefile: No such file or directory
 * ERROR: Function failed: do_install

Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 meta/classes/kernel.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index aee8a77..06b23e0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -204,8 +204,10 @@ kernel_do_install() {
 		rm -f $kerneldir/$entry
 	done
 
-	# Fix SLANG_INC for slang.h
-	sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
+	if [ -f $kerneldir/tools/perf/Makefile ]; then
+		# Fix SLANG_INC for slang.h
+		sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
+	fi
 }
 
 sysroot_stage_all_append() {
-- 
1.8.0.3



