Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4399.1795650952411244411
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 15:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=C8+yrJcV;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386bd881d39so5744394eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 15:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795650952; x=1796255752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbhIvPud0ot6zuAA9k1Sp+TuKEvUTok//KYRbh89slI=;
        b=C8+yrJcVTSrC8ZZZOjYi18bk3tI3+mLx+KJ/mQ31fX1V9JQcrBw4pTDKxD3mQBn+2d
         ZZRmgc6awtTx2POODLKe1jyDTIPmQZiqfHuKVEiPWBzCBvfT0h1rlwE2dm4T3S/mJFrv
         MMH5OK1OzekR0lO4+B88ITXbaGyeOoISlh74iYD9ZzKwrAUYjpunCuz3pzQ6PQCkolEa
         kxC0azpdPvL4wobZVNE1vOZ3kaTgKSMw2qyV190HTmkJtnr1wSC7rDvg/ONpXN3CC12C
         j9eQtU0OhHBloT4R7W2TODI0yh9Byf/iO5lNLL67xvGCt4mp4ieQ5dmZL6I89tMEkKYU
         elBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795650952; x=1796255752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbhIvPud0ot6zuAA9k1Sp+TuKEvUTok//KYRbh89slI=;
        b=FypyAcf0rG+tdiUbRPRpaBR6aS2iw7sZhZA2V3W0zy6Zgrs2L1wUxzkBvAIAOygWc0
         drTQO6Bcg/NNOrO4ODx1418gxGUmV/IQFvvUtZ1MUZuHaFyVwOUH1eKnkXxFRd4ao7+Z
         doXvLkvhGt/51ovH/ZrhVdRFITeGqbbgSXAJLqVjVmqUmYbnQq8IRX+01byBv7B6XlER
         WBnHZOrBKsXog7BiLh3yeHb/XYF0Za8jg/mzB8d0mPvtDiHKRc5ALNrQX/CbXKcV6C0h
         ClDdpF5zqmzuTvVmpiEl/8KlTASn/DmitQmJfXnPaE6FjmH56coznUt+NaK0J8LHJCU+
         fiMQ==
X-Gm-Message-State: APuU4Z/8n2DqVZ84d6zrfJVmdu2xSnF1jiRry+0QWsZK9yGca2ysipPX
	2ifDvbZcUdv7xBz+49xJA3z9dkDBRtZtmdY6+O4al/hJ3p7wNeTkemPO4enbq0h8
X-Gm-Gg: AZFdTZdVepqNny3cZJV7Ll8PTqH/bGpsiDRB6N14VIJmExXPCrfa213Y7H0HzEqJo0t
	zaLS2vuC7JdVdc0ZGTRje00TO0TcbRbi54xOpFCz2o4DktrdjgOUxg603Hg6Stsf3W3+9OYbDhz
	ubz0YqeBW2Nm/uiu92At53Vy/dLepje1mGq/M+otm8GcgvS7aAZe3aZAZBnUlXlTuY/35pxzT7E
	Qb7kjeyJ9JCAL24ZdePILfMPBF90WaYtaioDfESOh3F937Sc08NhCHisb04dvVJtWpbjSzXXap0
	3sDz7Mzevf29uSm7GEIgRUUAdZ/7jlamAD5JrlG4T0WzGfemk6PuLd8SshoerTfRKcMT9082ftl
	MM2Peji1NgtBsTmB9mpPeO0F76svGTH5mmfv6wdCzaAp3gJFj3daobEwDUhnsOCLcSSNcou01W5
	i8K/h4ql/4Ufs8QTHKPeqRH43fPQj7RNmA/P2JaihgCnhf5DOC7NuG0AmB8ZVGLoZPhqmDqolPg
	/DDoGEn2jzSEeQLyVcuBV3KHxS2HjFgPHq33xW1eoDOS7/+Hlt1ZzN5AddI9M3jKFY7ZlSBaVQU
	aLZyf5I/lA8oD03MKDXI/g2NihjYkQ3ZltXRrkPjXozXznrxYIMFdrkfl9YZB5iuKG6nGVmDeVy
	KSdT/jOxRnYwOmqCaCcei6N26cxuHEwC5/fReTUmYbzHAz48dR16OhdpPfNt9Phu2qiuj+ro6Vp
	Ik47FeK2TeCHijMfSu6bYNOuiddMeo6s9L0kOkf3yyiiP9sKWp7td6iW5kVTXKufceO6GclNhOE
	JEhKp7FdcCfEHo2hYPALX6Gc6oTNV+7z0Uo85Emk8szW7Qsan/IYMBKnXGU4oMkzLXluPMdkoHU
	YKbi
X-Received: by 2002:a05:7300:c00f:10b0:36c:a321:9fbc with SMTP id 5a478bee46e88-3856c9a6858mr22603038eec.1.1795650951457;
        Wed, 25 Nov 2026 15:55:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm47837183eec.25.2026.11.25.15.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:55:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH v2] libgpiod: Fix intermittent gpiocli monitor ptest failures
Date: Wed, 25 Nov 2026 15:55:48 -0800
Message-ID: <20261125235548.323036-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 23:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133084
Content-Type: text/plain; charset="utf-8"

test_monitor_all_lines_on_request and test_monitor_multiple_lines_by_name
toggle one line twice, with another line in between, before reading any
event. gpio-sim delivers both changes of the first line as one interrupt
when they happen before it is handled, so the rising edge is lost:

  ASSERT: '41610700648 falling "foo" 41610665414 rising  4' did not
  match '[0-9]+ rising\s+"foo"'

  ASSERT: '45056166795 falling "foo" 45056147828 rising  "xyz"' did not
  match '[0-9]+ rising\s+"foo"'

Wait for each event before triggering the next one. In a qemux86-64
guest this took the tests from 12 and 13 of 20 runs failing to none,
and ptest-runner libgpiod passed 12 of 12 runs on the rebuilt image.

The fix is the v2 patch sent upstream, which squashes the two tests'
fixes into one commit as the maintainer asked.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
v2: Use v2 of upstream submitted patch
 ...s-wait-for-each-event-in-the-gpiocli.patch | 82 +++++++++++++++++++
 .../libgpiod/libgpiod_2.3.2.bb                |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-dbus-client-tests-wait-for-each-event-in-the-gpiocli.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-dbus-client-tests-wait-for-each-event-in-the-gpiocli.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-dbus-client-tests-wait-for-each-event-in-the-gpiocli.patch
new file mode 100644
index 0000000000..394a73baf5
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-dbus-client-tests-wait-for-each-event-in-the-gpiocli.patch
@@ -0,0 +1,82 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 25 Nov 2026 15:37:49 -0800
+Subject: [PATCH] dbus: client: tests: wait for each event in the gpiocli
+ monitor tests
+
+test_monitor_all_lines_on_request and test_monitor_multiple_lines_by_name
+pull one line up, a second line up and the first line down again in
+quick succession and only then read the monitor output. gpio-sim raises
+the line interrupts through irq_sim, so two changes of the same line
+that happen before the interrupt is handled are delivered as one
+interrupt, and as edge detection is set to both edges the kernel derives
+the edge type from the line value read in the handler. The rising edge
+on the first line is then lost and only a falling edge is reported,
+timestamped after the rising edge on the second line:
+
+  ASSERT: '41610700648 falling "foo" 41610665414 rising  4' did not
+  match '[0-9]+ rising\s+"foo"'
+
+  ASSERT: '45056166795 falling "foo" 45056147828 rising  "xyz"' did not
+  match '[0-9]+ rising\s+"foo"'
+
+The tests fail intermittently, in 12 and 13 of 20 runs respectively, in a
+qemux86-64 guest.
+
+Wait for each event before triggering the next one, like the gpiomon
+tests in gpio-tools-test.bash do. In test_monitor_multiple_lines_by_name,
+matching the next line of output instead of searching all of it also
+makes the test verify that the change of line bar, which is not
+monitored, is ignored.
+
+Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
+Upstream-Status: Submitted [https://lore.kernel.org/linux-gpio/20261125234308.4052324-1-raj.khem@gmail.com/]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ dbus/client/gpiocli-test.bash | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/dbus/client/gpiocli-test.bash b/dbus/client/gpiocli-test.bash
+index 5160f57..ebddcbf 100755
+--- a/dbus/client/gpiocli-test.bash
++++ b/dbus/client/gpiocli-test.bash
+@@ -1376,14 +1376,14 @@ test_monitor_multiple_lines_by_name() {
+ 	dut_run gpiocli monitor foo xyz
+
+ 	gpiosim_set_pull sim0 1 pull-up
++	dut_regex_match "[0-9]+ rising\\s+\"foo\""
++
+ 	gpiosim_set_pull sim0 5 pull-up # This should be ignored
+ 	gpiosim_set_pull sim0 11 pull-up
+-	gpiosim_set_pull sim0 1 pull-down
++	dut_regex_match "[0-9]+ rising\\s+\"xyz\""
+
+-	dut_read
+-	output_regex_match "[0-9]+ rising\\s+\"foo\""
+-	output_regex_match "[0-9]+ rising\\s+\"xyz\""
+-	output_regex_match "[0-9]+ falling\\s+\"foo\""
++	gpiosim_set_pull sim0 1 pull-down
++	dut_regex_match "[0-9]+ falling\\s+\"foo\""
+
+ 	gpiodbus_release_request "$request"
+ }
+@@ -1421,13 +1421,13 @@ test_monitor_all_lines_on_request() {
+ 	dut_run gpiocli monitor -r "$request"
+
+ 	gpiosim_set_pull sim0 1 pull-up
++	dut_regex_match "[0-9]+ rising\\s+\"foo\""
++
+ 	gpiosim_set_pull sim0 4 pull-up
+-	gpiosim_set_pull sim0 1 pull-down
++	dut_regex_match "[0-9]+ rising\\s+4"
+
+-	dut_read
+-	output_regex_match "[0-9]+ rising\\s+\"foo\""
+-	output_regex_match "[0-9]+ rising\\s+4"
+-	output_regex_match "[0-9]+ falling\\s+\"foo\""
++	gpiosim_set_pull sim0 1 pull-down
++	dut_regex_match "[0-9]+ falling\\s+\"foo\""
+
+ 	gpiodbus_release_request "$request"
+ }
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
index eb1c454f8c..244e6ff7dc 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
@@ -25,6 +25,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"

 SRC_URI += " \
     file://gpio-manager.init \
+    file://0001-dbus-client-tests-wait-for-each-event-in-the-gpiocli.patch \
 "

 SRC_URI[sha256sum] = "dc48fb87cd72019745acb201599caf559556b5d913844df0ed011067d19e9a6b"
