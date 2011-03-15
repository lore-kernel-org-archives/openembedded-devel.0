Received: from na3sys009aog105.obsmtp.com ([74.125.149.75])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PzZhE-0002Kj-LX
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 20:14:22 +0100
Received: from source ([209.85.213.175]) (using TLSv1) by
	na3sys009aob105.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTX+6J8nxY0aNASe0uhunOy3eUupOT93X@postini.com;
	Tue, 15 Mar 2011 12:12:40 PDT
Received: by mail-yx0-f175.google.com with SMTP id 22so428936yxn.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 12:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=QlvhpAhL9Y14q/HOlA9cY4dF0HsYRUNcO0C6OpG3HnA=;
	b=VzC1UUiM7VGFXDS33FSzfIGpsr1Ciq+5Ux41eP20XWqGPOApf3JoRS8GWbLkSKEPrW
	45QKgB3BZibZ+YhUnvb0Q8DBp9gMAV0o7Bh6lkOdbNmVLITAiJqaeR2hDGewYwxvmgzf
	zAYKfSFzASv50mBQm2CFTzuQgls4sSjM53Tq8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=By2g05+GO0sa15UuYwhUkkSm6SGYBIFcC6fHYpxtudnXR3XxOfHMtWfctlBnER+g2g
	F+Yne9zyc+ZTd1YQm/BbpRndO3beF6sCWIwIUwwrol5Mgy7twKFm6KUfDDKKY02kjw50
	YKDklnjgsC0gG1AJ95xeV0v/hwQbqESyvRS5k=
Received: by 10.150.161.4 with SMTP id j4mr390626ybe.5.1300212840923;
	Tue, 15 Mar 2011 11:14:00 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id q34sm2981383ybk.15.2011.03.15.11.13.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 11:13:57 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Mar 2011 14:13:54 -0400
Message-Id: <1300212835-8779-1-git-send-email-bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
Cc: Tom Rini <trini@embeddedalley.com>
Subject: [PATCH 1/2] image.bbclass: add link to .rootfs.<type> or .<type>.img
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
X-List-Received-Date: Tue, 15 Mar 2011 19:14:22 -0000

The current image link-creation code will unconditionaly create a link
from .<type> pointing to the .rootfs.<type> output.

This is not compatible with the UBIFS images produced which have
.<type>.img extension since they are not considered to be valid rootfs
images when they are not included in a UBI container.

Check for existence of the link target .rootfs.<type> before creating the
link and fallback to a check for the .<type>.img target after that.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
CC: Tom Rini <trini@embeddedalley.com>

---

Tested successfully in arago; I'm sorry I couldn't find a combination of
MACHINE and DISTRO and image that would build on org.openembedded.dev.

This patch is a git am fix-up of the patch tested in arago.

---

 classes/image.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index 9621614..d7fe9b0 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -140,7 +140,11 @@ def get_imagecmds(d):
         cmd  = "\t#Code for image type " + type + "\n"
         cmd += "\t${IMAGE_CMD_" + type + "}\n"
         cmd += "\tcd ${DEPLOY_DIR_IMAGE}/\n"
-        cmd += "\tln -fs ${IMAGE_NAME}.rootfs." + type + " ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}." + type + "\n\n"
+        cmd += "\tif [ -f ${IMAGE_NAME}.rootfs." + type + " ]; then\n"
+        cmd += "\tln -fs ${IMAGE_NAME}.rootfs." + type + " ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}." + type + "\n"
+        cmd += "\telif [ -f ${IMAGE_NAME}." + type + ".img ]; then\n"
+        cmd += "\tln -fs ${IMAGE_NAME}." + type + ".img ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}." + type + "\n"
+        cmd += "\tfi\n\n"
         cmds += bb.data.expand(cmd, localdata)
     return cmds
 
-- 
1.7.1



