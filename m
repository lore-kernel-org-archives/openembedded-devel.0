Return-Path: <ghidoliemanuele@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11B4CCD19A
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 10:41:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.12388.1760697659463892489
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 03:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hgTkzZqV;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: ghidoliemanuele@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-471191ac79dso8729715e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 03:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760697657; x=1761302457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJ0WQ8RPL5uaaohfjxS8gr6rMfKvi9pJCK9UFynBBCs=;
        b=hgTkzZqVqjlMpteBlgCRFWy4A1c9JbPF1YxXAlavODz7PvsXpSxn3k3NcwFG/BYRyG
         Zd8z3YUY64oZAOoCp+hovZGCV0auSVUgn/1WuxddFmwmsRgyGHLmChj9H7b7kFt9bg/A
         7KiVl2q7jq8w2jvhJRAW8b0LwDb0Kts1d0kOYr+K11a6bMNdsBXFHpm9mUnQzKrhsNyB
         CYlO6V20LBlSdKUl+FwQWz4D7N5ZUM8IPhDgOosojELPvLwubzvPjMWPVIQA+m/r8ay+
         3vW4vYsrUHSDUD17jNkuDUTMyyQd1A0E+LDpssNZ7qKweWC2Q+5XhsQqDoKx0LqDf7DW
         6suQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760697657; x=1761302457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJ0WQ8RPL5uaaohfjxS8gr6rMfKvi9pJCK9UFynBBCs=;
        b=Aw1sC5V+5Oj4O+ouac9BA4zTiAJQYpkPy+Fm86sgUFzCSaMiL4YGOA3l0NMIwCkT1g
         2gornM5VuGBvVbsc0FEZWLfSxGigU/xP5ZaAVXNsJ/CvLQ2Nfy9GRX1gzMuqxN9Sp8HM
         flFJCyZQ3iWdaDbidfhImBZOUEXQyrFmaD+TMicwiJhJFPCdX+ydorXvYMU0AAScACYm
         ou76VDeCliqrqqgbiOPjOw/KDv7050MIsqq749Q/X3Suz6UexZ64heA0BlPTseupbwuV
         G4/2mDTPYNOJKo0tQIH9K3JHcWe7wIqqMoG58/6Qr6H+atbJ73w1F8UOedLm8gPiIHx/
         NPqg==
X-Gm-Message-State: AOJu0YyjGI7RBUmvt5GfOmeRQtjh4haofCzQzRzey5xsRpYkPkBKQFP0
	Shqs0lNop4G0UYxUupCLyP2e7152ppmUKze0Tq/fnn/xwYIyb6YOGtvceDzX0Jy8
X-Gm-Gg: ASbGnctviuJvUrs3COavRCNjnDC74h8T83K3pvj5d0NQzyM3I+zYTsy+fstQfsPj939
	gxBq5HVCN9NBbRSlr9LN66MZL481Dj8mVkl4z1lNXekQCmjZEGvPrC/1Qt4Pi1zsIdSRSjQI+iY
	rWjLj7egvwgOYB0qS5UQ2GYCPKnmx7CgETzm2KIB3RKOgSjOb5zY7kcJdz6Ibrm72XSuQ8CeA1P
	6c7NsPvX+7a5dB1UWa7C0WjDyGXq6XY12DYDQ6sxkAkIVdUuKLsVRbO1K6vdDh33m4Zsl5zXgon
	+/5iVDu2E+86Y3928NUDwC1gZDIIcAhKfGPxhkAeCnx2I0ayWpG3SUuZjoZMIR5DEUrmgBZf+CQ
	yS271S1v0mzY3XXr8AEL30kIRHzy4L3ETb0Yhlud5wlRLlcKx/bETXf2qfvas6pZPTrxWgQqEmu
	88mwncBPXw64tIxm/LBO4Z0duxUMcXqds=
X-Google-Smtp-Source: AGHT+IGy/k+wAHXUD9mY+752waPBvl5naqspd+L9PJRgMPPzWt9sRLjpXVDSFmUSoKTAThKRKREl4g==
X-Received: by 2002:a05:600c:3e0b:b0:46e:3cd9:e56f with SMTP id 5b1f17b1804b1-471178726bfmr24391945e9.6.1760697657425;
        Fri, 17 Oct 2025 03:40:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:aac:705d:ae36:2eb:35ce:6a7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42701a5f83bsm7799094f8f.16.2025.10.17.03.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:40:57 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: [meta-oe][master][PATCH 2/2] linux-serial-test: add patch to fix potential hang in while loop
Date: Fri, 17 Oct 2025 12:40:52 +0200
Message-ID: <20251017104053.2983626-3-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017104053.2983626-1-ghidoliemanuele@gmail.com>
References: <20251017104053.2983626-1-ghidoliemanuele@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 10:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120750

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


