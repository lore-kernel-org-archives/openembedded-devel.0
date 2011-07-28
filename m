Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmMfo-0002FT-UL
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 11:14:32 +0200
Received: by wyg30 with SMTP id 30so1769828wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 02:10:17 -0700 (PDT)
Received: by 10.227.55.66 with SMTP id t2mr1060005wbg.109.1311844217766;
	Thu, 28 Jul 2011 02:10:17 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n21sm517015wed.19.2011.07.28.02.10.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 02:10:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jul 2011 11:10:12 +0200
Message-Id: <1311844212-23277-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [2011.03-maintenance] gcc-package-target: fix for gcc 4.3.x
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
X-List-Received-Date: Thu, 28 Jul 2011 09:14:33 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes/gcc/gcc-package-target.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gcc/gcc-package-target.inc b/recipes/gcc/gcc-package-target.inc
index 33567da..7d3f4ae 100644
--- a/recipes/gcc/gcc-package-target.inc
+++ b/recipes/gcc/gcc-package-target.inc
@@ -171,5 +171,5 @@ GROUP ( libgcc_s.so.1 libgcc.a )" > ${D}${libdir}/libgcc_s.so
 	rm -rf ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/bits/*.gch
 	# move the gdb python helpers to gdb auto-load directory
 	install -d ${D}${datadir}/gdb/auto-load/${libdir}
-	mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${datadir}/gdb/auto-load${libdir}
+	mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${datadir}/gdb/auto-load${libdir} || true
 }
-- 
1.6.6.1



