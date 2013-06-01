Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id CE7B0620C2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jun 2013 14:02:40 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id a12so1968242wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jun 2013 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=m8l9Qdd/bmCSz8p+4kVmDOxpy6kTRavHu28Z58wrxPg=;
	b=oIdc411BW1usYTWC603fLfgYZhx4Acrdbkt/PzLNRMCK30yo+VdOJNzs3PK12Eg611
	WMzVp/qpsp/eaTR5bCtLhg78KEeTKkkfuC39bKJS8m4/fQ91cCKxsMEv6Nlu85iR2j5w
	h49swOT3T7J7RKc4OfXzqGx26gjb/SPHSgobx3eBEoc+AqORIosgIMs/VWM92tlBU1m8
	WtvyLVFD7zk8Hf11Yp7RcSuyxpu4PqW4mgaXdBedK6zJXgWVtY79lq1AhgOxvJvKCAsd
	VeFj1T6bbAIfL4IrZWbrnhlm8u/nMDk8Ld/BLWZMbNif0j+KYZpN0PSv2VBWwnLcNYL7
	nsxQ==
X-Received: by 10.194.157.65 with SMTP id wk1mr2558261wjb.8.1370095360873;
	Sat, 01 Jun 2013 07:02:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	fu14sm10381597wic.8.2013.06.01.07.02.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 01 Jun 2013 07:02:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Jun 2013 16:02:51 +0200
Message-Id: <1370095371-6702-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-oe][PATCH] claws-plugins-*: Update SRC_URI
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
X-List-Received-Date: Sat, 01 Jun 2013 14:02:41 -0000

* modules are now in one bigger tarball on sourceforge
  http://sourceforge.net/projects/sylpheed-claws/files/extra%20plugins/
* old tarballs are still available in plugins_obsolete directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb | 2 +-
 meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb        | 3 +--
 meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb           | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
index 338ff8c..3bd3deb 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=977f04a8048c04684e521c06e2844a94"
 
 PR = "r1"
 
-SRC_URI = "http://www.claws-mail.org/downloads/plugins/gtkhtml2_viewer-${PV}.tar.gz"
+SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/gtkhtml2_viewer-${PV}.tar.gz"
 SRC_URI[md5sum] = "a6c9dfa6f969ccd844796a5724b52167"
 SRC_URI[sha256sum] = "4d41f6d961efaac0f51705e5052bac732bc0bdafee2ef2082a9cf9d89f183ae5"
 
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
index 1465df7..5ae1632 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
@@ -4,8 +4,7 @@ DEPENDS = "claws-mail"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://www.claws-mail.org/downloads/plugins/mailmbox-${PV}.tar.gz\
-"
+SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/mailmbox-${PV}.tar.gz"
 SRC_URI[md5sum] = "7f72c68e6e1a8768f1247f455fd20b62"
 SRC_URI[sha256sum] = "633f7835261c88a0aa06de38553ac935a1799a7128120963a7fa87ace01dac18"
 
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
index c1fcf77..caf32b4 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
@@ -4,7 +4,7 @@ DEPENDS = "claws-mail libxml2 curl glib-2.0 gtk+"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c2348e0a084e573f0220f5e45d8097e"
 
-SRC_URI = "http://www.claws-mail.org/downloads/plugins/rssyl-${PV}.tar.gz"
+SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/rssyl-${PV}.tar.gz"
 SRC_URI[md5sum] = "49b45608e8d160b3625d3d50016ec2ca"
 SRC_URI[sha256sum] = "2e96a1cd6a1a5bb7f86cd2eb48f6e174665957fafe1f3b1e8361aac3bb967f79"
 inherit autotools pkgconfig gettext
-- 
1.8.2.1


