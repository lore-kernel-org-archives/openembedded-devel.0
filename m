Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SsMIw-0003zu-7d
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 01:08:14 +0200
Received: by pbbrq2 with SMTP id rq2so6140805pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2012 15:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=znWlb5jpMwZVxfHWHh0KBo7HT5uDqyBbPIgaT/0j99s=;
	b=OVNXyLmnqMHRJvrhfA6Wa2VKUk15McY9sbgQB7SpYJ9NZFJYWgUPVF0J1fEyW/awqR
	DhP9TIEh8EFKcBaFD/XwWNZb3SM55FLpPeuxW4WWlj+OUWdjWUIqxnApipcljd1oR0Zb
	E0BewG3H2hRdLOtqBkvnRNy45UFzmfpWZcY3o91U2NsfRD8zhPzHVAeS1tAjCMmJIhBm
	3/3Kl6uIcbvqLIqHR9BfxDybtjglz4BmjDWBPCSiMiZ9X+Sf5qg989y6gvZno4CvxWJc
	9I3TrKbl640xDmA79gXB8mzQkNdY6llDRIuz0e+nq1YDRZw3OIp+FpzctNgTGb/Nd20A
	f8sQ==
Received: by 10.68.227.163 with SMTP id sb3mr17568814pbc.74.1342825009937;
	Fri, 20 Jul 2012 15:56:49 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id iw10sm4191416pbc.55.2012.07.20.15.56.48
	(version=SSLv3 cipher=OTHER); Fri, 20 Jul 2012 15:56:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jul 2012 15:56:48 -0700
Message-Id: <1342825008-24903-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-java][PATCH] openjdk-6-common.inc: Change jdk_arch for powerpc
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
X-List-Received-Date: Fri, 20 Jul 2012 23:08:14 -0000

ppc is used in openjdk/jre but original jdk_arch
is defined as powerpc which means we have errors
compiling and installing openjdk for ppc platforms

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/openjdk/openjdk-6-common.inc |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index 6e984f6..02a4cb7 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -109,6 +109,10 @@ def get_jdk_arch(d):
     jdk_arch = bb.data.getVar('TARGET_ARCH', d, 1)
     if jdk_arch == "x86_64":
         jdk_arch = "amd64"
+    elif jdk_arch == "powerpc":
+        jdk_arch = "ppc"
+    elif jdk_arch == "powerpc64":
+        jdk_arch = "ppc64"
     elif (jdk_arch == "i486" or jdk_arch == "i586" or jdk_arch == "i686"):
         jdk_arch = "i386"
 
@@ -323,7 +327,6 @@ do_install() {
 		rm ${D}${JDK_HOME}/bin/$bf
 		ln -s ${JDK_HOME}/jre/bin/$bf ${D}${JDK_HOME}/bin/$bf
 	done
-
         install -m644 ${WORKDIR}/jvm.cfg  ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
 }
 
-- 
1.7.9.5



