Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 81F2F78327
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jul 2017 15:19:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6UFJOWR022683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 30 Jul 2017 16:19:25 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dbq04-0001bE-MY; Sun, 30 Jul 2017 16:19:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Jul 2017 16:19:21 +0100
Message-Id: <1501427963-6097-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501427963-6097-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1501427963-6097-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 30 Jul 2017 16:19:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/5] image: Drop before do_build from do_rootfs and do_image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Jul 2017 15:19:27 -0000

do_image_complete has the do_build dependency, these other two tasks
don't need it. If this is present, it complicates the dependency tree
and convinces rm_work that the tasks need to rerun even if they
already did since the stamps are removed.

Drop the unneeded dependency to help resolve this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 40bd614..0885fdb 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -261,7 +261,7 @@ fakeroot python do_rootfs () {
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[cleandirs] += "${S} ${IMGDEPLOYDIR}"
 do_rootfs[umask] = "022"
-addtask rootfs before do_build after do_prepare_recipe_sysroot
+addtask rootfs after do_prepare_recipe_sysroot
 
 fakeroot python do_image () {
     from oe.utils import execute_pre_post_process
@@ -272,7 +272,7 @@ fakeroot python do_image () {
 }
 do_image[dirs] = "${TOPDIR}"
 do_image[umask] = "022"
-addtask do_image after do_rootfs before do_build
+addtask do_image after do_rootfs
 
 fakeroot python do_image_complete () {
     from oe.utils import execute_pre_post_process
-- 
2.7.4


