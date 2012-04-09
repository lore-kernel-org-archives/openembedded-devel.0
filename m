Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHGTK-0001eM-KQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 17:25:38 +0200
Received: by wibhm17 with SMTP id hm17so2099174wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 08:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=4fO5SEYg2ScujWANEMRGQMBARcNDyoYe3M8IvhnSb6o=;
	b=PVoEHG3OyxgjK8QjMdpo+jmiO+QPGS1cG0xGMK9xgwGwK+GGRFhStz2p9HFVuFrz/P
	BAWgTQuTMeesr+2TX+WoOqwwDyeWdmmVWVxQlMy8GTvJyXoOIzbtropMBeHUOk5sObD8
	Qj3cW/bxWIpsdQfxfeB4wtxXJgSno6b8RFEzgG1HXzQhU6X3XdMAID+eRg6TfaHavVjy
	JQBdP36xd2BEHIHGhV4O+9r4C72Ur5y7sdZekttl/A/qRJNycE7RjoMQ7OPicn2f8AGe
	HsYshUlRFKZwkEbOsYKRiJyjyeZRxujZOl11VRdPx/nEL/zGiyJx5HvrpYycmGKnb3xN
	xFNQ==
Received: by 10.180.91.10 with SMTP id ca10mr16755364wib.17.1333984580890;
	Mon, 09 Apr 2012 08:16:20 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n20sm50102471wiw.5.2012.04.09.08.16.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 08:16:20 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2012 17:16:06 +0200
Message-Id: <1333984573-28464-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
References: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQklYjvUm5wlUXJhgMeNgeT9MxNHJ31Gc0bdJoejKGjgsfUOWYPTpGRq/ZiLtNK4hpc5DuAv
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 03/10] cloud9 0.5.1: use nodejs4 instead of nodejs
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
X-List-Received-Date: Mon, 09 Apr 2012 15:25:38 -0000

This allows using nodejs 0.6.x for apps, but running cloud9 using node4

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-devtools/cloud9/cloud9/cloud9.service  |    2 +-
 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb    |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service b/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
index 027d03a..714b465 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
+++ b/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
@@ -3,7 +3,7 @@ Description=Cloud9 IDE
 ConditionPathExists=|/var/lib/cloud9
 
 [Service]
-ExecStart=/usr/bin/node /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000
+ExecStart=/usr/bin/node4 /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
index 8a3f206..4f74edb 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
 DEPENDS = "libxml2 nodejs-native"
 
-PR = "r15"
+PR = "r16"
 
 SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/o3;destsuffix=o3;name=o3 \
@@ -90,7 +90,7 @@ do_install () {
 
  touch ${D}${bindir}/cloud9
  echo "#!/bin/sh" > ${D}${bindir}/cloud9
- echo "node ${datadir}/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000" >> ${D}${bindir}/cloud9
+ echo "node4 ${datadir}/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000" >> ${D}${bindir}/cloud9
  chmod 0755 ${D}${bindir}/cloud9
 
  install -m 0755 -d ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml
@@ -106,7 +106,7 @@ FILES_${PN}-dbg += "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o
                     ${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/.debug \
                    "
 
-RDEPENDS_${PN} = "nodejs gzip"
+RDEPENDS_${PN} = "nodejs4 gzip"
 
 inherit systemd
 
-- 
1.7.2.5



