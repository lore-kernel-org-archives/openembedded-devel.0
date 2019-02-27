Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0FFC77C85A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 08:13:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1R8CrEv011735
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 00:13:03 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Wed, 27 Feb 2019 00:12:42 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Feb 2019 16:12:41 +0800
Message-ID: <1551255161-11946-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lmsensors: read cpu information fail on ppc
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
X-List-Received-Date: Wed, 27 Feb 2019 08:13:13 -0000
Content-Type: text/plain

From: Dengke Du <dengke.du@windriver.com>

The program sensors-detect in lmsensors can't read the cpu
information on ppc and arm arch, such as: fsl-t4xxx based on ppc.

This is because the program sensors-detect design for the x86 and
x86-64, but weak on ppc and arm.

So add the support for the ppc and arm, just add the correspond
field to read in sensors-detect.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...fix-sensors-detect-can-t-read-the-cpu-inf.patch | 74 ++++++++++++++++++++++
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb  |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
new file mode 100644
index 0000000..2d5709f
--- /dev/null
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch
@@ -0,0 +1,74 @@
+From dd9b40c54f160a44f1d78e5946d4cd00a8852802 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Wed, 21 Sep 2016 03:17:32 -0400
+Subject: [PATCH] lm-sensors: fix sensors-detect can't read the cpu information
+ on fsl-t4xxx
+
+This is because two reasons:
+
+1. The sensors-detect program in lm-sensors depends on the file '/proc/cpuinfo',
+   different arch write different infomation to it. That program supports x86
+   and x86-64 well, but weak on ppc and arm.
+
+2. The sensors-detect program show the cpu information just design for intel's
+   cpu, when meets other arch, it can't output the correct information.
+
+So we need to add the ppc and arm support for this program:
+
+1. add the ppc cpu information field 'cpu' in initialize_cpu_list function.
+
+2. add the correspond case of ppc and arm when print cpu information in
+   print_cpu_info function.
+
+Upstream-Status: Pending
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ prog/detect/sensors-detect | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/prog/detect/sensors-detect b/prog/detect/sensors-detect
+index 5f62405..ae4def1 100755
+--- a/prog/detect/sensors-detect
++++ b/prog/detect/sensors-detect
+@@ -2833,6 +2833,7 @@ sub kernel_version_at_least
+ # model name and stepping, directly taken from /proc/cpuinfo.
+ use vars qw(@cpu);
+ 
++# The added field 'cpu' is for support the ppc.
+ sub initialize_cpu_list
+ {
+ 	local $_;
+@@ -2848,7 +2849,7 @@ sub initialize_cpu_list
+ 			};
+ 			next;
+ 		}
+-		if (m/^(vendor_id|cpu family|model|model name|stepping|cpuid level)\s*:\s*(.+)$/) {
++		if (m/^(vendor_id|cpu family|model|model name|stepping|cpuid level|cpu|revision)\s*:\s*(.+)$/) {
+ 			my $k = $1;
+ 			my $v = $2;
+ 			$v =~ s/\s+/ /g;	# Merge multiple spaces
+@@ -2861,12 +2862,20 @@ sub initialize_cpu_list
+ 	push @cpu, $entry if scalar keys(%{$entry}); # Last entry
+ }
+ 
++# The field 'model name' is for ARM.
++# The field 'cpu' is for ppc.
+ sub print_cpu_info
+ {
+ 	my $cpu = $cpu[0];
+ 	if ( $cpu->{'model name'} && $cpu->{'cpu family'} && $cpu->{model} && $cpu->{stepping} ) {
+ 		print "# Processor: $cpu->{'model name'} ($cpu->{'cpu family'}/$cpu->{model}/$cpu->{stepping})\n";
+ 	}
++	elsif ( $cpu->{'model name'} ) {
++		print "# Processor: $cpu->{'model name'}\n";
++	}
++	elsif ( $cpu->{'cpu'} && $cpu->{'revision'} ) {
++		print "# Processor: $cpu->{'cpu'} $cpu->{'revision'}\n";
++	}
+ 	else {
+ 		print "# Processor: There isn't enough cpu info for this arch!!!\n";
+ 	}
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
index ffab5d6..4dbef73 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/groeck/lm-sensors/archive/V3-4-0.tar.gz \
            file://sensord.init \
            file://0001-lmsensors-sensors-detect-print-a-special-message-whe.patch \
            file://0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch \
+           file://0001-lm-sensors-fix-sensors-detect-can-t-read-the-cpu-inf.patch \
 "
 SRC_URI[md5sum] = "1e9f117cbfa11be1955adc96df71eadb"
 SRC_URI[sha256sum] = "e334c1c2b06f7290e3e66bdae330a5d36054701ffd47a5dde7a06f9a7402cb4e"
-- 
2.7.4


