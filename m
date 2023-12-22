Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70713C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 05:16:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.15864.1703222176345296700
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 21:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YvySscL+;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d2e56f3a6so8439105e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 21:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703222174; x=1703826974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i43qhWvv5sbVBd/2jth/B8ff2n1lnY1TEvOfmg7+elA=;
        b=YvySscL+Auc9f/JvOJvkT2MDhJll1teHH6fSusM2BAZO3Spb4A+iaW8lheY8yqrkPN
         wQ2kpyMcl0BP6U/Cf8tX8HUKhOG/HRh0m9T11fSDzWdtPvjRmnjzvSIb6dsOiuspQE4C
         r5SNW/PDVBFuCB2UPBFdpCzrtlW9Lp4lflmyJxCDNNZhyhs9CqS007aOCCe4Ge2HJezz
         g8BCvMTRBN//9g2I0ya4qDMirIxqNajr9ZiI66HZpLfgYgLyiGLxaq8jk2qaossmCOB+
         37P4co0dhbP5GCdCxLkqY55jyMbcR407yjOLRyCcDRwFOTOhsQfahBAeu+57its4RprW
         Os8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703222174; x=1703826974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i43qhWvv5sbVBd/2jth/B8ff2n1lnY1TEvOfmg7+elA=;
        b=v6qQQmCoEh8zh8vsycHr86X2NfTEpV3eGwH+pv78AlRErwo+nFS2AwCxmY30SVcuxY
         itlmrdT7RGrdRJmnfQNVO2hMl4qy36iCyiVtJn+rlB87e6MBPgUyHjQlJyHTVUB9uZ1Z
         fz7VgHhvqvP5wNZHvONvCUWNBQl3Kx3Yc4L5cHrhsiAbFwdiQPU5GUyksEb65YPne8uS
         82k9OidD4Zzo349LyCzLpxUFI/KnMY9gc381zqQEJsSuJZffOiSIN3AHox1KGM+cDrnv
         vEgwZ0ngRTxdD7iTnTyXEotJozyzeC43WKChmg+ub7NE//L/+lItStmyINbV49Yyk3yB
         bdcA==
X-Gm-Message-State: AOJu0YzNbHwuqwucc9RbeIXwtNKymh89ucz/b9WQXWFyqdjorE25Pz1C
	WJLEThozglZNnkUvzrwlniX/qMj6tUU=
X-Google-Smtp-Source: AGHT+IEyBhVWzmerqnOVD9i+Cx+HYlr4Ejl9a/l1F8rJAHTAyps/apjyniqMoZGIR7esoEtTc0+7uQ==
X-Received: by 2002:a05:600c:3053:b0:40d:2b27:4ffd with SMTP id n19-20020a05600c305300b0040d2b274ffdmr316454wmh.70.1703222173809;
        Thu, 21 Dec 2023 21:16:13 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id hn34-20020a05600ca3a200b0040d1bd0e716sm5468674wmb.9.2023.12.21.21.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 21:16:13 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] dool: upgrade 1.1.0 -> 1.3.1
Date: Fri, 22 Dec 2023 08:16:08 +0300
Message-Id: <20231222051608.8896-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 05:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107743

* Patches removed because fixed in the new version
* License-Update: GPL-2.0 -> GPL-3.0

Changelog:

* Fix help of vmstat (as it includes sys instead of swap)
* Fix multiple SWAP's breaks output
* Better support for NVME drives
* Support for Python v3.12
* Shorter and more concise device names
* add support for terminals with only 16 colors
* Correctly report disk stats for NVME drives
* Capture VM name for top-cpu
* Properly capitalize unit letters for real this time
* Add a \n to output when using a count
* Fix the NTP plugin for Python 3.x
* Massive internal naming change dstat -> dool
* Fix bits/bytes in CSV file output
* Add a --devel logging option to assist in future developementg
* Update Github templates to simplify them and reflect the Dool name
* Lots of comments in the code as I slowly learn more about how it works
* --output now correctly writes to files cleanly
    Introduced --display to allow outputting to both screen and file
* Fix building docs with make docs
* Update the .spec file to allow building RPMs for Dool on modern systems
* Fix potential crashes from "OverflowError: cannot convert float infinity to integer"
* Updated Lustre plugin for modern versions
* Cleaned up output of sub frames in table output
* Add a plug-in for Linux bonding devices
* Add signal handling to better close down things when dool quits
* Added an option for --diskset to group drives together

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../0001-Fix-build-error-as-following.patch   |  39 ---
 .../dool/dool/0001-Fix-rename-in-docs.patch   | 261 ------------------
 meta-oe/recipes-support/dool/dool_1.1.0.bb    |  25 --
 meta-oe/recipes-support/dool/dool_1.3.1.bb    |  23 ++
 4 files changed, 23 insertions(+), 325 deletions(-)
 delete mode 100644 meta-oe/recipes-support/dool/dool/0001-Fix-build-error-as-following.patch
 delete mode 100644 meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch
 delete mode 100644 meta-oe/recipes-support/dool/dool_1.1.0.bb
 create mode 100644 meta-oe/recipes-support/dool/dool_1.3.1.bb

diff --git a/meta-oe/recipes-support/dool/dool/0001-Fix-build-error-as-following.patch b/meta-oe/recipes-support/dool/dool/0001-Fix-build-error-as-following.patch
deleted file mode 100644
index 2324af499..000000000
--- a/meta-oe/recipes-support/dool/dool/0001-Fix-build-error-as-following.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e81feec1ebbc676220cd8759d83f46335602d079 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@fujitsu.com>
-Date: Fri, 7 Jan 2022 14:37:36 +0900
-Subject: [PATCH] Fix build error as following:
-
-*** No rule to make target 'dstat.1', needed by 'docs'.  Stop.
-
-Upstream-Status: Pending
-
-Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
----
- docs/Makefile | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/docs/Makefile b/docs/Makefile
-index c031e82..1a85e61 100644
---- a/docs/Makefile
-+++ b/docs/Makefile
-@@ -11,13 +11,13 @@ all:
- 
- dist: docs
- 
--docs: dstat.1 $(htmltargets)
-+docs: dool.1 $(htmltargets)
- 
--install: dstat.1
--	install -Dp -m0644 dstat.1 $(DESTDIR)$(mandir)/man1/dstat.1
-+install: dool.1
-+	install -Dp -m0644 dool.1 $(DESTDIR)$(mandir)/man1/dool.1
- 
- clean:
--	rm -f dstat.1 *.html *.xml
-+	rm -f dool.1 *.html *.xml
- 
- %.1.html: %.1.adoc
- 	asciidoc -d manpage $<
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch b/meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch
deleted file mode 100644
index 8d576f5d5..000000000
--- a/meta-oe/recipes-support/dool/dool/0001-Fix-rename-in-docs.patch
+++ /dev/null
@@ -1,261 +0,0 @@
-From 689c65fb050976d5a548a5b9a0f5d2c14eaa3301 Mon Sep 17 00:00:00 2001
-From: Alexander Stein <alexander.stein@tq-group.com>
-Date: Thu, 8 Dec 2022 14:11:46 +0100
-Subject: [PATCH 1/1] Fix rename in docs
-
-The content of dool.1.adoc is completly unchanged from dstat.1.adoc.
-Unfortunately the 'NAME' specifies the created file name. So
-building/cleaning docs is currently broken
-
-Upstream-Status: Pending
-https://github.com/scottchiefbaker/dool/pull/30
-
-Signed-off-by: Alexander Stein <alexander.stein@tq-group.com>
----
- docs/dool.1.adoc | 108 +++++++++++++++++++++++------------------------
- 1 file changed, 54 insertions(+), 54 deletions(-)
-
-diff --git a/docs/dool.1.adoc b/docs/dool.1.adoc
-index 24c4a54..921df1f 100644
---- a/docs/dool.1.adoc
-+++ b/docs/dool.1.adoc
-@@ -1,35 +1,35 @@
--= dstat(1)
-+= dool(1)
- Dag Wieers <dag@wieers.com>
- v0.7.3, August 2014
- 
- 
- == NAME
--dstat - versatile tool for generating system resource statistics
-+dool - versatile tool for generating system resource statistics
- 
- 
- == SYNOPSIS
--dstat [-afv] [options..] [delay [count]]
-+dool [-afv] [options..] [delay [count]]
- 
- 
- == DESCRIPTION
--Dstat is a versatile replacement for vmstat, iostat and ifstat. Dstat
-+Dool is a versatile replacement for vmstat, iostat and ifstat. Dool
- overcomes some of the limitations and adds some extra features.
- 
--Dstat allows you to view all of your system resources instantly, you
-+Dool allows you to view all of your system resources instantly, you
- can eg. compare disk usage in combination with interrupts from your
- IDE controller, or compare the network bandwidth numbers directly with
- the disk throughput (in the same interval).
- 
--Dstat also cleverly gives you the most detailed information in columns
-+Dool also cleverly gives you the most detailed information in columns
- and clearly indicates in what magnitude and unit the output is displayed.
- Less confusion, less mistakes, more efficient.
- 
--Dstat is unique in letting you aggregate block device throughput for a
-+Dool is unique in letting you aggregate block device throughput for a
- certain diskset or network bandwidth for a group of interfaces, ie. 
- you can see the throughput for all the block devices that make up a
- single filesystem or storage system.
- 
--Dstat allows its data to be directly written to a CSV file to be
-+Dool allows its data to be directly written to a CSV file to be
- imported and used by OpenOffice, Gnumeric or Excel to create graphs.
- 
- [NOTE]
-@@ -187,13 +187,13 @@ Possible internal stats are::
-     write CSV output to file
- 
- --profile::
--    show profiling statistics when exiting dstat
-+    show profiling statistics when exiting dool
- 
- 
- == PLUGINS
--While anyone can create their own dstat plugins (and contribute them) dstat
-+While anyone can create their own dool plugins (and contribute them) dool
- ships with a number of plugins already that extend its capabilities greatly.
--Here is an overview of the plugins dstat ships with:
-+Here is an overview of the plugins dool ships with:
- 
- --battery::
-     battery in percentage (needs ACPI)
-@@ -225,17 +225,17 @@ Here is an overview of the plugins dstat ships with:
- --disk-wait::
-     average time (in milliseconds) for I/O requests issued to the device to be served
- 
----dstat::
--    show dstat cputime consumption and latency
-+--dool::
-+    show dool cputime consumption and latency
- 
----dstat-cpu::
--    show dstat advanced cpu usage
-+--dool-cpu::
-+    show dool advanced cpu usage
- 
----dstat-ctxt::
--    show dstat context switches
-+--dool-ctxt::
-+    show dool context switches
- 
----dstat-mem::
--    show dstat advanced memory usage
-+--dool-mem::
-+    show dool advanced memory usage
- 
- --fan::
-     fan speed (needs ACPI)
-@@ -250,7 +250,7 @@ Here is an overview of the plugins dstat ships with:
-     GPFS filesystem operations (needs mmpmon)
- 
- --helloworld::
--    Hello world example dstat plugin
-+    Hello world example dool plugin
- 
- --innodb-buffer::
-     show innodb buffer stats
-@@ -340,22 +340,22 @@ Here is an overview of the plugins dstat ships with:
-     show sendmail queue size (needs sendmail)
- 
- --snmp-cpu::
--    show CPU stats using SNMP from DSTAT_SNMPSERVER
-+    show CPU stats using SNMP from DOOL_SNMPSERVER
- 
- --snmp-load::
--    show load stats using SNMP from DSTAT_SNMPSERVER
-+    show load stats using SNMP from DOOL_SNMPSERVER
- 
- --snmp-mem::
--    show memory stats using SNMP from DSTAT_SNMPSERVER
-+    show memory stats using SNMP from DOOL_SNMPSERVER
- 
- --snmp-net::
--    show network stats using SNMP from DSTAT_SNMPSERVER
-+    show network stats using SNMP from DOOL_SNMPSERVER
- 
- --snmp-net-err:
--    show network errors using SNMP from DSTAT_SNMPSERVER
-+    show network errors using SNMP from DOOL_SNMPSERVER
- 
- --snmp-sys::
--    show system stats (interrupts and context switches) using SNMP from DSTAT_SNMPSERVER
-+    show system stats (interrupts and context switches) using SNMP from DOOL_SNMPSERVER
- 
- --snooze::
-     show number of ticks per second
-@@ -463,7 +463,7 @@ The default delay is 1 and count is unspecified (unlimited)
- 
- 
- == INTERMEDIATE UPDATES
--When invoking dstat with a *delay* greater than 1 and without the
-+When invoking dool with a *delay* greater than 1 and without the
- *--noupdate* option, it will show intermediate updates, ie. the first
- time a 1 sec average, the second update a 2 second average, etc. until
- the delay has been reached.
-@@ -475,34 +475,34 @@ average on a new line, just like with vmstat.
- 
- 
- == EXAMPLES
--Using dstat to relate disk-throughput with network-usage (eth0), total CPU-usage and system counters:
-+Using dool to relate disk-throughput with network-usage (eth0), total CPU-usage and system counters:
- ----
--dstat -dnyc -N eth0 -C total -f 5
-+dool -dnyc -N eth0 -C total -f 5
- ----
- 
--Checking dstat's behaviour and the system impact of dstat:
-+Checking dool's behaviour and the system impact of dool:
- ----
--dstat -taf --debug
-+dool -taf --debug
- ----
- 
- Using the time plugin together with cpu, net, disk, system, load, proc and
- top_cpu plugins:
- ----
--dstat -tcndylp --top-cpu
-+dool -tcndylp --top-cpu
- ----
- this is identical to
- ----
--dstat --time --cpu --net --disk --sys --load --proc --top-cpu
-+dool --time --cpu --net --disk --sys --load --proc --top-cpu
- ----
- 
--Using dstat to relate advanced cpu stats with interrupts per device:
-+Using dool to relate advanced cpu stats with interrupts per device:
- ----
--dstat -t --cpu-adv -yif
-+dool -t --cpu-adv -yif
- ----
- 
- 
- == BUGS
--Since it is practically impossible to test dstat on every possible
-+Since it is practically impossible to test dool on every possible
- permutation of kernel, python or distribution version, I need your
- help and your feedback to fix the remaining problems. If you have
- improvements or bugreports, please send them to:
-@@ -513,40 +513,40 @@ Please see the TODO file for known bugs and future plans.
- 
- 
- == FILES
--Paths that may contain external dstat_*.py plugins:
-+Paths that may contain external dool_*.py plugins:
- 
--    ~/.dstat/
-+    ~/.dool/
-     (path of binary)/plugins/
--    /usr/share/dstat/
--    /usr/local/share/dstat/
-+    /usr/share/dool/
-+    /usr/local/share/dool/
- 
- == ENVIRONMENT VARIABLES
- 
--Dstat will read additional command line arguments from the environment
--variable *DSTAT_OPTS*. You can use this to configure Dstat's default
-+Dool will read additional command line arguments from the environment
-+variable *DOOL_OPTS*. You can use this to configure Dool's default
- behavior, e.g. if you have a black-on-white terminal:
- 
--    export DSTAT_OPTS="--bw --noupdate"
-+    export DOOL_OPTS="--bw --noupdate"
- 
- Other internal or external plugins have their own environment variables
- to influence their behavior, e.g.
- 
- 
--    DSTAT_NTPSERVER
-+    DOOL_NTPSERVER
- 
--    DSTAT_MYSQL
--    DSTAT_MYSQL_HOST
--    DSTAT_MYSQL_PORT
--    DSTAT_MYSQL_SOCKET
--    DSTAT_MYSQL_USER
--    DSTAT_MYSQL_PWD
-+    DOOL_MYSQL
-+    DOOL_MYSQL_HOST
-+    DOOL_MYSQL_PORT
-+    DOOL_MYSQL_SOCKET
-+    DOOL_MYSQL_USER
-+    DOOL_MYSQL_PWD
- 
--    DSTAT_SNMPSERVER
--    DSTAT_SNMPCOMMUNITY
-+    DOOL_SNMPSERVER
-+    DOOL_SNMPCOMMUNITY
- 
--    DSTAT_SQUID_OPTS
-+    DOOL_SQUID_OPTS
- 
--    DSTAT_TIMEFMT
-+    DOOL_TIMEFMT
- 
- == SEE ALSO
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/dool/dool_1.1.0.bb b/meta-oe/recipes-support/dool/dool_1.1.0.bb
deleted file mode 100644
index 211f3a2b1..000000000
--- a/meta-oe/recipes-support/dool/dool_1.1.0.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "versatile resource statics tool"
-DESCRIPTION = "Dstat is a versatile replacement for vmstat, iostat, netstat and ifstat. \
-Dstat overcomes some of their limitations and adds some extra features, more counters \
-and flexibility. Dstat is handy for monitoring systems during performance tuning tests, \
-benchmarks or troubleshooting."
-HOMEPAGE = "http://dag.wiee.rs/home-made/dstat"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS += "asciidoc-native xmlto-native"
-
-SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=https \
-	   file://0001-Fix-build-error-as-following.patch \
-	   file://0001-Fix-rename-in-docs.patch \
-          "
-
-SRCREV = "41ec7b392b358dae29f0b587711d5c8f7f462805"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-    oe_runmake 'DESTDIR=${D}' install
-}
-
-RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell python3-six python3-unixadmin"
diff --git a/meta-oe/recipes-support/dool/dool_1.3.1.bb b/meta-oe/recipes-support/dool/dool_1.3.1.bb
new file mode 100644
index 000000000..b20f8b401
--- /dev/null
+++ b/meta-oe/recipes-support/dool/dool_1.3.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Dool is a Python3 compatible fork of Dstat"
+DESCRIPTION = "Dool is a command line tool to monitor many aspects of your system: \
+CPU, Memory, Network, Load Average, etc. It also includes a robust plug-in architecture \
+to allow monitoring other system metrics."
+HOMEPAGE = "http://dag.wiee.rs/home-made/dstat"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+DEPENDS += "asciidoc-native xmlto-native"
+RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell python3-six python3-unixadmin"
+
+SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=https \
+          "
+
+SRCREV = "30847c748483bc088549486292232d805b086b1f"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install
+}
+
+
-- 
2.25.1


