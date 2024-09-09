Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6C6ECE579
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 15:04:35 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.55431.1725894268533466999
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Sep 2024 08:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y8HTxDJ2;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7cd8d2731d1so2989255a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725894268; x=1726499068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT1IJ0AVj26C0pxtkqlS4nSX47k6oUrRT1sExpMT4Ug=;
        b=Y8HTxDJ2juIUVIG6QuXEAv7xdIixQsK1OD59l6yZonEKW4l8zes6SmII1f0g7yXqgD
         BpmallY0hGq79PjOXxlBe866ndFU6Wfc4EALJqKRYFIfw8FuMrjbWidIdUejc+zi+3B/
         Fy7oUAHQ1dMHAQeOXVRvYNK+eY1zuoFiS9+ubPdxxpKXqaDbIijm/MAPGjui752b+pke
         qYAnfA2GQvIc19jnZR2Bcq8ilKTndtJcCXEbiBYJlUajUtdJNss+rltkr7qJyRwir3HL
         dBl4PIM187ldJocfJHv6KCnFsQC4/z7U+/8Vl/KHX5XNgStptPzrMAardJJgSg9ZmFyO
         +eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725894268; x=1726499068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jT1IJ0AVj26C0pxtkqlS4nSX47k6oUrRT1sExpMT4Ug=;
        b=nRAwyCEwivpY8UcxC45lkkNw0xTWXOMIpsUz2z+y42TGN6IHrzaVtsTOeQsL5Wd2T4
         z9I/9uKjHYmVkciD4k54Xwp7SjiXJftaZCOZ9q/wK1B4ONDfjMFeZu7IVBvFJxflXYPe
         vC03fF29Z3eS/PFppJ8sIqLfOKyOlym3Yo70b6I35GG3XOan3JvwcN0eJOhY5t696aPg
         Tj6ZQi9VBRCFElKHDsYSuOwDUbpB+XXZcCz1/PIwMU78SzaCMzWqG4HFcl/sfFKbtpxf
         iPebjZzHpiylwKu5t8zgkQDfH8ARZV3nyCmd92WywC/o+aWlc/upEGDCM+8r9MX3V+G+
         d4Jw==
X-Gm-Message-State: AOJu0YyrcjM+gWtNopfbWyV3P4BrzQ4pd2VaiQJIPpzpSKmcHNFRZ7EN
	FcgPh6yXKEkRS3ubjntfgWD2okxPZp8KNUP3akWXxCfrywfoy2jTA5KAYUs2
X-Google-Smtp-Source: AGHT+IHfbtzQ6tmmA/GrzOJZNL8nsZQBubNCvgyV5Mvxsi2eX7XrCfodxl/Sk4gqC5QZGpyWkKnAEQ==
X-Received: by 2002:a05:6a20:2d1f:b0:1cf:46ef:463b with SMTP id adf61e73a8af0-1cf46ef4832mr2171084637.3.1725894267657;
        Mon, 09 Sep 2024 08:04:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4cdb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d825ba6b4dsm4063182a12.94.2024.09.09.08.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 08:04:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] freeipmi: Add recipe
Date: Mon,  9 Sep 2024 08:04:23 -0700
Message-ID: <20240909150423.4157986-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909150423.4157986-1-raj.khem@gmail.com>
References: <20240909150423.4157986-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 15:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112181

Its needed bt netdata 1.47+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-undeclared-function-errors.patch | 48 +++++++++++++++++++
 .../freeipmi/freeipmi_1.6.14.bb               | 25 ++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-undeclared-function-errors.patch
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi_1.6.14.bb

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-undeclared-function-errors.patch b/meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-undeclared-function-errors.patch
new file mode 100644
index 0000000000..5055679b72
--- /dev/null
+++ b/meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-undeclared-function-errors.patch
@@ -0,0 +1,48 @@
+From 3018aa9822c680663ebd19542bcd757dc9baf20a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 8 Sep 2024 20:16:49 -0700
+Subject: [PATCH] Fix undeclared function errors
+
+e.g.
+
+ipmi-sel-string-supermicro-x10dimm-common.c:87:14: error: call to undeclared function 'sel_string_output_supermicro_dimm_event_d
+    |    87 |   if ((ret = sel_string_output_supermicro_dimm_event_data2_event_data3 (ctx,
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/freeipmi-devel/2024-07/msg00000.html]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ipmi-sensors/ipmi-sensors-oem-intel.c               | 1 +
+ libfreeipmi/sel/ipmi-sel-string-supermicro-common.h | 9 +++++++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/ipmi-sensors/ipmi-sensors-oem-intel.c b/ipmi-sensors/ipmi-sensors-oem-intel.c
+index 5e0f373..872a730 100644
+--- a/ipmi-sensors/ipmi-sensors-oem-intel.c
++++ b/ipmi-sensors/ipmi-sensors-oem-intel.c
+@@ -36,6 +36,7 @@
+ #include "ipmi-sensors-oem-intel-s2600jf.h"
+ #include "ipmi-sensors-oem-intel-quanta-qssc-s4r.h"
+ #include "ipmi-sensors-oem-intel-node-manager.h"
++#include "ipmi-sensors-oem-intel-s2600wp.h"
+ 
+ #include "freeipmi-portability.h"
+ #include "pstdout.h"
+diff --git a/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h b/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
+index 5785f2b..9e29bd6 100644
+--- a/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
++++ b/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
+@@ -39,4 +39,13 @@ int sel_string_output_supermicro_overheat_event_data1_class_oem (ipmi_sel_ctx_t
+                                                                  unsigned int *wlen,
+                                                                  struct ipmi_sel_system_event_record_data *system_event_record_data);
+ 
++int sel_string_output_supermicro_dimm_event_data2_event_data3 (ipmi_sel_ctx_t ctx,
++                                                               struct ipmi_sel_entry *sel_entry,
++                                                               uint8_t sel_record_type,
++                                                               char *buf,
++                                                               unsigned int buflen,
++                                                               unsigned int flags,
++                                                               unsigned int *wlen,
++                                                               struct ipmi_sel_system_event_record_data *system_event_record_data,
++                                                               int *oem_rv);
+ #endif /* IPMI_SEL_STRING_SUPERMICRO_COMMON_H */
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.14.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.14.bb
new file mode 100644
index 0000000000..6117ca05b7
--- /dev/null
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.14.bb
@@ -0,0 +1,25 @@
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.ZRESEARCH;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.bmc-watchdog;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.ipmi-dcmi;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.ipmi-fru;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.ipmiconsole;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.ipmidetect;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.ipmimonitoring;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.ipmiping;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.ipmipower;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.ipmiseld;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.pstdout;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.sunbmc;md5=c03f21cd76ff5caba6b890d1213cbfbb"
+
+SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz \
+           file://0001-Fix-undeclared-function-errors.patch"
+SRC_URI[sha256sum] = "1a3dac5c76b7ccc4d4f86aa12b8ef9b212baef7489bf05e899b89abb7e14edb5"
+
+DEPENDS = "libgcrypt"
+
+inherit pkgconfig autotools
+
+EXTRA_OECONF = "--without-random-device"
+

