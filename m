Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9C8601A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 06:24:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7K6OK3J014745
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 23:24:20 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 19 Aug 2014 23:24:19 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Aug 2014 02:24:18 -0400
Message-ID: <1408515858-25321-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] webmin: uprev from 1.620 to 1.700
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
X-List-Received-Date: Wed, 20 Aug 2014 06:24:22 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changed:

- Adjust or remake the following patches based on 1.700:
  init-exclude.patch
  exports-lib.pl.patch

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../webmin/files/exports-lib.pl.patch              |  2 +-
 .../webmin/files/init-exclude.patch                | 35 ++++++++++++++--------
 .../webmin/{webmin_1.620.bb => webmin_1.700.bb}    |  4 +--
 3 files changed, 26 insertions(+), 15 deletions(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_1.620.bb => webmin_1.700.bb} (97%)

diff --git a/meta-webserver/recipes-webadmin/webmin/files/exports-lib.pl.patch b/meta-webserver/recipes-webadmin/webmin/files/exports-lib.pl.patch
index 140ae7e..177d8a3 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/exports-lib.pl.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/exports-lib.pl.patch
@@ -24,7 +24,7 @@ index 22891c0..1c67494 100755
  # Try exportfs -r first
 -if ($config{'apply_cmd'} && &find_byname("nfsd") && &find_byname("mountd")) {
 +if ($config{'apply_cmd'} && &find_byname("mountd")) {
- 	local $out = &backquote_logged("$config{'apply_cmd'} 2>&1 </dev/null");
+ 	my $out = &backquote_logged("$config{'apply_cmd'} 2>&1 </dev/null");
  	if (!$? && $out !~ /invalid|error|failed/i) {
  		# Looks like it worked!
 -- 
diff --git a/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch b/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
index 135492d..5563227 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
@@ -5,9 +5,17 @@
 # Upstream-status: Pending
 #
 # Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---- webmin-1.570.orig/init/index.cgi
-+++ webmin-1.570/init/index.cgi
-@@ -48,19 +48,20 @@ elsif ($init_mode eq "init" && $access{'
+# Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ init/index.cgi   | 27 ++++++++++++++-------------
+ init/init-lib.pl |  5 +++--
+ 2 files changed, 17 insertions(+), 15 deletions(-)
+
+diff --git a/init/index.cgi b/init/index.cgi
+index d48b793..30dafd4 100755
+--- a/init/index.cgi
++++ b/init/index.cgi
+@@ -45,19 +45,20 @@ elsif ($init_mode eq "init" && $access{'bootup'}) {
  					     : "$config{'init_dir'}/$ac[0]");
  		}
  	@runlevels = &list_runlevels();
@@ -41,11 +49,11 @@
  
  	# For each action, look at /etc/rc*.d/* files to see if it is 
  	# started at boot
-Index: webmin-1.570/init/init-lib.pl
-===================================================================
---- webmin-1.570.orig/init/init-lib.pl
-+++ webmin-1.570/init/init-lib.pl
-@@ -108,15 +108,17 @@ List boot time action names from init.d,
+diff --git a/init/init-lib.pl b/init/init-lib.pl
+index ead21ed..b41794b 100755
+--- a/init/init-lib.pl
++++ b/init/init-lib.pl
+@@ -119,8 +119,9 @@ List boot time action names from init.d, such as httpd and cron.
  =cut
  sub list_actions
  {
@@ -56,12 +64,15 @@ Index: webmin-1.570/init/init-lib.pl
  opendir(DIR, $dir);
  foreach $f (sort { lc($a) cmp lc($b) } readdir(DIR)) {
  	if ($f eq "." || $f eq ".." || $f =~ /\.bak$/ || $f eq "functions" ||
- 	    $f eq "core" || $f eq "README" || $f eq "rc" || $f eq "rcS" ||
+@@ -128,7 +129,7 @@ foreach $f (sort { lc($a) cmp lc($b) } readdir(DIR)) {
  	    -d "$dir/$f" || $f =~ /\.swp$/ || $f eq "skeleton" ||
  	    $f =~ /\.lock$/ || $f =~ /\.dpkg-(old|dist)$/ ||
--	    $f =~ /^\.depend\./ || $f eq '.legacy-bootordering') { next; }
-+	    $f =~ /^\.depend\./ || $f eq '.legacy-bootordering' ||
-+	    grep {$_ eq $f} @exclude ) { next; }
+ 	    $f =~ /^\.depend\./ || $f eq '.legacy-bootordering' ||
+-	    $f =~ /^mandrake/) { next; }
++	    $f =~ /^mandrake/ || grep {$_ eq $f} @exclude ) { next; }
  	if (@stbuf = stat("$dir/$f")) {
  		push(@rv, "$f $stbuf[1]");
  		}
+--
+2.0.0
+
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb
index 95540cc..45d635e 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb
@@ -17,8 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://net-lib.pl.patch \
            file://media-tomb.patch"
 
-SRC_URI[md5sum] = "e93bc5057a5b7d7e31ecb2bb228d7044"
-SRC_URI[sha256sum] = "3d36153406d8e5d3dcaeadba34dfb5cdbc4060b75c38339174ac97b2277f284b"
+SRC_URI[md5sum] = "e5261114a6a6ed10caf570d3239ed5b7"
+SRC_URI[sha256sum] = "1a6a8aa62c32c04932b902d17fc1864ee8f3fba03012bd25f709aa65e7e9b0f2"
 
 inherit perlnative update-rc.d
 
-- 
2.0.0


