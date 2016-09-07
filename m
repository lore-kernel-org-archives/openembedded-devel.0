Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13A4D77732
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 01:47:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u871l9ZQ023433
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Sep 2016 18:47:10 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 6 Sep 2016 18:47:08 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Sep 2016 09:46:29 +0800
Message-ID: <20160907014629.24264-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [meta-oe][PATCH] lmsensors: sensors-detect: print a special message when there isn't enough cpu info
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
X-List-Received-Date: Wed, 07 Sep 2016 01:47:13 -0000
Content-Type: text/plain

When running sensors-detect, if there isn't enough information in
/proc/cpuinfo for this arch (e.g. ppc64), "Use of uninitialized value
in concatenation (.) or string at /usr/sbin/sensors-detect line 2867"
and incomplete "# Processor: (//)" will be printed.
Here print out a prompt for such a case.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...ensors-detect-print-a-special-message-whe.patch | 40 ++++++++++++++++++++++
 .../recipes-support/lm_sensors/lmsensors_3.4.0.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch b/meta-oe/recipes-support/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch
new file mode 100644
index 0000000..abf6e75
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch
@@ -0,0 +1,40 @@
+From c4428260e7685ebaf5c26c6ecaae5a56849853e8 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Tue, 6 Sep 2016 14:04:29 +0800
+Subject: [PATCH] lmsensors: sensors-detect: print a special message when there
+ isn't enough cpu info
+
+When running sensors-detect, if there isn't enough information in
+/proc/cpuinfo for this arch (e.g. ppc64), "Use of uninitialized value
+in concatenation (.) or string at /usr/sbin/sensors-detect line 2867"
+and incomplete "# Processor: (//)" will be printed.
+Here print out a prompt for such a case.
+
+Upstream-Status: Pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ prog/detect/sensors-detect | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/prog/detect/sensors-detect b/prog/detect/sensors-detect
+index 3c2b44f..5f62405 100755
+--- a/prog/detect/sensors-detect
++++ b/prog/detect/sensors-detect
+@@ -2864,7 +2864,12 @@ sub initialize_cpu_list
+ sub print_cpu_info
+ {
+ 	my $cpu = $cpu[0];
+-	print "# Processor: $cpu->{'model name'} ($cpu->{'cpu family'}/$cpu->{model}/$cpu->{stepping})\n";
++	if ( $cpu->{'model name'} && $cpu->{'cpu family'} && $cpu->{model} && $cpu->{stepping} ) {
++		print "# Processor: $cpu->{'model name'} ($cpu->{'cpu family'}/$cpu->{model}/$cpu->{stepping})\n";
++	}
++	else {
++		print "# Processor: There isn't enough cpu info for this arch!!!\n";
++	}
+ }
+ 
+ # @i2c_adapters is a list of references to hashes, one hash per I2C/SMBus
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
index 857a57b..8215d90 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
@@ -10,6 +10,7 @@ DEPENDS = "sysfsutils virtual/libiconv bison-native flex-native rrdtool"
 SRC_URI = "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2 \
            file://fancontrol.init \
            file://sensord.init \
+           file://0001-lmsensors-sensors-detect-print-a-special-message-whe.patch \
 "
 SRC_URI[md5sum] = "c03675ae9d43d60322110c679416901a"
 SRC_URI[sha256sum] = "e0579016081a262dd23eafe1d22b41ebde78921e73a1dcef71e05e424340061f"
-- 
2.9.0


