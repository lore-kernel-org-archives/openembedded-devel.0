Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F5CF5A8AB
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 17:39:14 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25351.1776706746342374695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 10:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lA1LqTBK;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d7213b6ebso2228277f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776706745; x=1777311545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=00txl/cnEkf6yg/GmUaPHfNSGVpPcUjRKdhyKvr79lI=;
        b=lA1LqTBKs+Tz2neUhHgiZuft6u/G/MRyYvrbXn1itawvEZmtLH27w4VOTXSWaPjinn
         A8RbXaWuh2rTTYS5BLrV437a3jZx6IEAwMfYYZ3YRMBMBYJU8oo8gQbo0xa3aLbsiDxm
         T/CXdhYDy0AVgHw2rl2ZZAyuRl0GgO3VQzoCSqoDfmbdRbuc0LTYkZYbFGmqH2D8sYT0
         Sp3jyd3Ua9JDPMpzLmb+BfaRAvzBW58Gvz9DESbHAZw5Q6U05vMUZ1RbyeLuGvfuZLD7
         U/SU0tXSO5rC36NEEDz3YQv0utOGubF5rCnry0Jd0VaHvwIjHKCtBUANPNnp0NXv4n/x
         rIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706745; x=1777311545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00txl/cnEkf6yg/GmUaPHfNSGVpPcUjRKdhyKvr79lI=;
        b=Lb60ApJNfnOMlZJ03GcHugLdSjtA9+P1iyZ/Pd0mA3oKE0NleobC0bZlD71/vIm4iL
         m++bDDzjeIe7RM/qFj5YT5HfBhwnaz8c7IET0rSxheYlt9BHoDRrOrWOEcz+bSGwR5ZP
         Md/Jpw3iPI6iywNXeJGTtq3MnJTlQyfVJBRd69GnVm7lV/eGPLayGqmaFoCJOe0oWPpd
         lBn3LWjwFkUGG7Y8Q5O2DB3PchquyLCMQZnWRhHCLUzNioJOsW5+StXyD9NFjzF3FdxK
         mYqCpPaxygybIzlnl0G36pLHP5qJkFglFwvmvT7j95Yw5b8udWkXZFMw6J4PHFPNUzqv
         kZDw==
X-Gm-Message-State: AOJu0YwA8zrW69QZbdcXtSbMLDMU5N2HzQcTy62b9EU7dckyF3m7smyk
	OFoDZzh+bplFhMAIsAgMGD+rPNLw1H6E/983L+q8bkCI88nqG1fHh/M7V1Y5Rg==
X-Gm-Gg: AeBDietNXR2U33j7HbvQbSdV+KBgpDCVButRdMXpUsYuh/3U2KuFkBAyfJ8odqPlFVg
	lwA3/9VgayU0+04czBtfs7b3gh4SNHi7SkcfrJe/S3EAIJ9NvCqx02CANIEmCwZjmc8Yc5N9anv
	ocq/kizfSvfILKXTNMuU76Y2uUUh4kQZHl8Y0jO1C8apoHcPDDWDnRkVfNTT1catYJOCsvj7dRJ
	hAoQo3voR5nsA0YtNB24gCvXRXOzHst/oK66KzQB/en1NO4EH/O5CbySGkLC037iCPQ+6whQcq8
	TU1nN1/CJl5pSNpoSuVIH116748XZ/pr72kLxO61l+SWmAb3ungbzDYvPl2VmPeg62I26zbXOa7
	zgxBXksCUSYVkBXfTX3QGxLg454EZByuPJuOx5dzWRXrXAkV8mdgOQ3LuEy3TUrPpbi1tD4Jpy4
	qXGLCL7Ga54NvlkG/Y8wubKZayQzeBOu0=
X-Received: by 2002:a05:6000:2c0c:b0:43e:a70d:763c with SMTP id ffacd0b85a97d-43fe3e1e0ccmr20083614f8f.42.1776706744275;
        Mon, 20 Apr 2026 10:39:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4ffa8sm30198059f8f.35.2026.04.20.10.39.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:39:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 1/3] freeipmi: patch CVE-2026-33554
Date: Mon, 20 Apr 2026 19:39:01 +0200
Message-ID: <20260420173903.1007089-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 17:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126517

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-33554

The advisory references 3 bugs, but they were fixed by the same commit.
The first bug[1] references the commit that was backported in this patch.

[1]: https://savannah.gnu.org/bugs/?68140

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freeipmi/freeipmi/CVE-2026-33554.patch    | 92 +++++++++++++++++++
 .../freeipmi/freeipmi_1.6.16.bb               |  4 +-
 2 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-33554.patch

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-33554.patch b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-33554.patch
new file mode 100644
index 0000000000..7d3602f66b
--- /dev/null
+++ b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-33554.patch
@@ -0,0 +1,92 @@
+From 2270d652c4b05bd2ff9f95d4d103c194348d3fb9 Mon Sep 17 00:00:00 2001
+From: Albert Chu <chu11@llnl.gov>
+Date: Wed, 11 Mar 2026 11:06:37 -0700
+Subject: [PATCH] ipmi-oem: fix several memory out of bounds errors
+
+Found by Zhihan Zheng (chnzzh@outlook.com)
+
+CVE: CVE-2026-33554
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/freeipmi.git/diff/?h=freeipmi-1-6-0-stable&id=b03ca4d1bff4626c11db8684564b88cd26a2425d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ ipmi-oem/ipmi-oem-dell.c       | 12 +++++++++---
+ ipmi-oem/ipmi-oem-supermicro.c |  7 ++++++-
+ ipmi-oem/ipmi-oem-wistron.c    |  7 ++++++-
+ 3 files changed, 21 insertions(+), 5 deletions(-)
+
+diff --git a/ipmi-oem/ipmi-oem-dell.c b/ipmi-oem/ipmi-oem-dell.c
+index 7fbc0c1..cf3bad2 100644
+--- a/ipmi-oem/ipmi-oem-dell.c
++++ b/ipmi-oem/ipmi-oem-dell.c
+@@ -7161,7 +7161,7 @@ ipmi_oem_dell_get_last_post_code (ipmi_oem_state_data_t *state_data)
+   uint8_t bytes_rq[IPMI_OEM_MAX_BYTES];
+   uint8_t bytes_rs[IPMI_OEM_MAX_BYTES];
+   uint8_t post_code;
+-  uint8_t string_length;
++  size_t string_length;
+   char post_code_string[IPMI_OEM_STR_BUFLEN + 1];
+   int rs_len;
+   int rv = -1;
+@@ -7216,10 +7216,16 @@ ipmi_oem_dell_get_last_post_code (ipmi_oem_state_data_t *state_data)
+     goto cleanup;
+ 
+   post_code = bytes_rs[2];
+-  string_length = bytes_rs[3];
++  string_length = (size_t)bytes_rs[3];
+ 
+   if (string_length)
+-    memcpy (post_code_string, &bytes_rs[4], string_length);
++    {
++      if (string_length > (size_t)(rs_len - 4))
++        string_length = rs_len - 4;
++      if (string_length > IPMI_OEM_STR_BUFLEN)
++        string_length = IPMI_OEM_STR_BUFLEN;
++      memcpy (post_code_string, &bytes_rs[4], string_length);
++    }
+ 
+   pstdout_printf (state_data->pstate,
+                   "Post Code %02Xh : %s\n",
+diff --git a/ipmi-oem/ipmi-oem-supermicro.c b/ipmi-oem/ipmi-oem-supermicro.c
+index 51b8397..01d6b11 100644
+--- a/ipmi-oem/ipmi-oem-supermicro.c
++++ b/ipmi-oem/ipmi-oem-supermicro.c
+@@ -129,7 +129,12 @@ ipmi_oem_supermicro_extra_firmware_info (ipmi_oem_state_data_t *state_data)
+   firmware_hardware_id = bytes_rs[18];
+ 
+   if (rs_len > 19)
+-    memcpy (firmware_tag, &bytes_rs[19], rs_len - 19);
++    {
++      size_t tag_len = (size_t)(rs_len - 19);
++      if (tag_len > IPMI_OEM_SUPERMICRO_STRING_MAX)
++        tag_len = IPMI_OEM_SUPERMICRO_STRING_MAX;
++      memcpy (firmware_tag, &bytes_rs[19], tag_len);
++    }
+ 
+   /* assume minor version is BCD, just like in Get Device ID command */
+   /* assume sub version is also BCD */
+diff --git a/ipmi-oem/ipmi-oem-wistron.c b/ipmi-oem/ipmi-oem-wistron.c
+index b182cf7..f705c94 100644
+--- a/ipmi-oem/ipmi-oem-wistron.c
++++ b/ipmi-oem/ipmi-oem-wistron.c
+@@ -3047,6 +3047,7 @@ ipmi_oem_wistron_read_proprietary_string (ipmi_oem_state_data_t *state_data)
+   char string[IPMI_OEM_WISTRON_PROPRIETARY_STRING_MAX + 1];
+   int rs_len;
+   int rv = -1;
++  size_t len;
+ 
+   assert (state_data);
+   assert (!state_data->prog_data->args->oem_options_count);
+@@ -3107,8 +3108,12 @@ ipmi_oem_wistron_read_proprietary_string (ipmi_oem_state_data_t *state_data)
+       goto cleanup;
+     }
+ 
++  len = (size_t)bytes_rs[3];
++  if (len > (size_t)(rs_len - 4))
++    len = rs_len - 4;
++
+   memset (string, '\0', IPMI_OEM_WISTRON_PROPRIETARY_STRING_MAX + 1);
+-  memcpy (string, &bytes_rs[4], bytes_rs[3]);
++  memcpy (string, &bytes_rs[4], len);
+ 
+   pstdout_printf (state_data->pstate,
+                   "%s\n",
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb
index f5be870b1d..eafa000f2c 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.pstdout;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.sunbmc;md5=c03f21cd76ff5caba6b890d1213cbfbb"
 
-SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz \
+           file://CVE-2026-33554.patch \
+           "
 SRC_URI[sha256sum] = "5bcef6bb9eb680e49b4a3623579930ace7899f53925b2045fe9f91ad6904111d"
 
 DEPENDS = "libgcrypt"

