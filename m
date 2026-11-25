Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37927.1795594067869408690
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nPU5VWxt;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385c497bf94so2109330eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594067; x=1796198867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlmlC3QkoGdxHwKk4sM+gaSW+lf3wLcgrnbAEFvTdI0=;
        b=nPU5VWxtMtYPK08/9w4cVx6lQKhz1BdcaNBYA+/XUUMRrbHzQA8GS4equmbveZFgYT
         J/ghI55gcVFXFKLu9A94QmYjCtQ5scUWWJw2Tpm/tBH7FUIKOYWEx3sbZPrx1ke5mUX4
         M6Tpc4i12dnw9zwtNrmF7gVAzpPXp5fb2cyKSKI5mjt2pNBpWf8e16gTNrzUpSYqRxJq
         l0rV4+PlC4w53y3EPRjcRQ6YyojVf3jUPK4pzYRmj+fsFjhfljpTe5gsTV/J2XlHQDbS
         wP4MFPK+DjeR4pzr1LA33CroQqReGu2d+BRAK2J9kEk8OZy313XMkoJ9WCNnbjXbYhfT
         Secg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594067; x=1796198867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlmlC3QkoGdxHwKk4sM+gaSW+lf3wLcgrnbAEFvTdI0=;
        b=ZnRVUGfnGEit3D8OCfSjL10WIJRDZXgDd4S3qwKSGDUT3jl84JYa4rl/G5SG1djW3k
         Tl+I52sGT2+smj0ue4DdquNT3tRTvfT6aAajfiKAK7LGYk76CgJf+48gjPn6jv8sSJoh
         zSFnsNxW+1+wr4lliULXLRZLt9lE4J9aWZbcsrzcNHJ8N2Knu/TKT+KQvzBqYS737BqV
         cCC2nUDZzCOyWqLsAzr8FO2VODok6we0Eejg3MxoTGb6MBiZi4x8QmNwX3uCq8MJtr0O
         w90JcdKz4JpckhL9XctoNsG1ZzhUFrj+ZLuPXS/0OfzPUXH/+4yCIKEFPxdQUCjCzrQL
         z+Rg==
X-Gm-Message-State: APuU4Z+dDOXV2lSd3DvI2FzEVjsl8CXOZ8kbsS7c6pvfOhDYh2Mirl5Q
	kpRLnV4tn1zbmHFyx8IrT+U1Q2HJ+GhcEqkRmS+RhABZ/dZ83w57xMMTgVdFb7aN
X-Gm-Gg: AZFdTZe+PTKSeXx3ZA/1ihMqAF4L21lowuUfMmgK5V5jioKGYpGPZwkgDH0N/8PsHNF
	9/0B3TBwJGasmDVgzk137kkEZy7qpYmveTlK6mzzLj//K/+3D1dAPVlMPw+APS4OdgsPRpvmKi1
	vs+o6wf6zfnKyx2zBIIzEeSm/Vok/kyMS3HF+LO0YuaHQPM7DwArEzRXgB0hv2wKrBI2mD0j5dK
	TywqzBNtny2JrKQ6hlYxisqssUQGzEYZUn96Co+agFb60n20oLsmV3sJPusAgleQ+TqxdEzM59A
	xJaHFDCXAsPMFD85RKJup7sg5PCStHLPXBVck4Lvar0LUUOr6z+3VjK+ncdcG83nQx7kwSkIXNW
	b3ZbBUvX0Yg0FcDcrF8EN3h5JMHO7QxWmyWx1+71eaRRfm3G8CqxSd1MqgK7HOUedXm4TFdZnyU
	9pvtlvl7X+lepegcl3juDxXyxpyfj/SidM/nuqlaek/4dPeZjdh938bcMpRqRcZFpcmJNuXpKKB
	IZo1ooBE/DmZxeUPz+tRY955+XzRMwXWK8hhvNOA86SwCLNPob9FuYXygfwtvMczln2Dxvo9d94
	Niugj3T5SHb6AnjRWqaqY2y9rd3pxouXrHHAorUt2w7LuMh6N2JSXPLW45ZKtkJ/Uu07ugBQsZi
	awmvqXG0gx6p2QfE/nwmlO785RrgmNr7wkapQPFQdhno3Hp+DInJzea6DDCGkdRg69RhU85qNVS
	3rkPYE7tUSPOispZ7Ghg90kZZR0vpPWb4oBcfsj3sG5MyDqt//xWFlGVzBb7ZU6239AMtGmE+x4
	cOxXHibsauIUZRVJ545oqvOfmvaD2RD/6E9OsEQ/OcWD1/fGUUWca1YpZF1M8E56qHsu8T4z3eO
	e7od
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr26432293eec.7.1795594067148;
        Wed, 25 Nov 2026 00:07:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 02/55] libgpiod: Fix intermittent gpiocli monitor ptest failure
Date: Wed, 25 Nov 2026 00:06:18 -0800
Message-ID: <20261125080732.2419614-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133005
Content-Type: text/plain; charset="utf-8"

test_monitor_all_lines_on_request toggles line 1 twice, with line 4 in
between, before reading any event. gpio-sim delivers both changes of
line 1 as one interrupt when they happen before it is handled, so the
rising edge is lost:

  ASSERT: '41610700648 falling "foo" 41610665414 rising  4' did not
  match '[0-9]+ rising\s+"foo"'

Wait for each event before triggering the next one. In a qemux86-64
guest this took the test from 12 of 20 runs failing to none.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...for-each-event-in-test_monitor_all_l.patch | 53 +++++++++++++++++++
 .../libgpiod/libgpiod_2.3.2.bb                |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-dbus-tests-wait-for-each-event-in-test_monitor_all_l.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-dbus-tests-wait-for-each-event-in-test_monitor_all_l.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-dbus-tests-wait-for-each-event-in-test_monitor_all_l.patch
new file mode 100644
index 0000000000..f3eac65455
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-dbus-tests-wait-for-each-event-in-test_monitor_all_l.patch
@@ -0,0 +1,53 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 28 Oct 2026 07:55:33 -0700
+Subject: [PATCH] dbus: tests: wait for each event in
+ test_monitor_all_lines_on_request
+
+The test pulls line 1 up, line 4 up and line 1 down again in quick
+succession and only then reads the monitor output. gpio-sim raises the
+line interrupts through irq_sim, so two changes of the same line that
+happen before the interrupt is handled are delivered as one interrupt,
+and as edge detection is set to both edges the kernel derives the edge
+type from the line value read in the handler. The rising edge on line 1
+is then lost and only a falling edge is reported, timestamped after the
+rising edge on line 4:
+
+  ASSERT: '41610700648 falling "foo" 41610665414 rising  4' did not
+  match '[0-9]+ rising\s+"foo"'
+
+This fails intermittently, in 12 of 20 runs in a qemux86-64 guest.
+
+Wait for each event before triggering the next one, like the gpiomon
+tests in gpio-tools-test.bash do.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-gpio/20261125080045.2410076-1-raj.khem@gmail.com/]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ dbus/client/gpiocli-test.bash | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/dbus/client/gpiocli-test.bash b/dbus/client/gpiocli-test.bash
+index 5160f57..ede69c9 100755
+--- a/dbus/client/gpiocli-test.bash
++++ b/dbus/client/gpiocli-test.bash
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
index eb1c454f8c..b77ca581a9 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
@@ -25,6 +25,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
 SRC_URI += " \
     file://gpio-manager.init \
+    file://0001-dbus-tests-wait-for-each-event-in-test_monitor_all_l.patch \
 "
 
 SRC_URI[sha256sum] = "dc48fb87cd72019745acb201599caf559556b5d913844df0ed011067d19e9a6b"
