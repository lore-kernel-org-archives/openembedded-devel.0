Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PoL8m-0002DN-2L
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 20:28:20 +0100
Received: by bwz10 with SMTP id 10so4060890bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Feb 2011 11:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=G8nyvukRBLnFqiDLAJLgFaQesBQdQowiNDaSMVQZcws=;
	b=klsWXS2q6pCB6mxTCWMPpqVth15Tic7LzYWXz84ldP4fTJvMJycisQITfMIpkEtD/F
	V2OBWuE246Jitu9KafgIvBP/A+VzC0roVdp9ILU2HJ+3EA4PwUvQXxn5Ga2VE63GnusA
	clcKmBY7gmmCzWA6WzfA87aeOrjxUtsBr46e4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=oddasmKMfJZtdQOEyFLbvslc5/B17nuoR7j2lq+HKG9TEWQ7TzYwtN8Ylv6wMKaZPe
	DHx007HO50n1Hyb9c94UvoSdkoaduok5YrFF2g0Y6OQLw23T8irDqj5Suhz0RC5xiyjx
	ALlgJbHOwmDhMjHTd+S7/gwkpGwmHkFRctKd4=
Received: by 10.204.70.134 with SMTP id d6mr1783880bkj.21.1297538829429;
	Sat, 12 Feb 2011 11:27:09 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id b6sm537020bkb.10.2011.02.12.11.27.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Feb 2011 11:27:08 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Feb 2011 20:26:58 +0100
Message-Id: <1297538818-30102-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] deb packages support: switch from /var/dpkg to /var/lib/dpkg
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
X-List-Received-Date: Sat, 12 Feb 2011 19:28:20 -0000

OE generally tries to use /var/dpkg, but the change is missing
in some places, so it is needed to move completely to one of the
options. Keeping the dpkg's default /var/lib/dpkg causes less
maintenance overhead for OE.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/rootfs_deb.bbclass                         |   36 ++++++++++----------
 recipes/apt/files/apt.conf                         |    4 +-
 recipes/dpkg/dpkg-native.inc                       |    2 +-
 recipes/dpkg/dpkg_1.14.29.bb                       |    1 +
 recipes/meta/run-postinsts/run-postinsts           |    2 +-
 recipes/meta/run-postinsts/run-postinsts.awk       |    2 +-
 .../update-alternatives-dpkg-native_1.13.25.bb     |    3 +-
 .../update-alternatives-dpkg-native_1.14.29.bb     |    3 +-
 .../update-alternatives-dpkg_1.13.25.bb            |    3 +-
 .../update-alternatives-dpkg_1.14.29.bb            |    3 +-
 10 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/classes/rootfs_deb.bbclass b/classes/rootfs_deb.bbclass
index 6a87c7d..2130ad6 100644
--- a/classes/rootfs_deb.bbclass
+++ b/classes/rootfs_deb.bbclass
@@ -9,14 +9,14 @@ do_rootfs[recrdeptask] += "do_package_write_deb"
 
 fakeroot rootfs_deb_do_rootfs () {
 	set +e
-	mkdir -p ${IMAGE_ROOTFS}/var/dpkg/info
-	mkdir -p ${IMAGE_ROOTFS}/var/dpkg/updates
+	mkdir -p ${IMAGE_ROOTFS}/var/lib/dpkg/info
+	mkdir -p ${IMAGE_ROOTFS}/var/lib/dpkg/updates
 
 	rm -f ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev
 	rm -f ${STAGING_ETCDIR_NATIVE}/apt/preferences
-	> ${IMAGE_ROOTFS}/var/dpkg/status
-	> ${IMAGE_ROOTFS}/var/dpkg/available
-	mkdir -p ${IMAGE_ROOTFS}/var/dpkg/alternatives
+	> ${IMAGE_ROOTFS}/var/lib/dpkg/status
+	> ${IMAGE_ROOTFS}/var/lib/dpkg/available
+	mkdir -p ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives
 
 	priority=1
 	for arch in ${PACKAGE_ARCHS}; do
@@ -44,8 +44,8 @@ fakeroot rootfs_deb_do_rootfs () {
 
 	cat "${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample" \
 		| sed -e 's#Architecture ".*";#Architecture "${DPKG_ARCH}";#' \
-	        | sed -e 's#status ".*";#status "${IMAGE_ROOTFS}/var/dpkg/status";#' \ 
-		| sed -e 's#DPkg::Options {".*"};#DPkg::Options {"--root=${IMAGE_ROOTFS}";"--admindir=${IMAGE_ROOTFS}/var/dpkg";"--force-all";"--no-debsig"};#' \
+	        | sed -e 's#status ".*";#status "${IMAGE_ROOTFS}/var/lib/dpkg/status";#' \ 
+		| sed -e 's#DPkg::Options {".*"};#DPkg::Options {"--root=${IMAGE_ROOTFS}";"--admindir=${IMAGE_ROOTFS}/var/lib/dpkg";"--force-all";"--no-debsig"};#' \
 		> "${STAGING_ETCDIR_NATIVE}/apt/apt-rootfs.conf"
 
 	export APT_CONFIG="${STAGING_ETCDIR_NATIVE}/apt/apt-rootfs.conf"
@@ -57,10 +57,10 @@ fakeroot rootfs_deb_do_rootfs () {
 	apt-get update
 
 	_flag () {
-		sed -i -e "/^Package: $2\$/{n; s/Status: install ok .*/Status: install ok $1/;}" ${IMAGE_ROOTFS}/var/dpkg/status
+		sed -i -e "/^Package: $2\$/{n; s/Status: install ok .*/Status: install ok $1/;}" ${IMAGE_ROOTFS}/var/lib/dpkg/status
 	}
 	_getflag () {
-		cat ${IMAGE_ROOTFS}/var/dpkg/status | sed -n -e "/^Package: $2\$/{n; s/Status: install ok .*/$1/; p}"
+		cat ${IMAGE_ROOTFS}/var/lib/dpkg/status | sed -n -e "/^Package: $2\$/{n; s/Status: install ok .*/$1/; p}"
 	}
 
 	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
@@ -102,11 +102,11 @@ fakeroot rootfs_deb_do_rootfs () {
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
 
 	# Mark all packages installed
-	sed -i -e "s/Status: install ok unpacked/Status: install ok installed/;" ${IMAGE_ROOTFS}/var/dpkg/status
+	sed -i -e "s/Status: install ok unpacked/Status: install ok installed/;" ${IMAGE_ROOTFS}/var/lib/dpkg/status
 
 	# Attempt to run preinsts
 	# Mark packages with preinst failures as unpacked
-	for i in ${IMAGE_ROOTFS}/var/dpkg/info/*.preinst; do
+	for i in ${IMAGE_ROOTFS}/var/lib/dpkg/info/*.preinst; do
 		if [ -f $i ] && ! sh $i; then
 			_flag unpacked `basename $i .preinst`
 		fi
@@ -114,7 +114,7 @@ fakeroot rootfs_deb_do_rootfs () {
 
 	# Attempt to run postinsts
 	# Mark packages with postinst failures as unpacked
-	for i in ${IMAGE_ROOTFS}/var/dpkg/info/*.postinst; do
+	for i in ${IMAGE_ROOTFS}/var/lib/dpkg/info/*.postinst; do
 		if [ -f $i ] && ! sh $i configure; then
 			_flag unpacked `basename $i .postinst`
 		fi
@@ -124,13 +124,13 @@ fakeroot rootfs_deb_do_rootfs () {
 
 	# Hacks to allow opkg's update-alternatives and opkg to coexist for now
 	mkdir -p ${IMAGE_ROOTFS}${libdir}/opkg/alternatives
-	if [ -e ${IMAGE_ROOTFS}/var/dpkg/alternatives ]; then
-		mv ${IMAGE_ROOTFS}/var/dpkg/alternatives/* ${IMAGE_ROOTFS}${libdir}/opkg/alternatives/
-		rmdir ${IMAGE_ROOTFS}/var/dpkg/alternatives
+	if [ -e ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives ]; then
+		mv ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives/* ${IMAGE_ROOTFS}${libdir}/opkg/alternatives/
+		rmdir ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives
 	fi
-	ln -s ${libdir}/opkg/alternatives ${IMAGE_ROOTFS}/var/dpkg/alternatives
-	ln -s /var/dpkg/info ${IMAGE_ROOTFS}${libdir}/opkg/info
-	ln -s /var/dpkg/status ${IMAGE_ROOTFS}${libdir}/opkg/status
+	ln -s ${libdir}/opkg/alternatives ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives
+	ln -s /var/lib/dpkg/info ${IMAGE_ROOTFS}${libdir}/opkg/info
+	ln -s /var/lib/dpkg/status ${IMAGE_ROOTFS}${libdir}/opkg/status
 
 	${ROOTFS_POSTPROCESS_COMMAND}
 
diff --git a/recipes/apt/files/apt.conf b/recipes/apt/files/apt.conf
index 2bd9ddb..5b18b91 100644
--- a/recipes/apt/files/apt.conf
+++ b/recipes/apt/files/apt.conf
@@ -3,7 +3,7 @@ Dir "${STAGING_DIR_NATIVE}/"
    State "var/lib/apt/"
    {
       Lists "lists/";
-      status "${IMAGE_ROOTFS}/var/dpkg/status";
+      status "${IMAGE_ROOTFS}/var/lib/dpkg/status";
    };
    Cache "var/cache/apt/"
    {
@@ -39,5 +39,5 @@ APT
   };
 };
 
-DPkg::Options {"--root=${IMAGE_ROOTFS}";"--admindir=${IMAGE_ROOTFS}/var/dpkg";"--force-all";"--no-debsig"};
+DPkg::Options {"--root=${IMAGE_ROOTFS}";"--admindir=${IMAGE_ROOTFS}/var/lib/dpkg";"--force-all";"--no-debsig"};
 };
diff --git a/recipes/dpkg/dpkg-native.inc b/recipes/dpkg/dpkg-native.inc
index f7b243c..e97b511 100644
--- a/recipes/dpkg/dpkg-native.inc
+++ b/recipes/dpkg/dpkg-native.inc
@@ -18,7 +18,7 @@ EXTRA_OECONF = "--without-static-progs \
 		--with-zlib \
 		--with-bz2lib \
 		--without-selinux \
-		--with-admindir='\$\$$ENV{D}/var/dpkg' \
+		--with-admindir='\$\$$ENV{D}/var/lib/dpkg' \
 		--without-sgml-doc"
 
 do_stage_append() {
diff --git a/recipes/dpkg/dpkg_1.14.29.bb b/recipes/dpkg/dpkg_1.14.29.bb
index 92c8a96..aea7bea 100644
--- a/recipes/dpkg/dpkg_1.14.29.bb
+++ b/recipes/dpkg/dpkg_1.14.29.bb
@@ -11,4 +11,5 @@ EXTRA_OECONF = "--without-static-progs \
 		--with-start-stop-daemon \
 		--with-zlib \
 		--with-bz2lib \
+		--with-admindir='/var/lib/dpkg' \
 		--without-sgml-doc"
diff --git a/recipes/meta/run-postinsts/run-postinsts b/recipes/meta/run-postinsts/run-postinsts
index f632d1c..584a92e 100755
--- a/recipes/meta/run-postinsts/run-postinsts
+++ b/recipes/meta/run-postinsts/run-postinsts
@@ -5,7 +5,7 @@
 # Author: Richard Purdie <rpurdie@openedhand.com>
 #
 
-PKGSYSTEM=/var/dpkg
+PKGSYSTEM=/var/lib/dpkg
 
 if [ ! -e $PKGSYSTEM/status ]; then
   if [ -e /usr/lib/opkg/status ]; then
diff --git a/recipes/meta/run-postinsts/run-postinsts.awk b/recipes/meta/run-postinsts/run-postinsts.awk
index 09a1400..d92200b 100644
--- a/recipes/meta/run-postinsts/run-postinsts.awk
+++ b/recipes/meta/run-postinsts/run-postinsts.awk
@@ -9,7 +9,7 @@
 BEGIN {
   rc=system("test -d /usr/dpkg/info/")
   if (rc==0)
-    pkgdir="/var/dpkg/info"
+    pkgdir="/var/lib/dpkg/info"
   else
     pkgdir="/usr/lib/opkg/info"
   package=""
diff --git a/recipes/update-alternatives/update-alternatives-dpkg-native_1.13.25.bb b/recipes/update-alternatives/update-alternatives-dpkg-native_1.13.25.bb
index 0edb7ae..eca5c57 100644
--- a/recipes/update-alternatives/update-alternatives-dpkg-native_1.13.25.bb
+++ b/recipes/update-alternatives/update-alternatives-dpkg-native_1.13.25.bb
@@ -1,6 +1,7 @@
 require update-alternatives-dpkg.inc
 inherit native
 
+PR = "r1"
 PROVIDES += "virtual/update-alternatives-native"
 DEPENDS = "perl-native"
 DEFAULT_PREFERENCE = "-1"
@@ -9,7 +10,7 @@ SRC_URI += "file://paths.patch"
 
 do_stage () {
     install -d ${sbindir} \
-               ${localstatedir}/dpkg/alternatives \
+               ${localstatedir}/lib/dpkg/alternatives \
                ${sysconfdir}/alternatives
 
     install -m 0755 scripts/update-alternatives ${sbindir}/update-alternatives
diff --git a/recipes/update-alternatives/update-alternatives-dpkg-native_1.14.29.bb b/recipes/update-alternatives/update-alternatives-dpkg-native_1.14.29.bb
index 388988d..fdb084c 100644
--- a/recipes/update-alternatives/update-alternatives-dpkg-native_1.14.29.bb
+++ b/recipes/update-alternatives/update-alternatives-dpkg-native_1.14.29.bb
@@ -1,6 +1,7 @@
 require update-alternatives-dpkg.inc
 inherit native
 
+PR="r1"
 PROVIDES += "virtual/update-alternatives-native"
 DEPENDS = "perl-native"
 DEFAULT_PREFERENCE = "-1"
@@ -9,7 +10,7 @@ SRC_URI += "file://update-alternatives-native.patch"
 
 do_stage () {
     install -d ${sbindir} \
-               ${localstatedir}/dpkg/alternatives \
+               ${localstatedir}/lib/dpkg/alternatives \
                ${sysconfdir}/alternatives
 
     install -m 0755 scripts/update-alternatives ${sbindir}/update-alternatives
diff --git a/recipes/update-alternatives/update-alternatives-dpkg_1.13.25.bb b/recipes/update-alternatives/update-alternatives-dpkg_1.13.25.bb
index fc8701a..57e2741 100644
--- a/recipes/update-alternatives/update-alternatives-dpkg_1.13.25.bb
+++ b/recipes/update-alternatives/update-alternatives-dpkg_1.13.25.bb
@@ -1,5 +1,6 @@
 require update-alternatives-dpkg.inc
 
+PR="r1"
 RPROVIDES_${PN} = "update-alternatives"
 RDEPENDS_${PN} = "perl dpkg"
 
@@ -7,7 +8,7 @@ SRC_URI += "file://paths.patch"
 
 do_install () {
     install -d ${D}${sbindir} \
-               ${D}${localstatedir}/dpkg/alternatives \
+               ${D}${localstatedir}/lib/dpkg/alternatives \
                ${D}${sysconfdir}/alternatives
 
     install -m 0755 scripts/update-alternatives ${D}${sbindir}/update-alternatives
diff --git a/recipes/update-alternatives/update-alternatives-dpkg_1.14.29.bb b/recipes/update-alternatives/update-alternatives-dpkg_1.14.29.bb
index 4ad681e..24e6b95 100644
--- a/recipes/update-alternatives/update-alternatives-dpkg_1.14.29.bb
+++ b/recipes/update-alternatives/update-alternatives-dpkg_1.14.29.bb
@@ -1,11 +1,12 @@
 require update-alternatives-dpkg.inc
 
+PR="r1"
 RPROVIDES_${PN} = "update-alternatives"
 RDEPENDS_${PN} = "perl dpkg"
 
 do_install () {
     install -d ${D}${sbindir} \
-               ${D}${localstatedir}/dpkg/alternatives \
+               ${D}${localstatedir}/lib/dpkg/alternatives \
                ${D}${sysconfdir}/alternatives
 
     install -m 0755 scripts/update-alternatives ${D}${sbindir}/update-alternatives
-- 
1.7.1



