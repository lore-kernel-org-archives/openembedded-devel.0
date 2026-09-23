Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C20CC98309
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:25 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4158.1790160076666288927
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZrJoScJ2;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469f204f6so410434b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160076; x=1790764876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/IEcVz+VfmcH/APiQK/xL7wTzW/WraiMfmZmM1SDpk=;
        b=ZrJoScJ2ZUF/+dTypq/yIbC8TxXVZr6saxzm8b0ulz+402uGp5p1I8CbnTmYpPCdKf
         vhB54vKkEWkEOrSmLGKcIPOCRHsqG8ej7cd4k54aXWpBE4/Byaoe8xiQsiP3eN5Ugici
         HB7Ycuo24NyutqJqBd+dw0BgYtZexOsv2gt9juf0rb6HPcuAQ85sgulMS5bu6zGiULVn
         q4uhsSKPjXlbcHR9Vz6IcBxW+pTvosnMi9Ya/u4BlozQ59BC8dTHF12iHT3qo9OCunun
         GxEXwrKSq6MsKTOPXAx/7huUc1rAOFlzI1RfSYNU/zBlCMpZ4gRClUL2QAqlGdQ6Pa0x
         L7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160076; x=1790764876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/IEcVz+VfmcH/APiQK/xL7wTzW/WraiMfmZmM1SDpk=;
        b=EqmGKSTrH6pRMss3ycnd+hCUScPzYk+mfcBKV+hoYAcU9L5HPauk33sIkwtTsCVzFa
         jDi/E8l/2t9LBP+d7miWIoMXvIRJ0wPNX+07R817/eDTCmJr20Gd13iBT2ATCIlA2miD
         U2L3mrOegLBX4ewNEQxRGGaGCaMr/KUrliiaSMqa98KbgjPScDtFU3dPzjH6eJgubAyT
         YT/xiZwOSwpYok3Cj3dDtN87mxy4+v7qGCx9usYaLbbVx8KfQMRmPvj6GjYbMD6EqGCD
         SOCgyTxPKV6ft6ve8wMKVWHRMJN6qsxZLNdX2L7j1NAeerqB/1a8/rQg1exxep1PtCCy
         x6ww==
X-Gm-Message-State: AFuF++myn6UK8yedfGHf0xRRLntsyTrEdDhdSfwnzO3h8zoSSmKjr7pI
	75Qc7uraRRm9pezswzLHxPGVxFAUQs85k/9mRBHTdK2Kehxx/HA01/y8NJmuQA==
X-Gm-Gg: AYBFou3els2qksrCLgEli6eWyAKO2YiRFfkymB6vuaLt1b9R+4UjCVppSxY/h4VzoFS
	qG5ANWETyle7F98cJf+eePxwi/DF2BSpFVm95tjyYhjW0FErOHEFgW7Ikq0f/i3qzIgjXcm344e
	gy61t6Qc0yn9cfJNAv6W9pwYUeIel/toZkvZojx93ssy5oxym/zRsQA/dyGT48zA8RpOsvLpRPv
	tRsfn6z1bCKTIpYumn0/R7ktl9ftnUiEifIEEaYZxrWVavg57WqGW1gc+/HJTDCkPNIE4lcWJma
	vovrB1yTAcVMdMi41JQ177LLRMzfaqv4MfWDP0GSr0u8M1z/wQXtV1dANn4OzEkxW1+b+w31V6g
	MaklSNMmWvvTNg7gwHxhLxOgHuSvMFsyfaZL80KZHn2EWnyu4KMpzZcrWaFCIvhSUbF/nzLgvQw
	5m9LDvUZFBk+j3QWNlX7MoFjH4l6rGv59ZL+OYSS1Dhs2MLhWKIR7HQl84QYrqZ82/JO/2K+hnr
	55NiuJXpdvcc99Ib9Otv1c=
X-Received: by 2002:a05:6a00:2ea0:b0:878:3658:23db with SMTP id d2e1a72fcca58-87d1d9d2934mr2028704b3a.52.1790160075964;
        Wed, 23 Sep 2026 03:41:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 8/42] freeipmi: patch CVE-2026-85509
Date: Wed, 23 Sep 2026 22:40:22 +1200
Message-ID: <20260923104056.457360-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130195

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit from v1.6.19 matching NVD description.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-85509

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freeipmi/freeipmi/CVE-2026-85509.patch    | 54 +++++++++++++++++++
 .../freeipmi/freeipmi_1.6.17.bb               |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85509.patch

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85509.patch b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85509.patch
new file mode 100644
index 0000000000..71de8a533c
--- /dev/null
+++ b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85509.patch
@@ -0,0 +1,54 @@
+From f0360d8816918c1f8de6aa8ea7cbe2ee51971a32 Mon Sep 17 00:00:00 2001
+From: Albert L Chu <chu11@llnl.gov>
+Date: Tue, 11 Aug 2026 14:24:56 -0700
+Subject: [PATCH] libfreeipmi: clamp count_returned in _read_fru_data before
+ memcpy
+
+_read_fru_data reads FRU inventory in chunks, requesting at most
+count_to_read (<= IPMI_FRU_COUNT_TO_READ_BLOCK_SIZE, 16) bytes per
+iteration and copying the response into a fixed stack buffer frubuf.
+The BMC-supplied count_returned was validated only as non-zero and as
+equal to the returned data length -- never against the number of bytes
+requested.  A malicious or malfunctioning BMC returning more bytes than
+were asked for (up to 255) with a matching payload passes both existing
+checks, so memcpy(frubuf + num_bytes_read, buf, count_returned) writes
+past the intended chunk and can advance num_bytes_read beyond
+fru_read_bytes, overflowing the stack frubuf buffer.
+
+Reject count_returned > count_to_read before the memcpy.
+
+Assisted-by: Claude (Opus 4.8) <noreply@anthropic.com>
+(cherry picked from commit b7d4f1021c89a9a5dede0f481b10d438a9e18e23)
+
+CVE: CVE-2026-85509
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-19&id=b7d4f1021c89a9a5dede0f481b10d438a9e18e23]
+
+Dropped changes to the ChangeLog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreeipmi/fru/ipmi-fru.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/libfreeipmi/fru/ipmi-fru.c b/libfreeipmi/fru/ipmi-fru.c
+index f9dc8866d..bf35911c0 100644
+--- a/libfreeipmi/fru/ipmi-fru.c
++++ b/libfreeipmi/fru/ipmi-fru.c
+@@ -488,6 +488,17 @@ _read_fru_data (ipmi_fru_ctx_t ctx,
+           goto cleanup;
+         }
+ 
++      /* The BMC must not return more bytes than were requested.  A
++       * larger count_returned would advance num_bytes_read past
++       * fru_read_bytes and overflow frubuf via the memcpy below, so
++       * reject it rather than trust the device-supplied count.
++       */
++      if (count_returned > count_to_read)
++        {
++          FRU_SET_ERRNUM (ctx, IPMI_FRU_ERR_IPMI_ERROR);
++          goto cleanup;
++        }
++
+       memcpy (frubuf + num_bytes_read,
+               buf,
+               count_returned);
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
index f612caf3ac..ee0c05fb6f 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz \
            file://CVE-2026-50031-1.patch \
            file://CVE-2026-50031-2.patch \
+           file://CVE-2026-85509.patch \
 "
 SRC_URI[sha256sum] = "16783d10faa28847a795cce0bf86deeaa72b8fbe71d1f0dc1101d13a6b501ec1"
 

