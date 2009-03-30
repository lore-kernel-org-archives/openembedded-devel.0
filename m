Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LoCRc-00089V-Ru
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 10:02:08 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id D84A26831B;
	Mon, 30 Mar 2009 11:59:57 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Mon, 30 Mar 2009 11:59:57 +0400
Message-Id: <1238399997-6016-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH] image.bbclass: reorder do_rootfs
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
X-List-Received-Date: Mon, 30 Mar 2009 08:02:09 -0000

Places do_rootfs function before do_install in image creation process.

This change allows multiimage builds, when one image depends on another (before
that second image creation raced with do_rootfs for the first one) and uses
it for some purpose.

Multiimage builds are useful in situations like creating an installer image
with initramfs (built in OE) and an image of the target FS (also built in OE)
or for building virtualized system images to be placed on target FS.
---
 classes/image.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index fd0df4d..3a0bc32 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -106,6 +106,7 @@ do_rootfs[nostamp] = "1"
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[lockfiles] = "${IMAGE_ROOTFS}.lock"
 do_build[nostamp] = "1"
+do_install[nostamp] = "1"
 
 # Must call real_do_rootfs() from inside here, rather than as a separate
 # task, so that we have a single fakeroot context for the whole process.
@@ -234,5 +235,5 @@ rootfs_update_timestamp () {
 # export the zap_root_password, create_etc_timestamp and remote_init_link
 EXPORT_FUNCTIONS zap_root_password create_etc_timestamp remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp
 
-addtask rootfs before do_build after do_install
+addtask rootfs after do_compile before do_install
 addtask deploy_to after do_rootfs
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



