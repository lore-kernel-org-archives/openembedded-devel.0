Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9aNJ-0002Pq-Ln
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:35:57 +0200
Received: by wibhn17 with SMTP id hn17so1115105wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 04:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=8NPO9YN682qBmwD/TL+LY4yUJ/08jlZLyvgQLwgLQO4=;
	b=btmbw+5oq/dXNzYivh6m52o/Tu02K/3+5Sct4GYzeC3/aPiAREu5phk1Ary3R302BV
	Ni76Ob/bYs1Uj3UYQkQXouO//81Z99EI9ZjbdmMmOoVbVZ6+RYdRm+QZnZONCNJVNRlz
	75F/cpkfBCY8I+01E59BjQL8cIxKjdRZaJq2eejoWW5g2ndm/LmFwmC8bDZ1njyQmee1
	aRqwnP8Z41S6qINPnKD9jJ93TeuI4XHiVrDQDDqNNIcHnsgNCYIYn+5LuCh9TneJXqlB
	wVUQqiXD7t9yZM2LLiOzIOwMVTTYR9l4LKYhKNQqKG/iwQWD6FeJmq1hlVzK9wtHLq5i
	0eqQ==
Received: by 10.180.77.34 with SMTP id p2mr45179264wiw.0.1346930613533;
	Thu, 06 Sep 2012 04:23:33 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id hv8sm3682950wib.0.2012.09.06.04.23.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 04:23:32 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2012 13:23:23 +0200
Message-Id: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQmLBHYwnnFZmIo02uuFjnWfTj3lNMOTMRrDZHFxQ0Ml3bu6HUuAggd6Y4ZnaXyQxRaZpsC+
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-denzil][PATCH 1/8] kernel: save $kerndir/tools and $kerndir/lib from pruning
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
X-List-Received-Date: Thu, 06 Sep 2012 11:35:57 -0000

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
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index ce82351..c44a2f5 100644
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
1.7.7.6



