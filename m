Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7E1C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:35 +0000 (UTC)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4279.1790160086692404644
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NCqXZ5/N;
 spf=pass (domain: gmail.com, ip: 74.125.228.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so552739a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160086; x=1790764886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9azdClPeK74WUp2u9Ixn/x5DTm5IsoE1mZwzYFBgMMA=;
        b=NCqXZ5/NpwjKVzFpouKifnZAW1V5YogTTHKhVTYmEV9tVyAGSI+eOTuKnbEgdUb01W
         bSmaciZAblKSaGnLToMOeXNSu7shpGjUlBEY45wEBgTFALW5G+qjfHQY90/J8hqG9PIe
         Leu7Jh7bAi6D6SQi9oZkaaH6S2EsH/bhmRJJpVZLRIKnz6pLK2cKMXAlD6C3Juvv+5xJ
         gZgC++zNtn9CxVMnx9iNnwEZSnM2VnUgMZpcV2mzT1mqM6pn279kv7q040uceefv11J6
         PIenW993zdFO/DTSuxhvrfJaKBblSi5qBn3VVoh+jj0L9+nGFH1XnL7TVX+qeP+ExQQV
         tPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160086; x=1790764886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9azdClPeK74WUp2u9Ixn/x5DTm5IsoE1mZwzYFBgMMA=;
        b=IuJEiOdTyelb2Pg3rdVidGDxW3Y0lLEu6aGVJ2o3txqnsVidl5V4yugg9R505snuDT
         XAL6VICj70C0dysz35/6k/oHb2TAJBrT2erUsaxYQn9FbxnyP4ZAv+Z0FE/jjCfmUW4r
         W7uJCMbo5MhhN1oWJU4ts+a0NFAGL0NAKNhoXPQ+C7M/howwxr7Vg9kkpyCFM7dOn73U
         n4shNRBBV0aRj4bcO7pUK17T7gJiV6r1XpciZL9nQWWz/NuCfqLK0XPRUu7Q039uXUM3
         vJqtxwiujXPEYUte3cQ8g9SgF3oNsKouusOXcMxAJgBCDs94Ac5OMKnPtkeGB9S1FdZf
         NLkw==
X-Gm-Message-State: AFuF++lHdw6hHO7ipaLrk/+XcAZCrMcMqZ+b/Hwq/aTLcjHUUqb6SOdg
	56lvEMoHByisrwiFAdpq+D/dHRKtvOrZ0J4ZDgJIP4QN17PSoa4iTJvQz7543g==
X-Gm-Gg: AYBFou0xwARpd0ewaC8y8Y2O0/M2lkBTMX+ZphWirbrvgNp12t9Gp1++Tyst/UUC+9q
	RgfXTy4CnoL8a7UB/awvy0/yTD7dNeHwZUoGL3KkqwczoBDJxU1Q2opn1zRpdd0GqJiwdDUJoY0
	7rhN/eCE5gwKeOrsltsFuSFJ86FXUuWpm4QCQv+Y6FCR/oh8pjZJTlVkYA8j+dIQ7EqyhDKpWMG
	BAW5OMl7yGM62XbKQwLq9lFnFtJIBFfz/WANU1+GUmqiwzELqne+bQFrR4corYqyPJ0Oy91c+pV
	UPPxT/xifyTfYiTUlPX/98W9CXTi544WoVpuER6+LifVFNl2V4NxAOfUgwvp8CpkFE3PwxmMcs4
	bke1DZPJK/5c9WhqzzKW+xbFLLP7mXYs/OXR9+XRwjetBdYNK/Pfd7y8C7GiM+PIai5gUI6NnDh
	ZF0iLkGi0LMA8YD0F1d6MY+h5a69YBjXtKidaeOS2UKk0G9o5B+9fHKLjOZPdIOnsqQd9bmiVpu
	jV1SyoPX/Tl/+PI0mRHOVhSxATlqfycAg==
X-Received: by 2002:a05:6a20:3d08:b0:3dd:7a92:77bf with SMTP id adf61e73a8af0-3ddf79f1a9dmr2498090637.0.1790160086014;
        Wed, 23 Sep 2026 03:41:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 13/42] freeipmi: patch CVE-2026-85504
Date: Wed, 23 Sep 2026 22:40:27 +1200
Message-ID: <20260923104056.457360-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130200

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit from v1.6.19 matching NVD description.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-85504

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freeipmi/freeipmi/CVE-2026-85504.patch    | 93 +++++++++++++++++++
 .../freeipmi/freeipmi_1.6.17.bb               |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85504.patch

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85504.patch b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85504.patch
new file mode 100644
index 0000000000..d0614beb17
--- /dev/null
+++ b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85504.patch
@@ -0,0 +1,93 @@
+From 23bdae46ad532196ccd8a85d8a5c771e2aea1339 Mon Sep 17 00:00:00 2001
+From: Albert L Chu <chu11@llnl.gov>
+Date: Tue, 25 Aug 2026 11:40:41 -0700
+Subject: [PATCH] libfreeipmi: bound Fujitsu SEL long-text responses
+
+Reject short and oversized Fujitsu iRMC responses and cap each text chunk before copying it into the fixed-size output buffer.
+
+Assisted-by: Codex, GPT-5.6-SOL
+(cherry picked from commit 29fa34264e1eff685dcb9e0176e1eea0a6788e59)
+
+CVE: CVE-2026-85504
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-19&id=29fa34264e1eff685dcb9e0176e1eea0a6788e590]
+
+Dropped changes to the ChangeLog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ .../sel/ipmi-sel-string-fujitsu-irmc-common.c | 41 +++++++++++--------
+ 1 file changed, 24 insertions(+), 17 deletions(-)
+
+diff --git a/libfreeipmi/sel/ipmi-sel-string-fujitsu-irmc-common.c b/libfreeipmi/sel/ipmi-sel-string-fujitsu-irmc-common.c
+index f514a56c5..24aa94fb7 100644
+--- a/libfreeipmi/sel/ipmi-sel-string-fujitsu-irmc-common.c
++++ b/libfreeipmi/sel/ipmi-sel-string-fujitsu-irmc-common.c
+@@ -80,10 +80,10 @@ _ipmi_sel_oem_fujitsu_get_sel_entry_long_text (ipmi_sel_ctx_t ctx,
+   uint8_t severity = 0;
+   char data_buf[IPMI_OEM_FUJITSU_SEL_ENTRY_LONG_TEXT_MAX_DATA_LENGTH + 1];
+   char string_buf[IPMI_OEM_FUJITSU_SEL_ENTRY_LONG_TEXT_MAX_STRING_LENGTH + 1];
+-  uint8_t data_length;
++  unsigned int data_length;
+   uint8_t max_read_length;
+-  uint8_t offset = 0;
+-  uint8_t component_length = 0;
++  unsigned int offset = 0;
++  size_t component_length = 0;
+   const char *css_str = NULL;
+   const char *severity_str = NULL;
+   int rv = -1;
+@@ -208,8 +208,10 @@ _ipmi_sel_oem_fujitsu_get_sel_entry_long_text (ipmi_sel_ctx_t ctx,
+                             "[Fujitsu OEM decoding requires administrator privilege]");
+                   goto out;
+                 }
+-              goto cleanup;
+             }
++
++          SEL_SET_ERRNUM (ctx, IPMI_SEL_ERR_IPMI_ERROR);
++          goto cleanup;
+         }
+ 
+       /* Get severity and CSS flag only once */
+@@ -224,24 +226,29 @@ _ipmi_sel_oem_fujitsu_get_sel_entry_long_text (ipmi_sel_ctx_t ctx,
+ 
+       data_length = bytes_rs[15];
+ 
++      if (data_length > IPMI_OEM_FUJITSU_SEL_ENTRY_LONG_TEXT_MAX_DATA_LENGTH
++          || offset > data_length)
++        {
++          SEL_SET_ERRNUM (ctx, IPMI_SEL_ERR_IPMI_ERROR);
++          goto cleanup;
++        }
++
+       bytes_rs[rs_len-1] = '\0'; /* just to be sure it's terminated */
+       component_length = strlen ((char *)bytes_rs + 16);
+ 
+-      /* achu: truncate if there is overflow */
+-      if (offset + component_length > data_length)
+-        {
+-          memcpy (data_buf + offset,
+-                  &bytes_rs[16],
+-                  IPMI_OEM_FUJITSU_SEL_ENTRY_LONG_TEXT_MAX_DATA_LENGTH - offset);
+-          offset = data_length;
+-        }
+-      else
++      if (component_length > (data_length - offset))
++        component_length = data_length - offset;
++
++      if (!component_length && offset < data_length)
+         {
+-          memcpy (data_buf + offset,
+-                  &bytes_rs[16],
+-                  component_length);
+-          offset += component_length;
++          SEL_SET_ERRNUM (ctx, IPMI_SEL_ERR_IPMI_ERROR);
++          goto cleanup;
+         }
++
++      memcpy (data_buf + offset,
++              &bytes_rs[16],
++              component_length);
++      offset += component_length;
+     }
+ 
+   if (css == IPMI_OEM_FUJITSU_CSS_COMPONENT)
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
index a3a5fb5af0..aea282803a 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz \
            file://CVE-2026-85507.patch \
            file://CVE-2026-85506.patch \
            file://CVE-2026-85505.patch \
+           file://CVE-2026-85504.patch \
 "
 SRC_URI[sha256sum] = "16783d10faa28847a795cce0bf86deeaa72b8fbe71d1f0dc1101d13a6b501ec1"
 

