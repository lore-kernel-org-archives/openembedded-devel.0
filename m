Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288C5C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:07 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9057.1788343562083211200
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZKvNs07+;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1598133a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343561; x=1788948361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9EtLU5AQwjrhd/FkU9qvVdRImMXqspyl7LwYxAO860=;
        b=ZKvNs07+wGIQ0gIJlftVW8ajK2ElibN/s7KuKe6jxHMrl4x8ps7eqnG1gGZFFehACD
         CqU8kcaZWcxWPU34pfSaTy7udGSj8tyKFEEQ8d8oTrK6MzsULZLs0rDM/IF6YlGyyxUF
         Es1mJ72aGGbnVIeg5cQwHdfHhV0WcOZ9CsHaVA3QNbaLzSnoeFxswsY86YcmsY498gQH
         y5XCIvquwcAwNXNRf/EjILKlVo+MLRQTf5O0bbaJS96Laf5M8DbyHFi1m9NtdjrCxN7v
         2POPxKwD2NIn/1lbi9NyN2vU7bYxCR1Jzncs8nxfF2qUQNVcIGEednG1+YNqBt2/GjU+
         Rz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343561; x=1788948361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o9EtLU5AQwjrhd/FkU9qvVdRImMXqspyl7LwYxAO860=;
        b=ED79e/xy2Mya5wdN9YgpykPf3pPI2vvHL1JeEEoyNqNVzHfQapVhexqP8cVVLi8ogH
         sEOEug/v6yT3PtSbRsn3MBtJcI8lTJ8qRkJ8EF8FDegdlaww6dt566nsZR8DFaRKC8zG
         o0lOugwmOKJ4gp1jzlRUQHKIUuvwTyjHNsP2gNBjoKZ6JUvzc9+klfceLOzag1oQLorf
         jh3gByE8bmiV0PV0dUqYxSJyj/IzkSTF897ifxlILLytM4ImhL/19s3xBi5I8eXBMoIt
         kd4rL/C01vBKFPLu4S3TT3KwOL4lUAwCJNspDX29ODEQ4/zSSzYwsrPOdRFnSMnd3sjY
         r/fA==
X-Gm-Message-State: AFuF++m3OFRXFv4dmoLbl75a4uBLaezRU0awj/gfNQ9i2dsHtR5oXM3l
	DK6FPKUQif+7End2kHajHSwEFMPhBV0l76NfKF1b2/o2w/i9hIB/muNHMhKKdygy
X-Gm-Gg: AYBFou15WFUEdHSTrq6HRafRlzDuuoOYwdhe3QTclvJC0yLkzIYMVOlb8/mucIUh1L9
	FHrAmOKu2Y0z0hiFO1Gq+R4mNJcudYPUPre/XwSYgND0dhC50f/s5AgjhO6Zw4lxh8Mi8rkhqIN
	h7JK50AVELRa21bRaRdUc+HdA/qGjrXCE1QnVdJeMnsKsDCUyyyj2uqmS1Hq5FzMutvFif3hcm2
	cq099cWEXxQedSjxeFgMymb1FTBdg6mJEtqUCdiIqU9IS5FTppB+JKT/3YHO7HL1OX1m/toPpak
	wOMbOEMMV9MnwJm+I0oSzAImZN+EDxskFuarTBI9z7NrcYnE7tn+FuS7sTAIL2xxD9e60SoteQW
	TXRB3Lc2TDKGUNAtudGJcQUjiRxgxSJu9NCvFalxF+SUKoOqLGBiRwUqgb4PiNYFLXs74UQHZaR
	vy6Q8wblBLe5kixXiMfySulEMcSUxg1nTT0GpFvZ3lWhSbJgqDUPgKvb9pwXd1bKoP+xO8v6gs
X-Received: by 2002:a17:90a:fc4e:b0:398:9bd3:d6d6 with SMTP id 98e67ed59e1d1-39af65ab8b1mr1448268a91.16.1788343561341;
        Wed, 02 Sep 2026 03:06:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:06:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 17/28] freeipmi: patch CVE-2026-50031
Date: Wed,  2 Sep 2026 22:04:59 +1200
Message-ID: <20260902100511.2105916-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129648

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport patches fixing bugs[1][2] associated with the CVE.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-50031

[1] https://savannah.gnu.org/bugs/index.php?68363
[2] https://savannah.gnu.org/bugs/index.php?68364

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freeipmi/freeipmi/CVE-2026-50031-1.patch  | 33 +++++++++++++++++++
 .../freeipmi/freeipmi/CVE-2026-50031-2.patch  | 33 +++++++++++++++++++
 .../freeipmi/freeipmi_1.6.17.bb               |  5 ++-
 3 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-50031-1.patch
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-50031-2.patch

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-50031-1.patch b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-50031-1.patch
new file mode 100644
index 0000000000..e73368f473
--- /dev/null
+++ b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-50031-1.patch
@@ -0,0 +1,33 @@
+From 651119e671c7a64e72a79218f87b9f397037383b Mon Sep 17 00:00:00 2001
+From: Albert Chu <chu11@llnl.gov>
+Date: Tue, 19 May 2026 14:44:41 -0700
+Subject: [PATCH] ipmi-oem: fix potential stack corruption
+
+Problem: A buffer was incorrectly defined with a length of 256 bytes
+when it should have been 65536 bytes.
+
+Update the buffer length.
+
+CVE: CVE-2026-50031
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/freeipmi.git/commit/?id=f49a6076b640d802a9a80064089e772b4baa5335]
+
+Dropped changes done to the ChangeLog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ipmi-oem/ipmi-oem-dell.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ipmi-oem/ipmi-oem-dell.c b/ipmi-oem/ipmi-oem-dell.c
+index cf3bad244..f322cdfb8 100644
+--- a/ipmi-oem/ipmi-oem-dell.c
++++ b/ipmi-oem/ipmi-oem-dell.c
+@@ -4207,7 +4207,7 @@ ipmi_oem_dell_set_web_server_config (ipmi_oem_state_data_t *state_data)
+ int
+ ipmi_oem_dell_get_active_directory_config (ipmi_oem_state_data_t *state_data)
+ {
+-  uint8_t token_data[IPMI_OEM_MAX_BYTES];
++  uint8_t token_data[IPMI_OEM_DELL_TOKEN_DATA_MAX];
+   uint16_t expected_valid_field_mask = IPMI_OEM_DELL_EXTENDED_CONFIG_AD_CONFIGURATION_ALL_FIELD_MASK;
+   unsigned int token_data_read = 0;
+   unsigned int min_token_data_read = 0;
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-50031-2.patch b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-50031-2.patch
new file mode 100644
index 0000000000..b44799cffc
--- /dev/null
+++ b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-50031-2.patch
@@ -0,0 +1,33 @@
+From 1a7113599aa8926f133b5686c7e9b460d009a4e0 Mon Sep 17 00:00:00 2001
+From: Albert Chu <chu11@llnl.gov>
+Date: Tue, 19 May 2026 15:53:50 -0700
+Subject: [PATCH] ipmi-oem: fix potential stack overflow
+
+Problem: A buffer could incorrectly be overflowed in a fujitsu
+command.
+
+Add a guardrail to ensure no overflow.
+
+CVE: CVE-2026-50031
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/freeipmi.git/commit/?id=60dd7014c0b1402c881ef389f4e79ebb7a9e26c4]
+
+Dropped changes to the ChangeLog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ipmi-oem/ipmi-oem-fujitsu.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ipmi-oem/ipmi-oem-fujitsu.c b/ipmi-oem/ipmi-oem-fujitsu.c
+index 2f505229f..10220c9fc 100644
+--- a/ipmi-oem/ipmi-oem-fujitsu.c
++++ b/ipmi-oem/ipmi-oem-fujitsu.c
+@@ -1384,6 +1384,8 @@ ipmi_oem_fujitsu_get_sel_entry_long_text (ipmi_oem_state_data_t *state_data)
+         }
+ 
+       data_length = bytes_rs[15];
++      if (data_length > IPMI_OEM_FUJITSU_SEL_ENTRY_LONG_TEXT_MAX_DATA_LENGTH)
++        data_length = IPMI_OEM_FUJITSU_SEL_ENTRY_LONG_TEXT_MAX_DATA_LENGTH;
+ 
+       /* Every response should be NUL terminated, not just the last
+        * component.
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
index 7970e0f563..f612caf3ac 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
@@ -13,7 +13,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.pstdout;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.sunbmc;md5=c03f21cd76ff5caba6b890d1213cbfbb"
 
-SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz \
+           file://CVE-2026-50031-1.patch \
+           file://CVE-2026-50031-2.patch \
+"
 SRC_URI[sha256sum] = "16783d10faa28847a795cce0bf86deeaa72b8fbe71d1f0dc1101d13a6b501ec1"
 
 DEPENDS = "libgcrypt"

