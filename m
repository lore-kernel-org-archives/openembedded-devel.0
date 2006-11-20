Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1Gm0sY-0001Kv-IQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Nov 2006 05:35:35 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id E84E6D3486
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2006 15:32:55 +1100 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30975-03
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2006 15:32:54 +1100 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id B7E0DD32F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2006 15:32:54 +1100 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id AFB52162D799; Mon, 20 Nov 2006 15:32:54 +1100 (EST)
Date: Mon, 20 Nov 2006 15:32:54 +1100
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061120043254.GA19760@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
Mime-Version: 1.0
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Changes to populate-volatile.sh / new volatiles class
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Nov 2006 04:35:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The current populate-volatile.sh script uses it's cache (if it exists
and caching is enabled) but it doesn't add any new volatiles to it
unless you manually delete the cache, and even then it regenerates
the cache only with the entries for things that don't currently exist
on the system.

If no one has any complaints/comments I'll submit a change to fix
this in a day or two.

The patch does the following:

 - Modifies populate-volatile.sh to take an optional "update"
   parameter.  When this parameter is supplied any existing cache
   will not be used and it will regenerate the cache (if caching is
   enabled).

 - Modifies populate-volatile.sh so that when it is generating the
   cache it includes entries for *all* volatiles, not just those that
   do not currently exist. Otherwise an update doesn't add cache
   entries for things that have been previously created (ie, it runs
   at boot and creates everything properly, you install a package
   that adds new volatiles, it re-creates the cache but only with the
   new entries - when what we really want is *all* the entries that
   will be needed on next boot.)

 - Adds a volatiles class, which adds the required postinst call to
   populate-volatile.sh and passes it the update parameter to make
   sure the cache is regenerated (if it is being used) to save hand
   coding this everywhere and making it easier to change in the
   future should we need/want to.

 - Update a few .bb's to use the volatiles class as an example.

I'll also update the PR's and the other recipes using volatiles
before committing.

# 
# old_revision [22460f91f272d761c91ae1f227c56096af0d96cb]
# 
# add_file "classes/volatiles.bbclass"
#  content [58274cb50476640ea36b150e0ab151b1f2a8ac4c]
# 
# patch "packages/clamav/clamav.inc"
#  from [38c039e24b51d9e84dd932f70340316fb62f3d15]
#    to [6d554556442a3a834f65921fe0749de5cff8783b]
# 
# patch "packages/initscripts/initscripts-1.0/populate-volatile.sh"
#  from [d9e4b52470ac67315a89357e02b70cff504772c0]
#    to [fc2de44fc6057c5e6218d20907de11060c9e9028]
# 
# patch "packages/p3scan/p3scan_2.9.05d.bb"
#  from [c27e7b9f743ff741b34c7b692310a5051f5be1d5]
#    to [70dae16e7a4ec8ebddb6b104ad192627d974d57f]
# 
# patch "packages/postfix/postfix_2.0.20.bb"
#  from [552c854fd35a5bd3a96793c4653d2640f6cf0518]
#    to [61dd626233e0d97ffdb8501c47e953bd6936210f]
# 
============================================================
--- classes/volatiles.bbclass	58274cb50476640ea36b150e0ab151b1f2a8ac4c
+++ classes/volatiles.bbclass	58274cb50476640ea36b150e0ab151b1f2a8ac4c
@@ -0,0 +1,49 @@
+#
+# Include this class if you require volatile (/var) items.
+#
+# If also using update-rc.d then you should inherit this after
+# update-rc.d to ensure that the volatiles are created prior to the
+# application being started.
+#
+# The files, directories and symlinks are definied by the entry
+# your package adds under /etc/default/volatiles
+#
+# By default this class works on $PN only. To change the list of
+# packages this class works on you should set VOLATILES_PACKAGES to
+# the list of packages.
+#
+
+#
+# Create any required volatile entries after installation. Pass the
+# update parameter to force new entries to be processed and the cache
+# to be regenerated.
+#
+volatiles_postinst() {
+if [ "x$D" = "x" ]; then
+    ${sysconfdir}/init.d/populate-volatile.sh update
+fi
+}
+
+python populate_packages_prepend () {
+	def update_volatile_package(pkg):
+		bb.debug(1, 'adding volatiles calls to postinst for %s' % pkg)
+		localdata = bb.data.createCopy(d)
+		overrides = bb.data.getVar("OVERRIDES", localdata, 1)
+		bb.data.setVar("OVERRIDES", "%s:%s" % (pkg, overrides), localdata)
+		bb.data.update_data(localdata)
+
+		postinst = bb.data.getVar('pkg_postinst', localdata, 1)
+		if not postinst:
+			postinst = '#!/bin/sh\n'
+		postinst += bb.data.getVar('volatiles_postinst', localdata, 1)
+		bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)
+
+	pkgs = bb.data.getVar('VOLATILES_PACKAGES', d, 1)
+	if pkgs == None:
+		pkgs = bb.data.getVar('PN', d, 1)
+		packages = (bb.data.getVar('PACKAGES', d, 1) or "").split()
+		if not pkgs in packages and packages != []:
+			pkgs = packages[0]
+	for pkg in pkgs.split():
+		update_volatile_package(pkg)
+}
============================================================
--- packages/clamav/clamav.inc	38c039e24b51d9e84dd932f70340316fb62f3d15
+++ packages/clamav/clamav.inc	6d554556442a3a834f65921fe0749de5cff8783b
@@ -28,7 +28,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/clamav/
           file://volatiles.03_clamav-daemon \
           file://volatiles.03_clamav-freshclam"
 
-inherit autotools update-rc.d binconfig
+inherit autotools update-rc.d binconfig volatiles
 
 # Don't check for clamav uid/gid - they don't exist on the host
 # Put virus definitions in /var/lib not /usr/lib
@@ -93,21 +93,18 @@ pkg_postinst_${PN}-freshclam () {
         grep -q clamav: /etc/passwd || \
             adduser --disabled-password --home=/var/lib/clamav/ --system \
                     --ingroup clamav --no-create-home -g "ClamAV" clamav
-        /etc/init.d/populate-volatile.sh
 }
 pkg_postinst_${PN}-daemon () {
         grep -q clamav: /etc/group || addgroup clamav
         grep -q clamav: /etc/passwd || \
             adduser --disabled-password --home=/var/lib/clamav/ --system \
                     --ingroup clamav --no-create-home -g "ClamAV" clamav
-        /etc/init.d/populate-volatile.sh
 }
 pkg_postinst_${PN}-data () {
         grep -q clamav: /etc/group || addgroup clamav
         grep -q clamav: /etc/passwd || \
             adduser --disabled-password --home=/var/lib/clamav/ --system \
                     --ingroup clamav --no-create-home -g "ClamAV" clamav
-        /etc/init.d/populate-volatile.sh
 }
 
 # Indicate that the default files are configuration files
@@ -120,3 +117,5 @@ INITSCRIPT_PARAMS_${PN}-freshclam = "def
 INITSCRIPT_NAME_${PN}-freshclam = "clamav-freshclam"
 INITSCRIPT_PARAMS_${PN}-daemon = "defaults 50 50"
 INITSCRIPT_PARAMS_${PN}-freshclam = "defaults 50 50"
+
+VOLATILES_PACKAGES = "${PN}-data ${PN}-freshclam ${PN}-daemon"
============================================================
--- packages/initscripts/initscripts-1.0/populate-volatile.sh	d9e4b52470ac67315a89357e02b70cff504772c0
+++ packages/initscripts/initscripts-1.0/populate-volatile.sh	fc2de44fc6057c5e6218d20907de11060c9e9028
@@ -15,8 +15,12 @@ create_file() {
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 " 
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache
-	
-	eval $EXEC &
+
+	[ -e "$1" ] && {
+	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
+	} || {
+	  eval $EXEC &
+	}
 }
 
 mk_dir() {
@@ -27,7 +31,11 @@ mk_dir() {
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache
 	
-	eval $EXEC &
+	[ -e "$1" ] && {
+	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
+	} || {
+	  eval $EXEC &
+	}
 }
 
 link_file() {
@@ -35,7 +43,11 @@ link_file() {
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache
 	
-	eval $EXEC &
+	[ -e "$2" ] && {
+	  echo "Cannot create link over existing -${TNAME}-." >&2
+	} || {
+	  eval $EXEC &
+	}
 }
 
 check_requirements() {
@@ -109,14 +121,10 @@ apply_cfgfile() {
 
 
     [ "${TTYPE}" = "l" ] && {
-      [ -e "${TNAME}" ] && {
-        echo "Cannot create link over existing -${TNAME}-." >&2
-        } || {
-        TSOURCE="$TLTARGET"
-	[ -L "${TNAME}" ] || {
-          [ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
-          link_file "${TSOURCE}" "${TNAME}" &
-	  }
+      TSOURCE="$TLTARGET"
+      [ -L "${TNAME}" ] || {
+        [ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
+        link_file "${TSOURCE}" "${TNAME}" &
         }
       continue
       }
@@ -133,11 +141,6 @@ apply_cfgfile() {
         }
       }
 
-    [ -e "${TNAME}" ] && {
-      [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
-      continue
-      }
-
     case "${TTYPE}" in
       "f")  [ "${VERBOSE}" != "no" ] && echo "Creating file -${TNAME}-."
             create_file "${TNAME}" &
@@ -158,7 +161,7 @@ apply_cfgfile() {
 
   }
 
-if test -e /etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes"
+if test -e /etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "xupdate"
 then
 	sh /etc/volatile.cache
 else	
============================================================
--- packages/p3scan/p3scan_2.9.05d.bb	c27e7b9f743ff741b34c7b692310a5051f5be1d5
+++ packages/p3scan/p3scan_2.9.05d.bb	70dae16e7a4ec8ebddb6b104ad192627d974d57f
@@ -16,7 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/p3scan/
            file://doc.configure.txt \
            file://volatiles.05_p3scan"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d volatiles
 
 EXTRA_OECONF = "--with-clamav=${STAGING_LIBDIR}/.. \
                 --with-openssl=${STAGING_LIBDIR}/.. \
@@ -76,7 +76,6 @@ pkg_postinst_${PN} () {
         grep -q mail: /etc/passwd || \
             adduser --disabled-password --home=${localstatedir}/mail --system \
                     --ingroup mail --no-create-home -g "Mail" mail
-        /etc/init.d/populate-volatile.sh
 }
 
 CONFFILES_${PN} = "${sysconfdir}/p3scan/p3scan.conf"
============================================================
--- packages/postfix/postfix_2.0.20.bb	552c854fd35a5bd3a96793c4653d2640f6cf0518
+++ packages/postfix/postfix_2.0.20.bb	61dd626233e0d97ffdb8501c47e953bd6936210f
@@ -13,7 +13,7 @@ S = "${WORKDIR}/postfix-${PV}"
 
 S = "${WORKDIR}/postfix-${PV}"
 
-inherit update-rc.d
+inherit update-rc.d volatiles
 
 INITSCRIPT_NAME = "postfix"
 INITSCRIPT_PARAMS = "start 58 3 4 5 . stop 13 0 1 6 ."
@@ -64,7 +64,6 @@ pkg_postinst () {
 	rm -f /var/tmp/main_cf.sh
 	chmod 644 /etc/postfix/main.cf
 	[ -d /var/spool/postfix ] && rmdir /var/spool/postfix
-	/etc/init.d/populate-volatile.sh
 	touch /etc/aliases
 	newaliases
 	update-alternatives --install sendmail sendmail ${sbindir}/sendmail.${PN} 40

-- 
 Jamie Lenehan <lenehan@twibble.org>


