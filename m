Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Puu7V-0005zY-T6
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 23:02:12 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Puu66-0005fF-0Q from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 14:00:42 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 2 Mar 2011 14:00:41 -0800
Received: from localhost.localdomain ([172.30.80.189]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 2 Mar 2011 15:00:40 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2011 15:00:14 -0700
Message-Id: <1299103214-30434-4-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1299103214-30434-1-git-send-email-tom_rini@mentor.com>
References: <1299103214-30434-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 02 Mar 2011 22:00:40.0805 (UTC)
	FILETIME=[45310950:01CBD925]
Subject: [PATCH 3/3] policykit / policykit-gnome: Add 0.100
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
X-List-Received-Date: Wed, 02 Mar 2011 22:02:12 -0000

This version supports shadow or pam auth so we key that off of the
pam DISTRO_FEATURE.  This version is default now that distros
which wouldn't be able to build this due to dependencies lock down
to 0.96.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/policykit/policykit-gnome_0.100.bb |   20 +++++++++
 recipes/policykit/policykit_0.100.bb       |   64 ++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 0 deletions(-)
 create mode 100644 recipes/policykit/policykit-gnome_0.100.bb
 create mode 100644 recipes/policykit/policykit_0.100.bb

diff --git a/recipes/policykit/policykit-gnome_0.100.bb b/recipes/policykit/policykit-gnome_0.100.bb
new file mode 100644
index 0000000..dfbb10c
--- /dev/null
+++ b/recipes/policykit/policykit-gnome_0.100.bb
@@ -0,0 +1,20 @@
+HOMEPAGE = "http://www.packagekit.org/"
+DEPENDS = "policykit libgnome"
+PR = "r0"
+
+inherit autotools pkgconfig gnome
+
+SRC_URI = "http://hal.freedesktop.org/releases/polkit-gnome-${PV}.tar.bz2"
+SRC_URI[md5sum] = "0554fe631e923ed560d65b60661cbbe1"
+SRC_URI[sha256sum] = "d52bbcf6cdb7b0be499e6b220653dccaf0fed860806bdfd8112ef1fd1c26653d"
+
+EXTRA_OECONF = " --disable-man-pages \
+                 --disable-examples \
+                 --disable-gtk-doc \
+"
+
+S = "${WORKDIR}/polkit-gnome-${PV}"
+
+FILES_${PN} += " ${datadir}/dbus-1 \
+                 ${datadir}/PolicyKit \
+               "
diff --git a/recipes/policykit/policykit_0.100.bb b/recipes/policykit/policykit_0.100.bb
new file mode 100644
index 0000000..98cdb9b
--- /dev/null
+++ b/recipes/policykit/policykit_0.100.bb
@@ -0,0 +1,64 @@
+HOMEPAGE = "http://www.packagekit.org/"
+DEPENDS = "expat dbus-glib intltool-native ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+LICENSE = "LGPLv2+"
+PR = "r0"
+
+SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz"
+SRC_URI[md5sum] = "9f957bf046ff5a32b0fa0ffe1e35c09c"
+SRC_URI[sha256sum] = "afe63bec81b7f49e884ea4f2671ec76db121d84d05f36e75cde9b4ca4c828186"
+
+AUTHFW = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', 'shadow', d)}"
+EXTRA_OECONF = "--with-authfw=${AUTHFW} \
+                --with-os-type=${DISTRO} \
+                --disable-man-pages \
+                --disable-gtk-doc \
+                --enable-introspection=no \
+"
+
+S = "${WORKDIR}/polkit-${PV}"
+
+inherit autotools pkgconfig
+
+do_install_append () {
+	install -d ${D}${localstatedir}/run/PolicyKit
+	${@base_contains('DISTRO_FEATURES', 'pam', 'sed -i -e s:system:common:g ${D}${sysconfdir}/pam.d/*', '', d)}
+}
+
+FILES_${PN} += " ${datadir}/dbus-1 \
+                 ${datadir}/PolicyKit ${datadir}/polkit-1\
+                 ${localstatedir}/run/PolicyKit \
+                 ${libdir}/polkit-1/extensions/*.so \
+"
+
+FILES_${PN}-dev += " ${libdir}/polkit-1/extensions/*a"
+
+pkg_postinst_${PN} () {
+    # can't do this offline
+    if [ "x$D" != "x" ]; then
+        exit 1
+    fi
+    grep "^polkituser:" /etc/group > /dev/null || addgroup polkituser
+    grep "^polkituser:" /etc/passwd > /dev/null || adduser --disabled-password --system --home /var/run/polkit polkituser --ingroup polkituser -g polkituser 
+
+	# Fix owners
+	for i in /etc/polkit-1/localauthority /var/lib/polkit-1 ; do
+		mkdir -p $i
+		chown root $i
+		chmod 700 $i
+	done
+
+	for i in /usr/libexec/polkit-agent-helper-1 /usr/bin/pkexec ; do
+		chown root $i
+		chmod 4755 $i
+	done
+
+	DBUSPID=`pidof dbus-daemon`
+    if [ "x$DBUSPID" != "x" ]; then
+        /etc/init.d/dbus-1 force-reload
+    fi
+}
+
+pkg_postrm_${PN} () {
+    deluser polkituser || true
+    delgroup polkituser || true
+}
-- 
1.7.0.4



