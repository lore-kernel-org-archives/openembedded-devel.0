Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD1A6FAC4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:31 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so6450611wes.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zY3mu0FgVhlDUYxDjNIZAQnOAms9sqyul+EzOzoUtqE=;
	b=b2tbZYt142Rvw9Q2yMPCh9U7zlH1HPzHxeqZyOLvNgCiR+8oz5s0anmcQSIoKp5eGy
	oyaawhjMzJasd2PWw0WfU1zEDuQor1FLXOAT/HOCsJtuqQg0QyJ0wHjFf/ZEhfazMD1c
	lD7RkgKE0ekW0BAyB5yK1VmGjri+5/IERwd+kVDeuPlWBq2JxAeeDGD+IrTEoeAHNK3V
	LMXnsr6OV+aGHFAMuyJJikxqUMpL6NjrGUDGlOX578QavlmJDqprawdOxkbgDJW3rpWi
	jkf05GuFlW2jNTG387GRNOxbBph6inRvewFrBa0+NuOiGPKM0Jo+RRQcGqEC9Ad8RG7H
	JuvA==
X-Received: by 10.195.12.14 with SMTP id em14mr24171120wjd.15.1396372532333;
	Tue, 01 Apr 2014 10:15:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	44sm41848675eek.30.2014.04.01.10.15.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:49 +0200
Message-Id: <1396372434-10710-41-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 41/46] emacs: remove infodir
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 17:15:32 -0000

* doesn't use autotools.bbclass which removes infodir automatically
* fixes QA warning:
  emacs-23.4: The /usr/share/info/dir file is not meant to be shipped in a particular package.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index d7d281f..a1a4965 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -140,6 +140,10 @@ do_install_append() {
     # freaks package.bbclass and whole bitbake call returns error code
     # ERROR: runstrip: ''arm-oe-linux-gnueabi-strip'  '/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/emacs-23.4-r0/package/usr/share/emacs/23.4/etc/tutorials/TUTORIAL.ko'' strip command failed
     mv ${D}${datadir}/${BPN}/${PV}/etc/tutorials/TUTORIAL.ko ${D}${datadir}/${BPN}/${PV}/etc/tutorials/TUTORIAL.KO
+    # Info dir listing isn't interesting at this point so remove it if it exists.
+    if [ -e "${D}${infodir}/dir" ]; then
+        rm -f ${D}${infodir}/dir
+    fi
 }
 
 EXTRA_OEMAKE += 'QEMU="${QEMU}"'
-- 
1.9.1


