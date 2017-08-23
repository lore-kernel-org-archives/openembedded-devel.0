Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD06A782EC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 17:45:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7NHjK0L020416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 10:45:20 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 10:45:20 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Aug 2017 10:45:20 -0700
Message-ID: <20170823174520.61466-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] gnome-keyring: Fix compatibility with gcr 3 in oe-core
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
X-List-Received-Date: Wed, 23 Aug 2017 17:45:20 -0000
Content-Type: text/plain

The gnome-keyring is used to configure save certain wifi attributes
when using xfce or a gnome based UI.  This patch restores and fixes
the recipe removed by commit 9a53ba969ba69c59735fdc56e9f88a3430596590
in meta-openembedded's master-next branch.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../gnome-keyring/gnome-keyring_2.32.1.bb          | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
new file mode 100644
index 000000000..e22a360e3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -0,0 +1,53 @@
+SUMMARY = "Password and keyring managing daemon"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://gcr/gcr.h;endline=22;md5=a272df1e633e27ecf35e74fb5576250e \
+                    file://egg/egg-dbus.h;endline=25;md5=eb6f531af37165dc53420c073d774e61 \
+                    file://gp11/gp11.h;endline=24;md5=bd8c7a8a21d6c28d40536d96a35e3469 \
+                    file://pkcs11/pkcs11i.h;endline=24;md5=e72cfbb718389b76a4dae838d1c1f439"
+
+SECTION = "x11/gnome"
+
+PR = "r12"
+
+inherit autotools gnome gtk-doc pkgconfig gsettings
+
+SRC_URI += "file://egg-asn1x.patch"
+
+DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} intltool-native"
+RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
+
+EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
+
+SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
+SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8d6a1b44287f1e9e595b3594df46bf7f18f9"
+GNOME_COMPRESS_TYPE="bz2"
+
+FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr \
+                ${base_libdir}/security/*${SOLIBSDEV} \
+               "
+
+FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
+                    ${libdir}/${BPN}/devel/*${SOLIBSDEV} \
+                    ${libdir}/${BPN}/standalone/*.la \
+                    ${base_libdir}/security/*.la \
+                   "
+
+INSANE_SKIP_${PN}-dev += "dev-elf"
+
+FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
+                    ${libdir}/${BPN}/devel/.debug/ \
+                    ${base_libdir}/security/.debug/"
+
+# Make compatible with gcr version 3 or newer by removing
+# org.gnome.crypto.pgp.*, which is the provider for this optional
+# functionality.
+
+do_install_append() {
+	rm ${D}${datadir}/GConf/gsettings/org.gnome.crypto.pgp.convert
+	rm ${D}${datadir}/glib-2.0/schemas/org.gnome.crypto.pgp.gschema.xml
+}
+
-- 
2.11.0


