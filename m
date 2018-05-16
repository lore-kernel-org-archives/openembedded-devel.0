Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEFF748AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 14:35:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4GEY3Rh030685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 07:34:59 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 May 2018 07:34:22 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 May 2018 10:34:14 -0400
Message-ID: <1526481254-11166-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] gnome-keyring: fix 'installed but not shipped' QA issue
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
X-List-Received-Date: Wed, 16 May 2018 14:35:09 -0000
Content-Type: text/plain

Building the 'gnome-keyring' recipe with "installed-vs-shipped"
included in ERROR_QA will result in:

    ERROR: gnome-keyring-3.20.0-r0 do_package: QA Issue: gnome-keyring: \
      Files/directories were installed but not shipped in any package:
      /usr/lib64/pkcs11/gnome-keyring-pkcs11.la
      /lib64/security/pam_gnome_keyring.la

From various documents the .la files should not be packaged in either
the main recipe package or the -dev package unless required. So
inherit 'remove-libtool' to have all the .la files cleaned up as they
don't appear to be necessary.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb
index adf2ff9..5564062 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
-inherit distro_features_check gnomebase
+inherit distro_features_check gnomebase remove-libtool
 
 DEPENDS = " \
     intltool-native \
-- 
2.7.4


