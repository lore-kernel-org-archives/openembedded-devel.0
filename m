Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BCDCCD19A
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 10:58:39 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.11819.1760694783506717656
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 02:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=menCjh9t;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: ghidoliemanuele@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so1704802e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 02:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760694781; x=1761299581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJ0WQ8RPL5uaaohfjxS8gr6rMfKvi9pJCK9UFynBBCs=;
        b=menCjh9tWtVnKh4U/qqX/dGX6ami4NQsiSQgIlR0I8rLnIXUAaG+nwqzYqCDvwB1PS
         uq+39ZoeoG+B5BXgPHygCwftVVMXUbWqXwoy47Zb5lBgzEaI7jJesaImHXzDlhMUlYog
         G/x960ZUopCDkZmYeOZdwX/MPSzadC1d0u2k576mQye5xQrd7Sj6SyvMHazFBYJsnnGM
         Sy4BBsG/iBOLQ0Umegt3KI2Lfw/dg1Qg1BbeRpJxZ7wIe6GKUGwbS2DrBJbsEGZUdwG0
         0PDABijm0MLZvKy/7HIdBID03V383xkzHPJAKHtvM8MlsC5O8XhoN29+/HO+ndMEkekP
         tgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760694781; x=1761299581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJ0WQ8RPL5uaaohfjxS8gr6rMfKvi9pJCK9UFynBBCs=;
        b=vAHwT0gKJsQS3qOYkOwqdjUuInsLOwwjDZEE5RiCEzgx2iDsT5aef30DX7SV7wxlJn
         FrqR7OA0gDuSVQ9aoAUDKkexMk3Fw5FWiNeioGhanb/QWalq6sjDiJUMeS1SMaac93PU
         S5bng0FhkrwNM2WSsNpiTVhhSpIE2I6acFI2DPjQGH97PzuFAUzjX8JkNKuyMk3kCkGD
         iUTyRLgsuPpRfDJeV1VQrVWmtNezl8lZRwjlblNVv9ElEw7FtbtZ2xwi8NcSo+z6cQIK
         rHyzsb9CSBaxyw2g14WDQK4otwmlpq6ouSwTBgwvCEasxDS0FhjKTc69C7vav2fkg4T+
         vm1Q==
X-Gm-Message-State: AOJu0Yy1nnvoxlcF4jjtDI+ZxdEMDE4R6hggjOEPmW7a+d/CDgunOZOZ
	xdcW6AB97/ioO6/h1P/1ZvWOzE57wT8XOps/AWcaT+/FH9ta4AkI2bH6/gCLx+Pn
X-Gm-Gg: ASbGncv7FlBzJcupyA3GIT9svdzhhusoTkPHPUeJ63PhGGlFPXBgJz5Za303upkyFNn
	dvX8sM2AObCXJWTUD0Nj+PMmj7eAL+yzzkHqPM5FPrgT711zWFcHqmMBjUgndRMa1KletfsaYOP
	cujH1ZdeBX+n5Us2W8aOKuLsyBWe+LmWXnlu0sWiA6io//92iw71QnMqkqqbCR4ZK0hV3r9VlTO
	2EmFw/4zAmZr/bwLQSUsFcP3UC4rdrThSxGjgZ840x63XmVHCv8EdM7PKm3MigI3vmFh6MMqo0L
	i5diCZ/F8uj9CMPxRxJm8VGOqk22LFJKdaX3z96I8BMk/dHc6kVOEfEQR4lBrg3wRwc/cW9dvh6
	m65LbPtVplBL3K++XwLNbJxaMbTE/oYPI4Lc4recB0Q0Aiv2n9gPa2bhtRVlUsmiSK0BXNxGAmH
	uTB2KAxF2MD428H+kFbHYgF93kQ/HopO4=
X-Google-Smtp-Source: AGHT+IGku07nKLFlrPkWV0ELLgkn276ubh8R5Yflt5We0MmXwnTJ9jS138kQ2E+hAOqGmn7m+NEMRg==
X-Received: by 2002:a05:600c:46c9:b0:471:747:2116 with SMTP id 5b1f17b1804b1-471179303d0mr21840915e9.41.1760694414997;
        Fri, 17 Oct 2025 02:46:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:aac:705d:ae36:2eb:35ce:6a7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711442dbaesm75368995e9.8.2025.10.17.02.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 02:46:54 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: [meta-oe][master][PATCH 2/2] linux-serial-test: add patch to fix potential hang in while loop
Date: Fri, 17 Oct 2025 11:46:33 +0200
Message-ID: <20251017094636.2976738-3-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017094636.2976738-1-ghidoliemanuele@gmail.com>
References: <20251017094636.2976738-1-ghidoliemanuele@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 10:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120751

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

After commit 392f0f0ea76d ("linux-serial-test: Bump SRCREV to allow CMake 4+ compatibility"),
an infinite while loop can occur even when the timeout has been reached.

This patch fixes that regression.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 ...t.c-fix-potential-hang-in-while-loop.patch | 60 +++++++++++++++++++
 .../linux-serial-test_git.bb                  |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-test/linux-serial-test/files/0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch

diff --git a/meta-oe/recipes-test/linux-serial-test/files/0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch b/meta-oe/recipes-test/linux-serial-test/files/0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch
new file mode 100644
index 000000000000..f0b7f65a601a
--- /dev/null
+++ b/meta-oe/recipes-test/linux-serial-test/files/0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch
@@ -0,0 +1,60 @@
+From 9cf6c1d80c2f159dbb69967fbe934bf6de73c9e8 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Tue, 5 Aug 2025 09:35:06 +0200
+Subject: [PATCH 2/2] linux-serial-test.c: fix potential hang in while loop
+
+process_read_data() assumes that we can always wait for reception
+of 1024 chars. However that is not true if one sets the number of
+chars with the '-w' cmdline parameter or chars are lost. Maybe there
+are other reasons.
+
+Replace the magic number of 1024 by calculating the number of expected
+chars from _cl_tx_bytes.
+
+Brake a possible infinite while loop by adding a timeout to the loop
+calculated from the expected chars times chartime.
+
+Upstream-Status: Submitted [https://github.com/cbrake/linux-serial-test/pull/61/]
+Fixes: 7fd1057f8a95 ("Add loop to read all data in rcv buffer")
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
+---
+ linux-serial-test.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/linux-serial-test.c b/linux-serial-test.c
+index c2c8882d601b..294f53882570 100644
+--- a/linux-serial-test.c
++++ b/linux-serial-test.c
+@@ -543,8 +543,13 @@ static unsigned char next_count_value(unsigned char c)
+ static void process_read_data(void)
+ {
+ 	unsigned char rb[1024];
++	int loopcounter = 0;
+ 	int actual_read_count = 0;
+-	while (actual_read_count < 1024) {
++	int expected_read_count = _cl_tx_bytes == 0 ? 1024 : _cl_tx_bytes;
++	/* time for one char at current baudrate in us */
++	int chartime = 1000000 * (8 + _cl_parity + 1 + _cl_2_stop_bit) / _cl_baud;
++
++	while (actual_read_count < expected_read_count) {
+ 		int c = read(_fd, &rb, sizeof(rb));
+ 		if (c > 0) {
+ 			if (_cl_rx_dump) {
+@@ -577,7 +582,12 @@ static void process_read_data(void)
+ 			if (errno != EAGAIN) {
+ 				perror("read failed");
+ 			}
+-			continue; // Retry the read
++
++			if (loopcounter++ < expected_read_count) {
++				usleep(chartime);
++				continue; // Retry the read
++			}
++			break;
+ 		} else {
+ 		    break;
+ 		}
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
index 66511bd9c312..7a206319e77d 100644
--- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
 SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master \
            file://0001-linux-serial-test.c-fix-returned-error-code.patch \
+           file://0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch \
 "
 PV = "0+git"
 SRCREV = "1a81f3c7be086ee01a9be8589a606426276c86d5"
-- 
2.43.0


