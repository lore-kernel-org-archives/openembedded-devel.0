Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIu0Y-0007m6-Vs
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 04:46:11 +0200
Received: by yxn22 with SMTP id 22so1669985yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 19:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=WsQa8p5R2u5ztK47A3iJyc95jR+C0NV5IntAyexMDp4=;
	b=V5Eb4CNVc4zbEaK7WBvKYfZ52wi7Dmp4PwH4J7IX4850ptEOxVX7XWLHEtXGYviTEw
	z1FUwHx3MFcf6CJ7imWQpjP4OxSNVfLi8zH0o2bTnVZgpJR49mJFK8qUw+b2F27qynYu
	420GQnVBlb9A0d5/gcvx5eNXPPGPvIbAdjgkQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=x1RdZFBXhw0qdTZLGCiUtpIdY26Fn0W7Bjn4Ji3NgxQJiZBTnmOLoRHuvjDabyM6pU
	XdB81xrJzd8KGrZwqo29gB809JJJnD0XJ4UJOYP87xDP72xIPGYlZ/OTWnpA1BlKGx6J
	c0VBj/CRQgsyGQTNJFvsk/cVM1XesiIqlpd68=
Received: by 10.91.26.23 with SMTP id d23mr516961agj.73.1304822607681;
	Sat, 07 May 2011 19:43:27 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v1sm4837128anh.25.2011.05.07.19.43.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 19:43:26 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 02:42:57 +0000
Message-Id: <1304822586-14872-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 02/11] ntfs-3g-ntfsprogs: add 2011.4.12 recipes
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
X-List-Received-Date: Sun, 08 May 2011 02:46:11 -0000

This recipe is a merge of ntfs-3g and ntfsprogs thus the provides
entries.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../ntfs-3g-ntfsprogs_2011.4.12.bb                 |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb

diff --git a/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
new file mode 100644
index 0000000..561f52a
--- /dev/null
+++ b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "The NTFS-3G driver is an open source, freely available NTFS driver for Linux with read and write support."
+HOMEPAGE = "http://www.ntfs-3g.org/"
+DEPENDS = "fuse libgcrypt"
+PROVIDES = "ntfsprogs ntfs-3g"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
+PR = "r0"
+
+SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz"
+S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
+
+inherit autotools
+
+EXTRA_OEMAKE = "LDCONFIG=echo"
+
+PACKAGES =. "ntfs-3g ntfsprogs libntfs-3g"
+
+FILES_ntfs-3g = "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g*"
+RDEPENDS_ntfs-3g += "fuse"
+
+FILES_ntfsprogs = "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
+FILES_libntfs-3g = "${libdir}/*.so.*"
+
+SRC_URI[md5sum] = "9c4ce318373b15332239a77a9d2a39fe"
+SRC_URI[sha256sum] = "aa8c747f0bfe819b2387b05e12db8d35e4ac96dcb2432873a0b939e248b2ee05"
-- 
1.7.2.5



