Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B657FCCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 18:20:44 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.590.1762527887499926455
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Nov 2025 07:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lpITnFL4;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: ivitro@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-36295d53a10so6855011fa.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 07:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762527886; x=1763132686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1KSFwmLhD6xO19vU4hDOGzz2RIRXwEBO8fhV/wAkPpY=;
        b=lpITnFL4D3fB+jZBt1y/gAxtMTxIvThsQ8JtABCDgBFyjKe6KVLBOopdbLxpN/ZPoF
         slUeIGXfMRzp8sgah9oXw5zKir2S4kMf8/ONeUxjyjie+/kIpqE7FHADYec4PbtP9uLO
         J6bp5hLe3691coYYbi9LOau7bC/zKd8Ow6A4W/yMawkrsvMQlVSIp58XxBvm4eHiaFGk
         cmkovR1ctyNNpIL5H25G2BguuzvOJE5l2ILKE8MbiMh72+q6GAIj5VK9PA0SFSR/lk7o
         Thslxl9WOf2qvlfojD+lVn/YmNwibRm5cdGyalRGHUnyQOn1sC2HXDlUPOfdWAfo9tOm
         RGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762527886; x=1763132686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KSFwmLhD6xO19vU4hDOGzz2RIRXwEBO8fhV/wAkPpY=;
        b=dbFvSryGHPmjfKepsPHq0IWFriyfeuCEGpQ579aNPQKEezhEmwAKxgNfzyqJmYp/Tj
         Betxh6LziRqE0b7FTsf556CHBqfiR6CWbQQ3aag286gm58k6WR02pi8vSy91J3BzS/8D
         KSh7pKFH/k4kYg0IoNJI9effm1tgithBinC+z0ftHdRTGBJU3twbgkZ/s8biCiVCgc2Q
         GZpu+pGs8U5s3uHusQ3il2TOKtQ7mAgfZeglygFurVTmAua4oCn1veCR+DkSpUuTU+XB
         xohLJOb95e1hRpq8R53bucOGc7B4cWnmDfDyY8NulwHMSwseDsd4oly5BKXs5/6vypTd
         d7Ew==
X-Gm-Message-State: AOJu0Yxn1bbTYn2UQ6bymEFXKMKDOFUXSjEG4OD4T/Gaqb2byt4CUKJT
	nCVhcrAVCqsRzNCrnv5UpHNfA/PkVzcRh9NnitLXLgw2yTwDPdxGSrqrR0YT1w==
X-Gm-Gg: ASbGncunwAU+gQJtnjR/KWadmOzv469npGIN4l31dNbCyQnAsPfryAedLSSCX6i5uPm
	Cz+m9rdPEU/xUhZzucIEj9eDB5ESf6m2AGb8B3tFAUdQHeuHE2mteBw50iGP5+C2pvgNGL7h9rQ
	BgEgZzM8P9dVyoL6yyuIOFzk1MlhQLgpPdH+X5+VClBV7UIQqD74JBuQPJ3d9tsfPSLUBezljsB
	H49vZOXA/+LRNTGOVKVG68ZInAsR2I4mpe/Akecu+w+qf140WIJPgxqqshwVRZzY6pBN4XuFjcl
	lPE8g1D3e9ZJHTPmfcQ+SrCw10OMLlzB6WrjS0UeTUsfp6MRGUz3sjLU+D8GaSq9Y1LRzljKToq
	1VJxwjw2AKIuXf8bVNcVGF2ZXgJgqpfOfAKv57Ih1kzowBMsS1FsZOQFEX5QgghmweAb92X/AyN
	3tZRbVulgznxkqUEIY/30rAlxfxt0=
X-Google-Smtp-Source: AGHT+IFrAAt2lxfDyPxqo/QSEq4vUtqvM7BC/8WD1NyqOps/JcWCdy/3wI3j6jczCrwZLCcDXkOHag==
X-Received: by 2002:a05:600c:2211:b0:46f:b42e:edce with SMTP id 5b1f17b1804b1-4776bd0e051mr17965765e9.39.1762527435743;
        Fri, 07 Nov 2025 06:57:15 -0800 (PST)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675c9fdsm5667731f8f.28.2025.11.07.06.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:57:15 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vitor Soares <vitor.soares@toradex.com>,
	raj.khem@gmail.com,
	ivitro@gmail.com
Subject: [meta-oe][master][PATCH] linux-serial-test: remove upstreamed patches and bump SRCREV
Date: Fri,  7 Nov 2025 14:57:11 +0000
Message-ID: <20251107145712.392635-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 18:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121376

From: Vitor Soares <vitor.soares@toradex.com>

Remove patches that have been integrated upstream:
- Serial setup handling respecting user intent
- POSIX-compliant termios baud rate configuration
- Type safety and error handling improvements

$ git --no-pager log --oneline 1a81f3c7be08..e3461097252e
e3461097252e Merge pull request #61 from MaxKrummenacher/master
988deaad893b Merge pull request #69 from ivitro/fix/termios-use-cfset-speed
03aae5517cda Merge pull request #68 from ivitro/fix-serial-setup-handling
e124c19e97e9 Fix -Wstringop-overflow warning in process_write_data
363f569a531f Use cfsetispeed/cfsetospeed for baud configuration
9012c3366433 Fix serial setup handling to respect user intent
8a8aba302529 linux-serial-test.c: fix potential hang in while loop
8a5709984363 linux-serial-test.c: fix returned error code

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 ...etup-handling-to-respect-user-intent.patch | 133 ------------------
 ...erial-test.c-fix-returned-error-code.patch |  62 --------
 ...t.c-fix-potential-hang-in-while-loop.patch |  60 --------
 .../linux-serial-test_git.bb                  |   8 +-
 4 files changed, 2 insertions(+), 261 deletions(-)
 delete mode 100644 meta-oe/recipes-test/linux-serial-test/files/0001-Fix-serial-setup-handling-to-respect-user-intent.patch
 delete mode 100644 meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch
 delete mode 100644 meta-oe/recipes-test/linux-serial-test/files/0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch

diff --git a/meta-oe/recipes-test/linux-serial-test/files/0001-Fix-serial-setup-handling-to-respect-user-intent.patch b/meta-oe/recipes-test/linux-serial-test/files/0001-Fix-serial-setup-handling-to-respect-user-intent.patch
deleted file mode 100644
index 2360d1ee0cbf..000000000000
--- a/meta-oe/recipes-test/linux-serial-test/files/0001-Fix-serial-setup-handling-to-respect-user-intent.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 8d4f9a1a77f59eb3ed79267f58fac949835aebfc Mon Sep 17 00:00:00 2001
-From: Vitor Soares <vitor.soares@toradex.com>
-Date: Thu, 30 Oct 2025 14:52:57 +0000
-Subject: [PATCH] Fix serial setup handling to respect user intent
-
-Commit 77320571e63c ("Check if rs485 is already configured on the port")
-attempted to respect RS485 settings already configured on the port (e.g.
-via Device Tree). However, it unintentionally ignored user input,
-causing issues such as:
-- Inability to change delay settings
-- Failure to explicitly disable RS485
-- Broken UART loopback and RTS/CTS flow-control tests when RS485 was
-pre-enabled
-
-The original intent was valid for existing configurations (bare -q), but
-the tool should prioritize user intent, especially in testing scenarios.
-
-This update restores predictable, user-driven behavior:
-- RS485 can be explicitly enabled, disabled, or reconfigured
-- Current configurations are respected when appropriate
-
-Upstream-Status: Submitted [https://github.com/cbrake/linux-serial-test/pull/68]
-Fixes: 77320571e63c ("Check if rs485 is already configured on the port")
-Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
----
- linux-serial-test.c | 48 ++++++++++++++++++++++++++++-----------------
- 1 file changed, 30 insertions(+), 18 deletions(-)
-
-diff --git a/linux-serial-test.c b/linux-serial-test.c
-index 294f53882570..119bf58e663d 100644
---- a/linux-serial-test.c
-+++ b/linux-serial-test.c
-@@ -60,6 +60,7 @@ int _cl_no_tx_param = 0;
- int _cl_rx_delay = 0;
- int _cl_tx_delay = 0;
- int _cl_tx_bytes = 0;
-+int _cl_rs485 = 0;
- int _cl_rs485_after_delay = -1;
- int _cl_rs485_before_delay = 0;
- int _cl_rs485_rts_after_send = 0;
-@@ -315,7 +316,9 @@ static void display_help(void)
- 			"  -q, --rs485              Enable RS485 direction control on port, and set delay from when TX is\n"
- 			"                           finished and RS485 driver enable is de-asserted. Delay is specified in\n"
- 			"                           bit times. To optionally specify a delay from when the driver is enabled\n"
--			"                           to start of TX use 'after_delay.before_delay' (-q 1.1)\n"
-+			"                           to start of TX use 'after_delay.before_delay' (-q 1.1). If no value is\n"
-+			"                           given, delay defaults to 0. Existing RS485 configuration is respected if\n"
-+			"                           already enabled.\n"
- 			"  -Q, --rs485_rts          Deassert RTS on send, assert after send. Omitting -Q inverts this logic.\n"
- 			"  -m, --no-modem           Do not clobber against any modem lines.\n"
- 			"  -o, --tx-time            Number of seconds to transmit for (defaults to 0, meaning no limit)\n"
-@@ -335,7 +338,7 @@ static void process_options(int argc, char * argv[])
- {
- 	for (;;) {
- 		int option_index = 0;
--		static const char *short_options = "hb:p:d:D:TRsSy:z:cBertq:Qml:a:w:o:i:P:kKAI:O:W:Znf";
-+		static const char *short_options = "hb:p:d:D:TRsSy:z:cBertq::Qml:a:w:o:i:P:kKAI:O:W:Znf";
- 		static const struct option long_options[] = {
- 			{"help", no_argument, 0, 0},
- 			{"baud", required_argument, 0, 'b'},
-@@ -359,7 +362,7 @@ static void process_options(int argc, char * argv[])
- 			{"rx-delay", required_argument, 0, 'l'},
- 			{"tx-delay", required_argument, 0, 'a'},
- 			{"tx-bytes", required_argument, 0, 'w'},
--			{"rs485", required_argument, 0, 'q'},
-+			{"rs485", optional_argument, 0, 'q'},
- 			{"rs485_rts", no_argument, 0, 'Q'},
- 			{"no-modem", no_argument, 0, 'm'},
- 			{"tx-time", required_argument, 0, 'o'},
-@@ -467,8 +470,12 @@ static void process_options(int argc, char * argv[])
- 		}
- 		case 'q': {
- 			char *endptr;
--			_cl_rs485_after_delay = strtol(optarg, &endptr, 0);
--			_cl_rs485_before_delay = strtol(endptr+1, &endptr, 0);
-+			_cl_rs485 = 1;
-+
-+			if (optarg) {
-+				_cl_rs485_after_delay = strtol(optarg, &endptr, 0);
-+				_cl_rs485_before_delay = strtol(endptr+1, &endptr, 0);
-+			}
- 			break;
- 		}
- 		case 'Q':
-@@ -707,15 +714,20 @@ static void setup_serial_port(int baud)
- 
- 	/* enable/disable rs485 direction control, first check if RS485 is supported */
- 	if(ioctl(_fd, TIOCGRS485, &rs485) < 0) {
--		if (_cl_rs485_after_delay >= 0) {
-+		if (_cl_rs485) {
- 			/* error could be because hardware is missing rs485 support so only print when actually trying to activate it */
- 			perror("Error getting RS-485 mode");
- 		}
- 	} else {
--		if (rs485.flags & SER_RS485_ENABLED) {
--			printf("RS485 already enabled on port, ignoring delays if set\n");
--		} else {
--			if (_cl_rs485_after_delay >= 0) {
-+		if (_cl_rs485) {
-+			/* Skip reconfiguration if already enabled with default delays */
-+			if ((_cl_rs485_after_delay < 0) && (rs485.flags & SER_RS485_ENABLED)) {
-+				printf("RS485 already enabled on port with default settings\n");
-+			} else {
-+				/* Default to 0 if not specified */
-+				if (_cl_rs485_after_delay < 0) {
-+					_cl_rs485_after_delay = 0;
-+				}
- 				/* enable RS485 */
- 				rs485.flags |= SER_RS485_ENABLED | SER_RS485_RX_DURING_TX |
- 					(_cl_rs485_rts_after_send ? SER_RS485_RTS_AFTER_SEND : SER_RS485_RTS_ON_SEND);
-@@ -725,14 +737,14 @@ static void setup_serial_port(int baud)
- 				if(ioctl(_fd, TIOCSRS485, &rs485) < 0) {
- 					perror("Error setting RS-485 mode");
- 				}
--			} else {
--				/* disable RS485 */
--				rs485.flags &= ~(SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND | SER_RS485_RTS_AFTER_SEND);
--				rs485.delay_rts_after_send = 0;
--				rs485.delay_rts_before_send = 0;
--				if(ioctl(_fd, TIOCSRS485, &rs485) < 0) {
--					perror("Error setting RS-232 mode");
--				}
-+			}
-+		} else {
-+			/* disable RS485 */
-+			rs485.flags &= ~(SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND | SER_RS485_RTS_AFTER_SEND);
-+			rs485.delay_rts_after_send = 0;
-+			rs485.delay_rts_before_send = 0;
-+			if(ioctl(_fd, TIOCSRS485, &rs485) < 0) {
-+				perror("Error setting RS-232 mode");
- 			}
- 		}
- 	}
diff --git a/meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch b/meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch
deleted file mode 100644
index 91fdcf07ad63..000000000000
--- a/meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 1add8f3d228368665c3abd452640b91a86f41976 Mon Sep 17 00:00:00 2001
-From: Max Krummenacher <max.krummenacher@toradex.com>
-Date: Mon, 4 Aug 2025 14:57:22 +0200
-Subject: [PATCH 1/2] linux-serial-test.c: fix returned error code
-
-_cl_no_rx/_cl_no_rx are true in two cases, first when the relevant
-command line paramter is set and second when a rx or tx time is set
-and that time expired.
-
-This fixes the second case in a loopback test. With the change the
-application now correctly returns 125 if the number of written and
-read chars differ.
-
-E.g. `./linux-serial-test -o2 -i3 -b 115200 -p /dev/ttyS1 ; echo $?`
-returns now 0 with a loopback and 125 without, before it returned 0
-with or without a loopback.
-
-Upstream-Status: Submitted [https://github.com/cbrake/linux-serial-test/pull/61/]
-Fixes: 4e57f58c58ae ("compute error count valid when no_tx or no_rx")
-Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
-Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
----
- linux-serial-test.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/linux-serial-test.c b/linux-serial-test.c
-index d8f66c16c72f..c2c8882d601b 100644
---- a/linux-serial-test.c
-+++ b/linux-serial-test.c
-@@ -55,6 +55,8 @@ int _cl_loopback = 0;
- int _cl_dump_err = 0;
- int _cl_no_rx = 0;
- int _cl_no_tx = 0;
-+int _cl_no_rx_param = 0;
-+int _cl_no_tx_param = 0;
- int _cl_rx_delay = 0;
- int _cl_tx_delay = 0;
- int _cl_tx_bytes = 0;
-@@ -442,9 +444,11 @@ static void process_options(int argc, char * argv[])
- 			break;
- 		case 'r':
- 			_cl_no_rx = 1;
-+			_cl_no_rx_param = 1;
- 			break;
- 		case 't':
- 			_cl_no_tx = 1;
-+			_cl_no_tx_param = 1;
- 			break;
- 		case 'l': {
- 			char *endptr;
-@@ -745,7 +749,7 @@ static int diff_s(const struct timespec *t1, const struct timespec *t2)
- static int compute_error_count(void)
- {
- 	long long int result;
--	if (_cl_no_rx == 1 || _cl_no_tx == 1)
-+	if (_cl_no_rx_param == 1 || _cl_no_tx_param == 1)
- 		result = _error_count;
- 	else
- 		result = llabs(_write_count - _read_count) + _error_count;
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-test/linux-serial-test/files/0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch b/meta-oe/recipes-test/linux-serial-test/files/0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch
deleted file mode 100644
index f0b7f65a601a..000000000000
--- a/meta-oe/recipes-test/linux-serial-test/files/0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 9cf6c1d80c2f159dbb69967fbe934bf6de73c9e8 Mon Sep 17 00:00:00 2001
-From: Max Krummenacher <max.krummenacher@toradex.com>
-Date: Tue, 5 Aug 2025 09:35:06 +0200
-Subject: [PATCH 2/2] linux-serial-test.c: fix potential hang in while loop
-
-process_read_data() assumes that we can always wait for reception
-of 1024 chars. However that is not true if one sets the number of
-chars with the '-w' cmdline parameter or chars are lost. Maybe there
-are other reasons.
-
-Replace the magic number of 1024 by calculating the number of expected
-chars from _cl_tx_bytes.
-
-Brake a possible infinite while loop by adding a timeout to the loop
-calculated from the expected chars times chartime.
-
-Upstream-Status: Submitted [https://github.com/cbrake/linux-serial-test/pull/61/]
-Fixes: 7fd1057f8a95 ("Add loop to read all data in rcv buffer")
-Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
-Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
----
- linux-serial-test.c | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/linux-serial-test.c b/linux-serial-test.c
-index c2c8882d601b..294f53882570 100644
---- a/linux-serial-test.c
-+++ b/linux-serial-test.c
-@@ -543,8 +543,13 @@ static unsigned char next_count_value(unsigned char c)
- static void process_read_data(void)
- {
- 	unsigned char rb[1024];
-+	int loopcounter = 0;
- 	int actual_read_count = 0;
--	while (actual_read_count < 1024) {
-+	int expected_read_count = _cl_tx_bytes == 0 ? 1024 : _cl_tx_bytes;
-+	/* time for one char at current baudrate in us */
-+	int chartime = 1000000 * (8 + _cl_parity + 1 + _cl_2_stop_bit) / _cl_baud;
-+
-+	while (actual_read_count < expected_read_count) {
- 		int c = read(_fd, &rb, sizeof(rb));
- 		if (c > 0) {
- 			if (_cl_rx_dump) {
-@@ -577,7 +582,12 @@ static void process_read_data(void)
- 			if (errno != EAGAIN) {
- 				perror("read failed");
- 			}
--			continue; // Retry the read
-+
-+			if (loopcounter++ < expected_read_count) {
-+				usleep(chartime);
-+				continue; // Retry the read
-+			}
-+			break;
- 		} else {
- 		    break;
- 		}
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
index 78fd9d3b1cdf..6e3df371b142 100644
--- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -3,13 +3,9 @@ HOMEPAGE = "https://github.com/cbrake/linux-serial-test"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSES/MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
-SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master \
-           file://0001-linux-serial-test.c-fix-returned-error-code.patch \
-           file://0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch \
-           file://0001-Fix-serial-setup-handling-to-respect-user-intent.patch \
-"
+SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master"
 PV = "0+git"
-SRCREV = "1a81f3c7be086ee01a9be8589a606426276c86d5"
+SRCREV = "e3461097252e51fc527839884e77449cfd976701"
 
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.51.0


