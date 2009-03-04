Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaQ-0005ZR-CI
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:48 +0100
Received: (qmail 27036 invoked by uid 813007); 4 Mar 2009 15:53:52 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:52 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPl-0001Ds-9X; Wed, 04 Mar 2009 16:53:45 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:40 +0100
Message-Id: <1236182004-4523-26-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openedhand.com>
Subject: [PATCH 25/70] yum-metadata-parser: fixed dependencies (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:01 -0000

From: Marcin Juszkiewicz <hrw@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5385 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 .../python/yum-metadata-parser-native_1.1.2.bb     |    2 +-
 packages/python/yum-metadata-parser_1.1.2.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/packages/python/yum-metadata-parser-native_1.1.2.bb b/packages/python/yum-metadata-parser-native_1.1.2.bb
index 643d4b8..a74488c 100644
--- a/packages/python/yum-metadata-parser-native_1.1.2.bb
+++ b/packages/python/yum-metadata-parser-native_1.1.2.bb
@@ -1,6 +1,6 @@
 require yum-metadata-parser_${PV}.bb
 inherit native
-DEPENDS = "python-native sqlite3-native glib-2.0-native"
+DEPENDS = "python-native sqlite3-native glib-2.0-native libxml2-native"
 RDEPENDS = ""
 
 #BUILD_CFLAGS += "-I${STAGING_LIBDIR}/glib-2.0"
diff --git a/packages/python/yum-metadata-parser_1.1.2.bb b/packages/python/yum-metadata-parser_1.1.2.bb
index 0f9ed80..24de761 100644
--- a/packages/python/yum-metadata-parser_1.1.2.bb
+++ b/packages/python/yum-metadata-parser_1.1.2.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "C-based metadata parser to quickly parse xml metadata into sqlite
 HOMEPAGE = "http://linux.duke.edu/projects/yum/download.ptml"
 SECTION = "devel/python"
 PRIORITY = "optional"
+DEPENDS = "python sqlite3 glib-2.0 libxml2"
 LICENSE = "GPL"
-PR = "r0"
 
 SRC_URI = "http://linux.duke.edu/projects/yum/download/yum-metadata-parser/yum-metadata-parser-${PV}.tar.gz"
 S = "${WORKDIR}/yum-metadata-parser-${PV}"
-- 
1.6.1.3





