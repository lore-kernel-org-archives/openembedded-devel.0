Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17ECFCCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 16:31:29 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.19056.1761926629878161475
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 09:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BN0eDGlU;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: ivitro@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-591c98ebe90so2513166e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 09:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761926628; x=1762531428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9JTT316nAmLULXM7tt4FgsLBuhSpZXV/6qtVfrmfl8=;
        b=BN0eDGlUpcKZVVGYSO0DoSDj5qA3UVIozxAHHdJM9KF6CNFZUOfHueD+A2Z3eScpjK
         PmlTbFyosX3RIjWoEDtIKTWLikM4hH/8sEH/UP0Gs/YuaYatz1CWvmLcdUAte1LTtSRa
         MwVvO6AWirldv8+6DO9EMARxhPojOKBV1zkOQhZzNHLvUAGAu1t/11a2Qiu/i1ZcwbBI
         pnakFmrZlHDDmknGl+YYiBXsaRBBs6VstlitIlcTsFWw7v2gc1IiidgmgKe/PyZwyFUy
         w57lCEvoAj75i89WUD/E76+yLevfLfdlTi/RNtqCJCxnsnI/NRR6jukTXheXgAqQBLoK
         3t/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761926628; x=1762531428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9JTT316nAmLULXM7tt4FgsLBuhSpZXV/6qtVfrmfl8=;
        b=vA/dJ9n6hLBjvarIjkyoB5GvYA0efkU0448kPYZnDcCPKW7U0pLDtDMWJKgTc0+VYd
         ek47D4lS6bQZVBhcRaReP+r2YlykTM75b5wOKx+q1gHnZlx1n8Wen1Bw6/L4eDrKjqxI
         tuwaVKOzCW3FOz5VwfQsqCnHKaWgzVpPp+8wRc5SRibJ7GbiqXKn5UKULclAivQanKm/
         YmcY8XQ0VEenzAwdRzUGKGjRXM/rWjS/K2YohAE+8AYzJO1F/hdlGEJ12A1wht0D/fYs
         WinOOXIfUXg+bpJBzw1xTkYMYN8fgacv6DwGr7Tdmx1T/0jaefCLtUnJNGJJdXTewJXy
         m1oA==
X-Gm-Message-State: AOJu0YwPXnzisDu2tcXIId8QJbtJYe5OYtneCEIAHt1TymLnGidJIicn
	WXsaTbcYcdIY+M401Kod045NydFcY+Noi7qxbsSFSazITG4tA8lclCQiKh4LHQ==
X-Gm-Gg: ASbGnctO5xQbZ62R4XSxHxnFv6xTNW3Rhx3USoDE7C8UGxQbyI5/Howdcum1JE5cKBA
	oVnrLA0KL9CaE2CbvPNSj3CT+uziNWGh7CdPXDpl7+GQ+0+za4TgQqd4iqf6FznQIi4Qss7JBRH
	O8M1XCpl7elYs+E8R+mHWsNl2neaSXj+1/pTSUESutN7kzElW+gvhgvdHVPE5IeXTloZ8TJ1v2M
	pAZ4i6+NZVkgP72iiyFpQI7Dw6kIrahLwzSw1C7yjm63nOdivnsM3ojR5rKK8+KjYKn0QueJ1Te
	qIMoiJXCJgcuK9q29aJOO3bl5NijRruJNSzEup1RtgH3yUVt6xrL7TrxLgQIkJ/C3Lq0nOBbL8g
	SZfw4RSgnwFR2qNbxS5iAex6zOSfFOefnX2aLnc+AYwwFF1sxAst/bAX6C/4fKEJ+2/8RRxfP/o
	YZpcfh+OEu4Wjziam6e1J1w4+U0t4=
X-Google-Smtp-Source: AGHT+IG33JSKFstr60UW1mlBzQ5EQgCL1RThXZv1y6zfGCNnBb+5iWi3DTsVKcb4LcrimGAoEpaWNQ==
X-Received: by 2002:a05:600c:a44:b0:46e:2109:f435 with SMTP id 5b1f17b1804b1-477307b8739mr35622225e9.11.1761926179445;
        Fri, 31 Oct 2025 08:56:19 -0700 (PDT)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fdf8925sm25013765e9.2.2025.10.31.08.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 08:56:18 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vitor Soares <vitor.soares@toradex.com>,
	raj.khem@gmail.com,
	ivitro@gmail.com
Subject: [meta-oe][master][PATCH] linux-serial-test: add patch to fix serial setup handling
Date: Fri, 31 Oct 2025 15:56:13 +0000
Message-ID: <20251031155614.467109-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 16:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121242

From: Vitor Soares <vitor.soares@toradex.com>

Add patch that restores user intent in serial setup handling. Upstream
commit 77320571e63c ignores user input when RS485 was pre-configured,
breaking loopback and flow-control tests.

This patch ensures RS485 can be explicitly controlled while still
respecting pre-existing configurations when appropriate.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 ...etup-handling-to-respect-user-intent.patch | 133 ++++++++++++++++++
 .../linux-serial-test_git.bb                  |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta-oe/recipes-test/linux-serial-test/files/0001-Fix-serial-setup-handling-to-respect-user-intent.patch

diff --git a/meta-oe/recipes-test/linux-serial-test/files/0001-Fix-serial-setup-handling-to-respect-user-intent.patch b/meta-oe/recipes-test/linux-serial-test/files/0001-Fix-serial-setup-handling-to-respect-user-intent.patch
new file mode 100644
index 000000000000..2360d1ee0cbf
--- /dev/null
+++ b/meta-oe/recipes-test/linux-serial-test/files/0001-Fix-serial-setup-handling-to-respect-user-intent.patch
@@ -0,0 +1,133 @@
+From 8d4f9a1a77f59eb3ed79267f58fac949835aebfc Mon Sep 17 00:00:00 2001
+From: Vitor Soares <vitor.soares@toradex.com>
+Date: Thu, 30 Oct 2025 14:52:57 +0000
+Subject: [PATCH] Fix serial setup handling to respect user intent
+
+Commit 77320571e63c ("Check if rs485 is already configured on the port")
+attempted to respect RS485 settings already configured on the port (e.g.
+via Device Tree). However, it unintentionally ignored user input,
+causing issues such as:
+- Inability to change delay settings
+- Failure to explicitly disable RS485
+- Broken UART loopback and RTS/CTS flow-control tests when RS485 was
+pre-enabled
+
+The original intent was valid for existing configurations (bare -q), but
+the tool should prioritize user intent, especially in testing scenarios.
+
+This update restores predictable, user-driven behavior:
+- RS485 can be explicitly enabled, disabled, or reconfigured
+- Current configurations are respected when appropriate
+
+Upstream-Status: Submitted [https://github.com/cbrake/linux-serial-test/pull/68]
+Fixes: 77320571e63c ("Check if rs485 is already configured on the port")
+Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
+---
+ linux-serial-test.c | 48 ++++++++++++++++++++++++++++-----------------
+ 1 file changed, 30 insertions(+), 18 deletions(-)
+
+diff --git a/linux-serial-test.c b/linux-serial-test.c
+index 294f53882570..119bf58e663d 100644
+--- a/linux-serial-test.c
++++ b/linux-serial-test.c
+@@ -60,6 +60,7 @@ int _cl_no_tx_param = 0;
+ int _cl_rx_delay = 0;
+ int _cl_tx_delay = 0;
+ int _cl_tx_bytes = 0;
++int _cl_rs485 = 0;
+ int _cl_rs485_after_delay = -1;
+ int _cl_rs485_before_delay = 0;
+ int _cl_rs485_rts_after_send = 0;
+@@ -315,7 +316,9 @@ static void display_help(void)
+ 			"  -q, --rs485              Enable RS485 direction control on port, and set delay from when TX is\n"
+ 			"                           finished and RS485 driver enable is de-asserted. Delay is specified in\n"
+ 			"                           bit times. To optionally specify a delay from when the driver is enabled\n"
+-			"                           to start of TX use 'after_delay.before_delay' (-q 1.1)\n"
++			"                           to start of TX use 'after_delay.before_delay' (-q 1.1). If no value is\n"
++			"                           given, delay defaults to 0. Existing RS485 configuration is respected if\n"
++			"                           already enabled.\n"
+ 			"  -Q, --rs485_rts          Deassert RTS on send, assert after send. Omitting -Q inverts this logic.\n"
+ 			"  -m, --no-modem           Do not clobber against any modem lines.\n"
+ 			"  -o, --tx-time            Number of seconds to transmit for (defaults to 0, meaning no limit)\n"
+@@ -335,7 +338,7 @@ static void process_options(int argc, char * argv[])
+ {
+ 	for (;;) {
+ 		int option_index = 0;
+-		static const char *short_options = "hb:p:d:D:TRsSy:z:cBertq:Qml:a:w:o:i:P:kKAI:O:W:Znf";
++		static const char *short_options = "hb:p:d:D:TRsSy:z:cBertq::Qml:a:w:o:i:P:kKAI:O:W:Znf";
+ 		static const struct option long_options[] = {
+ 			{"help", no_argument, 0, 0},
+ 			{"baud", required_argument, 0, 'b'},
+@@ -359,7 +362,7 @@ static void process_options(int argc, char * argv[])
+ 			{"rx-delay", required_argument, 0, 'l'},
+ 			{"tx-delay", required_argument, 0, 'a'},
+ 			{"tx-bytes", required_argument, 0, 'w'},
+-			{"rs485", required_argument, 0, 'q'},
++			{"rs485", optional_argument, 0, 'q'},
+ 			{"rs485_rts", no_argument, 0, 'Q'},
+ 			{"no-modem", no_argument, 0, 'm'},
+ 			{"tx-time", required_argument, 0, 'o'},
+@@ -467,8 +470,12 @@ static void process_options(int argc, char * argv[])
+ 		}
+ 		case 'q': {
+ 			char *endptr;
+-			_cl_rs485_after_delay = strtol(optarg, &endptr, 0);
+-			_cl_rs485_before_delay = strtol(endptr+1, &endptr, 0);
++			_cl_rs485 = 1;
++
++			if (optarg) {
++				_cl_rs485_after_delay = strtol(optarg, &endptr, 0);
++				_cl_rs485_before_delay = strtol(endptr+1, &endptr, 0);
++			}
+ 			break;
+ 		}
+ 		case 'Q':
+@@ -707,15 +714,20 @@ static void setup_serial_port(int baud)
+ 
+ 	/* enable/disable rs485 direction control, first check if RS485 is supported */
+ 	if(ioctl(_fd, TIOCGRS485, &rs485) < 0) {
+-		if (_cl_rs485_after_delay >= 0) {
++		if (_cl_rs485) {
+ 			/* error could be because hardware is missing rs485 support so only print when actually trying to activate it */
+ 			perror("Error getting RS-485 mode");
+ 		}
+ 	} else {
+-		if (rs485.flags & SER_RS485_ENABLED) {
+-			printf("RS485 already enabled on port, ignoring delays if set\n");
+-		} else {
+-			if (_cl_rs485_after_delay >= 0) {
++		if (_cl_rs485) {
++			/* Skip reconfiguration if already enabled with default delays */
++			if ((_cl_rs485_after_delay < 0) && (rs485.flags & SER_RS485_ENABLED)) {
++				printf("RS485 already enabled on port with default settings\n");
++			} else {
++				/* Default to 0 if not specified */
++				if (_cl_rs485_after_delay < 0) {
++					_cl_rs485_after_delay = 0;
++				}
+ 				/* enable RS485 */
+ 				rs485.flags |= SER_RS485_ENABLED | SER_RS485_RX_DURING_TX |
+ 					(_cl_rs485_rts_after_send ? SER_RS485_RTS_AFTER_SEND : SER_RS485_RTS_ON_SEND);
+@@ -725,14 +737,14 @@ static void setup_serial_port(int baud)
+ 				if(ioctl(_fd, TIOCSRS485, &rs485) < 0) {
+ 					perror("Error setting RS-485 mode");
+ 				}
+-			} else {
+-				/* disable RS485 */
+-				rs485.flags &= ~(SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND | SER_RS485_RTS_AFTER_SEND);
+-				rs485.delay_rts_after_send = 0;
+-				rs485.delay_rts_before_send = 0;
+-				if(ioctl(_fd, TIOCSRS485, &rs485) < 0) {
+-					perror("Error setting RS-232 mode");
+-				}
++			}
++		} else {
++			/* disable RS485 */
++			rs485.flags &= ~(SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND | SER_RS485_RTS_AFTER_SEND);
++			rs485.delay_rts_after_send = 0;
++			rs485.delay_rts_before_send = 0;
++			if(ioctl(_fd, TIOCSRS485, &rs485) < 0) {
++				perror("Error setting RS-232 mode");
+ 			}
+ 		}
+ 	}
diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
index 7a206319e77d..78fd9d3b1cdf 100644
--- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/MIT;md5=544799d0b492f119fa04641d1b8868ed"
 SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master \
            file://0001-linux-serial-test.c-fix-returned-error-code.patch \
            file://0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch \
+           file://0001-Fix-serial-setup-handling-to-respect-user-intent.patch \
 "
 PV = "0+git"
 SRCREV = "1a81f3c7be086ee01a9be8589a606426276c86d5"
-- 
2.51.0


