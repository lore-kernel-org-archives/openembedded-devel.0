Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiA3i-00069H-7u
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 19:25:34 +0100
Received: by bwz10 with SMTP id 10so1578416bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=JWQxK+fVxwlt2Sq5SupPZ/vbW1eoY2PiWOPK6rB6QfA=;
	b=wQs9POukX68JyWhcGJXxC/fAWjLrf6DpzbFa44JkJoWFM32gwRM2cBktfhLiCsnaOD
	hgsQ89KpdLiQpYcObL99gRpAwwQZZA9wey9sjudlcYtPg3+f842ShxDJ9LQS7n5hmtFi
	0z02bMNrMHYgwtOUgZiIJqG40b2WmjF3XjhNE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=C0oNTfbstQuSlWTdOzge7IIGT+Tmt4RUgEdFyL9Vm66XKx+AlNyJLGKMAl+7Qbm/2w
	eDn97KlzXizlwbAPvDJtbjQiNfgyGhkkwAvDW+autwbmo1YAUZ+yMrE9s+BMjrmbwiSO
	l15IaUueLiGIgxkyeXbYINFh8an1VVR2GbAlQ=
Received: by 10.204.113.75 with SMTP id z11mr736555bkp.90.1296065618209;
	Wed, 26 Jan 2011 10:13:38 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id u23sm5085975bkw.21.2011.01.26.10.13.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 10:13:36 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pi9s5-0002WF-Rc; Wed, 26 Jan 2011 19:13:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 19:13:30 +0100
Message-Id: <1296065612-9637-8-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 7/9] kernel.bbclass: simplify "if image" condition
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
X-List-Received-Date: Wed, 26 Jan 2011 18:25:34 -0000

Anything that expands image to any false value should not set
INITRAMFS_TASK (instead of just "" or None).

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index ea1daf6..d0608e5 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -18,7 +18,7 @@ python __anonymous () {
     	bb.data.setVar("DEPENDS", depends, d)
 
     image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
-    if image != '' and image is not None:
+    if image:
         bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
 
     machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
-- 
1.7.2.3



