Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaK-0005Z7-IT
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:45 +0100
Received: (qmail 26830 invoked by uid 813007); 4 Mar 2009 15:53:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:47 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPg-0001DV-AW; Wed, 04 Mar 2009 16:53:40 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:34 +0100
Message-Id: <1236182004-4523-20-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Ross Burton <ross@openedhand.com>
Subject: [PATCH 19/70] yum-native: add depends on libxml2-native (from Poky)
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

From: Ross Burton <ross@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5118 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/yum-native_3.2.18.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/packages/yum/yum-native_3.2.18.bb b/packages/yum/yum-native_3.2.18.bb
index 03e54d5..fcb5680 100644
--- a/packages/yum/yum-native_3.2.18.bb
+++ b/packages/yum/yum-native_3.2.18.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://linux.duke.edu/projects/yum/"
 SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
            file://hacks.patch;patch=1 \
            file://paths.patch;patch=1"
-PR = "r2"
+PR = "r3"
 
-DEPENDS = "rpm-native python-native python-iniparse-native python-urlgrabber-native yum-metadata-parser-native"
+DEPENDS = "rpm-native python-native python-iniparse-native python-urlgrabber-native yum-metadata-parser-native libxml2-native"
 
 S = "${WORKDIR}/yum-${PV}"
 
-- 
1.6.1.3





