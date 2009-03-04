Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTi-0005OR-F3
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:57:54 +0100
Received: (qmail 26390 invoked by uid 813007); 4 Mar 2009 15:53:37 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:37 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPW-0001Ct-Ev; Wed, 04 Mar 2009 16:53:30 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:22 +0100
Message-Id: <1236182004-4523-8-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 07/70] rpm-native: Set varprefix to get the rpm database in a sane location (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:35 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5132 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/rpm/rpm-native_4.4.2.3.bb |    2 +-
 packages/rpm/rpm_4.4.2.3.bb        |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/packages/rpm/rpm-native_4.4.2.3.bb b/packages/rpm/rpm-native_4.4.2.3.bb
index 2e949dc..5ed737e 100644
--- a/packages/rpm/rpm-native_4.4.2.3.bb
+++ b/packages/rpm/rpm-native_4.4.2.3.bb
@@ -3,5 +3,5 @@ inherit native
 
 DEPENDS = "beecrypt-native zlib-native file-native popt-native python-native"
 
-export sharedstatedir = "${layout_sharedstatedir}"
 export localstatedir = "${layout_localstatedir}"
+export varprefix = "${layout_localstatedir}"
diff --git a/packages/rpm/rpm_4.4.2.3.bb b/packages/rpm/rpm_4.4.2.3.bb
index 1a6e01a..6718042 100644
--- a/packages/rpm/rpm_4.4.2.3.bb
+++ b/packages/rpm/rpm_4.4.2.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The RPM Package Manager."
 HOMEPAGE = "http://rpm.org/"
 LICENSE = "LGPL GPL"
 DEPENDS = "zlib beecrypt file popt python"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.4.2.3.tar.gz \
            file://external-tools.patch;patch=1 \
@@ -36,6 +36,8 @@ MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX}"
 
+export varprefix = "${localstatedir}"
+
 do_configure () {
 	rm ${S}/popt/ -Rf
 	rm ${S}/db/dist/configure.in -f
-- 
1.6.1.3





