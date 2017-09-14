Return-Path: <Rob.Woolley@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32967780B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 02:44:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8E2ih4x015317
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 13 Sep 2017 19:44:43 -0700
Received: from yow-feoserver.wrs.com (128.224.149.92) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 13 Sep 2017 19:44:42 -0700
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Sep 2017 22:44:40 -0400
Message-ID: <1505357080-2240-1-git-send-email-rob.woolley@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v3] gnome-keyring: Resolve conflict with gcr 3 and gold linking error
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
X-List-Received-Date: Thu, 14 Sep 2017 02:44:44 -0000
Content-Type: text/plain

The gnome-keyring is used to configure save certain wifi attributes
when using xfce or a gnome based UI.

Removing org.gnome.crypto.pgp.* makes gnome-keyring compatible with
gcr 3.

The gnome-keyring needs libgmodule to be explicitly added in order
to satisfy the gold linker.  This is necessary because pkg-config
doesn't list libgmodule as one of the libraries for gtk+-2.0.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
---
 .../recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 4ac75cbef..3b4cbf57f 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -20,6 +20,8 @@ SRC_URI += "file://egg-asn1x.patch"
 DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} intltool-native"
 RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
 
+LDFLAGS += "-lgmodule-2.0"
+
 EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
 
 SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
@@ -42,4 +44,11 @@ FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
                     ${libdir}/${BPN}/devel/.debug/ \
                     ${base_libdir}/security/.debug/"
 
-PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from oe-core - the recipe will be removed on 2017-09-01 unless the issue is fixed"
+# Make compatible with gcr version 3 or newer by removing
+# org.gnome.crypto.pgp.*, which is the provider for this optional
+# functionality.
+
+do_install_append() {
+	rm ${D}${datadir}/GConf/gsettings/org.gnome.crypto.pgp.convert
+	rm ${D}${datadir}/glib-2.0/schemas/org.gnome.crypto.pgp.gschema.xml
+}
-- 
2.11.0


