Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaO-0005ZO-CI
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:47 +0100
Received: (qmail 26924 invoked by uid 813007); 4 Mar 2009 15:53:50 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:50 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPi-0001Dj-Qo; Wed, 04 Mar 2009 16:53:42 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:37 +0100
Message-Id: <1236182004-4523-23-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openedhand.com>
Subject: [PATCH 22/70] yum-metadata-parser-native: depend on GLib 2.0 native (from Poky)
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

git-svn-id: https://svn.o-hand.com/repos/poky@5140 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 .../python/yum-metadata-parser-native_1.1.2.bb     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/packages/python/yum-metadata-parser-native_1.1.2.bb b/packages/python/yum-metadata-parser-native_1.1.2.bb
index 4e4ab9f..643d4b8 100644
--- a/packages/python/yum-metadata-parser-native_1.1.2.bb
+++ b/packages/python/yum-metadata-parser-native_1.1.2.bb
@@ -1,6 +1,6 @@
 require yum-metadata-parser_${PV}.bb
 inherit native
-DEPENDS = "python-native sqlite3-native"
+DEPENDS = "python-native sqlite3-native glib-2.0-native"
 RDEPENDS = ""
 
 #BUILD_CFLAGS += "-I${STAGING_LIBDIR}/glib-2.0"
-- 
1.6.1.3





