Received: from mail-gw0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dick@softplc.com>) id 1PwfGv-0003A9-3m
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 19:35:09 +0100
Received: by gwaa20 with SMTP id a20so2660825gwa.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2011 10:33:35 -0800 (PST)
Received: by 10.236.19.72 with SMTP id m48mr4022963yhm.9.1299522815152;
	Mon, 07 Mar 2011 10:33:35 -0800 (PST)
Received: from localhost.localdomain (host65-16-135-194.birch.net
	[65.16.135.194])
	by mx.google.com with ESMTPS id 66sm1934327yhl.46.2011.03.07.10.33.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Mar 2011 10:33:34 -0800 (PST)
From: Dick Hollenbeck <dick@softplc.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Mar 2011 12:33:31 -0600
Message-Id: <1299522811-2065-1-git-send-email-dick@softplc.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Dick Hollenbeck <dick@softplc.com>
Subject: [PATCH] cc1 and cc1plus had about 20 mbytes of debug information each, in the final redistributable form. This patch strips those two binaries yielding a savings of about 40 mbytes per SDK.
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
X-List-Received-Date: Mon, 07 Mar 2011 18:35:09 -0000

Signed-off-by: Dick Hollenbeck <dick@softplc.com>
---
 recipes/gcc/gcc-package-sdk.inc    |    5 +++++
 recipes/gcc/gcc-package-target.inc |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/recipes/gcc/gcc-package-sdk.inc b/recipes/gcc/gcc-package-sdk.inc
index 1b6529f..54452fa 100644
--- a/recipes/gcc/gcc-package-sdk.inc
+++ b/recipes/gcc/gcc-package-sdk.inc
@@ -65,4 +65,9 @@ do_install () {
 			fi
 		done
 	fi
+
+    # Manually strip unneeded debug info from files that were not being stripped
+    ${BUILD_STRIP} ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1${EXEEXT}
+    ${BUILD_STRIP} ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus${EXEEXT}
+    ${BUILD_STRIP} ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2${EXEEXT}
 }
diff --git a/recipes/gcc/gcc-package-target.inc b/recipes/gcc/gcc-package-target.inc
index 438c314..2a415be 100644
--- a/recipes/gcc/gcc-package-target.inc
+++ b/recipes/gcc/gcc-package-target.inc
@@ -168,4 +168,9 @@ GROUP ( libgcc_s.so.1 libgcc.a )" > ${D}${libdir}/libgcc_s.so
 
 	# Remove precompiled c++ headers as they are really big
 	rm -rf ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/bits/*.gch
+
+    # Manually strip unneeded debug info from files that were not being stripped
+    ${STRIP} ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1
+    ${STRIP} ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus
+    ${STRIP} ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2
 }
-- 
1.7.0.4



