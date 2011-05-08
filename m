Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ75v-0001WT-Hg
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:44:35 +0200
Received: by gxk3 with SMTP id 3so953350gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=Y9Kx/DFPs2nGpDH/qOArw4RtfhCcl+K14ope45Zx1Mk=;
	b=c9my2QNADY5WcQqIf8Ss0c0SQlzmlIkr6OgCGe8XJ7+rn5ym2cqlE4FT1npymoXHdi
	PGhwnlTA1cY+rX6VNMS+3bJtZET+ewy8p5uL03RveERxMDIK/QddRHWGBJnXfvp3eRao
	E5yWHAj7VIbnnlw8RInFgPmVEp2zhObWxUC8s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=n8yZrhcQJCsNrbRR6QfxVWKM/zOK8f2Mhch6ONd6eIlQG0PXZh7d1Z8lEF470jr+/H
	RjKM32hNJd7CegI8U3Kof849Y8cGOU4ctsbeaKFksWCA1HcgJSh5C4uIXdHkH+/MibyK
	V6/K0QxEWW9Lg0Jyw7sm4pV9QKEZ6dVTqxZho=
Received: by 10.236.151.74 with SMTP id a50mr6480063yhk.13.1304872911656;
	Sun, 08 May 2011 09:41:51 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l74sm2245064yhn.96.2011.05.08.09.41.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 09:41:50 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 16:41:26 +0000
Message-Id: <1304872895-21596-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
References: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3 02/11] ntfs-3g-ntfsprogs: add version 2011.4.12
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
X-List-Received-Date: Sun, 08 May 2011 16:44:35 -0000

This recipe is a merge of ntfs-3g and ntfsprogs thus the provides
entries.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../ntfs-3g-ntfsprogs_2011.4.12.bb                 |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb

diff --git a/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
new file mode 100644
index 0000000..db5686e
--- /dev/null
+++ b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "The NTFS-3G driver is an open source, freely available NTFS driver for Linux with read and write support."
+HOMEPAGE = "http://www.ntfs-3g.org/"
+DEPENDS = "fuse libgcrypt"
+PROVIDES = "ntfsprogs ntfs-3g"
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
+PR = "r0"
+
+SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz"
+S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
+
+SRC_URI[md5sum] = "9c4ce318373b15332239a77a9d2a39fe"
+SRC_URI[sha256sum] = "aa8c747f0bfe819b2387b05e12db8d35e4ac96dcb2432873a0b939e248b2ee05"
+
+inherit autotools
+
+# required or it calls ldconfig at install step
+EXTRA_OEMAKE = "LDCONFIG=echo"
+
+PACKAGES =+ "ntfs-3g ntfsprogs libntfs-3g"
+
+FILES_ntfs-3g = "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g*"
+RDEPENDS_ntfs-3g += "fuse"
+
+FILES_ntfsprogs = "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
+FILES_libntfs-3g = "${libdir}/*${SOLIBS}"
-- 
1.7.2.5



