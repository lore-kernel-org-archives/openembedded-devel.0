Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EC5117F896
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 07:21:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77731113"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 15:21:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id EE5EF4CE1511
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 15:13:28 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 31 Oct 2019 15:21:28 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 23:15:54 +0800
Message-ID: <1572534954-51304-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EE5EF4CE1511.A9662
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] lmsensors: upgrade 3.5.0 -> 3.6.0
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
X-List-Received-Date: Thu, 31 Oct 2019 07:21:29 -0000
Content-Type: text/plain

1) Upgrade lmsensors from 3.5.0 to 3.6.0.

2) Remove two patches for their function have been included in new version.
   0001-lmsensors-sensors-detect-print-a-special-message-whe.patch
   0002-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...ensors-detect-print-a-special-message-whe.patch | 40 ------------
 ...fix-sensors-detect-can-t-read-the-cpu-inf.patch | 74 ----------------------
 .../{lmsensors_3.5.0.bb => lmsensors_3.6.0.bb}     |  4 +-
 3 files changed, 1 insertion(+), 117 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch
 delete mode 100644 meta-oe/recipes-bsp/lm_sensors/lmsensors/0002-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
 rename meta-oe/recipes-bsp/lm_sensors/{lmsensors_3.5.0.bb => lmsensors_3.6.0.bb} (96%)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch
deleted file mode 100644
index 337fb11..0000000
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 05a4d54e2adc4caed507baca529089ec01f48340 Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Tue, 6 Sep 2016 14:04:29 +0800
-Subject: [PATCH 1/2] lmsensors: sensors-detect: print a special message when
- there isn't enough cpu info
-
-When running sensors-detect, if there isn't enough information in
-/proc/cpuinfo for this arch (e.g. ppc64), "Use of uninitialized value
-in concatenation (.) or string at /usr/sbin/sensors-detect line 2867"
-and incomplete "# Processor: (//)" will be printed.
-Here print out a prompt for such a case.
-
-Upstream-Status: Pending
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- prog/detect/sensors-detect | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/prog/detect/sensors-detect b/prog/detect/sensors-detect
-index 0b3b0ff2..68594cd7 100755
---- a/prog/detect/sensors-detect
-+++ b/prog/detect/sensors-detect
-@@ -3119,7 +3119,12 @@ sub initialize_cpu_list
- sub print_cpu_info
- {
- 	my $cpu = $cpu[0];
--	print "# Processor: $cpu->{'model name'} ($cpu->{'cpu family'}/$cpu->{model}/$cpu->{stepping})\n";
-+	if ( $cpu->{'model name'} && $cpu->{'cpu family'} && $cpu->{model} && $cpu->{stepping} ) {
-+		print "# Processor: $cpu->{'model name'} ($cpu->{'cpu family'}/$cpu->{model}/$cpu->{stepping})\n";
-+	}
-+	else {
-+		print "# Processor: There isn't enough cpu info for this arch!!!\n";
-+	}
- }
- 
- # @i2c_adapters is a list of references to hashes, one hash per I2C/SMBus
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0002-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0002-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
deleted file mode 100644
index 68f51f5..0000000
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0002-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 26742544bc9f136093b6be78259f4a891870aa3c Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 21 Sep 2016 03:17:32 -0400
-Subject: [PATCH 2/2] lm-sensors: fix sensors-detect can't read the cpu
- information on fsl-t4xxx
-
-This is because two reasons:
-
-1. The sensors-detect program in lm-sensors depends on the file '/proc/cpuinfo',
-   different arch write different infomation to it. That program supports x86
-   and x86-64 well, but weak on ppc and arm.
-
-2. The sensors-detect program show the cpu information just design for intel's
-   cpu, when meets other arch, it can't output the correct information.
-
-So we need to add the ppc and arm support for this program:
-
-1. add the ppc cpu information field 'cpu' in initialize_cpu_list function.
-
-2. add the correspond case of ppc and arm when print cpu information in
-   print_cpu_info function.
-
-Upstream-Status: Pending
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- prog/detect/sensors-detect | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/prog/detect/sensors-detect b/prog/detect/sensors-detect
-index 68594cd7..efe2c1af 100755
---- a/prog/detect/sensors-detect
-+++ b/prog/detect/sensors-detect
-@@ -3088,6 +3088,7 @@ sub kernel_version_at_least
- # model name and stepping, directly taken from /proc/cpuinfo.
- use vars qw(@cpu);
- 
-+# The added field 'cpu' is for support the ppc.
- sub initialize_cpu_list
- {
- 	local $_;
-@@ -3103,7 +3104,7 @@ sub initialize_cpu_list
- 			};
- 			next;
- 		}
--		if (m/^(vendor_id|cpu family|model|model name|stepping|cpuid level)\s*:\s*(.+)$/) {
-+		if (m/^(vendor_id|cpu family|model|model name|stepping|cpuid level|cpu|revision)\s*:\s*(.+)$/) {
- 			my $k = $1;
- 			my $v = $2;
- 			$v =~ s/\s+/ /g;	# Merge multiple spaces
-@@ -3116,12 +3117,20 @@ sub initialize_cpu_list
- 	push @cpu, $entry if scalar keys(%{$entry}); # Last entry
- }
- 
-+# The field 'model name' is for ARM.
-+# The field 'cpu' is for ppc.
- sub print_cpu_info
- {
- 	my $cpu = $cpu[0];
- 	if ( $cpu->{'model name'} && $cpu->{'cpu family'} && $cpu->{model} && $cpu->{stepping} ) {
- 		print "# Processor: $cpu->{'model name'} ($cpu->{'cpu family'}/$cpu->{model}/$cpu->{stepping})\n";
- 	}
-+	elsif ( $cpu->{'model name'} ) {
-+		print "# Processor: $cpu->{'model name'}\n";
-+	}
-+	elsif ( $cpu->{'cpu'} && $cpu->{'revision'} ) {
-+		print "# Processor: $cpu->{'cpu'} $cpu->{'revision'}\n";
-+	}
- 	else {
- 		print "# Processor: There isn't enough cpu info for this arch!!!\n";
- 	}
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
similarity index 96%
rename from meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index ffafd17..48490e8 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -14,10 +14,8 @@ DEPENDS = " \
 SRC_URI = "git://github.com/lm-sensors/lm-sensors.git;protocol=https \
            file://fancontrol.init \
            file://sensord.init \
-           file://0001-lmsensors-sensors-detect-print-a-special-message-whe.patch \
-           file://0002-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch \
 "
-SRCREV = "e8afbda10fba571c816abddcb5c8180afc435bba"
+SRCREV = "1667b850a1ce38151dae17156276f981be6fb557"
 
 inherit update-rc.d systemd
 
-- 
2.7.4




