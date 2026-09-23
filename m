Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A879C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:25 +0000 (UTC)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4163.1790160082744259992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J1YK2lhb;
 spf=pass (domain: gmail.com, ip: 74.125.228.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so552717a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160082; x=1790764882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyMAYTrCHT8kx2wJ9DfBdg+KJnRt90lQrD6WHFSjccY=;
        b=J1YK2lhbOFzxz5Gzbfd6hM1hs9BEp6XsGQNWc7DnCdpHq86Jv+4zF2x7h55tcBaisB
         ZeAuUW1SvhhECoceDX9tRYmPdT0Kl+ZDFNfWW5tFOa4HYQGuzErss31V/ioTsXgH9p0v
         eZPYhKPjYOSZGVi3827hVI9a4YEqoNIfwbuM/ArikVKvLVGHfQ1knRHg5Rdn2/NvJ5RJ
         +8JKI1cKMpxBllwQK3P8tyjVLzGjORJOSh76MyX6XoQ0U9iuKDkP0iMd4vgquqxhVHkF
         YIqlvzBk2GRjNTRODaujKY1dyQEkL5J9u9Ch6ZnCyWxYAkEqB4PUSSkqG+xUHes0tu/v
         VLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160082; x=1790764882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GyMAYTrCHT8kx2wJ9DfBdg+KJnRt90lQrD6WHFSjccY=;
        b=itZ9hY9xu1YaQagsSzii+7wof3kF0gtc05u1xmHLl4uTrxRpUksyRW9S5CqzhzWemj
         EgQIVIEim66L8r5zxqmngOKhA4hV3myak7iABHQLTJPlOzfeAOsK89kbKiCbYBddIfE8
         Q6TS7AHF/Z3CUaaRSaA5mbDJ61SrFF81Jm+z8ebuT/Ke0OyPRidMpJyeD8DBYNxjrd4N
         FkeKBpQ58VoCHSLaBuCbW4Hw4IGPGlsr2DicRdtM7a/HIByQPNmFHdlagTjrWdM8nRbK
         i4I0YcVMB3AYzrOwZRhwVjXdc3xeHt4IJof9ivlZClTF++R93vCbaF0snETFyjCmunV8
         C9/g==
X-Gm-Message-State: AFuF++k5oo0JuoJUPZMSO7v/ruDsbHRFb6YaWOF9WODpIihiQsDFh/vw
	nTme5SQZvxPHevVCCw7lgq157Siw1fGsbiKGlQlqfAC+hlktuk9iAeCFzRI0NQ==
X-Gm-Gg: AYBFou1MR9oL+/O4OhYBFViBxI3cNsYdg6Wr8EtkBDilH5gHcrQEL0717m4BSCGZLqV
	xzTLX9JNxZPl5QnoJu9KwaEJzE5GNp8z5LEUWXQTAOxBnHSWGU3CyBdLWRi+OUxnG3JJ8VQEWRo
	UNpWpxn0KWlCSInylSGtceTrc8iGTGhqjYSjH9Pl7/rzk39u0lnsHnZPHKacOfbt201BzHhUSx5
	l0ykKInbhsaFZgVCmPXgFT5cictW/UGyBdVAdsAWlj7brwsoPdSgMnN36beGqjPnt/N+mrVlsGF
	riYMWq6Nd+6UcJMM6ZyMC8ZCobAZKGXgHCL8KHqFo0E4zRbzIhLou2yisriyRUxuYO2dfxi+wMS
	Ga2jUFLL2ZJMBeXTqjO4y0cDuqGaXsRSMYQyCR6mJuu9R0aqu+A8nR9Q/5FvHlyeoIYEs5TSptk
	15TE9p22YxjD05xaDw6JNMcKLQZDPRYLXjbnT5XzxfspyN4OwGgEW703+AuCLB+QjJDBXo0rNP2
	eyzN0/O2F7xk8bTDIO8mwHPD4+WmT8Bvw==
X-Received: by 2002:a05:6a21:b84:b0:3dd:85a9:55a9 with SMTP id adf61e73a8af0-3ddf826330amr2018565637.34.1790160082095;
        Wed, 23 Sep 2026 03:41:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 11/42] freeipmi: patch CVE-2026-85506
Date: Wed, 23 Sep 2026 22:40:25 +1200
Message-ID: <20260923104056.457360-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130198

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit from v1.6.19 matching NVD description.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-85506

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freeipmi/freeipmi/CVE-2026-85506.patch    | 51 +++++++++++++++++++
 .../freeipmi/freeipmi_1.6.17.bb               |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85506.patch

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85506.patch b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85506.patch
new file mode 100644
index 0000000000..267754ec9a
--- /dev/null
+++ b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85506.patch
@@ -0,0 +1,51 @@
+From 8652f7ca02cb6920c7a4c89add8effa6e9419ec7 Mon Sep 17 00:00:00 2001
+From: Albert L Chu <chu11@llnl.gov>
+Date: Tue, 18 Aug 2026 14:09:35 -0700
+Subject: [PATCH] ipmi-oem: bound Dell iDRAC-info accumulation loop against
+ buffer size
+
+_get_dell_system_info_idrac_info accumulates configuration parameter data
+from three get-system-info responses into a 256-byte idrac_info stack
+buffer, copying (len - 1) bytes per iteration at a running offset with no
+check against the destination size.  The response field is BMC-controlled
+and can legitimately return up to 128 bytes per call, so a malicious BMC
+returning large blocks overflows the stack buffer with attacker-controlled
+data on the third iteration.  This helper is also reached via
+dell get-system-info mac-addresses.
+
+Reject any copy whose cumulative length would exceed sizeof (idrac_info)
+before the memcpy, mirroring the existing invalid-length error path.
+
+Assisted-by: Claude (Opus 4.8) <noreply@anthropic.com>
+(cherry picked from commit 301458ac7b230dbfa42e73ee2c2959e4bbaecf30)
+
+CVE: CVE-2026-85506
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-19&id=301458ac7b230dbfa42e73ee2c2959e4bbaecf30]
+
+Dropped changes to the ChangeLog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ipmi-oem/ipmi-oem-dell.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/ipmi-oem/ipmi-oem-dell.c b/ipmi-oem/ipmi-oem-dell.c
+index 19c962cb1..f8e5ae165 100644
+--- a/ipmi-oem/ipmi-oem-dell.c
++++ b/ipmi-oem/ipmi-oem-dell.c
+@@ -595,6 +595,15 @@ _get_dell_system_info_idrac_info (ipmi_oem_state_data_t *state_data,
+           goto cleanup;
+         }
+ 
++      if ((idrac_info_len + (len - 1)) > sizeof (idrac_info))
++        {
++          pstdout_fprintf (state_data->pstate,
++                           stderr,
++                           "ipmi_cmd_get_system_info_parameters: invalid buffer length returned: %d\n",
++                           len);
++          goto cleanup;
++        }
++
+       memcpy (&idrac_info[idrac_info_len],
+               configuration_parameter_data + 1, /* remove set selector */
+               len - 1);
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
index 06fc6ca174..8438a517ec 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz \
            file://CVE-2026-85509.patch \
            file://CVE-2026-85508.patch \
            file://CVE-2026-85507.patch \
+           file://CVE-2026-85506.patch \
 "
 SRC_URI[sha256sum] = "16783d10faa28847a795cce0bf86deeaa72b8fbe71d1f0dc1101d13a6b501ec1"
 

