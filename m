Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0bC3-0004iV-GB
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:55 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so626258eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:58:36 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.48.7 as permitted sender) client-ip=10.14.48.7; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.48.7 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.48.7])
	by 10.14.48.7 with SMTP id u7mr1174359eeb.89.1330012716352 (num_hops =
	1); Thu, 23 Feb 2012 07:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5jouFz3LIDSbmBYxSOFc58cQckSff+CGYOlgFPz/rnU=;
	b=pgCVt6/HZMF+AY/Hb07D/XZlBLTErjai7XF9P0OGg5wXv/RZ2emWiIh3AIrgCeQUXq
	qsUIbgvvv5f+29tmBV5mCc6Ht0XingKW/3uY944E/qlfNooYPEsyZ74PJHL6CbLhGFgp
	kuyrG2oBvYk17vJy7RZrBgZvubF9Bt++vXV6A=
Received: by 10.14.48.7 with SMTP id u7mr928578eeb.89.1330012715400;
	Thu, 23 Feb 2012 07:58:35 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm6710108eeb.8.2012.02.23.07.58.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:58:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 16:58:03 +0100
Message-Id: <50aa8367a598c3552a6fc2ed425bdf0eedced1d5.1330012507.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <93f56c062e7a5103f15551808826f76c94779005.1330012507.git.Martin.Jansa@gmail.com>
References: <93f56c062e7a5103f15551808826f76c94779005.1330012507.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330012507.git.Martin.Jansa@gmail.com>
References: <cover.1330012507.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/7] cloud9: use systemd_unitdir variable
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:56 -0000

* maybe we should move systemd_unitdir definition outside systemd.bbclass
  because it's used in few more recipes which doesn't inherit systemd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
index 4e95075..7041527 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
 DEPENDS = "libxml2 nodejs-native"
 
-PR = "r13"
+PR = "r14"
 
 SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/o3;destsuffix=o3;name=o3 \
@@ -98,8 +98,8 @@ do_install () {
  install -m 0644 ${WORKDIR}/o3/modules/o3.js ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.js
  install -m 0755 ${WORKDIR}/o3/o3.node ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.node
 
- install -m 0755 -d ${D}${base_libdir}/systemd/system
- install -m 0644 ${WORKDIR}/cloud9.service ${D}${base_libdir}/systemd/system/
+ install -m 0755 -d ${D}${systemd_unitdir}/system
+ install -m 0644 ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system/
 
   install -m 0755 -d ${D}${sysconfdir}/avahi/services/
   install -m 0644 ${WORKDIR}/cloud9-avahi.service ${D}${sysconfdir}/avahi/services/
@@ -109,7 +109,7 @@ FILES_${PN}-dbg += "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o
                     ${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/.debug \
                    "
 
-FILES_${PN} += "${base_libdir}/systemd/system"
+FILES_${PN} += "${systemd_unitdir}/system"
 RDEPENDS_${PN} = "nodejs gzip"
 
 inherit systemd
-- 
1.7.8.4



