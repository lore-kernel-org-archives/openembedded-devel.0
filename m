Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08528C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 13:55:37 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.14236.1670507733376396319
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Dec 2022 05:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=fzTRchQQ;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670507733; x=1702043733;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vxw2OkU0mm4FML77sbpsm560S/ZZPj0leyiBp0ueCuI=;
  b=fzTRchQQ/17tNcv4KuJi0SLYfL43PTZ2dmIyuc02jJ1jJ3QdAySD3fC8
   oN+jvbuL+wXXQkUeHfiVBibZSGqN5nn3HOZaNDSXbNBhdiuPQpX08rQhd
   RQt7mc/ZptJRnTYyjwvC4pGvo9nDLl0iGJTUSxP3cyWSJ5FEsduf/hA0x
   yK+UPaREcQLrzEjVLhauJIflWUjbNk+gJjiUR/+jXacPelGrr/9bpntKq
   7QliFwvYUD33A+LQeQYtyWUQeRClKj14cM6lJX9qgKO+Ti/KubC1DoyCe
   1cQasi+w7/I5KnWIdLgaXaiioS98rl0F0UEc2CgObtJ3kvlPacZRN5J2t
   g==;
X-IronPort-AV: E=Sophos;i="5.96,227,1665439200"; 
   d="scan'208";a="27841630"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 08 Dec 2022 14:55:31 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 08 Dec 2022 14:55:31 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 08 Dec 2022 14:55:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670507731; x=1702043731;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vxw2OkU0mm4FML77sbpsm560S/ZZPj0leyiBp0ueCuI=;
  b=d79niXKimhagx9S9LGy5k8tYC9pWDu4DVg8G6kS4tJjWNLBdB3IQGOo5
   uT10T04uFRVBQf1fI5Ot1UyIY5wqrMyl9F12hTyTGnTMCejN7tqtQMsii
   FY0JH6VUoeM9Ot4+Gphfs7ChssIwFBiCVBCajmmf+AMzvCD+Fnm2XbzIC
   C+VjLQ4Wi7zbRSTsemJgClvZ28ZZq3dMM7ZnuSywSib+rdwtwfvZjXBsq
   va38VZ2sE7a/KNL44pUJoo43BTbVh0U90wxoATmXgn1ByyqZCWmbcXRVc
   ghdylHCHY3GmYcseuqhVFZvc3vzDobhPf/I1JuMsYZbOdvzltFdP6jToj
   A==;
X-IronPort-AV: E=Sophos;i="5.96,227,1665439200"; 
   d="scan'208";a="27841629"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 08 Dec 2022 14:55:31 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 287B5280071;
	Thu,  8 Dec 2022 14:55:31 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [meta-oe][PATCH] dool: Add patch to fix rebuild
Date: Thu,  8 Dec 2022 14:55:24 +0100
Message-Id: <20221208135525.3224333-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 13:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99995

When cleaning the package during rebuild in base_do_configure()
'make clean' deletes docs/dool.1. This files comes from source repository
but can't be recreated using 'make docs'.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Steps to reproduce:
1. bitbake -c cleanall dool
2. bitbake dool
3. echo "foobar" > tmp/work/cortexa72-cortexa53-tq-linux/dool/1.0.0-r0/configure.sstate
4. bitbake --clear-stamp=do_prepare_recipe_sysroot dool

Step 3 is just for invalidating the checksum.

 .../dool/dool/0001-Fix-rename-in-docs.patch   | 261 ++++++++++++++++++
 meta-oe/recipes-support/dool/dool_1.1.0.bb    |   1 +
 2 files changed, 262 insertions(+)
 create mode 100644 meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch

diff --git a/meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch b/meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch
new file mode 100644
index 000000000..8d576f5d5
--- /dev/null
+++ b/meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch
@@ -0,0 +1,261 @@
+From 689c65fb050976d5a548a5b9a0f5d2c14eaa3301 Mon Sep 17 00:00:00 2001
+From: Alexander Stein <alexander.stein@tq-group.com>
+Date: Thu, 8 Dec 2022 14:11:46 +0100
+Subject: [PATCH 1/1] Fix rename in docs
+
+The content of dool.1.adoc is completly unchanged from dstat.1.adoc.
+Unfortunately the 'NAME' specifies the created file name. So
+building/cleaning docs is currently broken
+
+Upstream-Status: Pending
+https://github.com/scottchiefbaker/dool/pull/30
+
+Signed-off-by: Alexander Stein <alexander.stein@tq-group.com>
+---
+ docs/dool.1.adoc | 108 +++++++++++++++++++++++------------------------
+ 1 file changed, 54 insertions(+), 54 deletions(-)
+
+diff --git a/docs/dool.1.adoc b/docs/dool.1.adoc
+index 24c4a54..921df1f 100644
+--- a/docs/dool.1.adoc
++++ b/docs/dool.1.adoc
+@@ -1,35 +1,35 @@
+-= dstat(1)
++= dool(1)
+ Dag Wieers <dag@wieers.com>
+ v0.7.3, August 2014
+ 
+ 
+ == NAME
+-dstat - versatile tool for generating system resource statistics
++dool - versatile tool for generating system resource statistics
+ 
+ 
+ == SYNOPSIS
+-dstat [-afv] [options..] [delay [count]]
++dool [-afv] [options..] [delay [count]]
+ 
+ 
+ == DESCRIPTION
+-Dstat is a versatile replacement for vmstat, iostat and ifstat. Dstat
++Dool is a versatile replacement for vmstat, iostat and ifstat. Dool
+ overcomes some of the limitations and adds some extra features.
+ 
+-Dstat allows you to view all of your system resources instantly, you
++Dool allows you to view all of your system resources instantly, you
+ can eg. compare disk usage in combination with interrupts from your
+ IDE controller, or compare the network bandwidth numbers directly with
+ the disk throughput (in the same interval).
+ 
+-Dstat also cleverly gives you the most detailed information in columns
++Dool also cleverly gives you the most detailed information in columns
+ and clearly indicates in what magnitude and unit the output is displayed.
+ Less confusion, less mistakes, more efficient.
+ 
+-Dstat is unique in letting you aggregate block device throughput for a
++Dool is unique in letting you aggregate block device throughput for a
+ certain diskset or network bandwidth for a group of interfaces, ie. 
+ you can see the throughput for all the block devices that make up a
+ single filesystem or storage system.
+ 
+-Dstat allows its data to be directly written to a CSV file to be
++Dool allows its data to be directly written to a CSV file to be
+ imported and used by OpenOffice, Gnumeric or Excel to create graphs.
+ 
+ [NOTE]
+@@ -187,13 +187,13 @@ Possible internal stats are::
+     write CSV output to file
+ 
+ --profile::
+-    show profiling statistics when exiting dstat
++    show profiling statistics when exiting dool
+ 
+ 
+ == PLUGINS
+-While anyone can create their own dstat plugins (and contribute them) dstat
++While anyone can create their own dool plugins (and contribute them) dool
+ ships with a number of plugins already that extend its capabilities greatly.
+-Here is an overview of the plugins dstat ships with:
++Here is an overview of the plugins dool ships with:
+ 
+ --battery::
+     battery in percentage (needs ACPI)
+@@ -225,17 +225,17 @@ Here is an overview of the plugins dstat ships with:
+ --disk-wait::
+     average time (in milliseconds) for I/O requests issued to the device to be served
+ 
+---dstat::
+-    show dstat cputime consumption and latency
++--dool::
++    show dool cputime consumption and latency
+ 
+---dstat-cpu::
+-    show dstat advanced cpu usage
++--dool-cpu::
++    show dool advanced cpu usage
+ 
+---dstat-ctxt::
+-    show dstat context switches
++--dool-ctxt::
++    show dool context switches
+ 
+---dstat-mem::
+-    show dstat advanced memory usage
++--dool-mem::
++    show dool advanced memory usage
+ 
+ --fan::
+     fan speed (needs ACPI)
+@@ -250,7 +250,7 @@ Here is an overview of the plugins dstat ships with:
+     GPFS filesystem operations (needs mmpmon)
+ 
+ --helloworld::
+-    Hello world example dstat plugin
++    Hello world example dool plugin
+ 
+ --innodb-buffer::
+     show innodb buffer stats
+@@ -340,22 +340,22 @@ Here is an overview of the plugins dstat ships with:
+     show sendmail queue size (needs sendmail)
+ 
+ --snmp-cpu::
+-    show CPU stats using SNMP from DSTAT_SNMPSERVER
++    show CPU stats using SNMP from DOOL_SNMPSERVER
+ 
+ --snmp-load::
+-    show load stats using SNMP from DSTAT_SNMPSERVER
++    show load stats using SNMP from DOOL_SNMPSERVER
+ 
+ --snmp-mem::
+-    show memory stats using SNMP from DSTAT_SNMPSERVER
++    show memory stats using SNMP from DOOL_SNMPSERVER
+ 
+ --snmp-net::
+-    show network stats using SNMP from DSTAT_SNMPSERVER
++    show network stats using SNMP from DOOL_SNMPSERVER
+ 
+ --snmp-net-err:
+-    show network errors using SNMP from DSTAT_SNMPSERVER
++    show network errors using SNMP from DOOL_SNMPSERVER
+ 
+ --snmp-sys::
+-    show system stats (interrupts and context switches) using SNMP from DSTAT_SNMPSERVER
++    show system stats (interrupts and context switches) using SNMP from DOOL_SNMPSERVER
+ 
+ --snooze::
+     show number of ticks per second
+@@ -463,7 +463,7 @@ The default delay is 1 and count is unspecified (unlimited)
+ 
+ 
+ == INTERMEDIATE UPDATES
+-When invoking dstat with a *delay* greater than 1 and without the
++When invoking dool with a *delay* greater than 1 and without the
+ *--noupdate* option, it will show intermediate updates, ie. the first
+ time a 1 sec average, the second update a 2 second average, etc. until
+ the delay has been reached.
+@@ -475,34 +475,34 @@ average on a new line, just like with vmstat.
+ 
+ 
+ == EXAMPLES
+-Using dstat to relate disk-throughput with network-usage (eth0), total CPU-usage and system counters:
++Using dool to relate disk-throughput with network-usage (eth0), total CPU-usage and system counters:
+ ----
+-dstat -dnyc -N eth0 -C total -f 5
++dool -dnyc -N eth0 -C total -f 5
+ ----
+ 
+-Checking dstat's behaviour and the system impact of dstat:
++Checking dool's behaviour and the system impact of dool:
+ ----
+-dstat -taf --debug
++dool -taf --debug
+ ----
+ 
+ Using the time plugin together with cpu, net, disk, system, load, proc and
+ top_cpu plugins:
+ ----
+-dstat -tcndylp --top-cpu
++dool -tcndylp --top-cpu
+ ----
+ this is identical to
+ ----
+-dstat --time --cpu --net --disk --sys --load --proc --top-cpu
++dool --time --cpu --net --disk --sys --load --proc --top-cpu
+ ----
+ 
+-Using dstat to relate advanced cpu stats with interrupts per device:
++Using dool to relate advanced cpu stats with interrupts per device:
+ ----
+-dstat -t --cpu-adv -yif
++dool -t --cpu-adv -yif
+ ----
+ 
+ 
+ == BUGS
+-Since it is practically impossible to test dstat on every possible
++Since it is practically impossible to test dool on every possible
+ permutation of kernel, python or distribution version, I need your
+ help and your feedback to fix the remaining problems. If you have
+ improvements or bugreports, please send them to:
+@@ -513,40 +513,40 @@ Please see the TODO file for known bugs and future plans.
+ 
+ 
+ == FILES
+-Paths that may contain external dstat_*.py plugins:
++Paths that may contain external dool_*.py plugins:
+ 
+-    ~/.dstat/
++    ~/.dool/
+     (path of binary)/plugins/
+-    /usr/share/dstat/
+-    /usr/local/share/dstat/
++    /usr/share/dool/
++    /usr/local/share/dool/
+ 
+ == ENVIRONMENT VARIABLES
+ 
+-Dstat will read additional command line arguments from the environment
+-variable *DSTAT_OPTS*. You can use this to configure Dstat's default
++Dool will read additional command line arguments from the environment
++variable *DOOL_OPTS*. You can use this to configure Dool's default
+ behavior, e.g. if you have a black-on-white terminal:
+ 
+-    export DSTAT_OPTS="--bw --noupdate"
++    export DOOL_OPTS="--bw --noupdate"
+ 
+ Other internal or external plugins have their own environment variables
+ to influence their behavior, e.g.
+ 
+ 
+-    DSTAT_NTPSERVER
++    DOOL_NTPSERVER
+ 
+-    DSTAT_MYSQL
+-    DSTAT_MYSQL_HOST
+-    DSTAT_MYSQL_PORT
+-    DSTAT_MYSQL_SOCKET
+-    DSTAT_MYSQL_USER
+-    DSTAT_MYSQL_PWD
++    DOOL_MYSQL
++    DOOL_MYSQL_HOST
++    DOOL_MYSQL_PORT
++    DOOL_MYSQL_SOCKET
++    DOOL_MYSQL_USER
++    DOOL_MYSQL_PWD
+ 
+-    DSTAT_SNMPSERVER
+-    DSTAT_SNMPCOMMUNITY
++    DOOL_SNMPSERVER
++    DOOL_SNMPCOMMUNITY
+ 
+-    DSTAT_SQUID_OPTS
++    DOOL_SQUID_OPTS
+ 
+-    DSTAT_TIMEFMT
++    DOOL_TIMEFMT
+ 
+ == SEE ALSO
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/dool/dool_1.1.0.bb b/meta-oe/recipes-support/dool/dool_1.1.0.bb
index dcb66c7fd..211f3a2b1 100644
--- a/meta-oe/recipes-support/dool/dool_1.1.0.bb
+++ b/meta-oe/recipes-support/dool/dool_1.1.0.bb
@@ -11,6 +11,7 @@ DEPENDS += "asciidoc-native xmlto-native"
 
 SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=https \
 	   file://0001-Fix-build-error-as-following.patch \
+	   file://0001-Fix-rename-in-docs.patch \
           "
 
 SRCREV = "41ec7b392b358dae29f0b587711d5c8f7f462805"
-- 
2.34.1


