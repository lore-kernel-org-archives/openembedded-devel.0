Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVbE-00020u-7q
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 17:53:05 +0100
Received: by wgbds11 with SMTP id ds11so12091124wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=r5+hTWUXyup3AVRuDHT+YE2ENaZo30gfzOEVgL4wstQ=;
	b=MsRd4aPgvfYaDZNONL+KLDPT3xRv0nlZFYiDDqSZMRND7UnZLaMb+XFKbUnW4CV643
	1r8skJC2H5GQU204U7G/JecXnfMPL4uA1OEbnFFCDXDeu14yPSj1Qmjg++gB75neP2cQ
	uahlQQ976KunGGd0Y7gkzDdD55Xpxa1yvo4oo=
Received: by 10.227.208.133 with SMTP id gc5mr17244374wbb.25.1323794768499;
	Tue, 13 Dec 2011 08:46:08 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id
	n9sm27277056wbo.16.2011.12.13.08.46.06 (version=SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 08:46:07 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:44:38 +0400
Message-Id: <1323794683-24233-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
References: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
Subject: [meta-opie 1/6] uicmoc: do also provide nativesdk variant
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
X-List-Received-Date: Tue, 13 Dec 2011 16:53:05 -0000

Opie SDK needs nativesdk version of uicmoc package. To achieve this, replace uicmoc-native
with uicmoc recipe, which can be built both as virtclass-native and virtclass-nativesdk.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../64bit-cleanup.patch                            |    0
 .../fix-makefile.patch                             |    0
 .../gcc3_4.patch                                   |    0
 .../gcc4.patch                                     |    0
 .../gcc4_1.patch                                   |    0
 .../kernel-asm-page.patch                          |    0
 .../{uicmoc-native_2.3.10.bb => uicmoc_2.3.10.bb}  |   11 ++++++++---
 7 files changed, 8 insertions(+), 3 deletions(-)
 rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/64bit-cleanup.patch (100%)
 rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/fix-makefile.patch (100%)
 rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/gcc3_4.patch (100%)
 rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/gcc4.patch (100%)
 rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/gcc4_1.patch (100%)
 rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/kernel-asm-page.patch (100%)
 rename recipes-qt/uicmoc/{uicmoc-native_2.3.10.bb => uicmoc_2.3.10.bb} (81%)

diff --git a/recipes-qt/uicmoc/uicmoc-native-2.3.10/64bit-cleanup.patch b/recipes-qt/uicmoc/uicmoc-2.3.10/64bit-cleanup.patch
similarity index 100%
rename from recipes-qt/uicmoc/uicmoc-native-2.3.10/64bit-cleanup.patch
rename to recipes-qt/uicmoc/uicmoc-2.3.10/64bit-cleanup.patch
diff --git a/recipes-qt/uicmoc/uicmoc-native-2.3.10/fix-makefile.patch b/recipes-qt/uicmoc/uicmoc-2.3.10/fix-makefile.patch
similarity index 100%
rename from recipes-qt/uicmoc/uicmoc-native-2.3.10/fix-makefile.patch
rename to recipes-qt/uicmoc/uicmoc-2.3.10/fix-makefile.patch
diff --git a/recipes-qt/uicmoc/uicmoc-native-2.3.10/gcc3_4.patch b/recipes-qt/uicmoc/uicmoc-2.3.10/gcc3_4.patch
similarity index 100%
rename from recipes-qt/uicmoc/uicmoc-native-2.3.10/gcc3_4.patch
rename to recipes-qt/uicmoc/uicmoc-2.3.10/gcc3_4.patch
diff --git a/recipes-qt/uicmoc/uicmoc-native-2.3.10/gcc4.patch b/recipes-qt/uicmoc/uicmoc-2.3.10/gcc4.patch
similarity index 100%
rename from recipes-qt/uicmoc/uicmoc-native-2.3.10/gcc4.patch
rename to recipes-qt/uicmoc/uicmoc-2.3.10/gcc4.patch
diff --git a/recipes-qt/uicmoc/uicmoc-native-2.3.10/gcc4_1.patch b/recipes-qt/uicmoc/uicmoc-2.3.10/gcc4_1.patch
similarity index 100%
rename from recipes-qt/uicmoc/uicmoc-native-2.3.10/gcc4_1.patch
rename to recipes-qt/uicmoc/uicmoc-2.3.10/gcc4_1.patch
diff --git a/recipes-qt/uicmoc/uicmoc-native-2.3.10/kernel-asm-page.patch b/recipes-qt/uicmoc/uicmoc-2.3.10/kernel-asm-page.patch
similarity index 100%
rename from recipes-qt/uicmoc/uicmoc-native-2.3.10/kernel-asm-page.patch
rename to recipes-qt/uicmoc/uicmoc-2.3.10/kernel-asm-page.patch
diff --git a/recipes-qt/uicmoc/uicmoc-native_2.3.10.bb b/recipes-qt/uicmoc/uicmoc_2.3.10.bb
similarity index 81%
rename from recipes-qt/uicmoc/uicmoc-native_2.3.10.bb
rename to recipes-qt/uicmoc/uicmoc_2.3.10.bb
index 57f61d4..e72a454 100644
--- a/recipes-qt/uicmoc/uicmoc-native_2.3.10.bb
+++ b/recipes-qt/uicmoc/uicmoc_2.3.10.bb
@@ -16,11 +16,16 @@ S = "${WORKDIR}/qt-${PV}"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=aea7d119b7f7d798464fa2b1aae005f8 \
                     file://README;beginline=1;endline=7;md5=d3e237af71522cc2a3c89dbaf48b345d"
 
-inherit native qmake_base
+inherit qmake_base
+BBCLASSEXTEND = "native nativesdk"
+UICMOCNATIVE = "uicmoc-native"
+UICMOCNATIVE_virtclass-native = ""
+DEPENDS_prepend = "${UICMOCNATIVE}"
 
 export QTDIR = "${S}"
-EXTRA_OEMAKE = 'SYSCONF_CXX="${CXX}" SYSCONF_LINK="${CXX}"'
-CXXFLAGS += " -DQWS"
+SYSUICMOC = 'SYSCONF_MOC="${STAGING_BINDIR_NATIVE}/moc2" SYSCONF_UIC="${STAGING_BINDIR_NATIVE}/uic2"'
+SYSUICMOC_virtclass-native = ""
+EXTRA_OEMAKE = 'SYSCONF_CC="${CC}" SYSCONF_CXX="${CXX}" SYSCONF_CFLAGS="${CFLAGS}" SYSCONF_CXXFLAGS="${CXXFLAGS} -DQWS" SYSCONF_LINK="${CXX}" ${SYSUICMOC}'
 
 QT_CONFIG_FLAGS = "-depths 8,16 -no-qvfb -no-g++-exceptions -no-jpeg -no-mng \
                    -qt-zlib -qt-libpng -no-xft -no-xkb -no-vnc -no-sm \
-- 
1.7.7.3



