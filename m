Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4DDE960670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 03:25:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0C3PUtv015719
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2015 19:25:30 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 11 Jan 2015 19:25:30 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Jan 2015 11:25:28 +0800
Message-ID: <1421033128-4624-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-perl][PATCH v2] adduser: add new recipe
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
X-List-Received-Date: Mon, 12 Jan 2015 03:25:33 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This is a utility from debain to add users/groups to the system,
which is actually a perl wrapper of the useradd/groupadd command.

We want this to replace the same commands provided by busybox.

Homepage: https://alioth.debian.org/projects/adduser

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-perl/adduser/adduser_3.113+nmu3.bb     | 53 ++++++++++++++++++++
 ...-M-option-for-useradd-when-no-create-home.patch | 57 ++++++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb
 create mode 100644 meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd-when-no-create-home.patch

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb b/meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb
new file mode 100644
index 0000000..969a739
--- /dev/null
+++ b/meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb
@@ -0,0 +1,53 @@
+SUMMARY = "a utility to add users/groups to the system"
+DESCRIPTION = "adduser, addgroup - add a user or group to the system"
+HOMEPAGE = "http://alioth.debian.org/projects/adduser/"
+SECTION = "base/utils"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=caed49ab166f22ef31bf1127f558d0ef"
+
+SRC_URI = "http://ftp.de.debian.org/debian/pool/main/a/${BPN}/${BPN}_${PV}.tar.gz \
+           file://adduser-add-M-option-for-useradd-when-no-create-home.patch \
+"
+
+SRC_URI[md5sum] = "ccb5864bde56683182c89c44474e7182"
+SRC_URI[sha256sum] = "02682be3f51f3e732121f20a3e4922bb8bef15cfacb8767fc250a01d09502122"
+
+inherit cpan-base update-alternatives
+
+do_install() {
+    install -d ${D}${sbindir}
+    install -m 0755 ${S}/adduser ${D}${sbindir}
+    install -m 0755 ${S}/deluser ${D}${sbindir}
+
+    install -d ${D}${libdir}/perl/${PERLVERSION}/Debian
+    install -m 0644 ${S}/AdduserCommon.pm ${D}${libdir}/perl/${PERLVERSION}/Debian
+    sed -i -e "s/VERSION/${PV}/" ${D}${sbindir}/*
+
+    install -d ${D}/${sysconfdir}
+    install -m 0644 ${S}/*.conf ${D}/${sysconfdir}
+
+    install -d ${D}${mandir}/man5
+    install -m 0644 ${S}/doc/*.conf.5 ${D}${mandir}/man5
+    install -d ${D}${mandir}/man8
+    install -m 0644 ${S}/doc/*.8 ${D}${mandir}/man8
+    install -d ${D}${docdir}/${BPN}
+    cp -rf ${S}/examples ${D}${docdir}/${BPN}
+}
+
+RDEPENDS_${PN} += "\
+    shadow \
+    perl-module-getopt-long \
+    perl-module-overloading \
+    perl-module-file-find \
+    perl-module-file-temp \
+"
+
+ALTERNATIVE_${PN} = "adduser deluser addgroup delgroup"
+ALTERNATIVE_PRIORITY = "60"
+ALTERNATIVE_LINK_NAME[adduser] = "${sbindir}/adduser"
+ALTERNATIVE_LINK_NAME[deluser] = "${sbindir}/deluser"
+ALTERNATIVE_LINK_NAME[addgroup] = "${sbindir}/addgroup"
+ALTERNATIVE_LINK_NAME[delgroup] = "${sbindir}/delgroup"
+ALTERNATIVE_TARGET[addgroup] = "${sbindir}/adduser.${BPN}"
+ALTERNATIVE_TARGET[delgroup] = "${sbindir}/deluser.${BPN}"
diff --git a/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd-when-no-create-home.patch b/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd-when-no-create-home.patch
new file mode 100644
index 0000000..4b0a03f
--- /dev/null
+++ b/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd-when-no-create-home.patch
@@ -0,0 +1,57 @@
+From 809f00a6ef0224b41b2e1207194c8da3cd3e3c7e Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 18 Dec 2014 17:23:37 +0800
+Subject: [PATCH] adduser: add -M option for useradd when --no-create-home is specified
+
+The useradd (from package passwd) in debian based system sets -M (--no-create-home) by default,
+but the one we are using (from package shadow) sets -m (--create-home) by default, so we
+need to explicitly add -M option for useradd call when --no-create-home is specified for adduser.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ adduser |   20 ++++++++++++++++----
+ 1 files changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/adduser b/adduser
+index c3bd8b0..9a07f9f 100755
+--- a/adduser
++++ b/adduser
+@@ -434,8 +434,14 @@ if ($action eq "addsysuser") {
+     $shell = $special_shell || '/bin/false';
+     $undouser = $new_name;
+     my $useradd = &which('useradd');
+-    &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
+-		$shell, '-u', $new_uid, $new_name);
++    if ($no_create_home) {
++        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
++		    $shell, '-u', $new_uid, '-M', $new_name);
++    }
++    else {
++        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
++                    $shell, '-u', $new_uid, $new_name);
++    }
+     if(!$disabled_login) {
+         my $usermod = &which('usermod');
+         &systemcall($usermod, '-p', '*', $new_name);
+@@ -524,8 +530,14 @@ if ($action eq "adduser") {
+ 	$shell = $special_shell || $config{"dshell"};
+     $undouser = $new_name;
+     my $useradd = &which('useradd');
+-    &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
+-		$shell, '-u', $new_uid, $new_name);
++    if ($no_create_home) {
++        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
++	    	    $shell, '-u', $new_uid, '-M', $new_name);
++    }
++    else {
++        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
++	    	    $shell, '-u', $new_uid, $new_name);
++    }
+     &invalidate_nscd();
+ 
+     create_homedir (1); # copy skeleton data
+-- 
+1.7.1
+
-- 
1.9.1


