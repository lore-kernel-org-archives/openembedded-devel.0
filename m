Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37928.1795594069485453720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=B9M8TyxE;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380c28f9e35so6623381eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594069; x=1796198869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvGHb8TovePELMOdHtEsJ08RygzS3Bxnanea15ccBCo=;
        b=B9M8TyxEy4upIMNy+xJHhe/JgLODerJ+Q9sa0UAL1LduNXKxDzebAzGS7UFOQqk/to
         YHmlKq+wrGI9uQQ+UhkDHDq2e8+E02/XQ/hiFDWcU3iXqJQAVUL9j2i7auwTL+ZDlK36
         KC9FByUY4Wv7AlXVY4QbWfvmoTMBVVvrCqBsjzTQEcrl/6Q5COevvHXHmcK0Hkq4eUui
         tbRMmV2Zku3uRNHGccQ4Lctf1U87ksoD8DqFMijdbumXmeaY7WMh7eUyX9VoM7/VAEOe
         8Ybzf4RCQ4IFcyFHbCXil7veqC5PLR1E+K4eITsIwgDcgjpqnElgYid6NYnT6YAXREzG
         96eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594069; x=1796198869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvGHb8TovePELMOdHtEsJ08RygzS3Bxnanea15ccBCo=;
        b=cdLoX1GM257RnaAh/fuJEcC7WGzqfuGhSG0iUmUZ98dmh7raHLEqFCCGx4ZHArxmYN
         KI0fP4+z+t8GDmiXaxZzBA6jeyHxxBD4SkTlxATs6621vdA4jfPPQz/5+9wt5QioRF3m
         X03C2jipIjhDgw68sc0uWhJLw1QmtN+bJAbQkvMBM0xjrYLTx/Rno+VsdLJJB1UkhtOB
         vvDXcXnNLDBBHgxA4cn1OOb282iutX9IlOyL+amjTHMNqPX+i7WQVKnQ+hvNbmp+xbSX
         xUSbXsIaqJ47EyrnO7T76+ZPbTRdwK91a9d8seb/ekZDaMNJ/zJVYeOBJCXE20TX0x4o
         UieA==
X-Gm-Message-State: APuU4Z/RXy5nqTsnM2mFkO9Jtmtmg1AEtFushgtZ6zaNb5RZ3xA8YfjL
	p4SI/XSXB9y/qhkTXKYbZn1qgczgFOQDV8LQWJnYtVOARM2fyasW5VCbK/aOQjo/
X-Gm-Gg: AZFdTZf83o+NgiZ2wm+I3E39dsaWLAI5UDoypI6htCRRPhJAGOCt+2kkm8/ho0D3xIs
	HnPQxYMNvxCs3WoahMeDSsaiTCCBzMQeauFJU+3WLSuD+a3WFkjGf4duMBi7yb/bNg6siyx6yyb
	kywWN9/uqsLwVlEgSiHDjcskQR/umtxFhk98lodCREY7ajELWnFo4QYgUJjK2GVxN8quri0tqzN
	aW0Dsyau+KS701iqts6xk8rwHtsbi42sQXLdsrMSfxEx8L3QIO/+p1I1JCFfaDfgr3RoLIreGU6
	b/8Xh877nem7XkP0BNYpKKv+qldcTDcHe/FXCRXPW9oiN98pTFdSpeRdTMWQ9LBP53pvHgVKL1n
	CGvxKFi2AsqKDMIJcSK5uB0iXrWqMeHBbaBc2d2CKv4L7E5cZUzV+y7zpL24ubYyJdkVg845vLw
	uHJaLieq/joQ9IoSMbiUIUZpwVp1l9hBPq76bZSygYM5BHgRCbLy9N4imM7uVmZEiLv/THHc0W9
	nZhZzXDE6a9Q3df8FHo9mugc5Dwp7zCsDwDiQr4/FORYNE7B4Qh/c7wSxQo6Wu9iaAn05XUZcb8
	2hi4feCcyyMp+ac5bEv4/SQcGZlXHGLGNkAnbxp94V0+xP+07/yRmM3vC1J1EVMNG9YBmYx44Pp
	aW08Oz758fyUMIBZYQtJ6dwqUO7KXK6b3D8Aw14Ae+/QgGzXgIzvXchiNnGtZgdUWflA84M2+pY
	0C5Joth90GtvgSlyFuuBdZdLXIcIWodBN0HCXX/Y+YFvhJJIdcHKnHVo1theoFJsYvMCePJ6/ad
	RtZHvvZl1tLHantzIkmi6Q4UZncHkqxxN5AS7RybGG1sMI/LjAVma9luLAZfrs3dVuNOJ9mmGL6
	xcgVTQ==
X-Received: by 2002:a05:7300:a9c:b0:386:c453:dfd8 with SMTP id 5a478bee46e88-386c453e1demr3832130eec.14.1795594068510;
        Wed, 25 Nov 2026 00:07:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 03/55] libgpiod: Fix intermittent gpiocli multiple lines monitor ptest failure
Date: Wed, 25 Nov 2026 00:06:19 -0800
Message-ID: <20261125080732.2419614-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133006
Content-Type: text/plain; charset="utf-8"

test_monitor_multiple_lines_by_name has the same race which was fixed
in test_monitor_all_lines_on_request: it toggles line foo twice, with
line xyz in between, before reading any event. gpio-sim delivers both
changes of foo as one interrupt when they happen before it is handled,
so the rising edge is lost:

  ASSERT: '45056166795 falling "foo" 45056147828 rising  "xyz"' did not
  match '[0-9]+ rising\s+"foo"'

Wait for each event before triggering the next one. In a qemux86-64
guest this took the test from 13 of 20 runs failing to none, and
ptest-runner libgpiod passed 12 of 12 runs on the rebuilt image.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...for-each-event-in-test_monitor_multi.patch | 55 +++++++++++++++++++
 .../libgpiod/libgpiod_2.3.2.bb                |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0002-dbus-tests-wait-for-each-event-in-test_monitor_multi.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0002-dbus-tests-wait-for-each-event-in-test_monitor_multi.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0002-dbus-tests-wait-for-each-event-in-test_monitor_multi.patch
new file mode 100644
index 0000000000..f38859d354
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0002-dbus-tests-wait-for-each-event-in-test_monitor_multi.patch
@@ -0,0 +1,55 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 1 Nov 2026 03:45:13 +0000
+Subject: [PATCH] dbus: tests: wait for each event in
+ test_monitor_multiple_lines_by_name
+
+The test pulls line foo up, line xyz up and line foo down again in quick
+succession and only then reads the monitor output, which is the same
+race test_monitor_all_lines_on_request had. Two changes of the same line
+that happen before the gpio-sim interrupt is handled are delivered as
+one interrupt, and as edge detection is set to both edges the kernel
+derives the edge type from the line value read in the handler. The
+rising edge on foo is then lost and only a falling edge is reported,
+timestamped after the rising edge on xyz:
+
+  ASSERT: '45056166795 falling "foo" 45056147828 rising  "xyz"' did not
+  match '[0-9]+ rising\s+"foo"'
+
+This fails intermittently, in 13 of 20 runs in a qemux86-64 guest.
+
+Wait for each event before triggering the next one. Matching the next
+line of output instead of searching all of it also makes the test
+verify that the change of line bar, which is not monitored, is ignored.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-gpio/20261125080045.2410076-2-raj.khem@gmail.com/]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ dbus/client/gpiocli-test.bash | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/dbus/client/gpiocli-test.bash b/dbus/client/gpiocli-test.bash
+index ede69c9..ebddcbf 100755
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
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
index b77ca581a9..2cf1b0f563 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.2.bb
@@ -26,6 +26,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 SRC_URI += " \
     file://gpio-manager.init \
     file://0001-dbus-tests-wait-for-each-event-in-test_monitor_all_l.patch \
+    file://0002-dbus-tests-wait-for-each-event-in-test_monitor_multi.patch \
 "
 
 SRC_URI[sha256sum] = "dc48fb87cd72019745acb201599caf559556b5d913844df0ed011067d19e9a6b"
