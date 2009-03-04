Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaS-0005ZV-Cc
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:58 +0100
Received: (qmail 27136 invoked by uid 813007); 4 Mar 2009 15:53:54 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:54 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPm-0001Dy-U5; Wed, 04 Mar 2009 16:53:46 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:42 +0100
Message-Id: <1236182004-4523-28-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 27/70] yum: Don't apply hacks.patch, its only needed for the native version (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:02 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5395 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/yum_3.2.18.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/packages/yum/yum_3.2.18.bb b/packages/yum/yum_3.2.18.bb
index 7d34097..9770a4e 100644
--- a/packages/yum/yum_3.2.18.bb
+++ b/packages/yum/yum_3.2.18.bb
@@ -1,8 +1,7 @@
 HOMEPAGE = "http://linux.duke.edu/projects/yum/"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
-           file://hacks.patch;patch=1 \
            file://paths.patch;patch=1 \
 	   file://yum-install-recommends.py \
 	   file://extract-postinst.awk"
-- 
1.6.1.3





