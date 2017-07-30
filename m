Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C21F278410
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jul 2017 15:19:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6UFJOiQ022684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 30 Jul 2017 16:19:25 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dbq04-0001bI-N1; Sun, 30 Jul 2017 16:19:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Jul 2017 16:19:22 +0100
Message-Id: <1501427963-6097-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501427963-6097-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1501427963-6097-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 30 Jul 2017 16:19:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 4/5] image/rm_work: Promote do_image_complete to be more sstate like
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

We relied on the missing do_image_complete_setscene task to ensure the dummy
sstate tarball that was created would never be used. This lead to its own
issues and a better fix for SSTATE_SKIP_CREATION has now been merged.

We can therefore make do_image_complete look like a more standard sstate
task which means image generation doesn't keep rerunning when using rm_work.

We do need to turn do_image_complete's stamp into an sstate version to
handle this (it otherwise matches the do_image_* glob).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass   | 4 ++++
 meta/classes/rm_work.bbclass | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0885fdb..696aacd 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -289,6 +289,10 @@ do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
 do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_image_complete[stamp-extra-info] = "${MACHINE}"
 addtask do_image_complete after do_image before do_build
+python do_image_complete_setscene () {
+    sstate_setscene(d)
+}
+addtask do_image_complete_setscene
 
 # Add image-level QA/sanity checks to IMAGE_QA_COMMANDS
 #
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 2a4e808..71c21a0 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -61,6 +61,11 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
+            *do_image_complete*)
+                mv $i `echo $i | sed -e "s#${j}#${j}_setscene#"`
+                i=dummy
+                break
+                ;;
             *do_rootfs*|*do_image*|*do_bootimg*|*do_bootdirectdisk*|*do_vmimg*|*do_write_qemuboot_conf*)
                 i=dummy
                 break
-- 
2.7.4


