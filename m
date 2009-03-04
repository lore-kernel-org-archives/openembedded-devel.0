Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetUO-0005Oy-9X
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:59:23 +0100
Received: (qmail 28497 invoked by uid 813007); 4 Mar 2009 15:54:19 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:19 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQC-0001FV-AY; Wed, 04 Mar 2009 16:54:12 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:13 +0100
Message-Id: <1236182004-4523-59-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 58/70] python: Fix -native package staging functions (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:00:29 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5104 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/python/python-iniparse-native_0.2.3.bb    |    1 +
 packages/python/python-urlgrabber-native_3.1.0.bb  |    1 +
 .../python/yum-metadata-parser-native_1.1.2.bb     |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/packages/python/python-iniparse-native_0.2.3.bb b/packages/python/python-iniparse-native_0.2.3.bb
index ab799db..c2d633c 100644
--- a/packages/python/python-iniparse-native_0.2.3.bb
+++ b/packages/python/python-iniparse-native_0.2.3.bb
@@ -5,5 +5,6 @@ RDEPENDS = ""
 
 do_stage() {
 	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+	STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \    
         ${STAGING_BINDIR}/python setup.py install --prefix=${STAGING_BINDIR}/.. --install-data=${STAGING_DATADIR}
 }
diff --git a/packages/python/python-urlgrabber-native_3.1.0.bb b/packages/python/python-urlgrabber-native_3.1.0.bb
index 01aebee..5e43ca2 100644
--- a/packages/python/python-urlgrabber-native_3.1.0.bb
+++ b/packages/python/python-urlgrabber-native_3.1.0.bb
@@ -5,5 +5,6 @@ RDEPENDS = ""
 
 do_stage() {
 	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+	STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
         ${STAGING_BINDIR}/python setup.py install --prefix=${STAGING_BINDIR}/.. --install-data=${STAGING_DATADIR}
 }
diff --git a/packages/python/yum-metadata-parser-native_1.1.2.bb b/packages/python/yum-metadata-parser-native_1.1.2.bb
index a74488c..8a43ec4 100644
--- a/packages/python/yum-metadata-parser-native_1.1.2.bb
+++ b/packages/python/yum-metadata-parser-native_1.1.2.bb
@@ -7,5 +7,6 @@ RDEPENDS = ""
 
 do_stage() {
 	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+	STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
         ${STAGING_BINDIR}/python setup.py install --prefix=${STAGING_BINDIR}/.. --install-data=${STAGING_DATADIR}
 }
-- 
1.6.1.3





