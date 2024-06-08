Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2839C25B76
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 04:55:15 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.939.1717822511569672295
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jun 2024 21:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KDMD5CSv;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-701b0b0be38so2725125b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 21:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717822511; x=1718427311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNkHzccTQCob6a3pJ3Uv4NEDjvLhp47F/epTI9Sole4=;
        b=KDMD5CSvlodIxuTwxsVUDXZZzvJqhJAsXOgHVo82Ougpu9MECaDoGl8sJcRIsHmOcr
         DjR/YV0r9vF7393O6W0aXJjrjW4QrsCXzQEaaaHIcDTgLJ9DtBMftVNRP8D5V24OMpQW
         +uPlaAVwAYU7JJLh1ra/IkideNZ5FfBo4A6F65kXIWvaQH5xutL/rvTu6iFComx6V00L
         pJg9kzIqux8yB6lXwfKiwxng8gCGRjkh3TmbxZLWas75Hc7wa+K8yb6NqJFen9lP9wuT
         IX3W/aXyyTd/wiJTWKOx0CFVPn2RJxWj6nxEvv3gJhh3Laq6uSHDEh6L4DhJdprqEiDk
         8PMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717822511; x=1718427311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNkHzccTQCob6a3pJ3Uv4NEDjvLhp47F/epTI9Sole4=;
        b=s9BiAGwmQP7v2n2FE+1b4jqhKQkYaiXRj8ePAGOe/Xsy0XO1W4/QMLNeJGqDuoWSC3
         Vr2qtWHrqY7gg6L8fzQ+TBbe4keCTvJWy4hl0hz9YU9G4F1XppE+5ykIT7oFZ2plD4VZ
         aDf2NchKipjyPAWwhiSkF4pbf++MXNVa0Awtn9h1YFVfiPkEmo+yYjV+F2wdk+moLZ82
         MUA11JBpbETUY/18+FvcPTphCj3WQHmz/CEH3kuFj81INc/sfjKDh8//QePN3pTLPDde
         IrJ6JdlE7NbgqFnzigiViLX7hkNVsl6h39EtOsKJrz7cRUp3KPflacVQZ8AYUrjD/Lv6
         3vzw==
X-Gm-Message-State: AOJu0YwDxb9lPSngn/Khc9Xb1HwsZ2GlupFv10OzWsJMWKOxIaB2NRgH
	3kpvpCV0+lkOcABGsou/SQLzZd9agbqQNId745nFIrlxorbP+hORPAzyPZYy
X-Google-Smtp-Source: AGHT+IHMFci7YEYj/ZhGF16fKChGPIl+YLkl6/P1upR1PQVuIx6/T8+3ZlHUJSMQ7KFM5P0vkqOdeA==
X-Received: by 2002:a05:6a00:13a9:b0:702:4077:97f4 with SMTP id d2e1a72fcca58-7040c74f834mr4599546b3a.30.1717822510343;
        Fri, 07 Jun 2024 21:55:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7041edb91cdsm805380b3a.213.2024.06.07.21.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 21:55:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] networkmanager: Fix undefined symbol errors on musl+lld
Date: Fri,  7 Jun 2024 21:55:06 -0700
Message-ID: <20240608045506.2770978-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240608045506.2770978-1-raj.khem@gmail.com>
References: <20240608045506.2770978-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Jun 2024 04:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110772

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...re-Disable-sd_dhcp6_client_set_duid_.patch | 65 +++++++++++++++++++
 .../networkmanager/networkmanager_1.48.0.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-systemd-core-Disable-sd_dhcp6_client_set_duid_.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-systemd-core-Disable-sd_dhcp6_client_set_duid_.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-systemd-core-Disable-sd_dhcp6_client_set_duid_.patch
new file mode 100644
index 0000000000..8e246efe01
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-systemd-core-Disable-sd_dhcp6_client_set_duid_.patch
@@ -0,0 +1,65 @@
+From 34d7a6c9919a73c2e716835000944c17438b2ca1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jun 2024 14:03:15 -0700
+Subject: [PATCH] libnm-systemd-core: Disable sd_dhcp6_client_set_duid_uuid
+ function
+
+When building on musl systems ( with out systemd ), and using LLD linker
+from LLVM project we fail to link with undefined symbols.
+
+This symbol is in sd_id128.c but its disabled, so let disable the functions
+which need this function.
+
+| x86_64-yoe-linux-musl-ld.lld: error: undefined symbol: sd_id128_get_machine_app_specific
+| >>> referenced by sd-dhcp-duid.c:202 (/usr/src/debug/networkmanager/1.48.0/../NetworkManager-1.48.0/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c:202)
+| >>>               libnm-systemd-core.a.p/src_libsystemd-network_sd-dhcp-duid.c.o:(sd_dhcp_duid_set_uuid) in archive src/libnm-systemd-core/libnm-systemd-core.a
+| x86_64-yoe-linux-musl-clang: error: linker command failed with exit code 1 (use -v to see invocation)
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1966]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c   | 2 ++
+ .../src/libsystemd-network/sd-dhcp6-client.c                   | 3 ++-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c
+index e664a4a..7ba5020 100644
+--- a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c
++++ b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c
+@@ -193,6 +193,7 @@ int sd_dhcp_duid_set_en(sd_dhcp_duid *duid) {
+         return 0;
+ }
+ 
++#if 0
+ int sd_dhcp_duid_set_uuid(sd_dhcp_duid *duid) {
+         sd_id128_t machine_id;
+         int r;
+@@ -209,6 +210,7 @@ int sd_dhcp_duid_set_uuid(sd_dhcp_duid *duid) {
+         duid->size = offsetof(struct duid, uuid.uuid) + sizeof(machine_id);
+         return 0;
+ }
++#endif
+ 
+ int dhcp_duid_to_string_internal(uint16_t type, const void *data, size_t data_size, char **ret) {
+         _cleanup_free_ char *p = NULL, *x = NULL;
+diff --git a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c
+index 7c20116..08c1e96 100644
+--- a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c
++++ b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c
+@@ -244,6 +244,7 @@ int sd_dhcp6_client_set_duid_en(sd_dhcp6_client *client) {
+         return 0;
+ }
+ 
++#if 0
+ int sd_dhcp6_client_set_duid_uuid(sd_dhcp6_client *client) {
+         int r;
+ 
+@@ -256,7 +257,7 @@ int sd_dhcp6_client_set_duid_uuid(sd_dhcp6_client *client) {
+ 
+         return 0;
+ }
+-
++#endif
+ int sd_dhcp6_client_set_duid_raw(sd_dhcp6_client *client, uint16_t duid_type, const uint8_t *duid, size_t duid_len) {
+         int r;
+ 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.0.bb
index 1355e52a6e..47287951f5 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.0.bb
@@ -40,6 +40,7 @@ SRC_URI = " \
     file://${BPN}.initd \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
+    file://0001-libnm-systemd-core-Disable-sd_dhcp6_client_set_duid_.patch \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 

