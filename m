Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6A77FE51
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 06:16:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0096G1Pw025036
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jan 2020 22:16:01 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 8 Jan 2020 22:16:00 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Jan 2020 14:15:58 +0800
Message-ID: <20200109061558.19630-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-perl][PATCH] adduser: set default shell with /sbin/nologin
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
X-List-Received-Date: Thu, 09 Jan 2020 06:16:02 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Shell nologin whether provided by shadow or util-linux is installed to
/sbin/nologin in oe-core. But the default shell of adduser is
/usr/sbin/nologin and will fail to create a new user.

Set the default shell with /sbin/nologin to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-perl/adduser/adduser_3.118.bb     |  1 +
 ...-set-default-shell-with-sbin-nologin.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.118.bb b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
index e695c5894..80cf14286 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.118.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=caed49ab166f22ef31bf1127f558d0ef
 
 SRC_URI = "https://launchpad.net/debian/+archive/primary/+sourcefiles/adduser/${PV}/${BPN}_${PV}.tar.xz \
            file://adduser-add-M-option-for-useradd.patch \
+           file://0001-adduser-set-default-shell-with-sbin-nologin.patch \
 "
 
 SRC_URI[md5sum] = "44ba2475ebdaafc9613236bdda321c97"
diff --git a/meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch b/meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch
new file mode 100644
index 000000000..91cc6bcba
--- /dev/null
+++ b/meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch
@@ -0,0 +1,34 @@
+From 75e949bf80bf5e3e5bd8f81b258095e662b705c4 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Thu, 9 Jan 2020 13:51:28 +0800
+Subject: [PATCH] adduser: set default shell with /sbin/nologin
+
+Shell nologin whether provided by shadow or util-linux is installed to
+/sbin/nologin in oe-core. But the default shell of adduser is
+/usr/sbin/nologin and will fail to create a new user.
+
+Set the default shell with /sbin/nologin to fix the issue.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ adduser | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/adduser b/adduser
+index 0f24cc9..ab554d0 100755
+--- a/adduser
++++ b/adduser
+@@ -431,7 +431,7 @@ if ($action eq "addsysuser") {
+     printf gtx("Adding new user `%s' (UID %d) with group `%s' ...\n"),$new_name,$new_uid,$ingroup_name
+ 	if $verbose;
+     $home_dir = $special_home || &homedir($new_name, $ingroup_name);
+-    $shell = $special_shell || '/usr/sbin/nologin';
++    $shell = $special_shell || '/sbin/nologin';
+     $undouser = $new_name;
+     my $useradd = &which('useradd');
+     &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
+-- 
+2.17.1
+
-- 
2.17.1


