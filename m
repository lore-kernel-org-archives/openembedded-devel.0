Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ss9wB-0002dl-LU
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 11:55:55 +0200
Received: by wibhm11 with SMTP id hm11so280526wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2012 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=umr2Fhb0E4pjPevI7vgGmxqOvUfXPat2dkf8PNRK+ww=;
	b=t1GqTMhdW2ufIz3R05PyQz5LWlNktTpkE/G3eW4QeyRc31mdx6e2sEvTG4W7qA2ljW
	dl7cxUe1eUMDYx55JRxxnQl1NsVsRe2+2coB7hsiWK/kLEZpD3tgOtGGTvjFsO+gn1G+
	m6r4HNy7pBP69cxUzfCWtbh9Foo6brAN2VwYqB81YoG1JxOUJ0RxzAnrkOKxO5sJY1p8
	+K/pm/lawg+RbeyNXhG/9LDvxlkOdMgv7NK4xzPhZijYY85Y6rbhAb7MpuW7X3xtwhoC
	H1KmAp+iOpezFQzPZ9yJbsbuiCM1wkHu9JFakV5yyc6/pn1iSdDKJJstFxe13ck2hpjY
	GX/w==
Received: by 10.216.238.30 with SMTP id z30mr3265451weq.223.1342777472836;
	Fri, 20 Jul 2012 02:44:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm13681371wix.5.2012.07.20.02.44.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 02:44:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jul 2012 11:44:42 +0200
Message-Id: <1342777483-25687-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-systemd][PATCHv2 1/2] systemd: add usbutils to DEPENDS
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
X-List-Received-Date: Fri, 20 Jul 2012 09:55:55 -0000

* fixes:
  | No package 'usbutils' found
  | configure:16015: error: Package requirements (usbutils >= 0.82) were not met:

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 6b9fc8c..ac02cff 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 PROVIDES = "udev"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers"
+DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
@@ -19,7 +19,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r0"
+PR = "r1"
 
 inherit useradd pkgconfig autotools vala perlnative
 
-- 
1.7.8.6



