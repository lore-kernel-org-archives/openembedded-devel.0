Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaI-0005Yu-Vm
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:45 +0100
Received: (qmail 26727 invoked by uid 813007); 4 Mar 2009 15:53:45 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:45 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPd-0001DM-RO; Wed, 04 Mar 2009 16:53:37 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:31 +0100
Message-Id: <1236182004-4523-17-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openedhand.com>
Subject: [PATCH 16/70] createrepo-native: added dependency on Python (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:01 -0000

From: Marcin Juszkiewicz <hrw@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5142 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/createrepo-native_0.9.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/packages/yum/createrepo-native_0.9.bb b/packages/yum/createrepo-native_0.9.bb
index 22b5033..80bf95d 100644
--- a/packages/yum/createrepo-native_0.9.bb
+++ b/packages/yum/createrepo-native_0.9.bb
@@ -1,3 +1,5 @@
+DEPENDS = "python-native"
+
 SRC_URI = "http://linux.duke.edu/projects/metadata/generate/createrepo-${PV}.tar.gz \
            file://fix.patch;patch=1 \
            file://pathfix.patch;patch=1 "
-- 
1.6.1.3





