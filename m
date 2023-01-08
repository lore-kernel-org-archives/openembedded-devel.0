Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B7AC54EBE
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:52 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.46815.1673191303593452693
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BfgBnbUr;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id n8so5208706oih.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpqDJ2APuZ1oCGAUdm4MUELLr54CPAGeppN3YgyMh6k=;
        b=BfgBnbUrCvNgjFS+tWItegivUC8c0rrMqmj0i0L3NrQmnzL2RdkS4xX9jTtbpvtv+r
         UkrKERY+wCj+Q4cmdvBRSiw/sT0ntaNyLdjgkq43v09/hb2V/E5ZCP3C9/9WB8HRuZw0
         TLqvHmxxSHFgWykt58V1+FTCf2wnUSBKRL7Rzib7G5vfJbnVs+RlblFWwuya1DJYgtCm
         apHXnCuWonYhTNqCAqJI/WGHmwoe6CCnSFE/k/HrCJ1CvGK2rY1R9ixccjWRFxeCgzNQ
         K1k732kHU588G/6CHghviMU9dToSTjYDy0sWyroaTMvEL/K/ZSMi6f3A+ipoUOTQZx0A
         9TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpqDJ2APuZ1oCGAUdm4MUELLr54CPAGeppN3YgyMh6k=;
        b=HKzL4rd1sZu0/A59NA6Wzv2/NGk+/AERqQBFdv0p6dZfvx9CWuSsNgN5ZJSgeHo484
         dcYm+74hmXj2pD98fCwONQ+OyZn1FUuJz+gV0nMMt3/45cXwR4c0y9xjneMw0WiY5PFq
         rl0Ygtdw0bRXswM9tr7tRVvkmOCbYCS5bZF5DGInLLn1g1OSUPrAEX6s2bX3VfXvpwmC
         uwKbQoPs4o1L3f+T3sWzVg4EQsCMRAqB7yJz6Q93kVKi7PhuDsiM9J6w3TzwGU7EXB2Q
         3cYiL5vTurKmcuhI4tnnjKi6XLuBhNZFBf9toyjt3fZ4l6Rr/PAH3oFX+jwtRSTdYjF8
         vI5g==
X-Gm-Message-State: AFqh2kqzza0PkQF5EcHNJb96FheKrW/RWSiggAhjuNAUVMi0dXudXMM5
	/nLmPFGFg03smSSwIFG14tkF0C+m4FY=
X-Google-Smtp-Source: AMrXdXuo9bCaqOMJRmLCeUPeCZUwgNdsqpiH9x6Qs7jWZYxf6DbvPIq2XqYBYaS9jSZ8joQ/1AwqPg==
X-Received: by 2002:a05:6808:7dd:b0:361:1e04:8360 with SMTP id f29-20020a05680807dd00b003611e048360mr28964956oij.31.1673191302611;
        Sun, 08 Jan 2023 07:21:42 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 22/26] dool: Add patch to fix rebuild
Date: Sun,  8 Jan 2023 10:20:57 -0500
Message-Id: <4f15bf4a46d04945f6640c08bb1589c17fb138b6.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100467

From: Alexander Stein <alexander.stein@ew.tq-group.com>

When cleaning the package during rebuild in base_do_configure()
'make clean' deletes docs/dool.1. This files comes from source repository
but can't be recreated using 'make docs'.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 19f28fb34e2fa15b30274b97d10b8ecbdafaaf19)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dool/dool/0001-Fix-rename-in-docs.patch   | 261 ++++++++++++++++++
 meta-oe/recipes-support/dool/dool_1.1.0.bb    |   1 +
 2 files changed, 262 insertions(+)
 create mode 100644 meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch

diff --git a/meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch b/meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch
new file mode 100644
index 0000000000..8d576f5d58
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
index dcb66c7fd4..211f3a2b11 100644
--- a/meta-oe/recipes-support/dool/dool_1.1.0.bb
+++ b/meta-oe/recipes-support/dool/dool_1.1.0.bb
@@ -11,6 +11,7 @@ DEPENDS += "asciidoc-native xmlto-native"
 
 SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=https \
 	   file://0001-Fix-build-error-as-following.patch \
+	   file://0001-Fix-rename-in-docs.patch \
           "
 
 SRCREV = "41ec7b392b358dae29f0b587711d5c8f7f462805"
-- 
2.25.1


