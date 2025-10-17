Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F01DCCD1A5
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 10:58:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.12278.1760697004422948380
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 03:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KNfSTf8x;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: ghidoliemanuele@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so12774385e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760697002; x=1761301802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/lc90qXOmA1qRmfL7Bo2xMu6I0sg8pJOg28EKO5Sa0=;
        b=KNfSTf8xSsSxcSvMY6HKKH2QBZcqB+/jQ+zuskmRIqdE8iYBhyCJR00kRsBFnZkF34
         50388Ij9t4H4VwGK/kgH1Uoe8yGpauv6pk+5BkogC/1716E/iFfIWcbVd4nkG575yz/P
         Wn7avzU3wIOtWuvTQ6qGzj2Nelwq5fpSGYmyrylyo55x2e0jm6fxwPAJqRSUdLpAU7RB
         GZ252jveno6CqVxDDQBXBS/RPU0HiD5VHcxzSkY0mysRDWGrsUsRdWU/UneCcL/SexjZ
         Mx0cU5/2pBSD1wBdzJlQxpuLMLFOYfckb0XIiwYUk4d843TrJ+qKj0h09i9N8MoSb0Lz
         fq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760697002; x=1761301802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/lc90qXOmA1qRmfL7Bo2xMu6I0sg8pJOg28EKO5Sa0=;
        b=hs3ZFM78wl1yh7C0oexwGzpAX4ooktxXd7ivR4GbDK2NbESFDPt0fyDPybH20b7k1y
         fK8H0cVATPvVVXMfxweIOEKAW9gL1WZ+mOfVD/4uPpkmNBOU6q/INZ0HhcOS9LtEoY4z
         KgFl0ERmvsYqKyBT3l2ii+5gqTm5naPhdK1V6kqVtaHc5MtTpVfvnAyxieSRQkZ14nar
         vcMqdCR1QhIFwJLFj2TJFqCaz024BA3TJ0k1vHZUSLZpTuQqRkh5rBsz3p6HZKwqdQB6
         BWMXkbrdRtzrotbJ0Rzk9LIJxk8zkRb8LYc+i+SjKagm6P8hq3nUrP3kFqZgPbGZgRfL
         glfg==
X-Gm-Message-State: AOJu0YymJcpETtNDyWM3zfzdouKwuT/FCD0e6m+s2BVlYqpHjEhXwvaB
	8XeEWMH8uqb77cfWfO9/Ec9A3HTtJdXrWJWOnodJkCxyDKqyHEG6TPTIF+Hi6xNE
X-Gm-Gg: ASbGncu81gQLqfLK3CIJG6xlxTAoV41IgYJnysT8JHZ5HGDURs4QZrCjcKlJG0usMEh
	WqU1xFIOGrkMbrHPI78duaUhfuy+Urtgvw8W++6BVYHEXLVdeSXc8qCwjkREBlH1MMHMrWEYRXJ
	3ZinGNdvP14H7qTgMalgs+8qWwjxdqOfT+Z2lIj8pjcfMzQLz4Rn/LHlNt774ZGvsXozBAY2m/N
	uj1RUKnA2MRJ9sNXWWqWSREehJwwZ2xmBSZbw8PfOtARxSVMvjdzGCTkFpex0vY3BqImC57cNCy
	UQWXFP8pdJghW9gGv5qfFURVHKYxfL+7pzYYk+mtDBb1IPnnaRuVNjeVFnDAy4BmYJZWhTdRMPW
	hK4VC5kd1bYtOCT2SH0tLHQC/ft5KTtEd3cfhSQlYb9rNC5yWB0WZaAjDHsxud4id6C8GSh2U9k
	llY7Xov//LAlP9HoBxJWxm2s+KU9wrp7k=
X-Google-Smtp-Source: AGHT+IEsqnKnE/0a4ZXECGd2J4sP14S8GMz8ASlqFcuvNsd0UczXS19/ImurfbLORa1obT8u0YZ1ng==
X-Received: by 2002:a05:600c:444d:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-471179202famr22209755e9.36.1760697002102;
        Fri, 17 Oct 2025 03:30:02 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:aac:705d:ae36:2eb:35ce:6a7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710e8037aasm45730985e9.2.2025.10.17.03.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:30:01 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: [meta-oe][master][PATCH 1/2] linux-serial-test: add patch to fix returned error code
Date: Fri, 17 Oct 2025 12:29:54 +0200
Message-ID: <20251017102958.2982003-2-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017102958.2982003-1-ghidoliemanuele@gmail.com>
References: <20251017102958.2982003-1-ghidoliemanuele@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 10:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120755

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

After commit 392f0f0ea76d ("linux-serial-test: Bump SRCREV to allow CMake 4+ compatibility"),
the behavior of linux-serial-test changed: it now returns 125 instead of 0
when the number of read characters differs from the written ones.

This patch fixes that regression.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 ...erial-test.c-fix-returned-error-code.patch | 62 +++++++++++++++++++
 .../linux-serial-test_git.bb                  |  4 +-
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch

diff --git a/meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch b/meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch
new file mode 100644
index 000000000000..91fdcf07ad63
--- /dev/null
+++ b/meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch
@@ -0,0 +1,62 @@
+From 1add8f3d228368665c3abd452640b91a86f41976 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Mon, 4 Aug 2025 14:57:22 +0200
+Subject: [PATCH 1/2] linux-serial-test.c: fix returned error code
+
+_cl_no_rx/_cl_no_rx are true in two cases, first when the relevant
+command line paramter is set and second when a rx or tx time is set
+and that time expired.
+
+This fixes the second case in a loopback test. With the change the
+application now correctly returns 125 if the number of written and
+read chars differ.
+
+E.g. `./linux-serial-test -o2 -i3 -b 115200 -p /dev/ttyS1 ; echo $?`
+returns now 0 with a loopback and 125 without, before it returned 0
+with or without a loopback.
+
+Upstream-Status: Submitted [https://github.com/cbrake/linux-serial-test/pull/61/]
+Fixes: 4e57f58c58ae ("compute error count valid when no_tx or no_rx")
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
+---
+ linux-serial-test.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/linux-serial-test.c b/linux-serial-test.c
+index d8f66c16c72f..c2c8882d601b 100644
+--- a/linux-serial-test.c
++++ b/linux-serial-test.c
+@@ -55,6 +55,8 @@ int _cl_loopback = 0;
+ int _cl_dump_err = 0;
+ int _cl_no_rx = 0;
+ int _cl_no_tx = 0;
++int _cl_no_rx_param = 0;
++int _cl_no_tx_param = 0;
+ int _cl_rx_delay = 0;
+ int _cl_tx_delay = 0;
+ int _cl_tx_bytes = 0;
+@@ -442,9 +444,11 @@ static void process_options(int argc, char * argv[])
+ 			break;
+ 		case 'r':
+ 			_cl_no_rx = 1;
++			_cl_no_rx_param = 1;
+ 			break;
+ 		case 't':
+ 			_cl_no_tx = 1;
++			_cl_no_tx_param = 1;
+ 			break;
+ 		case 'l': {
+ 			char *endptr;
+@@ -745,7 +749,7 @@ static int diff_s(const struct timespec *t1, const struct timespec *t2)
+ static int compute_error_count(void)
+ {
+ 	long long int result;
+-	if (_cl_no_rx == 1 || _cl_no_tx == 1)
++	if (_cl_no_rx_param == 1 || _cl_no_tx_param == 1)
+ 		result = _error_count;
+ 	else
+ 		result = llabs(_write_count - _read_count) + _error_count;
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
index 888b13e2f6fa..66511bd9c312 100644
--- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/cbrake/linux-serial-test"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSES/MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
-SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master \
+           file://0001-linux-serial-test.c-fix-returned-error-code.patch \
+"
 PV = "0+git"
 SRCREV = "1a81f3c7be086ee01a9be8589a606426276c86d5"
 
-- 
2.43.0


