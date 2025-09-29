Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031AFCCA476
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:46 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.53206.1759151077264548641
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CuCOER2E;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b0418f6fc27so657022666b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151076; x=1759755876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZFS5OdgTXFDtNA3COQHNY1Zu6nq943V0xHsAaumRXU=;
        b=CuCOER2Ea1JU8mXRVb2C81yNWlft/94nK2Moiw8h0nPPNNlouBwCwhO4emq7V9yOB/
         BYd3F5escEuK+fdKqeujdMhETreOOtHKR4pbkR7lX1SCFsGAqdydICcPV0xWgy5Ew1cX
         0TLwK2M46c4mjdZ23vo7PDYuqkzUEKzLF8rBipgsETvEE5wjk7C3HqHHD+JHLuh+N6Bu
         +f1dSGEVDS2FeAwNLULcJq9+V9PKeZMjxVWtBem3IDxN6k9ZuCGOSH0E83vWTy1F4tRo
         tIH1gmmA0XYe7VZIb6ADgNeFdvODx55TwOrnkb6sdIucTpddLRNq9rBmhCBeDw7NDfcB
         rkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151076; x=1759755876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZFS5OdgTXFDtNA3COQHNY1Zu6nq943V0xHsAaumRXU=;
        b=HdWv6ZUa6emNjWcQregCTLbVJ9qrYHsnsLmZo5h0mY+ycboDxefmHk68jojP8TRSe0
         axTMSMFijvTWiV4X2gJrRsDKA4PL4bOujN8hHCbnId0+lGMP/abGu4LCzgaGqJofiq9m
         B5qWyZvLz99/8GUKmUyFLz8APv808I4au847S1lIXinlPEWrh3EUbeHrhLaO1sDLP4XR
         zfBBBewrIdYz7R/hoBIO73+3CCfJWd3N1DwLU7bpxeD/lj3CfNnokwyQbVFEV9bExl6L
         6ljMwLU/q/03Oo6pGqD3mLN3wiTemFOzgURYFItgNQHCdcrMLTtDVZy6DnuOb8/Lp24E
         7hBQ==
X-Gm-Message-State: AOJu0Yz+RVzCLZxCH1rd/FwDcc9N31xw1YYYhhDqr2FDdOLml3hoV15D
	Gt7Hs5QZpZIypfDrOYdWeSgoUxJ+CXteNUb0uIE8zYobpieeNrEstiyjoktF+A==
X-Gm-Gg: ASbGncvdfJyXoSe79Ou5CHnN8lbBAaSU5deNsSb1jEGek0iHxJAhEcHyevW1MMkXo+m
	TcNeVfCL2NI7jzIOXWgzRAKUOHwKVN9wNC40JSD8sD/BQc+JSVr8XD09b1wQUbs3MvuBjFJ/GRX
	P20/ZFubEWvvrjoVhnVEkKg8PmhSS8OW6gyB9cMw6uoxaNMOlxlBT7AJZMZIND8BtXY4qbKHjGW
	hr6nszfMKXQyydyoWZfXOzh6HRKmn7qv9oZuT2HvmBHyhzo9lTMM9l++onyJuyI6bVizPTG1u+1
	3Z7Fk6KXxFropbgV4bXyMJlcN1CKZ5pxQOvFerjWcswNzZF5PMKkuHQqoPYoZwMYV4W8BiGWV92
	CvKX7lb5BDQ8PclrDWkXr
X-Google-Smtp-Source: AGHT+IFR1/2Ut5KrQdE2hlbby55ygnI9xcqpo+0YhlBVuycCqq7F3gSxQhNg4PJXvCVtqhCCvfztVw==
X-Received: by 2002:a17:907:72c4:b0:b07:c714:f3ca with SMTP id a640c23a62f3a-b34bcd59520mr1739770566b.50.1759151075419;
        Mon, 29 Sep 2025 06:04:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 09/22] cifs-utils: upgrade 6.14 -> 6.15
Date: Mon, 29 Sep 2025 15:04:12 +0200
Message-ID: <20250929130425.2912077-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120022

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 88ea7fc012f3edcb7ee7b22330826d285f0319b7)

Adapted to Kirkstone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...{cifs-utils_6.14.bb => cifs-utils_6.15.bb} |  7 +--
 .../cifs/files/CVE-2022-27239.patch           | 40 ----------------
 .../cifs/files/CVE-2022-29869.patch           | 48 -------------------
 3 files changed, 2 insertions(+), 93 deletions(-)
 rename meta-networking/recipes-support/cifs/{cifs-utils_6.14.bb => cifs-utils_6.15.bb} (90%)
 delete mode 100644 meta-networking/recipes-support/cifs/files/CVE-2022-27239.patch
 delete mode 100644 meta-networking/recipes-support/cifs/files/CVE-2022-29869.patch

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.15.bb
similarity index 90%
rename from meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_6.15.bb
index 516e467ee4..a009a26cc2 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.15.bb
@@ -4,11 +4,8 @@ SECTION = "otherosfs"
 LICENSE = "GPL-3.0-only & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "8c06dce7d596e478c20bc54bdcec87ad97f80a1b"
-SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master \
-           file://CVE-2022-27239.patch \
-           file://CVE-2022-29869.patch \
-"
+SRCREV = "58ca03f183b375cb723097a241bc2fc2254dab21"
+SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
 DEPENDS += "libtalloc"
diff --git a/meta-networking/recipes-support/cifs/files/CVE-2022-27239.patch b/meta-networking/recipes-support/cifs/files/CVE-2022-27239.patch
deleted file mode 100644
index 77f6745abe..0000000000
--- a/meta-networking/recipes-support/cifs/files/CVE-2022-27239.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 007c07fd91b6d42f8bd45187cf78ebb06801139d Mon Sep 17 00:00:00 2001
-From: Jeffrey Bencteux <jbe@improsec.com>
-Date: Thu, 17 Mar 2022 12:58:52 -0400
-Subject: [PATCH] CVE-2022-27239: mount.cifs: fix length check for ip option
- parsing
-
-Previous check was true whatever the length of the input string was,
-leading to a buffer overflow in the subsequent strcpy call.
-
-Bug: https://bugzilla.samba.org/show_bug.cgi?id=15025
-
-Signed-off-by: Jeffrey Bencteux <jbe@improsec.com>
-Reviewed-by: David Disseldorp <ddiss@suse.de>
-
-Upstream-Status: Backport [ https://git.samba.org/?p=cifs-utils.git;a=commit;h=007c07fd91b6d42f8bd45187cf78ebb06801139d]
-CVE: CVE-2022-27239
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
----
- mount.cifs.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/mount.cifs.c b/mount.cifs.c
-index 84274c9..3a6b449 100644
---- a/mount.cifs.c
-+++ b/mount.cifs.c
-@@ -926,9 +926,10 @@ parse_options(const char *data, struct parsed_mount_info *parsed_info)
- 			if (!value || !*value) {
- 				fprintf(stderr,
- 					"target ip address argument missing\n");
--			} else if (strnlen(value, MAX_ADDRESS_LEN) <=
-+			} else if (strnlen(value, MAX_ADDRESS_LEN) <
- 				MAX_ADDRESS_LEN) {
--				strcpy(parsed_info->addrlist, value);
-+				strlcpy(parsed_info->addrlist, value,
-+					MAX_ADDRESS_LEN);
- 				if (parsed_info->verboseflag)
- 					fprintf(stderr,
- 						"ip address %s override specified\n",
--- 
-2.34.1
diff --git a/meta-networking/recipes-support/cifs/files/CVE-2022-29869.patch b/meta-networking/recipes-support/cifs/files/CVE-2022-29869.patch
deleted file mode 100644
index f0c3f37dec..0000000000
--- a/meta-networking/recipes-support/cifs/files/CVE-2022-29869.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8acc963a2e7e9d63fe1f2e7f73f5a03f83d9c379 Mon Sep 17 00:00:00 2001
-From: Jeffrey Bencteux <jbe@improsec.com>
-Date: Sat, 19 Mar 2022 13:41:15 -0400
-Subject: [PATCH] mount.cifs: fix verbose messages on option parsing
-
-When verbose logging is enabled, invalid credentials file lines may be
-dumped to stderr. This may lead to information disclosure in particular
-conditions when the credentials file given is sensitive and contains '='
-signs.
-
-Bug: https://bugzilla.samba.org/show_bug.cgi?id=15026
-
-Signed-off-by: Jeffrey Bencteux <jbe@improsec.com>
-Reviewed-by: David Disseldorp <ddiss@suse.de>
-
-Upstream-Status: Backport [https://git.samba.org/?p=cifs-utils.git;a=commit;h=8acc963a2e7e9d63fe1f2e7f73f5a03f83d9c379]
-CVE: CVE-2022-29869
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
----
- mount.cifs.c | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/mount.cifs.c b/mount.cifs.c
-index 3a6b449..2278995 100644
---- a/mount.cifs.c
-+++ b/mount.cifs.c
-@@ -628,17 +628,13 @@ static int open_cred_file(char *file_name,
- 				goto return_i;
- 			break;
- 		case CRED_DOM:
--			if (parsed_info->verboseflag)
--				fprintf(stderr, "domain=%s\n",
--					temp_val);
- 			strlcpy(parsed_info->domain, temp_val,
- 				sizeof(parsed_info->domain));
- 			break;
- 		case CRED_UNPARSEABLE:
- 			if (parsed_info->verboseflag)
- 				fprintf(stderr, "Credential formatted "
--					"incorrectly: %s\n",
--					temp_val ? temp_val : "(null)");
-+					"incorrectly\n");
- 			break;
- 		}
- 	}
--- 
-2.34.1
-

