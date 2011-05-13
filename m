Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKotu-00073V-DG
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 11:43:14 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1839288fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 02:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=fbHCBjuwgK8dzHYuhdEqBNSAsIZShD2ZCCxiKY0oAkQ=;
	b=lxBgibSuxuv9iy30MEMXhl2VcIMK6QljIIjo3Yj3k3yle9pT+lnmGgIyZzadEqLXdW
	CN7za86jpb2a+PaIvLTKiZOaOLrzDO5/vTsRhxMo9FAEbj+xGRTTZglIHdz35+vK3QCk
	Fy0c/I2GC7ttEYlmDdPL5mZDlc/fmAXorVNyg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=aGP/QqtGHI2h/dV7IF5gYQ7xRVQknqr1Cgx1thibRod9ixEN4CXwEKA0y7Qu5d4f1l
	vyAjdbevz7n5XtTOMx8/EJx74HAIMcov5ryTZKFEat4YMYeeQSupbZVjwErEywhfXhBN
	C7TLOjIokhcH54xcX3XqmnYzJfpS1dKLYat3A=
Received: by 10.223.127.213 with SMTP id h21mr1480426fas.45.1305279625261;
	Fri, 13 May 2011 02:40:25 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id g5sm776035faa.2.2011.05.13.02.40.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 02:40:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2011 11:40:07 +0200
Message-Id: <1305279609-31395-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <1305279609-31395-1-git-send-email-Martin.Jansa@gmail.com>
References: <1305279609-31395-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] pointercal-xinput: sync koen's changes from meta-oe
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
X-List-Received-Date: Fri, 13 May 2011 09:43:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/xinput-calibrator/pointercal-xinput_0.0.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes/xinput-calibrator/pointercal-xinput_0.0.bb b/recipes/xinput-calibrator/pointercal-xinput_0.0.bb
index 2d62f20..993a75d 100644
--- a/recipes/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/recipes/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -1,8 +1,11 @@
 DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
-LICENSE = "MIT/X11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
 SECTION = "base"
 
-PR = "r2"
+PR = "r3"
+
 SRC_URI = "file://pointercal.xinput"
 S = "${WORKDIR}"
 
@@ -14,6 +17,5 @@ do_install() {
 	fi
 }
 
-ALLOW_EMPTY_${PN} = "1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
-- 
1.7.5.rc3



