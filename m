Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7739B745AB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:19 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g14so3721447pfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZHKOwbBTvGm54+NXp1iNP05qQt6mwQQlINb1tsMFMcY=;
	b=l4UUIKr4R+DChwt+ZQb0+nAosJ+xiseAgtJkkzLKyfN7EE+0AaBPMIz7K45XAyLb+M
	USNCcp+OqoJmwp38BQjq49uJ1y4vZfVKT2Ej7AvIHbRqOdJuSLbyE1F1dHRe2IC3v8Zj
	/CDCSWq1AHeQN1CwxnPwHmjKy9DiGa5j9f8sd21x7RNW+41PD7PYYpwynllfEXTwu4F4
	2zQXhGZ59HkbBK+++HJpfUcMQsQaDQ3LO3AbF4BzNIuhpiHS9w+Z1+SqbOzHATtEKORH
	ipu32AGRyc1ImL6Yiz27x0XH8MTYZa7EzXh8lq3vJDY++lWdO+4I0vARWQ6PvYdIGZW2
	KzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZHKOwbBTvGm54+NXp1iNP05qQt6mwQQlINb1tsMFMcY=;
	b=Et79WPdi7crFquyrpWoPr1dc4LMw2xJw6xoPgPiNicW/eX0LC9ZWDxc2N8Cv+WmTs6
	LeqbsFlRWmn4i6FRa2MRmSNIPxEwS71LMdC+KZkV+UyXdPwYi6nFqSoG2J1IKvnXS/Uu
	yP8j3Ac1bmZ6Q+dvZPMl2UfoSxh9RrCFI42qcxG323uQHECyj0jGj9Q7lOqCYbyeFuaE
	IzXaXGK1uHRzo5lYuQCTf8GSLSWejOXEXgEtX3i7ziRM1lAEKZoc0RkjYpp5dW54pQmi
	9TnlG602nqp0XMn2AAOX1/UHaN+03+J5FtnMPcFqFDnEzThv2SwSKohna2jp74gApoI6
	X1Vg==
X-Gm-Message-State: AElRT7ECYCS1FgW/2C4xPYlz/gxqmYVdf30G0UwxWG5EtbDqk7nrfA6O
	YlpyKCPz+IAgp9ZUVWKyHEfRqA==
X-Google-Smtp-Source: AIpwx48+O1/j29o3v8j3OcV46wBS6Bf9RbDrgXNV74kjPnKY28CKeqMCPhP14umaTVr591LZ7khmMw==
X-Received: by 10.98.58.75 with SMTP id h72mr25261320pfa.209.1523170760252;
	Sat, 07 Apr 2018 23:59:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:40 -0700
Message-Id: <1523170729-26321-28-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 28/37] webmin: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING: webmin-1.850-r0 do_patch:
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
Applying patch nfs-export.patch
patching file exports/save_export.cgi
Hunk #1 succeeded at 50 (offset 10 lines).
Hunk #2 succeeded at 87 with fuzz 2 (offset 17 lines).

Now at patch nfs-export.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../webmin/files/disable-version-check.patch       | 11 +++++-----
 .../webmin/files/exports-lib.pl.patch              | 13 +++++------
 .../webmin/files/init-exclude.patch                | 25 ++++++++++------------
 .../webmin/files/net-generic.patch                 | 12 +++++++----
 .../recipes-webadmin/webmin/files/nfs-export.patch | 20 ++++++++---------
 5 files changed, 39 insertions(+), 42 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
index 1ca1480..9aad894 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
@@ -7,11 +7,11 @@ Upstream-status: Inappropriate
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
-diff --git a/webmin/webmin-lib.pl b/webmin/webmin-lib.pl
-index 57a37f7..838b944 100755
---- a/webmin/webmin-lib.pl
-+++ b/webmin/webmin-lib.pl
-@@ -1086,28 +1086,28 @@
+Index: webmin-1.850/webmin/webmin-lib.pl
+===================================================================
+--- webmin-1.850.orig/webmin/webmin-lib.pl
++++ webmin-1.850/webmin/webmin-lib.pl
+@@ -1112,28 +1112,28 @@ my %miniserv;
  &load_theme_library();	# So that UI functions work
  
  # Need OS upgrade
@@ -62,4 +62,3 @@ index 57a37f7..838b944 100755
  
  # Password close to expiry
  my $warn_days = $config{'warn_days'};
-
diff --git a/meta-webserver/recipes-webadmin/webmin/files/exports-lib.pl.patch b/meta-webserver/recipes-webadmin/webmin/files/exports-lib.pl.patch
index 177d8a3..d5dfed5 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/exports-lib.pl.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/exports-lib.pl.patch
@@ -14,11 +14,11 @@ Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
  exports/exports-lib.pl |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/exports/exports-lib.pl b/exports/exports-lib.pl
-index 22891c0..1c67494 100755
---- a/exports/exports-lib.pl
-+++ b/exports/exports-lib.pl
-@@ -273,7 +273,7 @@ return !&has_command("rpc.nfsd") && !&has_command("nfsd") &&
+Index: webmin-1.850/exports/exports-lib.pl
+===================================================================
+--- webmin-1.850.orig/exports/exports-lib.pl
++++ webmin-1.850/exports/exports-lib.pl
+@@ -301,7 +301,7 @@ return !&has_command("rpc.nfsd") && !&ha
  sub restart_mountd
  {
  # Try exportfs -r first
@@ -27,6 +27,3 @@ index 22891c0..1c67494 100755
  	my $out = &backquote_logged("$config{'apply_cmd'} 2>&1 </dev/null");
  	if (!$? && $out !~ /invalid|error|failed/i) {
  		# Looks like it worked!
--- 
-1.7.9.5
-
diff --git a/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch b/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
index 5563227..4212917 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
@@ -11,11 +11,11 @@
  init/init-lib.pl |  5 +++--
  2 files changed, 17 insertions(+), 15 deletions(-)
 
-diff --git a/init/index.cgi b/init/index.cgi
-index d48b793..30dafd4 100755
---- a/init/index.cgi
-+++ b/init/index.cgi
-@@ -45,19 +45,20 @@ elsif ($init_mode eq "init" && $access{'bootup'}) {
+Index: webmin-1.850/init/index.cgi
+===================================================================
+--- webmin-1.850.orig/init/index.cgi
++++ webmin-1.850/init/index.cgi
+@@ -45,19 +45,20 @@ elsif ($init_mode eq "init" && $access{'
  					     : "$config{'init_dir'}/$ac[0]");
  		}
  	@runlevels = &list_runlevels();
@@ -49,11 +49,11 @@ index d48b793..30dafd4 100755
  
  	# For each action, look at /etc/rc*.d/* files to see if it is 
  	# started at boot
-diff --git a/init/init-lib.pl b/init/init-lib.pl
-index ead21ed..b41794b 100755
---- a/init/init-lib.pl
-+++ b/init/init-lib.pl
-@@ -119,8 +119,9 @@ List boot time action names from init.d, such as httpd and cron.
+Index: webmin-1.850/init/init-lib.pl
+===================================================================
+--- webmin-1.850.orig/init/init-lib.pl
++++ webmin-1.850/init/init-lib.pl
+@@ -124,8 +124,9 @@ List boot time action names from init.d,
  =cut
  sub list_actions
  {
@@ -64,7 +64,7 @@ index ead21ed..b41794b 100755
  opendir(DIR, $dir);
  foreach $f (sort { lc($a) cmp lc($b) } readdir(DIR)) {
  	if ($f eq "." || $f eq ".." || $f =~ /\.bak$/ || $f eq "functions" ||
-@@ -128,7 +129,7 @@ foreach $f (sort { lc($a) cmp lc($b) } readdir(DIR)) {
+@@ -133,7 +134,7 @@ foreach $f (sort { lc($a) cmp lc($b) } r
  	    -d "$dir/$f" || $f =~ /\.swp$/ || $f eq "skeleton" ||
  	    $f =~ /\.lock$/ || $f =~ /\.dpkg-(old|dist)$/ ||
  	    $f =~ /^\.depend\./ || $f eq '.legacy-bootordering' ||
@@ -73,6 +73,3 @@ index ead21ed..b41794b 100755
  	if (@stbuf = stat("$dir/$f")) {
  		push(@rv, "$f $stbuf[1]");
  		}
---
-2.0.0
-
diff --git a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
index 7d20aff..5549392 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
@@ -3,9 +3,11 @@
 # Upstream-status: Not appropriate [config]
 #
 # Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---- webmin-1.570.orig/net/module.info
-+++ webmin-1.570/net/module.info
-@@ -11,7 +11,7 @@ desc_ko_KR.UTF-8=ÎÑ§Ìä∏ÏõåÌÅ¨ Íµ¨ÏÑ±
+Index: webmin-1.850/net/module.info
+===================================================================
+--- webmin-1.850.orig/net/module.info
++++ webmin-1.850/net/module.info
+@@ -14,7 +14,7 @@ desc_ko_KR.UTF-8=ÎÑ§Ìä∏ÏõåÌÅ¨ Íµ¨ÏÑ±
  name=Networking
  desc_tr=A Yap˝land˝rmas˝
  desc_de=Netzwerkkonfiguration
@@ -14,8 +16,10 @@
  desc_sk=Konfigur·cia siete
  desc_zh_CN=Õ¯¬Á≈‰÷√
  risk=low medium high
+Index: webmin-1.850/net/generic-linux-lib.pl
+===================================================================
 --- /dev/null
-+++ webmin-1.570/net/generic-linux-lib.pl
++++ webmin-1.850/net/generic-linux-lib.pl
 @@ -0,0 +1,2 @@
 +do 'linux-lib.pl';
 +
diff --git a/meta-webserver/recipes-webadmin/webmin/files/nfs-export.patch b/meta-webserver/recipes-webadmin/webmin/files/nfs-export.patch
index c17e3b2..426d637 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/nfs-export.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/nfs-export.patch
@@ -12,11 +12,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Yu Ke <ke.yu@intel.com>
 
-diff --git a/exports/save_export.cgi b/exports/save_export.cgi
-index 3bc2f97..3e60298 100755
---- a/exports/save_export.cgi
-+++ b/exports/save_export.cgi
-@@ -40,7 +40,7 @@ else {
+Index: webmin-1.850/exports/save_export.cgi
+===================================================================
+--- webmin-1.850.orig/exports/save_export.cgi
++++ webmin-1.850/exports/save_export.cgi
+@@ -50,7 +50,7 @@ else {
  			&error(&text('save_enetmask', $in{'netmask'}));
  		$exp{'host'} = $in{'network'}."/".$in{'netmask'};
  		}
@@ -25,9 +25,9 @@ index 3bc2f97..3e60298 100755
  	else {
  		$in{'host'} =~ /\*/ || &to_ipaddress($in{'host'}) ||
  			&error(&text('save_ehost', $in{'host'}));
-@@ -70,6 +70,11 @@ else {
- 
- 	delete($opts{'no_subtree_check'}); delete($opts{'subtree_check'});
+@@ -87,6 +87,11 @@ else {
+ 	delete($opts{'no_subtree_check'});
+ 	delete($opts{'subtree_check'});
  	$opts{'no_subtree_check'} = "" if ($in{'no_subtree_check'});
 +	if ($in{'no_subtree_check'}) {
 +		$opts{'no_subtree_check'} = "";
@@ -35,5 +35,5 @@ index 3bc2f97..3e60298 100755
 +		$opts{'subtree_check'} = "";
 +	}
  
- 	delete($opts{'nohide'}); delete($opts{'hide'});
- 	$opts{'nohide'} = "" if ($in{'nohide'});
+ 	delete($opts{'nohide'});
+ 	delete($opts{'hide'});
-- 
2.7.4


