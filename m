Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SkInr-0002eN-0F
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 19:46:51 +0200
Received: by dalh21 with SMTP id h21so3072781dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 10:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YpgidvdjE7KmTG5ol32vJtkstxCH0yGyYXky/FtYyh4=;
	b=iUh80gFQsZHwobPAdUe4pLNWljhgCW5ScqI0bEN4KTWRmtoI5GHkK7PtoSC90mkcBF
	drQRypD03uub9d0vpX900gdsVp5mpyjqMYisdQmWiCkz9mkTjPBa560jUjgmZc1aNejc
	f+lLxzpaF22ko8LHTPxrF/cW3IBRW4CbXbT++9wqrG8Rl+QAu3o0hDrhdVSYK8cJAD/S
	48+7gW7cbbwZRv+YTjPI/QLyr81pKzUWvyAesAfsgpRKKbP8mb5QMXNIVLwodrZfnbMf
	f15VRNGlseJNZYPnmGs2gkkyJCRWqmwNLAPMswidrW+FZ8ZhBfApVYwH5U+MD5pVb0Yi
	rVTQ==
Received: by 10.68.242.7 with SMTP id wm7mr9887621pbc.98.1340904955505;
	Thu, 28 Jun 2012 10:35:55 -0700 (PDT)
Received: from localhost.localdomain ([94.205.109.242])
	by mx.google.com with ESMTPS id np8sm2684407pbc.71.2012.06.28.10.35.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 10:35:54 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2012 19:35:42 +0200
Message-Id: <1340904942-41537-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx] util-linux: rename file to util-linux_2.21.2.bbappend
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
X-List-Received-Date: Thu, 28 Jun 2012 17:46:51 -0000

* Rename util-linux bbaapend file to match recipe version provided in
  poky/meta/recipes-core/util-linux

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 recipes-core/util-linux/util-linux_2.21.1.bbappend |    3 ---
 recipes-core/util-linux/util-linux_2.21.2.bbappend |    3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 recipes-core/util-linux/util-linux_2.21.1.bbappend
 create mode 100644 recipes-core/util-linux/util-linux_2.21.2.bbappend

diff --git a/recipes-core/util-linux/util-linux_2.21.1.bbappend b/recipes-core/util-linux/util-linux_2.21.1.bbappend
deleted file mode 100644
index 5199eb2..0000000
--- a/recipes-core/util-linux/util-linux_2.21.1.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS := "${THISDIR}/${PN}"
-# Disable microblaze ncurses support
-EXTRA_OECONF_microblaze += " --without-ncurses "
diff --git a/recipes-core/util-linux/util-linux_2.21.2.bbappend b/recipes-core/util-linux/util-linux_2.21.2.bbappend
new file mode 100644
index 0000000..5199eb2
--- /dev/null
+++ b/recipes-core/util-linux/util-linux_2.21.2.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+# Disable microblaze ncurses support
+EXTRA_OECONF_microblaze += " --without-ncurses "
-- 
1.7.9.5



