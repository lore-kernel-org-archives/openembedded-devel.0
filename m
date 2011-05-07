Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIpmC-0000Dz-S4
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 00:15:05 +0200
Received: by gyf1 with SMTP id 1so1641847gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 15:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=SN11R23kn3EwwlrgO5DWvVPkwwP4NoPPFX25eVaxM/A=;
	b=VngAOYjdHqBrbumrRxvpvPeizkEACcgHcX9EK0jIHqpDg3iTKHCKekX3SXWfMYSfr/
	+4xz6mU+gSocSSfusZjAYAtDHjOA1KSLttIAFa28nBmGyNQajRR+/4t49aPS2dI9w/pH
	LtEhnWsOUdQyLA8WbrbbcFiMsn/Ig+byN1bZw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=AN4WYgl5Uvx6QdhDo6xfMzNbU/+tUIt63XXU+VPewpuUI9NI0n26S9b78RIuc9xnj+
	NLDWGgO9E/FLNE74N/Qx/PNxoxmAbfi9VcqFRLDyOBxDQApcoUEM9Qj8KdwIzgNk9tMa
	kr4FYktv9EcgNAsxKe2a3WwJ+mDCCbl3TaMng=
Received: by 10.236.78.68 with SMTP id f44mr6086283yhe.186.1304806341180;
	Sat, 07 May 2011 15:12:21 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id g2sm2005922yhc.76.2011.05.07.15.12.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 15:12:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2011 22:11:50 +0000
Message-Id: <1304806316-9716-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304806316-9716-1-git-send-email-otavio@ossystems.com.br>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/8] ntfs-3g-ntfsprogs: add 2011.4.12 recipes
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
X-List-Received-Date: Sat, 07 May 2011 22:15:05 -0000

This recipe is a merge of ntfs-3g and ntfsprogs thus the provides
entries.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../ntfs-3g-ntfsprogs_2011.4.12.bb                 |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb

diff --git a/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
new file mode 100644
index 0000000..2b1720c
--- /dev/null
+++ b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "The NTFS-3G driver is an open source, freely available NTFS driver for Linux with read and write support."
+HOMEPAGE = "http://www.ntfs-3g.org/"
+DEPENDS = "fuse libgcrypt"
+PROVIDES = "ntfsprogs ntfs-3g"
+RDEPENDS_ntfs-3g += "fuse"
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
+FILES_ntfsprogs = "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
+FILES_libntfs-3g = "${libdir}/*.so.*"
+
+SRC_URI[md5sum] = "9c4ce318373b15332239a77a9d2a39fe"
+SRC_URI[sha256sum] = "aa8c747f0bfe819b2387b05e12db8d35e4ac96dcb2432873a0b939e248b2ee05"
-- 
1.7.2.5



