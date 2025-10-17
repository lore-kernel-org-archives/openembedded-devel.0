Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35E3CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 10:58:39 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.12216.1760697004792068984
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 03:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l4lJf63t;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: ghidoliemanuele@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47114a40161so17098395e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760697003; x=1761301803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJ0WQ8RPL5uaaohfjxS8gr6rMfKvi9pJCK9UFynBBCs=;
        b=l4lJf63ts2TbXaQHR48fIR1jvyr5aO81MtEWnGMLcBW+nFJqt2TYinKH9WDdCfy807
         J/SEbru6M3wJIbSKh1ejjA7Ar5HpYk9sijpz0D52A2/zcXw7vTUFvlRN16SsML6xIotu
         RhbBL65XcVg/vFXXCPnk4AzpmxVhEKX/wekAhIOXunLV3SxeZAegQdDERyVMhdUlFrA5
         zxwOgp6mh3CrHFaBoYfJNCkyoPkRCaDUs5lpfB3mIkpWmp5s0jigk7uIbgRDuePNvzW4
         wGhyv1DtPLKhwNExKUW7+ivoe81bUQgSrnkbhBUJP9J8lDYgp5sJ4Un0ylpnQ1RxHLE6
         Qhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760697003; x=1761301803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJ0WQ8RPL5uaaohfjxS8gr6rMfKvi9pJCK9UFynBBCs=;
        b=DE1izIqIREnX9rwuq2HjHSW1rfpZ0Og9/PZ8qcZ/uiFFbDNU7yNPKVeEC/qsCRG43r
         Un3j5H2NvubGtBHjbESIAsvhWjp3TWenWZrAnL8S49fCYSYDeOOVMHsF9z1sA6UFPq80
         mkkiN4acY3DO/jiRSFY1WlkQl43e6CqnsBgv71pFMzvA+aeT9lU3dSOm84ySF+QSRJkI
         ZV7sEXo4l+F/5mGh35FILhqSVUPN3vVQI0E0as4atujeNGkoWjNnD7509/IHbmqeDmcL
         HFWpV+YJnHkVSj6WymklpE8raejnuV67Bt/IAF3vU1Ls+nF2XNBwZIVP71jLlPxvl+Ta
         qVaA==
X-Gm-Message-State: AOJu0YxxfieFFN5WsTbyPmcyC0eostkbW3bqCfT35OqzX8jNc499W616
	TSC4r2/2giGJtdbxcaAxKyMs2Xxwc1ljWhbpaWgg1y7VUDfLBK8YUKun0ymroL8Y
X-Gm-Gg: ASbGncun4riMKtJ479/ZeWCpZiKRxNocSTRFIpm0YKl2IQcuaKtye/EavOxX2r9ICC1
	HnAmYzUDYcwqacwnAwOKWH7m5HhdeuL/Zlgp1zvSyv7fH7CtTxcljO4EY+6RMSidc2MNFqioPdW
	he1MqvDsbl4EY5tAa0CMgizNETf2rJhpJhYP8sNTYqRw4CgJtMfwfBMRsv/pN5V+pmiYY0XQYBe
	npiC5VUYbjiBIbfwD/2tNx0vcW2lbkuz5Mioa3ziscE518vCXKsAOfNtj5FmiR+UKucpnQeFHz3
	3CTdwnEu9ZO2zOGWR6SMWurHwocBAk6m+jx1AD3fRg1GT02lnXeqd9M9vsAoUX8okMuvkKha8jV
	nnB/NstjaYe19wWyTeMrBMEEcUT+qAde13dAxaQQ+5L1pSXQcuVsT4mAoEtrAUoUyKfRtent+XT
	3raLAD+iI9Ty2Dwp9GMzvu7LHkIx3ilJQ=
X-Google-Smtp-Source: AGHT+IHpmUndVYCYiawdC+Yz67dJwddyaJRbOjX1/B3HBWue0nxhvln3fT357k2hnnjEcw+TKpXA3A==
X-Received: by 2002:a05:600c:37ce:b0:471:ff3:a87e with SMTP id 5b1f17b1804b1-4711791d205mr24397745e9.36.1760697002682;
        Fri, 17 Oct 2025 03:30:02 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:aac:705d:ae36:2eb:35ce:6a7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710e8037aasm45730985e9.2.2025.10.17.03.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:30:02 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: [meta-oe][master][PATCH 2/2] linux-serial-test: add patch to fix potential hang in while loop
Date: Fri, 17 Oct 2025 12:29:55 +0200
Message-ID: <20251017102958.2982003-3-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017102958.2982003-1-ghidoliemanuele@gmail.com>
References: <20251017102958.2982003-1-ghidoliemanuele@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 10:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120756

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


