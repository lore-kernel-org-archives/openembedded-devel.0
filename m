Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F407B6FF69
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:19:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9J5K0uC026918
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:20:00 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 18 Oct 2016 22:19:59 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Oct 2016 13:00:57 +0800
Message-ID: <20161019050057.4584-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-perl][PATCH] adduser: always add -M option for useradd
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
X-List-Received-Date: Wed, 19 Oct 2016 05:20:00 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The useradd (from package passwd) in debian based system
sets -M (--no-create-home) by default, but the one we are
using (from package shadow) sets -m (--create-home) by
default, the previous patch added -M option conditionally,
which worked but we see a confused message:
"The home directory `/home/newuser' already exists. Not copying from `/etc/skel'"

So change it to always add the -M option for useradd and let
adduser handle the home creation with its logic.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-perl/recipes-perl/adduser/adduser_3.115.bb    |  2 +-
 ...atch => adduser-add-M-option-for-useradd.patch} | 48 ++++++++--------------
 2 files changed, 19 insertions(+), 31 deletions(-)
 rename meta-perl/recipes-perl/adduser/files/{adduser-add-M-option-for-useradd-when-no-create-home.patch => adduser-add-M-option-for-useradd.patch} (38%)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.115.bb b/meta-perl/recipes-perl/adduser/adduser_3.115.bb
index 312bad8..81068d6 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.115.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.115.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=caed49ab166f22ef31bf1127f558d0ef"
 
 SRC_URI = "http://ftp.de.debian.org/debian/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
-           file://adduser-add-M-option-for-useradd-when-no-create-home.patch \
+           file://adduser-add-M-option-for-useradd.patch \
 "
 
 SRC_URI[md5sum] = "6bb6d93922d281f1b56393a53f8ce5fd"
diff --git a/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd-when-no-create-home.patch b/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd.patch
similarity index 38%
rename from meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd-when-no-create-home.patch
rename to meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd.patch
index 4b0a03f..2ecec51 100644
--- a/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd-when-no-create-home.patch
+++ b/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd.patch
@@ -1,57 +1,45 @@
-From 809f00a6ef0224b41b2e1207194c8da3cd3e3c7e Mon Sep 17 00:00:00 2001
+From 55a0adfc416ad85dbc440eaa667d98c200a8ce62 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Thu, 18 Dec 2014 17:23:37 +0800
-Subject: [PATCH] adduser: add -M option for useradd when --no-create-home is specified
+Subject: [PATCH] adduser: add -M option for useradd
 
 The useradd (from package passwd) in debian based system sets -M (--no-create-home) by default,
 but the one we are using (from package shadow) sets -m (--create-home) by default, so we
-need to explicitly add -M option for useradd call when --no-create-home is specified for adduser.
+need to explicitly add -M option for useradd call or it will try to create home twice and
+throw a confused message:
+"The home directory `/home/newuser' already exists. Not copying from `/etc/skel'"
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [1]
+
+[1] https://lists.alioth.debian.org/pipermail/adduser-devel/2016-October/005478.html
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 ---
- adduser |   20 ++++++++++++++++----
- 1 files changed, 16 insertions(+), 4 deletions(-)
+ adduser | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/adduser b/adduser
-index c3bd8b0..9a07f9f 100755
+index a5f83f3..f6cb52c 100755
 --- a/adduser
 +++ b/adduser
-@@ -434,8 +434,14 @@ if ($action eq "addsysuser") {
-     $shell = $special_shell || '/bin/false';
+@@ -435,7 +435,7 @@ if ($action eq "addsysuser") {
      $undouser = $new_name;
      my $useradd = &which('useradd');
--    &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
+     &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
 -		$shell, '-u', $new_uid, $new_name);
-+    if ($no_create_home) {
-+        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
-+		    $shell, '-u', $new_uid, '-M', $new_name);
-+    }
-+    else {
-+        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
-+                    $shell, '-u', $new_uid, $new_name);
-+    }
++	        $shell, '-u', $new_uid, '-M', $new_name);
      if(!$disabled_login) {
          my $usermod = &which('usermod');
          &systemcall($usermod, '-p', '*', $new_name);
-@@ -524,8 +530,14 @@ if ($action eq "adduser") {
- 	$shell = $special_shell || $config{"dshell"};
+@@ -525,7 +525,7 @@ if ($action eq "adduser") {
      $undouser = $new_name;
      my $useradd = &which('useradd');
--    &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
+     &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
 -		$shell, '-u', $new_uid, $new_name);
-+    if ($no_create_home) {
-+        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
-+	    	    $shell, '-u', $new_uid, '-M', $new_name);
-+    }
-+    else {
-+        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
-+	    	    $shell, '-u', $new_uid, $new_name);
-+    }
++               $shell, '-u', $new_uid, '-M', $new_name);
      &invalidate_nscd();
  
      create_homedir (1); # copy skeleton data
 -- 
-1.7.1
+1.8.5.2
 
-- 
2.8.3


