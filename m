Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MJ1zF-0006DY-BY
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:08:17 +0200
Received: (qmail 1643 invoked by uid 813007); 23 Jun 2009 08:57:14 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Jun 2009 08:57:14 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jun 2009 10:56:27 +0200
Message-Id: <1245747394-31806-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906230941.30107.marcin@juszkiewicz.com.pl>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 021/125] rootfs_deb: make Packages.gz, not Packages.bz2.
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
X-List-Received-Date: Tue, 23 Jun 2009 09:08:17 -0000

From: Michael Smith <msmith@cbnco.com>

apt ignores Packages.bz2 unless bzip2 exists in /bin/bzip2 (!!).
If it's in /usr/bin/bzip2 (e.g. SuSE build host) the image fails to build.

Also, remove commented-out check for DEPLOY_KEEP_PACKAGES.

Signed-off-by: Michael Smith <msmith@cbnco.com>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/rootfs_deb.bbclass |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/classes/rootfs_deb.bbclass b/classes/rootfs_deb.bbclass
index 2768c2a..8222066 100644
--- a/classes/rootfs_deb.bbclass
+++ b/classes/rootfs_deb.bbclass
@@ -24,10 +24,12 @@ fakeroot rootfs_deb_do_rootfs () {
 			continue;
 		fi
 		cd ${DEPLOY_DIR_DEB}/$arch
-		# if [ -z "${DEPLOY_KEEP_PACKAGES}" ]; then
-			rm -f Packages.gz Packages Packages.bz2
-		# fi
-		dpkg-scanpackages . | bzip2 > Packages.bz2
+		rm -f Packages.gz Packages Packages.bz2
+
+		# apt-native ignores Packages.bz2 unless /bin/bzip2 exists
+		# on the build host, so stick with gzip
+		dpkg-scanpackages . | gzip > Packages.gz
+
 		echo "Label: $arch" > Release
 
 		echo "deb file:${DEPLOY_DIR_DEB}/$arch/ ./" >> ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev
-- 
1.6.3.1





