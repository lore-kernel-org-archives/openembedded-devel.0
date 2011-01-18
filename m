Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PfDLN-0006EX-G4
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 16:19:37 +0100
Received: by iyj18 with SMTP id 18so6006443iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 07:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=KR+o7Ld9ZHYfOG2yvq+ghXypCnPxCX6ps0UXgkxpmt0=;
	b=cjzNp3OerE7eM+GICaajvkJbfsiRG29CMh6wh58MlykCg6IDGpJLt6IUOU9JgZTUAs
	dRtW48uinqMgO2KZCTkvfOW3WSoR8DZq5nbaqaHW4G8UU9UASPUwQAsfMhjnEsjwY4rl
	251G3f+KE3VmHZPjIm3WtU+virM8f67oB0bpY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=a2nOB3Gm9BM+M5v51tVH64qxkrniBIIFmJBQfxBoUkCdFVqlDKfRyfZIZ7el/dA6OL
	2zMPaLTuV5qxvaw653utBX0FUfrr9Id2m5CEUJFoII5+WirGqX6lTjremnSBBAib2mmN
	uANMIs34AJJCAd87zZ9durEyJ5E6KTlrrlIUE=
Received: by 10.42.179.194 with SMTP id br2mr3495000icb.339.1295363938183;
	Tue, 18 Jan 2011 07:18:58 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id f5sm4564018icu.16.2011.01.18.07.18.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 Jan 2011 07:18:56 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jan 2011 08:18:47 -0700
Message-Id: <1295363929-13246-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
References: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/4] Move stage-manager-* into bin/ rather than a recipe
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
X-List-Received-Date: Tue, 18 Jan 2011 15:19:37 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 {recipes/stage-manager/files => bin}/stage-manager |    3 --
 .../stage-manager/files => bin}/stage-manager-ipkg |   26 ++++++++++----------
 .../files => bin}/stage-manager-ipkg-build         |    6 ++--
 classes/base.bbclass                               |    5 +--
 classes/packaged-staging.bbclass                   |    5 ----
 recipes/stage-manager/stagemanager-native_0.0.1.bb |   26 --------------------
 6 files changed, 18 insertions(+), 53 deletions(-)
 rename {recipes/stage-manager/files => bin}/stage-manager (99%)
 rename {recipes/stage-manager/files => bin}/stage-manager-ipkg (98%)
 rename {recipes/stage-manager/files => bin}/stage-manager-ipkg-build (99%)
 delete mode 100644 recipes/stage-manager/stagemanager-native_0.0.1.bb

diff --git a/recipes/stage-manager/files/stage-manager b/bin/stage-manager
similarity index 99%
rename from recipes/stage-manager/files/stage-manager
rename to bin/stage-manager
index 0c01a18..5b47791 100755
--- a/recipes/stage-manager/files/stage-manager
+++ b/bin/stage-manager
@@ -151,6 +151,3 @@ if __name__ == "__main__":
     if found_difference:
         sys.exit(5)
     sys.exit(0)
-
-
-
diff --git a/recipes/stage-manager/files/stage-manager-ipkg b/bin/stage-manager-ipkg
similarity index 98%
rename from recipes/stage-manager/files/stage-manager-ipkg
rename to bin/stage-manager-ipkg
index 105ea54..456bc78 100755
--- a/recipes/stage-manager/files/stage-manager-ipkg
+++ b/bin/stage-manager-ipkg
@@ -131,15 +131,15 @@ Valid destinations are directories or one of the dest names from $IPKG_CONF:" >&
 	IPKG_HTTP_PROXY=`ipkg_option http_proxy`
 	IPKG_FTP_PROXY=`ipkg_option ftp_proxy`
 	IPKG_NO_PROXY=`ipkg_option no_proxy`
-	if [ -n "$IPKG_HTTP_PROXY" ]; then 
+	if [ -n "$IPKG_HTTP_PROXY" ]; then
 		export http_proxy="$IPKG_HTTP_PROXY"
 	fi
 
-	if [ -n "$IPKG_FTP_PROXY" ]; then 
+	if [ -n "$IPKG_FTP_PROXY" ]; then
 		export ftp_proxy="$IPKG_FTP_PROXY"
 	fi
 
-	if [ -n "$IPKG_NO_PROXY" ]; then 
+	if [ -n "$IPKG_NO_PROXY" ]; then
 		export no_proxy="$IPKG_NO_PROXY"
 	fi
 
@@ -175,7 +175,7 @@ Options:
 				configuration file, (but can also be a directory
 				name in a pinch).
         -o <offline_root>       Use <offline_root> as the root for offline installation.
-        -offline <offline_root> 				
+        -offline <offline_root>
 
 Force Options (use when ipkg is too smart for its own good):
 	-force-depends          Make dependency checks warnings instead of errors
@@ -221,7 +221,7 @@ ipkg_download() {
 	local proxyuser=""
 	local proxypassword=""
 	local proxyoption=""
-		
+
 	if [ -n "$IPKG_PROXY_USERNAME" ]; then
 		proxyuser="--proxy-user=\"$IPKG_PROXY_USERNAME\""
 		proxypassword="--proxy-passwd=\"$IPKG_PROXY_PASSWORD\""
@@ -276,7 +276,7 @@ ipkg_update() {
 
 ipkg_list() {
 	for src in `ipkg_src_names`; do
-		if ipkg_require_list $src; then 
+		if ipkg_require_list $src; then
 # black magic...
 sed -ne "
 /^Package:/{
@@ -342,7 +342,7 @@ ipkg_info() {
 			case $# in
 			0)
 				cat $IPKG_LISTS_DIR/$src
-				;;	
+				;;
 			1)
 				ipkg_extract_paragraph $1 < $IPKG_LISTS_DIR/$src
 				;;
@@ -545,7 +545,7 @@ ipkg_safe_pkg_name() {
 }
 
 ipkg_set_depends() {
-	local pkg=$1; shift 
+	local pkg=$1; shift
 	local new_deps="$*"
 	pkg=`ipkg_safe_pkg_name $pkg`
 	## setvar ${pkg}_depends "$new_deps"
@@ -672,7 +672,7 @@ Status: install ok not-installed" | ipkg_status_update_sd $sd $pkg
 				new_pkgs="$new_pkgs $pkg"
 				### echo "Dependences not satisfied for $pkg: $remaining_deps"
 				if [ $curcheck -ne `echo  $pkgs|wc -w` ]; then
-			        	continue
+					continue
 				fi
 			fi
 
@@ -886,7 +886,7 @@ diff -u $dest/$conffile $IPKG_TMP/$pkg/data/$conffile"
 	fi
 
 	local owd=`pwd`
-	(cd $IPKG_TMP/$pkg/data/; tar cf - . | (cd $owd; cd $dest; tar xf -))		
+	(cd $IPKG_TMP/$pkg/data/; tar cf - . | (cd $owd; cd $dest; tar xf -))
 	rm -rf $IPKG_TMP/$pkg/data
 	rmdir $IPKG_TMP/$pkg
 	rm -f $IPKG_TMP/data.tar.gz $IPKG_TMP/data.tar
@@ -924,7 +924,7 @@ ipkg_install() {
 	while [ $# -gt 0 ]; do
 		local pkg="$1"
 		shift
-	
+
 		case "$pkg" in
 		http://* | ftp://*)
 			local tmp_pkg_file="$IPKG_TMP/"`ipkg_file_part $pkg`
@@ -1013,7 +1013,7 @@ ipkg_upgrade_pkg() {
 				return 0
 			fi
 
-			if [ "$avail_ver" = "$inst_ver" ]; then 
+			if [ "$avail_ver" = "$inst_ver" ]; then
 				echo "Package $pkg ($inst_ver) installed in $dest_name is up to date"
 			elif ipkg-compare-versions $avail_ver '>>' $inst_ver; then
 				echo "Upgrading $pkg ($dest_name) from $inst_ver to $avail_ver"
@@ -1037,7 +1037,7 @@ ipkg_upgrade() {
 	else
 		pkgs="$*"
 	fi
-	
+
 	for pkg in $pkgs; do
 		ipkg_upgrade_pkg $pkg
 	done
diff --git a/recipes/stage-manager/files/stage-manager-ipkg-build b/bin/stage-manager-ipkg-build
similarity index 99%
rename from recipes/stage-manager/files/stage-manager-ipkg-build
rename to bin/stage-manager-ipkg-build
index 77367ac..1a5e2597 100755
--- a/recipes/stage-manager/files/stage-manager-ipkg-build
+++ b/bin/stage-manager-ipkg-build
@@ -68,7 +68,7 @@ You probably want to chown these to a system user: " >&2
 		ls -ld $large_uid_files
 		echo >&2
 	fi
-	    
+
 
 	if [ ! -f "$CONTROL/control" ]; then
 		echo "*** Error: Control file $pkg_dir/$CONTROL/control not found." >&2
@@ -109,7 +109,7 @@ You probably want to chown these to a system user: " >&2
 	source=`required_field Source`
 	[ "$?" -ne 0 ] && PKG_ERROR=1
 	if [ -z "$source" ]; then
-	    echo "The Source field contain the URL's or filenames of the source code and any patches" 
+	    echo "The Source field contain the URL's or filenames of the source code and any patches"
 	    echo "used to build this package.  Either gnu-style tarballs or Debian source packages "
 	    echo "are acceptable.  Relative filenames may be used if they are distributed in the same"
 	    echo "directory as the .ipk file."
@@ -196,7 +196,7 @@ case $# in
 	;;
 *)
 	echo $usage >&2
-	exit 1 
+	exit 1
 	;;
 esac
 
diff --git a/classes/base.bbclass b/classes/base.bbclass
index 308498f..6fa292e 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -61,8 +61,7 @@ def base_deps(d):
 	# that case though.
 	#
 	deps = "coreutils-native"
-	if bb.data.getVar('PN', d, True) in ("shasum-native", "stagemanager-native",
-	                                     "coreutils-native"):
+	if bb.data.getVar('PN', d, True) in ("shasum-native", "coreutils-native"):
 		deps = ""
 
 	# INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
@@ -76,7 +75,7 @@ def base_deps(d):
 				bb.data.getVar('PN', d, True) not in \
 				("linux-libc-headers-native", "quilt-native",
 				 "unifdef-native", "shasum-native",
-				 "stagemanager-native", "coreutils-native"):
+				 "coreutils-native"):
 			deps += " linux-libc-headers-native"
 	return deps
 
diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index e968e4d..19d84bd 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -23,7 +23,6 @@ PSTAGE_SCAN_CMD ?= "find ${PSTAGE_TMPDIR_STAGE} \( -name "*.la" -o -name "*-conf
 
 PSTAGE_NATIVEDEPENDS = "\
     shasum-native \
-    stagemanager-native \
     "
 
 BB_STAMP_WHITELIST = "${PSTAGE_NATIVEDEPENDS}"
@@ -75,10 +74,6 @@ python __anonymous() {
     # Add task dependencies if we're active, otherwise mark packaged staging
     # as inactive.
     if pstage_allowed:
-        deps = bb.data.getVarFlag('do_setscene', 'depends', d) or ""
-        deps += " stagemanager-native:do_populate_sysroot"
-        bb.data.setVarFlag('do_setscene', 'depends', deps, d)
-
         policy = bb.data.getVar("BB_STAMP_POLICY", d, True)
         if policy == "whitelist" or policy == "full":
            deps = bb.data.getVarFlag('do_setscene', 'recrdeptask', d) or ""
diff --git a/recipes/stage-manager/stagemanager-native_0.0.1.bb b/recipes/stage-manager/stagemanager-native_0.0.1.bb
deleted file mode 100644
index 9577749..0000000
--- a/recipes/stage-manager/stagemanager-native_0.0.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "Helper script for packaged-staging.bbclass"
-PR = "r15"
-
-SRC_URI = "file://stage-manager \
-           file://stage-manager-ipkg \
-           file://stage-manager-ipkg-build "
-LICENSE = "GPLv2"
-
-PACKAGE_ARCH = "all"
-
-inherit native
-
-DEPENDS = " "
-PACKAGE_DEPENDS = " "
-PATCHDEPENDENCY = ""
-INHIBIT_DEFAULT_DEPS = "1"
-
-PSTAGING_DISABLED = "1"
-
-NATIVE_INSTALL_WORKS = "1"
-do_install() {
-	install -d ${STAGING_BINDIR}
-	install -m 0755 ${WORKDIR}/stage-manager ${STAGING_BINDIR}
-	install -m 0755 ${WORKDIR}/stage-manager-ipkg ${STAGING_BINDIR}
-	install -m 0755 ${WORKDIR}/stage-manager-ipkg-build ${STAGING_BINDIR}
-}
-- 
1.7.2.3



