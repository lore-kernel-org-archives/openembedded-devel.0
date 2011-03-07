Received: from kcmailp05.birch.net ([216.212.0.100] helo=mx01.birch.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dick@softplc.com>) id 1PwfDf-00036X-Kq
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 19:31:48 +0100
Received: (qmail 17367 invoked from network); 7 Mar 2011 18:23:34 -0000
Received: by simscan 1.0.8 ppid: 17362, pid: 17364, t: 0.0761s scanners:none
Received: from unknown (HELO [192.100.100.3]) ([65.16.135.194])
	(envelope-sender <dick@softplc.com>)
	by mx01.birch.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	7 Mar 2011 18:23:34 -0000
Message-ID: <4D7522A6.7020303@softplc.com>
Date: Mon, 07 Mar 2011 12:23:34 -0600
From: Dick Hollenbeck <dick@softplc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] gcc internal executables have debug information attached
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
X-List-Received-Date: Mon, 07 Mar 2011 18:31:48 -0000
X-Groupsio-MsgNum: 29967
Content-Type: multipart/mixed; boundary="------------000403060402070303060205"

--------------000403060402070303060205
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------000403060402070303060205
Content-Type: text/x-patch;
 name="0001-cc1-and-cc1plus-had-about-20-mbytes-of-debug-informa.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-cc1-and-cc1plus-had-about-20-mbytes-of-debug-informa.pa";
 filename*1="tch"

From 75515b7abc69c9161c7acef0d2630cb94eabb05f Mon Sep 17 00:00:00 2001
From: Dick Hollenbeck <dick@softplc.com>
Date: Mon, 7 Mar 2011 12:12:48 -0600
Subject: [PATCH] cc1 and cc1plus had about 20 mbytes of debug information each, in the
 final redistributable form.  This patch strips those two binaries
 yielding a savings of about 40 mbytes per SDK.

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


--------------000403060402070303060205--
