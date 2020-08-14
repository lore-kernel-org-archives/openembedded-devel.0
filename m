Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.12372.1597383423910756467
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QnSIt+za;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id y206so4000178pfb.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IksqAyTJTdhnwvhfN4ezWBs4+/b6yARk4lO7L+umfEw=;
        b=QnSIt+zaQp52l4Qdp1Wz+YL6UM79nkJVGnluYuIADAmDzsod0cK9ulC35O0bSSpfzm
         R5YXhHnKky2RvaDjAJsCWvR21lZHomn1dB0Zv2OG/fOVUWUpR6AyY1FZIrEo9kXX5Ary
         eEy7nzrudr2Zq+HUW2AfK2kKgkXqCFNkjQNLjE6lIAkwSe2iFKhEMZ0FEsvgoIRZg59d
         BMw6LtT/wEN+6PPE6UJ4fPTo6u8kH/GFkR2707bWss9P/YVgJCxWMdLOh60U4hcK5USa
         rYiqKkxN8F4YA15JSRoz55mMnp7Iy+vwEgV3RuQh6W8g+6wgv8GY+iSBG2VQCx+pUFdd
         ZBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IksqAyTJTdhnwvhfN4ezWBs4+/b6yARk4lO7L+umfEw=;
        b=nk1+EcN26NwWTqdPnhyuxzcucdnNXnH0qjTAXAKiuXylNCK7dtUCwDK9uxersOqnHw
         6qIWlzIHge3uswiOQUsiQVwE8GYKaJvEZGpjysjutcyvFJZpNbKfVcVHo82K8wLetTfJ
         avUp0Kq+f1nVEiVHCo5N1rvE/jgN8tbqMkcR65ln0GMghS6mkvBucEZmhN6Rs1I/V/HY
         oPZ7B+VG6YI7vXaGIsufabsQJcUYvmCm+kcd7lW9QCsxtZ8ahE05uqHMqETxj0rpSNaB
         zLdMveVPO9cpyeM1vH3BhqUoahVvQ0rWzVO9oPOWeHGXdaH9eRJ0k1buCTUg5pvTZ5US
         lgFA==
X-Gm-Message-State: AOAM532qScqENEHKoL3MRKqa2Z7WsyTTCjh7SqlKd3krHO1ony6e/TXI
	RoOEuyVjGjeyrbS54NMOTyyv9LN3b29JOA==
X-Google-Smtp-Source: ABdhPJy3FQzSskBKcaCEdvoTT6C35EF9lfkKTJvdJZwHtcpV0wblactRFyCu0brP1V48YJJ94MJTWg==
X-Received: by 2002:a62:1614:: with SMTP id 20mr675074pfw.258.1597383423066;
        Thu, 13 Aug 2020 22:37:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/21] ipmitool: Fix build with -fno-common
Date: Thu, 13 Aug 2020 22:36:41 -0700
Message-Id: <20200814053657.1701247-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-move-variable-definition-to-.c-file.patch | 41 +++++++++++++++++++
 .../ipmitool/ipmitool_1.8.18.bb               |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0001-hpmfwupg-move-variable-definition-to-.c-file.patch

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-hpmfwupg-move-variable-definition-to-.c-file.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-hpmfwupg-move-variable-definition-to-.c-file.patch
new file mode 100644
index 0000000000..a765c3ab2f
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-hpmfwupg-move-variable-definition-to-.c-file.patch
@@ -0,0 +1,41 @@
+From 3f7bb7218181745ca7762c1b4832cbb1c9e692f5 Mon Sep 17 00:00:00 2001
+From: Vaclav Dolezal <vdolezal@redhat.com>
+Date: Thu, 23 Jan 2020 11:26:32 +0100
+Subject: [PATCH] hpmfwupg: move variable definition to .c file
+
+Upstream-Status: Pending
+Signed-off-by: Vaclav Dolezal <vdolezal@redhat.com>
+---
+ include/ipmitool/ipmi_hpmfwupg.h | 2 +-
+ lib/ipmi_hpmfwupg.c              | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/ipmitool/ipmi_hpmfwupg.h b/include/ipmitool/ipmi_hpmfwupg.h
+index de65292..07f597b 100644
+--- a/include/ipmitool/ipmi_hpmfwupg.h
++++ b/include/ipmitool/ipmi_hpmfwupg.h
+@@ -800,7 +800,7 @@ typedef struct _VERSIONINFO {
+ 	char descString[HPMFWUPG_DESC_STRING_LENGTH + 1];
+ }VERSIONINFO, *PVERSIONINFO;
+ 
+-VERSIONINFO gVersionInfo[HPMFWUPG_COMPONENT_ID_MAX];
++extern VERSIONINFO gVersionInfo[HPMFWUPG_COMPONENT_ID_MAX];
+ 
+ #define TARGET_VER (0x01)
+ #define ROLLBACK_VER (0x02)
+diff --git a/lib/ipmi_hpmfwupg.c b/lib/ipmi_hpmfwupg.c
+index bbcffc0..d7cdcd6 100644
+--- a/lib/ipmi_hpmfwupg.c
++++ b/lib/ipmi_hpmfwupg.c
+@@ -58,6 +58,8 @@ ipmi_intf_get_max_request_data_size(struct ipmi_intf * intf);
+ 
+ extern int verbose;
+ 
++VERSIONINFO gVersionInfo[HPMFWUPG_COMPONENT_ID_MAX];
++
+ int HpmfwupgUpgrade(struct ipmi_intf *intf, char *imageFilename,
+ 		int activate, int, int);
+ int HpmfwupgValidateImageIntegrity(struct HpmfwupgUpgradeCtx *pFwupgCtx);
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
index 3de9a92a71..e3c74a5162 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
@@ -30,6 +30,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ipmitool/ipmitool-${PV}.tar.bz2 \
            file://0003-channel-Fix-buffer-overflow.patch \
            file://0004-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch \
            file://0005-fru-sdr-Fix-id_string-buffer-overflows.patch \
+           file://0001-hpmfwupg-move-variable-definition-to-.c-file.patch \
            "
 SRC_URI[md5sum] = "bab7ea104c7b85529c3ef65c54427aa3"
 SRC_URI[sha256sum] = "0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8b81e01"
-- 
2.28.0

