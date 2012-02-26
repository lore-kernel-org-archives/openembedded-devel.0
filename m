Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S1mY6-0004OK-2e
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 23:26:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Feb 2012 14:18:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="70494814"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.61])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Feb 2012 14:18:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2012 22:18:00 +0000
Message-Id: <8f2fded12ded4b5301ede2cd5010780101909296.1330294151.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1330294151.git.paul.eggleton@linux.intel.com>
References: <cover.1330294151.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1330294151.git.paul.eggleton@linux.intel.com>
References: <cover.1330294151.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] qt4-tools-nativesdk: fix build of 4.7.4
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
X-List-Received-Date: Sun, 26 Feb 2012 22:26:34 -0000

Commit 4ccae37db1aa77a1d15098c3720ea6e2d383fbdc introduced a sed command
line to modify a file that only exists in 4.8.0, thus do_configure of
4.7.4 was failing; so make this conditional upon the file existing.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index 4b097cf..64cc1ae 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
@@ -59,9 +59,12 @@ do_configure() {
 
     cp ../g++.conf mkspecs/common
     cp ../linux.conf mkspecs/common
-    # don't use host g++ even during configure
-    sed -i -e "s#g++#${CXX}#" mkspecs/common/g++-base.conf
-    sed -i -e "s#gcc#${CC}#" mkspecs/common/g++-base.conf
+
+    if [ -f mkspecs/common/g++-base.conf ] ; then
+        # don't use host g++ even during configure (4.8.0+)
+        sed -i -e "s#g++#${CXX}#" mkspecs/common/g++-base.conf
+        sed -i -e "s#gcc#${CC}#" mkspecs/common/g++-base.conf
+    fi
 
     # first launch configure to get qmake compiled for the nativesdk
     (echo o; echo yes) | CC="${CC}" CXX="${CXX}" ./configure ${EXTRA_OECONF} || true
-- 
1.7.5.4



