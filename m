Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.739.1793419258154412441
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 21:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=flh+EzUk;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2307148eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 21:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419257; x=1794024057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5yipu0q8Vr2jBjaghB7XbaYkQSgULC6LkO3kB9GKMo=;
        b=flh+EzUkFJd0ug9RPQVMeHhhh1G17o+wC+dEI/oU16Alxj6Mlkpf0IBjYZ7d4KWhzE
         +Yyd0V6TjVqqdxRmlIMAvjFekPOYzeBzitj3hP/D7MOXqLLURPCiqz0M0ojT/IFoCaAq
         bmC4PycnJ9V+wGH0Dhby4YEIoj7Jd11CPyu6+686FqhhuwLtIN2nkXPN61HlwBAFDnef
         jrXmu/CP6H0B1QqSnyYsRH7GWKOBVrO4gPVQjP8whbh0qpELdkx69fXVBf6P+5ouyxjQ
         zXCpB6aPf3J4uJG5m1POSotBw8YkX/0CD90M+absgQJvBhkuTOYU/fRNdwvUNGDFrXY2
         W0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419257; x=1794024057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5yipu0q8Vr2jBjaghB7XbaYkQSgULC6LkO3kB9GKMo=;
        b=X6SVXSnbM7KUKklUReaVX2xK0zw1ocXQXGhWm5P75J4hPwoyE89ERkv/JJCCfiZ0x+
         APGlX0KFhOjBjLwBt+UPlDFLr16ACghHHNryZ1BQ0p8N1J5BUqqU8yLej2qbrqehGqSz
         ZnVhYQXt4ZxgVQPk0njdvTYmE/1m/gsXGekBWNCgpT9pcpE84gHyt6LZ/VO//xMUTUwk
         QaNBog8g73P6bvQM3Q0ODzM8KYTDf22IPeWkjJWBx1weJ+80c5zohAgPyH3Z2G1WOrRl
         LTQrOdaf1M7QeCCZ7ufN8s92x5IE4N36HiQhAI6Sdntn3h9kBbXLDKv5o8J/K16IQ3QA
         2VFg==
X-Gm-Message-State: AFq9FYLuxMb669FQMf2tvJWNOjyM5JQKadmZFpXTfMc3clFMLBTgHiYj
	5BhPrk9HYp0RPY4ZDGUb9SefXe1su5UCJjkaA6ySAVDEpmbTGiKg778t34Ko5fwJH20=
X-Gm-Gg: AYBFou39eFzhw4KGBHrNyEN9wNjREujodtRRZ9gi2JmsWSVwzSwumLNItfZIPRO80OL
	CdJ3REMT+muKqP+Cn2es8YSCzA8jOtXBpu8QS7h8K/N/990tXV0MTT/omPvupmXR7ScmqD1joMg
	Qsb14XlZQ/1q08c/R2RAoLYOC0zdbw5ZCNifhOIPN7xocDVzuZqjUWIb/47ifzNatoDe4Cpsapq
	0OqEa78Gdtc18/1Hrlf7Nj+H0P55zC5pwoN8kCD2M8YDIPbLuiVJpqqDPGlxi3gl5jUQRFpvV9y
	ibSyzZgOLYXwk4svJZE+xW8eLg1c1OPG3+gcshRoTk1hWN/ia03R/pB14YHHWZoRLpLNPgOxTsb
	8VH7XrDKwZTo1YqWAiXCGl3pcUoBkQY/+5+T/dq7fzKiVdPT5Ogm/D2XA2pzpQ12C1Kz37u83O5
	F2lfb2/XwKQtE6VX7SoxZlaK+6AGw1j/3HqxIKdDScE5Gm/WyaqCsFSyIWBd9xg6dSm0NO36njx
	+YLWQRnwYwoB3IObuQMHrgjco8fkr8ATEVaeYJ9KJoyp4IQ02ln7KHhXPlJOgv3DtgEYkf5zHXk
	yr1MFQiWnJyleSuEPGs/hRFXau4WmTUhz+sXxU24tnuRYpyXKSm1lRA7uYrb5YOi6XDq4IjAHvp
	kREjPeR2bnMY+zCTD5/VEiKbjE9ciXDuE35dKVJ9C+lQBELmrDRKpvdWZC6qvoNwLnFMDAjAfwF
	wes4L5ypCv3GZJAaVx5wKjCiAnyUZpeovnx2HVc5EnR4fKNzN96x9C7+pGDt9IBU1TqDUAKE1Ab
	ACBbwXwgbL33QE26/k5IdFNRPwtitPjFnyDciu/ytlDZr2WzNvgN6U1LOK2c7Wjt38aGEfs9OFZ
	DXlW
X-Received: by 2002:a05:693c:6092:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-36a424609c2mr7531424eec.35.1793419256805;
        Fri, 30 Oct 2026 21:00:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm11853728eec.28.2026.10.30.21.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:00:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/3] libgpiod: Fix intermittent gpiocli monitor ptest failure
Date: Fri, 30 Oct 2026 21:00:51 -0700
Message-ID: <20261031040051.2131713-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031040051.2131713-1-khem.raj@oss.qualcomm.com>
References: <20261031040051.2131713-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 04:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131723
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
 ...for-each-event-in-test_monitor_all_l.patch | 52 +++++++++++++++++++
 .../libgpiod/libgpiod_2.3.1.bb                |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-dbus-tests-wait-for-each-event-in-test_monitor_all_l.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-dbus-tests-wait-for-each-event-in-test_monitor_all_l.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-dbus-tests-wait-for-each-event-in-test_monitor_all_l.patch
new file mode 100644
index 0000000000..6f94fc6a68
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-dbus-tests-wait-for-each-event-in-test_monitor_all_l.patch
@@ -0,0 +1,52 @@
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
+Upstream-Status: Pending
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
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
index 49327591b7..1c8c13677f 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
@@ -26,6 +26,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 SRC_URI += " \
     file://gpio-manager.init \
     file://fix_gpiodbus_license.patch \
+    file://0001-dbus-tests-wait-for-each-event-in-test_monitor_all_l.patch \
 "

 SRC_URI[sha256sum] = "e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54b3566484650a30"
