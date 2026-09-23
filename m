Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7405C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:25 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4277.1790160078611672763
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RbdHz1V2;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso1427150b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160078; x=1790764878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OgFOYGy+ifwZfxBoY6i+IgUL+IQZy3pF7DlbrLZWY4=;
        b=RbdHz1V2Q1x69qBlB+GZAMzbYGwfV5bAV1G3N9NIJMfX1MrLZ4LJQ/2ql2kWiQ7R9L
         iUHi9AFhcuaBHpRpJnQ5UGUOJmSKKZAOC2t953VQK41EI56Zv3Mt4UzeIrjw07YFQO/Q
         uHi+cG0CWGP+fnF4bIn46FERFfx3yTKaZ9GWS0UjP29KgH7Wp/ngtm96ZLJJvpI2VpmN
         eg2pMwtV+r/eZ/wuiZRtu8+lCCTa7Y7wlD498rxk11nWpjQ30kT6Ir3smT2KNgHu1rQ2
         LM6aR2taFat0d/vsd/Mn0hw/NwQi43yq5qP4avF25YQTGgDtcauERbc3JKXte7WvbQwF
         fLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160078; x=1790764878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3OgFOYGy+ifwZfxBoY6i+IgUL+IQZy3pF7DlbrLZWY4=;
        b=Bu5zDKTHRjU4IAzh9TMdQ0NKdw3hPjEOJ2Spp/8XJWJWaljp115Qv+ogPdjDNWgYQA
         F7MsAO0Cb2UvNdSbTH2BrSMq9dpJAZaKQWwi6B5oMv0D6txjHjhTM7H5rc/kiY36Zz2s
         dVQtDaJPCJ4VNSqmzFis5s5H42ZJk9G7otnKNknH4GLz28Dq/+sbsMVmm15TPt8SPX69
         SYY6dpRgjp5G+aLK/49/3i6VjNeYtL/eaMuOB9iCSbFAHsLEYk781cBW+5sBZ6i+nk7F
         T3XEjxzo6JYQqqnaVDmGOyoDmd5Ae283cUmYwDj+OUDX2rddaoiYU2nR8f16/s4OcrH/
         vFRw==
X-Gm-Message-State: AFuF++kY9V30uHczuroW6DKHrnUqXJ9NVkJeZ+LShGiVGNLb1tNN6sIA
	Z5dY3yOHvraJns5MetcoQiQgS8OQt50JTmLvHuq5gprPbInrwQAsPte7rHK/KA==
X-Gm-Gg: AYBFou01Me+xEJrifBXRQIp4cfUtYIkGwhKWNl+aZoeqbUVHuRdiQ8nb8lXWCTdzCU4
	RP9bqbV40PqOCowkE0lT7c9DkbfXM4nsfIAMJbj1s92PAJcd2sSgZbODVfHE53sRkwxLftk5WpW
	Bg/YK0VrYMg7rGW8hpa7pLASWC0Pa7R9cKk0Zd3dKpzx90nx3Z2qIE8uv2q+aIIQs9xa2u0PtV6
	JfH/X2FToFFZ5MUI+vGcgDeMoyt9BLTfxx9pzmSXD0fpzo27S+oO4R/eDuHlxu+PS39TFLcbt15
	oTqDtts8yuu2+4U8jbCfGU7uVRFXTzNCJK20CJW2on8544LR/fN389IZTXdOg5v5U7sIpO5K1+M
	Glhq/gqBQ2kNCYGRGRF2E2jBJNMKGoIYbAqbIId7B+tiGC8WQl3JAhr/d5KWbHb1ss2oaJCznNc
	xzLxJEqCHxjv+mkEFP4K2QS1kA65hbg+uE38vWpcClSq49U+6PH9xY+VIZk220Gd4tpg35e/4WN
	7Z/21XpJvVsOSnEROwkfSQ=
X-Received: by 2002:a05:6a00:a96:b0:857:73c3:446a with SMTP id d2e1a72fcca58-87c8452ed05mr2839118b3a.25.1790160077926;
        Wed, 23 Sep 2026 03:41:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 9/42] freeipmi: patch CVE-2026-85508
Date: Wed, 23 Sep 2026 22:40:23 +1200
Message-ID: <20260923104056.457360-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130196

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit from v1.6.19 matching NVD description.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-85508

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freeipmi/freeipmi/CVE-2026-85508.patch    | 51 +++++++++++++++++++
 .../freeipmi/freeipmi_1.6.17.bb               |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85508.patch

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85508.patch b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85508.patch
new file mode 100644
index 0000000000..80d2e53eea
--- /dev/null
+++ b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85508.patch
@@ -0,0 +1,51 @@
+From 4525750676ebf8dcf96a04bcd8cd59767581c44c Mon Sep 17 00:00:00 2001
+From: Albert L Chu <chu11@llnl.gov>
+Date: Tue, 18 Aug 2026 12:44:01 -0700
+Subject: [PATCH] ipmi-oem: bound Dell CMC-IPv6-info accumulation loop against
+ buffer size
+
+_output_dell_system_info_cmc_ipv6_info accumulates configuration
+parameter data from four get-system-info responses into a 256-byte
+cmc_ipv6_info stack buffer, copying (len - 1) bytes per iteration at a
+running offset with no check against the destination size.  The response
+field is BMC-controlled and can legitimately return up to 128 bytes per
+call, so a malicious BMC returning large blocks overflows the stack
+buffer with attacker-controlled data starting on the third iteration.
+
+Reject any copy whose cumulative length would exceed sizeof
+(cmc_ipv6_info) before the memcpy, mirroring the existing invalid-length
+error path.
+
+Assisted-by: Claude (Opus 4.8) <noreply@anthropic.com>
+(cherry picked from commit b34841134f3d3206840de06fb152ae3ee0b8bcff)
+
+CVE: CVE-2026-85508
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-19&id=b34841134f3d3206840de06fb152ae3ee0b8bcff]
+
+Dropped changes to the ChangeLog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ipmi-oem/ipmi-oem-dell.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/ipmi-oem/ipmi-oem-dell.c b/ipmi-oem/ipmi-oem-dell.c
+index f322cdfb8..ff2d39b1c 100644
+--- a/ipmi-oem/ipmi-oem-dell.c
++++ b/ipmi-oem/ipmi-oem-dell.c
+@@ -1220,6 +1220,15 @@ _output_dell_system_info_cmc_ipv6_info (ipmi_oem_state_data_t *state_data)
+           goto cleanup;
+         }
+ 
++      if ((cmc_ipv6_info_len + (len - 1)) > sizeof (cmc_ipv6_info))
++        {
++          pstdout_fprintf (state_data->pstate,
++                           stderr,
++                           "ipmi_cmd_get_system_info_parameters: invalid buffer length returned: %d\n",
++                           len);
++          goto cleanup;
++        }
++
+       memcpy (&cmc_ipv6_info[cmc_ipv6_info_len],
+               configuration_parameter_data + 1, /* remove set selector */
+               len - 1);
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
index ee0c05fb6f..8fa615c13a 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz \
            file://CVE-2026-50031-1.patch \
            file://CVE-2026-50031-2.patch \
            file://CVE-2026-85509.patch \
+           file://CVE-2026-85508.patch \
 "
 SRC_URI[sha256sum] = "16783d10faa28847a795cce0bf86deeaa72b8fbe71d1f0dc1101d13a6b501ec1"
 

