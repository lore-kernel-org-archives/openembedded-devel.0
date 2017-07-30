Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CC95678413
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jul 2017 15:19:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6UFJO7n022685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 30 Jul 2017 16:19:25 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dbq04-0001bN-NZ; Sun, 30 Jul 2017 16:19:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Jul 2017 16:19:23 +0100
Message-Id: <1501427963-6097-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501427963-6097-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1501427963-6097-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 30 Jul 2017 16:19:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 5/5] image: Make do_image_qa a dummy sstate task to match do_image_complete
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

Similar to do_image_complete, make do_image_qa a dummy sstate task
so that rm_work doesn't cause image generation to repeat on every
new build command.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 696aacd..2c1dc81 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -324,6 +324,15 @@ fakeroot python do_image_qa () {
 }
 addtask do_image_qa after do_image_complete before do_build
 
+SSTATETASKS += "do_image_qa"
+SSTATE_SKIP_CREATION_task-image-qa = '1'
+do_image_qa[sstate-inputdirs] = ""
+do_image_qa[sstate-outputdirs] = ""
+python do_image_qa_setscene () {
+    sstate_setscene(d)
+}
+addtask do_image_qa_setscene
+
 def setup_debugfs_variables(d):
     d.appendVar('IMAGE_ROOTFS', '-dbg')
     d.appendVar('IMAGE_LINK_NAME', '-dbg')
-- 
2.7.4


