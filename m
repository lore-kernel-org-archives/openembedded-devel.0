Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiA6P-0006LL-2D
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 19:28:21 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so1580396bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=GXo7ckB9aj4I/IhZo4dls8owrt6uSIStUwI10qJt0nk=;
	b=BFbKfKumkia6YhH+q1XqEX+DlL+2keeU6VQu3OzcnIId6n7bcGG5x8DCzD9JRQEpN2
	IuN7kGhKScTd4ocB4zhcE908cMO30Ro+/x1MhU9E8h4mRq2LRH1x2x6O6w+ZRlm5u8S2
	BpMFBy9+tJGP2xMCBGmwANxGRc1lJaf+nWBSE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=CJCmwJHRVO3XW3UnZ8lJGo0hCIlZA+7zfAkMIFfXmqnb5LoP8ZqyJKosV3I8BUMv9v
	iTqybsRV4jY4dihc4flylr0kZVNrmPcq+8xeJXByetHDM5ztST0tf0E/ktFXkVz1DpW3
	h5XA/04ACZBnaqvxEy0fsv/DZdTNNa2Fmrr2M=
Received: by 10.204.57.204 with SMTP id d12mr737817bkh.69.1296065617440;
	Wed, 26 Jan 2011 10:13:37 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id b6sm7649163bkb.10.2011.01.26.10.13.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 10:13:35 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pi9s5-0002WL-Ss; Wed, 26 Jan 2011 19:13:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 19:13:32 +0100
Message-Id: <1296065612-9637-10-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 9/9] util-linux: honour largefile distro feature
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
X-List-Received-Date: Wed, 26 Jan 2011 18:28:21 -0000

do_install on micro-image still broken (${bindir}/hexdump lives in
${usrbindir}/hexdump from util-linux POV. Not fixing these.)

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/util-linux/files/MCONFIG  |    1 -
 recipes/util-linux/util-linux.inc |    4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/util-linux/files/MCONFIG b/recipes/util-linux/files/MCONFIG
index 3fea2c0..1e87749 100644
--- a/recipes/util-linux/files/MCONFIG
+++ b/recipes/util-linux/files/MCONFIG
@@ -206,7 +206,6 @@ endif
 
 CFLAGS := $(OPT) -I$(LIB) $(WARNFLAGS) \
 			$(CURSESFLAGS) $(SLANGFLAGS) $(NLSFLAGS) \
-			-D_FILE_OFFSET_BITS=64 \
 			-DSBINDIR=\"$(SBIN_DIR)\" \
 			-DUSRSBINDIR=\"$(USRSBIN_DIR)\" \
 			-DLOGDIR=\"$(LOG_DIR)\" \
diff --git a/recipes/util-linux/util-linux.inc b/recipes/util-linux/util-linux.inc
index eef4645..e1caf80 100644
--- a/recipes/util-linux/util-linux.inc
+++ b/recipes/util-linux/util-linux.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Util-linux is a suite of essential utilities for any Linux system
 SECTION = "base"
 LICENSE = "GPL"
 DEPENDS = "zlib ncurses"
-INC_PR = "r16"
+INC_PR = "r17"
 inherit autotools
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux/util-linux-${PV}.tar.bz2 \
@@ -30,6 +30,8 @@ FILES_util-linux-readprofile = "/usr/sbin/readprofile"
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile "
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
 
+CFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'largefile', '-D_FILE_OFFSET_BITS=64', '', d)}"
+
 do_compile () {
 	set -e
 	install ${WORKDIR}/MCONFIG ${S}/MCONFIG
-- 
1.7.2.3



