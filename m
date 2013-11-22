Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 386D66D772
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2013 02:37:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAM2b610005111
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 18:37:09 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 21 Nov 2013 18:37:07 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Nov 2013 10:37:29 +0800
Message-ID: <1385087849-30272-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] webmin: fix failures in do_install task
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Nov 2013 02:37:13 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, even if something went wrong in setup.sh script, the do_install
task would still exit successfully. As a result, failures in do_install
task were hidden.

Unlike the setup.sh script shipped with webmin source code, some commands
in our own setup.sh script are possible to fail because we are not installing
webmin on target.

If we examine the log file of the do_install, we can see the following error.

	  Script was not run with full path (failed to find run-postinstalls.pl
	  under /usr/lib64/webmin/webmin)

This patch fixes the above problem. It also adds checks to the return
value of some commands in the setup.sh script so that if the commands
fail, the do_install task will fail too.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-webadmin/webmin/files/setup.sh         |   42 ++++++++++++--------
 .../recipes-webadmin/webmin/webmin_1.620.bb        |    2 +-
 2 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/files/setup.sh b/meta-webserver/recipes-webadmin/webmin/files/setup.sh
index 8d24f92..75e5214 100755
--- a/meta-webserver/recipes-webadmin/webmin/files/setup.sh
+++ b/meta-webserver/recipes-webadmin/webmin/files/setup.sh
@@ -1,6 +1,16 @@
 #!/bin/sh
 # Modified version of setup.sh distributed with webmin
 
+done_or_error () {
+	if [ "$?" = "0" ]; then
+	    echo "..done"
+	    echo ""
+	else
+	    echo "Error out: $@"
+	    exit 1
+	fi
+}
+
 if [ "$wadir" = "" ]; then
 	echo "ERROR: wadir not specified"
 	echo ""
@@ -41,7 +51,7 @@ echo $var_dir > $config_dir/var-path
 echo "Creating web server config files.."
 cfile=$config_dir/miniserv.conf
 echo "port=$port" >> $cfile
-echo "root=$wadir_runtime" >> $cfile
+echo "root=$wadir" >> $cfile
 echo "mimetypes=$wadir_runtime/mime.types" >> $cfile
 echo "addtype_cgi=internal/cgi" >> $cfile
 echo "realm=Webmin Server" >> $cfile
@@ -124,8 +134,7 @@ chmod 600 $kfile
 echo "keyfile=$config_dir_runtime/miniserv.pem" >> $cfile
 
 chmod 600 $cfile
-echo "..done"
-echo ""
+done_or_error "chmod 600 $cfile"
 
 echo "Creating access control file.."
 afile=$config_dir/webmin.acl
@@ -136,8 +145,7 @@ else
 	echo "$login: $defaultmods" >> $afile
 fi
 chmod 600 $afile
-echo "..done"
-echo ""
+done_or_error "chmod 600 $afile"
 
 if [ "$login" != "root" -a "$login" != "admin" ]; then
 	# Allow use of RPC by this user
@@ -147,8 +155,7 @@ fi
 if [ "$noperlpath" = "" ]; then
 	echo "Inserting path to perl into scripts.."
 	(find "$wadir" -name '*.cgi' -print ; find "$wadir" -name '*.pl' -print) | $perl "$wadir/perlpath.pl" $perl_runtime -
-	echo "..done"
-	echo ""
+	done_or_error
 fi
 
 echo "Creating start and stop scripts.."
@@ -184,8 +191,7 @@ echo "pidfile=\`grep \"^pidfile=\" $config_dir_runtime/miniserv.conf | sed -e 's
 echo "kill -USR1 \`cat \$pidfile\`" >>$config_dir/reload
 
 chmod 755 $config_dir/start $config_dir/stop $config_dir/restart $config_dir/reload
-echo "..done"
-echo ""
+done_or_error "chmod 755 $config_dir/start $config_dir/stop $config_dir/restart $config_dir/reload"
 
 if [ "$upgrading" = 1 ]; then
 	echo "Updating config files.."
@@ -223,8 +229,7 @@ fi
 # Disallow unknown referers by default
 echo "referers_none=1" >>$config_dir/config
 echo $ver > $config_dir/version
-echo "..done"
-echo ""
+done_or_error "echo $ver > $config_dir/version"
 
 # Set passwd_ fields in miniserv.conf from global config
 for field in passwd_file passwd_uindex passwd_pindex passwd_cindex passwd_mindex; do
@@ -276,8 +281,7 @@ fi
 if [ "$makeboot" = "1" ]; then
 	echo "Configuring Webmin to start at boot time.."
 	(cd "$wadir/init" ; WEBMIN_CONFIG=$config_dir WEBMIN_VAR=$var_dir "$wadir/init/atboot.pl" $bootscript)
-	echo "..done"
-	echo ""
+	done_or_error
 fi
 
 # If password delays are not specifically disabled, enable them
@@ -326,15 +330,19 @@ done
 if [ "$nopostinstall" = "" ]; then
 	echo "Running postinstall scripts .."
 	(cd "$wadir" ; WEBMIN_CONFIG=$config_dir WEBMIN_VAR=$var_dir "$wadir/run-postinstalls.pl")
-	echo "..done"
-	echo ""
+	done_or_error
 fi
 
 # Enable background collection
 if [ "$upgrading" != 1 -a -r $config_dir/system-status/enable-collection.pl ]; then
 	echo "Enabling background status collection .."
 	$config_dir/system-status/enable-collection.pl 5
-	echo "..done"
-	echo ""
+	done_or_error
 fi
 
+# Substitude some values to finalize the file to be used on target
+echo "Finalizing web server files.."
+find $prefix -type f | xargs sed -i "s#$prefix##g"
+done_or_error "$prefix cleanup"
+find $prefix -type f | xargs sed -i "s#$perl#$perl_runtime#g"
+done_or_error "$perl cleanup"
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
index 8822b92..3cdcc73 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
@@ -80,7 +80,7 @@ do_install() {
     rm -rf ${D}${libexecdir}/webmin/patches
 
     # Run setup script
-    export perl=perl
+    export perl=${OECMAKE_PERLNATIVE_DIR}/perl
     export perl_runtime=${bindir}/perl
     export prefix=${D}
     export tempdir=${S}/install_tmp
-- 
1.7.9.5


