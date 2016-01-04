Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id D7E8C6067C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 13:40:06 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f206so213772843wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 05:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iP8Zcnfj8yqb36vBNJwxFAMrl8LZxHCXUuMjR7/pm5U=;
	b=o4LqONE7hUJyTIpuOeOyPMJqE+dyhFAAlHVQ2Tax2W6w4qOAhTpI9J477smMcRvgoP
	9XJ0fzsKDUn8EFr1KScVHOo+ILCsf/haCsAIshAtM7cChaQzAO8AgCrKYt+CwZGvsm1V
	wsxNzXevp/rC73gxmZcdsC/MEt0jhEMYGpj3XGfIig6ozP64zxAiufdJ2X/bsLdpQLR2
	8V5SNZyBeJyFzkqypDBfQpONzZNz9gyDMQUyIIdG23hEafDabqSxxw3NXnVm/j5de5Ma
	6AIWnPCp7pm34zp8azSns4PrsKl24Al5sdqDoD2vsKmsmAX8/leUbfRr0hf9N3HqvBuW
	S3wA==
X-Received: by 10.28.12.9 with SMTP id 9mr45695306wmm.76.1451914806637;
	Mon, 04 Jan 2016 05:40:06 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l194sm51418998wmb.14.2016.01.04.05.40.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 05:40:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jan 2016 14:44:12 +0100
Message-Id: <1451915055-28243-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][meta-oe 1/4] libetpan, claws*: blacklist because of gnutls upgrade
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
X-List-Received-Date: Mon, 04 Jan 2016 13:40:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb                  | 1 +
 meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb | 2 ++
 meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb        | 2 ++
 meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb           | 2 ++
 meta-oe/recipes-support/libetpan/libetpan_0.57.bb                    | 3 +++
 5 files changed, 10 insertions(+)

diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
index 1f61c39..5b75a52 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
@@ -4,6 +4,7 @@ DEPENDS = "gtk+ libetpan openssl aspell curl libgcrypt"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e059bde2972c1790af786f3e86bac22e"
 
+PNBLACKLIST[claws-mail] = "depends on blacklisted libetpan"
 
 inherit autotools pkgconfig gettext
 
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
index 9adfd28..cabc1f3 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
@@ -4,6 +4,8 @@ DEPENDS = "claws-mail gtkhtml2 curl"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=977f04a8048c04684e521c06e2844a94"
 
+PNBLACKLIST[claws-plugin-gtkhtml2-viewer] = "depends on blacklisted claws-mail"
+
 PR = "r1"
 
 SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/gtkhtml2_viewer-${PV}.tar.gz \
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
index a4717dc..1951832 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
@@ -4,6 +4,8 @@ DEPENDS = "claws-mail"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+PNBLACKLIST[claws-plugin-mailmbox] = "depends on blacklisted claws-mail"
+
 SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/mailmbox-${PV}.tar.gz"
 SRC_URI[md5sum] = "7f72c68e6e1a8768f1247f455fd20b62"
 SRC_URI[sha256sum] = "633f7835261c88a0aa06de38553ac935a1799a7128120963a7fa87ace01dac18"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
index cdc465c..a9459d0 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
@@ -4,6 +4,8 @@ DEPENDS = "claws-mail libxml2 curl glib-2.0 gtk+"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c2348e0a084e573f0220f5e45d8097e"
 
+PNBLACKLIST[claws-plugin-rssyl] = "depends on blacklisted claws-mail"
+
 SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/rssyl-${PV}.tar.gz \
            file://configure.patch"
 SRC_URI[md5sum] = "49b45608e8d160b3625d3d50016ec2ca"
diff --git a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
index 6be0694..c8d7c58 100644
--- a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
+++ b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f18ebe7e452708c26f83954f81062ba7"
 
 PR = "r1"
 
+# http://errors.yoctoproject.org/Errors/Details/25823/
+PNBLACKLIST[libetpan] = "Not compatible with gnutls version 3.4 currently in oe-core"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/libetpan/libetpan-${PV}.tar.gz \
            file://libetpan-autoreconf.patch \
            file://libetpan-ldflags.patch \
-- 
2.6.4


