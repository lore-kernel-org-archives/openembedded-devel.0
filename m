Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PsLjd-00044D-DU
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 21:54:57 +0100
Received: by bwz10 with SMTP id 10so614749bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 12:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=4iYzFiYaPtNaZgeid00sKuiSfrJHkPEZn8NLmxevNM4=;
	b=wOsVodnFtZ2+4ePqNnVlF/Ih7t4dJw0ATT6jW92f1XMr3MNHKXaZ8CqAe4nFRiz82M
	DVAm5z1SFZrRe8zvfD9RvVl7CvzeqS5it46hXCYnjGIGY/cUh6HsKQONmM0H9UbXOphI
	WfUF8LAwBo4JY0JOQ0LniHZ0s+Ea909+ple6o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=ds9C+8NgHpMKC5455BAEdLpwgNQeRA5B5ZqOjq5kr+iKKa9mQ7d9DgOwxis9iFcywx
	gHoz6mLseaR/vFIHl4BMj81Phbvs+nKCIG7AMvw9Ytua/Oan4nBJh2na0aPTh/mUsgKX
	prAIA+Uw4KxzJauFVtcBNm+bYE7XjC1sdunGc=
Received: by 10.223.83.144 with SMTP id f16mr5676599fal.4.1298493755355;
	Wed, 23 Feb 2011 12:42:35 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id o12sm1257560fav.6.2011.02.23.12.42.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 12:42:34 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 21:42:28 +0100
Message-Id: <1298493748-32496-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] package_deb.bbclass: create a proper package_update_index_deb task.
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
X-List-Received-Date: Wed, 23 Feb 2011 20:54:57 -0000

Until now the Packages.gz generation was hardcoded in rootfs_deb_do_rootfs.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/package_deb.bbclass |   28 ++++++++++++++++++++++++++++
 classes/rootfs_deb.bbclass  |    5 -----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
index f94771c..9f2a342 100644
--- a/classes/package_deb.bbclass
+++ b/classes/package_deb.bbclass
@@ -276,3 +276,31 @@ python do_package_write_deb () {
 do_package_write_deb[dirs] = "${D}"
 addtask package_write_deb before do_package_write after do_package
 
+do_package_update_index_deb[lockfiles] = "${DEPLOY_DIR_DEB}.lock"
+do_package_update_index_deb[nostamp] = "1"
+do_package_update_index_deb[recrdeptask] += "do_package_write_deb"
+do_package_update_index_deb[depends] += "dpkg-native:do_populate_sysroot"
+
+do_package_update_index_deb () {
+	set -x
+
+	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" ]; then
+		return
+	fi
+
+	cd "${DEPLOY_DIR_DEB}"
+	for arch in ${PACKAGE_ARCHS}; do
+		if [ -e "$arch" ] ; then 
+    			dpkg-scanpackages "$arch" | gzip > "$arch/Packages.gz"
+		fi
+		if [ -e "${BUILD_ARCH}-$arch-sdk" ] ; then 
+			dpkg-scanpackages "${BUILD_ARCH}-$arch-sdk" | gzip > "${BUILD_ARCH}-$arch-sdk/Packages.gz"
+		fi
+		if [ -e "${SDK_SYS}-sdk-$arch" ] ; then
+			dpkg-scanpackages "${SDK_SYS}-sdk-$arch" | gzip > "${SDK_SYS}-sdk-$arch/Packages.gz"
+		fi
+	done
+	cd -
+}
+
+addtask package_update_index_deb before do_rootfs
diff --git a/classes/rootfs_deb.bbclass b/classes/rootfs_deb.bbclass
index 2130ad6..d5db816 100644
--- a/classes/rootfs_deb.bbclass
+++ b/classes/rootfs_deb.bbclass
@@ -24,11 +24,6 @@ fakeroot rootfs_deb_do_rootfs () {
 			continue;
 		fi
 		cd ${DEPLOY_DIR_DEB}/$arch
-		rm -f Packages.gz Packages Packages.bz2
-
-		# apt-native ignores Packages.bz2 unless /bin/bzip2 exists
-		# on the build host, so stick with gzip
-		dpkg-scanpackages . | gzip > Packages.gz
 
 		echo "Label: $arch" > Release
 
-- 
1.7.1



