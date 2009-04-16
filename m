Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LuQ7T-0003Ah-Fw
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 13:51:36 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 60FFB683CA;
	Thu, 16 Apr 2009 15:47:01 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Thu, 16 Apr 2009 15:47:01 +0400
Message-Id: <1239882421-19769-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] image.bbclass: IMAGE_VARS->IMAGE_BOOT, make overridable
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
X-List-Received-Date: Thu, 16 Apr 2009 11:51:37 -0000

IMAGE_VARS usage forces images to have init, dev management, login
management and other stuff. In cases where you don't need any of those
(like initramfs images or other special-purpose images) you need to
override 4 variables in order to get clean image that only installs
things from IMAGE_INSTALL.

So, this changes IMAGE_VARS to more meaningful IMAGE_BOOT and makes it
possible to build images without boot components with single
IMAGE_BOOT="".
---
 classes/image.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index fd0df4d..9012de2 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -17,16 +17,16 @@ IMAGE_INITSCRIPTS ?= "initscripts"
 #
 IMAGE_LOGIN_MANAGER ?= "tinylogin"
 
-IMAGE_VARS = "${IMAGE_INITSCRIPTS} \
+IMAGE_BOOT ?= "${IMAGE_INITSCRIPTS} \
 ${IMAGE_DEV_MANAGER} \
 ${IMAGE_INIT_MANAGER} \
 ${IMAGE_LOGIN_MANAGER} "
 
-RDEPENDS += "${IMAGE_INSTALL} ${IMAGE_VARS}"
+RDEPENDS += "${IMAGE_INSTALL} ${IMAGE_BOOT}"
 
 # "export IMAGE_BASENAME" not supported at this time
 IMAGE_BASENAME[export] = "1"
-export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${IMAGE_VARS}"
+export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${IMAGE_BOOT}"
 
 # We need to recursively follow RDEPENDS and RRECOMMENDS for images
 do_rootfs[recrdeptask] += "do_deploy do_populate_staging"
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



