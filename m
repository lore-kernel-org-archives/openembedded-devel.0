Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OzB25-0005co-CV
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 18:22:01 +0200
Received: by yxg6 with SMTP id 6so1071727yxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 09:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=8kgxJk5uo2fuc8imXbEuBCcwTd9lPsVYXAry8+MIq+E=;
	b=ZIbZomDsvK51jRu284Iq7Vrv73DNjCjEBXWVJptb5poTcrRmqmu5T6u53CB/qJe+lD
	ci8qlFfiKWTQzAzJ1jBeEv1IwonUQZetDKUxQVh55HrCk9RA7y3KCYzxrnin8MDHpYzV
	pWmB619GSTynCJr9p8BPZ26GKIHrKVNFKP8jk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=aYloDFIPht/6sFgD7Y91xyyL19ctt6EPReHR7dhtKc4YL1D5Qd+/B5kE1A3FEP91hw
	ALfZO8+FXxJP1eAl7C3nMRBBmZ4RBfs5+/tO4DZsph5DU1590KENdaRUUXB6rNI2FU9f
	EAzyJhU6N95HIn1bb9AP4Ujn7FXw3GDlqcJ+g=
Received: by 10.150.53.3 with SMTP id b3mr4732616yba.372.1285345302496;
	Fri, 24 Sep 2010 09:21:42 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u42sm2404709yba.0.2010.09.24.09.21.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 24 Sep 2010 09:21:41 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 11:09:13 -0500
Message-Id: <1285344553-25176-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] desktop-file-utils: fix broken download links
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
X-List-Received-Date: Fri, 24 Sep 2010 16:22:01 -0000

* fixed the SRC_URI download links
* fixed md5 and sha256 sums for the downloads
* Updated recipe license

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../desktop-file-utils/desktop-file-utils_0.3.bb   |   11 ++++-------
 .../desktop-file-utils/desktop-file-utils_0.6.bb   |    8 ++++----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.3.bb b/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
index b4a35ae..4bd0295 100644
--- a/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
+++ b/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
@@ -1,16 +1,13 @@
 SECTION = "console/utils"
 HOMEPAGE = "http://www.freedesktop.org/Software/desktop-file-utils"
 DESCRIPTION = "command line utilities to work with *.desktop files"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 DEPENDS = "popt glib-2.0"
 
-SRC_URI = "http://freedesktop.org/Software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.gz \
+SRC_URI = "http://freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.gz \
 	   file://m4.patch"
 
 inherit autotools
 
-SRC_URI[md5sum] = "40a93def0f37f1577c5edc638fcb35a5"
-SRC_URI[sha256sum] = "6e932e73818697ea9ec8909bed535a87ba34651031bbbedb63a42e4cdc423284"
-#CHECKSUMS.INI MISMATCH: I've got this instead:
-#SRC_URI[md5sum] = "a1c8bcd648da58bfe0b142042292caa8"
-#SRC_URI[sha256sum] = "06a3d9d97dce9773fc8ac47d6c01aa5e0c0c517cb6ac2e06a627479a0593efca"
+SRC_URI[md5sum] = "a1c8bcd648da58bfe0b142042292caa8"
+SRC_URI[sha256sum] = "06a3d9d97dce9773fc8ac47d6c01aa5e0c0c517cb6ac2e06a627479a0593efca"
diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.6.bb b/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
index 3267b8e..2a1eaf2 100644
--- a/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
+++ b/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
@@ -1,12 +1,12 @@
 SECTION = "console/utils"
 HOMEPAGE = "http://www.freedesktop.org/Software/desktop-file-utils"
 DESCRIPTION = "command line utilities to work with *.desktop files"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 DEPENDS = "popt glib-2.0 gnome-vfs"
 
-SRC_URI = "http://freedesktop.org/Software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.gz"
+SRC_URI = "http://freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.gz"
 
 inherit autotools
 
-SRC_URI[md5sum] = "0d6b6d4fa861f73e0b4225e93077578f"
-SRC_URI[sha256sum] = "64c05a48e91850627cfaa7314d4b4b847547bc4333fa9345994fa49c79276f3d"
+SRC_URI[md5sum] = "dcace3294470e9cdc9ebfe7de1881ece"
+SRC_URI[sha256sum] = "37245e1c606bbdbffa12d43e902a95d7081673191dc1246640c00cb5a8b4f4d2"
-- 
1.7.0.4



