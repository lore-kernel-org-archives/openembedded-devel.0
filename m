Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CBFC369B2
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 15:30:38 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.12850.1744471829853799973
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Apr 2025 08:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dje/I5KW;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso3354970a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744471829; x=1745076629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQrU4gzDTeYB7OO4FY1ZfnOkzcLG0zcBfzvszkooz9w=;
        b=dje/I5KWzRdbT62WtvBYUoIcaHCsYdk3BQmyyM2UOlah+OLUGtIh61lTBljtFkVPtW
         6Adq+ZvXahWh7mtNPHW9y8kghgDB9Fk4Mk1HTFVHXG6awqU4VdMqr4avGdvonBB3opq0
         NwWitS3mrEDbbXTFJ/0Lj7SbahNNSj5o7UoGKWeRERGHvpFVfq6giAoJhhOBHkVjZSWJ
         A/PBYRa8vXzMj+cSzdNfCbC6N6BUXU2dWHbIl6rU2hTN4LXcIuIbQP8VLJiuA7MTsmPp
         PKcUG9/6UoNS/5JRjIpjfo2UWScz2Tr1Hzy1H7I0bzqe0F0E5l6Spj0AQufoSS0gVDrc
         Dd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744471829; x=1745076629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQrU4gzDTeYB7OO4FY1ZfnOkzcLG0zcBfzvszkooz9w=;
        b=SkWS7coE9QzgEWm4e1pyvl7u6PKEXQXMjaeFU3Lca4Iu/Q+K+9azc9MgYda7wBhL7A
         qNEd2ZMUqOV7kUZXsYMu6pgOsozLpGnYA98fyVSso43Hyg3/usXWCqlzrRK9ZfpaYtq5
         A0uAFoFtVpnXajEeWtrLea/fHBLn0e8Bixreo0RfkJUNKhr8r9OmkrRm9kv9VnMPkcaO
         WDUHimRlymLqnZ6rWreaPVWqjBM8a8Zb+60WH2rpmLUlb4kGVLmwXm2gc3d/TM8JccLc
         U28lIgbBi1Ic8ksGwRrQi6qyNaX5J1tRm5p0j02zCpY1eqfskX0JV381FwjvbUkt2jLx
         ceKg==
X-Gm-Message-State: AOJu0YwJJLoGwNdLcym5cENNC6ywmxEfzIyrsHQC0TEZss9itOKNZwON
	V681f5fSluYaG2mEtiksEHr7E6/O1UBaNBnLW5JRf/ejBnkGgP6xkA6voWUQ
X-Gm-Gg: ASbGncsewDiGE8ZJ/A6/XnAX05YBMvN7H0qvIYxg9Jre0T0Y25jlNFzpvmR8TtoZfgl
	crXRGsgf4THVJTzLrdPOXA9z0zQ3nPWK/k3GaYuaKVGQ5RD9XdwesGoLRHazYkyjspt1TJYc7Yp
	FA6f6FOYWblXCaKgyJdD7gzSD50CW/tLqraaGQ/pg64wicn59Ot39MGzh5WO0OWvd/31+U4O1oK
	HzoAe6DmXfhifH3oXvsGoN2VxOTCCT5wrLAm/cxm18pKiouJAlgZiIcTc2ufTW/37kDYmPsmN72
	W8x/YwQChquLTgSA4DnQ+qNVHDMJwDxI
X-Google-Smtp-Source: AGHT+IFKgy5THSYkl5OOW1VB3K6JhulMzkJs1aosL4X0Gz3o52zRdVMV4MV+7clFmLTp7w5HxZpTWA==
X-Received: by 2002:a17:90b:2dd2:b0:2ff:72f8:3708 with SMTP id 98e67ed59e1d1-3082365241fmr11686523a91.17.1744471828798;
        Sat, 12 Apr 2025 08:30:28 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm7686659a91.47.2025.04.12.08.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 08:30:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/8] meta-oe: Move tests out or into problematic test lists
Date: Sat, 12 Apr 2025 08:30:17 -0700
Message-ID: <20250412153022.2343322-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412153022.2343322-1-raj.khem@gmail.com>
References: <20250412153022.2343322-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 15:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116815

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 77bf47d90c..ff7f86bd94 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -20,10 +20,12 @@ PTESTS_FAST_META_OE = "\
     leveldb \
     libcereal \
     libgpiod \
+    libjcat \
     libio-pty-perl \
     libmanette \
     librelp \
     libssh \
+    libteam \
     libtinyxml2 \
     libtoml11 \
     libxml++-5.0 \
@@ -50,7 +52,7 @@ PTESTS_FAST_META_OE = "\
 PTESTS_FAST_META_OE:append:x86 = " mcelog"
 PTESTS_FAST_META_OE:append:x86-64 = " mcelog"
 
-PTESTS_FAST_META_OE:remove:libc-musl = "minicoredumper"
+PTESTS_FAST_META_OE:remove:libc-musl = "jemalloc minicoredumper oprofile"
 PTESTS_FAST_META_OE:remove:riscv64 = "nodejs oprofile"
 PTESTS_FAST_META_OE:remove:riscv32 = "nodejs oprofile"
 
@@ -58,10 +60,8 @@ PTESTS_SLOW_META_OE = "\
     c-ares \
     fftw \
     libusb-compat \
-    rsyslog \
     rocksdb \
     mariadb \
-    poco \
     re2 \
 "
 PTESTS_SLOW_META_OE:append:x86 = " kernel-selftest"
@@ -71,8 +71,9 @@ PTESTS_SLOW_META_OE:remove:libc-musl = "kernel-selftest"
 PTESTS_PROBLEMS_META_OE = "\
     keyutils \
     libdbi-perl \
-    libjcat \
-    libteam \
     ostree \
+    poco \
     psqlodbc \
+    rsyslog \
 "
+PTESTS_PROBLEMS_META_OE:append:libc-musl = " jemalloc minicoredumper oprofile"

