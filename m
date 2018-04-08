Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 30A4175500
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:14 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id e22-v6so1443041plj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VdqiIzSO9uvlJYobTrNJNWZMCqfIF6RVwK6qX5E9c7A=;
	b=XxuaWG1PDv6TRSUzINiC9fKgUlpVVmOWJb/g2a6y86zIm8KfrRczqLHIqlXB3Z8x6F
	FplEGcburzjH6mQGxlN91nbI3V/O1Mwlsb58cJJXDZYUUDLxxN/vTcaDbredcJiQ5SVr
	HiDjc6t8czshva/dALbzCS7ejwkQzcfqoYMgDT4YS+affCzZ+IoB/3CpO2QgJss5aZZ0
	4ibxytuPSJ9LXgO1Smhcc0/QF+gLqL+tWtdrMNbCD54dLgzpjtjfvAjpY2h/Pq1OE1tN
	Y0XDKtqO5cdJt3AKtire+eWCuiDpP66Vrd5ijq/LTuIzOrjyPNltWg60Bg2TfQPCya9x
	cWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VdqiIzSO9uvlJYobTrNJNWZMCqfIF6RVwK6qX5E9c7A=;
	b=CSvJRKmN5KBVHUMPCDiixDPqpL71PIFT3ADSWF7sn/JFD95y2mbocnBVfJ6yXClPcZ
	h7LChNqbt9e1sSZ0bgRzAe2WJQ7R0BzoRDc8y/hTLAleJ+zq2MCKD70ylbL66Hw9kJ0H
	e2BhjeSXd9R1ppdU5aKCtfa8rma74RiuHk+8Ue5txwYIsC9H9IGglBB8O5V8vOCxZf8y
	Ly5y39dl4HVOT3CshsakO3fHY61xXGldDwQ017q+ePTh4ivBNvRCcUc7annp8Ui4+FC6
	qnk8HVZPw0XipAWnZ7ue1oiUEIVHTF7LNmN6nsz0BizGwkql4wLzK65GRlg6m8I9ngU3
	DigQ==
X-Gm-Message-State: AElRT7EWuWYnALqUGD2N8HDi6Kl69/NqAcHv0es5sATJT+Zmy2al0MPF
	B/NvS9370KFPdK84vMneevf3/g==
X-Google-Smtp-Source: AIpwx48uHNfMKIPr/eZuCu+fgqsoVXieOBgrR1HDAXtuEYJ+WDDgv1WG/pZ2//CLsL77PENSqmKFFA==
X-Received: by 2002:a17:902:8646:: with SMTP id
	y6-v6mr34512788plt.182.1523170756065; 
	Sat, 07 Apr 2018 23:59:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:36 -0700
Message-Id: <1523170729-26321-24-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 24/37] apache2: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:15 -0000

WARNING: apache2-2.4.29-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch apache-configure_perlbin.patch
patching file configure.in
Hunk #1 succeeded at 855 with fuzz 2 (offset 217 lines).

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../apache2/apache2/apache-configure_perlbin.patch | 12 ++++++-----
 .../apache2/apache2/apache-ssl-ltmain-rpath.patch  | 23 ++++++++++------------
 .../replace-lynx-to-curl-in-apachectl-script.patch | 17 +++++++---------
 3 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
index c90279d..92c53f3 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
@@ -4,11 +4,13 @@
 #
 # Upstream-Status: Inappropriate [configuration]
 
---- a/configure.in
-+++ b/configure.in
-@@ -638,10 +638,7 @@
- AC_DEFINE_UNQUOTED(APACHE_MPM_DIR, "$MPM_DIR",
- 	[Location of the source for the current MPM])
+Index: httpd-2.4.29/configure.in
+===================================================================
+--- httpd-2.4.29.orig/configure.in
++++ httpd-2.4.29/configure.in
+@@ -855,10 +855,7 @@ AC_DEFINE_UNQUOTED(SERVER_CONFIG_FILE, "
+ AC_DEFINE_UNQUOTED(AP_TYPES_CONFIG_FILE, "${rel_sysconfdir}/mime.types",
+ 	[Location of the MIME types config file, relative to the Apache root directory])
  
 -perlbin=`$ac_aux_dir/PrintPath perl`
 -if test "x$perlbin" = "x"; then
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch b/meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch
index 413dc53..f13da91 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch
@@ -1,11 +1,11 @@
  build/ltmain.sh | 32 +++++++++++++++++++++++++++-----
  1 file changed, 27 insertions(+), 5 deletions(-)
 
-diff --git a/build/ltmain.sh b/build/ltmain.sh
-index 5eca4ae..805b461 100644
---- a/build/ltmain.sh
-+++ b/build/ltmain.sh
-@@ -6944,7 +6944,7 @@ func_mode_link ()
+Index: httpd-2.4.29/build/ltmain.sh
+===================================================================
+--- httpd-2.4.29.orig/build/ltmain.sh
++++ httpd-2.4.29/build/ltmain.sh
+@@ -6969,7 +6969,7 @@ func_mode_link ()
  	dir=$func_resolve_sysroot_result
  	# We need an absolute path.
  	case $dir in
@@ -14,7 +14,7 @@ index 5eca4ae..805b461 100644
  	*)
  	  absdir=`cd "$dir" && pwd`
  	  test -z "$absdir" && \
-@@ -8137,7 +8137,7 @@ func_mode_link ()
+@@ -8167,7 +8167,7 @@ func_mode_link ()
  	    $ECHO "*** $linklib is not portable!"
  	  fi
  	  if test lib = "$linkmode" &&
@@ -23,7 +23,7 @@ index 5eca4ae..805b461 100644
  	    # Hardcode the library path.
  	    # Skip directories that are in the system default run-time
  	    # search path.
-@@ -8404,7 +8404,7 @@ func_mode_link ()
+@@ -8434,7 +8434,7 @@ func_mode_link ()
  
  	if test lib = "$linkmode"; then
  	  if test -n "$dependency_libs" &&
@@ -32,7 +32,7 @@ index 5eca4ae..805b461 100644
  	       test yes = "$build_old_libs" ||
  	       test yes = "$link_static"; }; then
  	    # Extract -R from dependency_libs
-@@ -9025,7 +9025,8 @@ func_mode_link ()
+@@ -9086,7 +9086,8 @@ func_mode_link ()
  	  *) func_append finalize_rpath " $libdir" ;;
  	  esac
  	done
@@ -42,7 +42,7 @@ index 5eca4ae..805b461 100644
  	  dependency_libs="$temp_xrpath $dependency_libs"
  	fi
        fi
-@@ -9473,7 +9474,7 @@ EOF
+@@ -9534,7 +9535,7 @@ EOF
  	case $archive_cmds in
  	  *\$LD\ *) wl= ;;
          esac
@@ -51,7 +51,7 @@ index 5eca4ae..805b461 100644
  	  # Hardcode the library paths
  	  hardcode_libdirs=
  	  dep_rpath=
-@@ -10211,6 +10212,27 @@ EOF
+@@ -10272,6 +10273,27 @@ EOF
        # Now hardcode the library paths
        rpath=
        hardcode_libdirs=
@@ -79,6 +79,3 @@ index 5eca4ae..805b461 100644
        for libdir in $compile_rpath $finalize_rpath; do
  	if test -n "$hardcode_libdir_flag_spec"; then
  	  if test -n "$hardcode_libdir_separator"; then
--- 
-1.9.1
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch b/meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch
index 584ddc8..e4e01b2 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch
@@ -10,11 +10,11 @@ Signed-off-by: Yulong Pei <Yulong.pei@windriver.com>
  support/apachectl.in |   14 ++++++++++----
  1 files changed, 10 insertions(+), 4 deletions(-)
 
-diff --git a/support/apachectl.in b/support/apachectl.in
-index d4dff38..109ea13 100644
---- a/support/apachectl.in
-+++ b/support/apachectl.in
-@@ -51,11 +51,11 @@ fi
+Index: httpd-2.4.29/support/apachectl.in
+===================================================================
+--- httpd-2.4.29.orig/support/apachectl.in
++++ httpd-2.4.29/support/apachectl.in
+@@ -52,11 +52,11 @@ fi
  # a command that outputs a formatted text version of the HTML at the
  # url given on the command line.  Designed for lynx, however other
  # programs may work.  
@@ -28,7 +28,7 @@ index d4dff38..109ea13 100644
  #
  # Set this variable to a command that increases the maximum
  # number of file descriptors allowed per child process. This is
-@@ -91,10 +91,16 @@ configtest)
+@@ -92,10 +92,16 @@ configtest)
      ERROR=$?
      ;;
  status)
@@ -46,7 +46,4 @@ index d4dff38..109ea13 100644
 +    fi
      ;;
  *)
-     $HTTPD $ARGV
--- 
-1.6.4
-
+     $HTTPD "$@"
-- 
2.7.4


