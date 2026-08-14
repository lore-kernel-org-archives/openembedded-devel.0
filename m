Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65465C5DF70
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:42 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24557.1786747660795343387
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=noFLt9dN;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84faf87d19dso1588761b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747660; x=1787352460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBU/WuHVfb39PESG84FQJe9rwKHJ0SAWS/Jc9kJ89WU=;
        b=noFLt9dNMPV4YJnZNNdDREShSTrRX+lN5txZ5uAo+V7yYZWjJcdG0QvfSGlHa8wG8g
         zjfeNz75PN56GiLsjDUTHGwdDQSxs0AbEb6VCVR275qWhMjE4vDRPRIUvYtWnyQunuGz
         KTiqRq9Pda4AQh1lKNFqxpDL6/oFcUhxXoIQpAzamOIJpCl0OJOIxBHMYD+wcTFe4/q+
         +587+nMuhKdIazKwkdcOoQerYYKF8e09xOQNadgAkXbb1OR7rAjWtXdYTVgS+lrGNoRH
         uHo1DAjsYXdz9xoz+BcPMpWTU8zkMOS8agojOmN2a0ci651l34px/pxBmqFOcGo1cWl6
         7MBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747660; x=1787352460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TBU/WuHVfb39PESG84FQJe9rwKHJ0SAWS/Jc9kJ89WU=;
        b=fMNuHh17y84L2RwNhVlodpfYuu+U3b0HotjoSicpWjnQfMQmAhsO+FBflxJh3Gc0JH
         EIh8ffN5KA6zv0+U0CtkjiaM5QUvHiNQ/SyufbDZo5/KoWXmJwHfr6Ntz7jvId7NGv4b
         BJsuvfvAPC8Z7Igi+6lYWeVbsfhdAlsTZvZ08N+yv+7rIbSzbTL7traXSHcpOIznNtIw
         7Le0EYBqNZvHt593IpIG10rQ+I4Ad6RcJQ7XqNJ023n5n5xD15exYpGTBMBGE6DwSTQv
         TuBvGLCXpelXysFswDT8N0Tnl4WfV0cWZ9Rhr6xhZJoBMEbqZXGxHyuZ3lZ6Qiae40+g
         BOCA==
X-Gm-Message-State: AOJu0YxODQazNNVPCRCENynWsuyiph0xAo+4JYzo6q9lMJspviwkIy/c
	Sm3bCK5Lk0IqlH8o3GBS/hB6NKRxcQZttL2tNYIQgIewbsGbaDVGfESVW0057jjd
X-Gm-Gg: AR+sD11NDzMi3kORCtUeIXl13ZdX2qVuTbwrGr8q8xHtenfmF32d65dY01PYZr7yUmJ
	17gBw5BQA0WcPktFlPJ0wL+PuXcIGN6YHU9q0zYr9+R7AhbUbECTPFYEIIwC7RjhQBcTkymmzMb
	2FWScpw/poNdpMxvSMvEYpOkP9HUs2khZL9HmuX2hPzkA9cU07rBzWaO2//AD66z+omsKHa2315
	CIEXvz/Em1SOoQfOLN7uhUCuYIZvKvwT5skiiCCzzKsGy10+XwHJoUKjWr/Q04fF6E8DWva5s+P
	Dh5/YcgSTDc3Qtqp75KA3382PY67ty5nCBSyNbx53s16dQU2HEkrwWPecziuJqmEcjZK5+wewoG
	Xf3Dpqf+AM2QhxHsUPYDGygD4eBmofSUreNMxhE8vM4lzsuOsXHeOhxvFMa7CZb8l+Kuq931fVA
	BQ40MMeoRRrselbsjclc3eDnnC4jWxB2K4M9q5WQMhBG8d3UccDM+qi96Z0MqpdDdHRVFOvfaUV
	gk8VtnXOCLNc1aCL3MRoH1MqokFqYexg/+g8DjNtAznT7m0sTBfcbCSe36MWQF+vfQt644HacmZ
	73/yqEOrOqwRAuswXOoZxT+n99E/Z4vIktCxPmWgL87qz6+uHG6spjSw86BVpnFBLTIF7a0Dbsp
	FhIjgye+fZA2/UROMiujgLU2wsH6W8wmOWIb+t5+woYU/rgg=
X-Received: by 2002:a05:6a20:3ca2:b0:3a2:d316:de53 with SMTP id adf61e73a8af0-3cc71858bbfmr10590356637.0.1786747660054;
        Fri, 14 Aug 2026 15:47:40 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 099/109] openconnect: upgrade 9.12 -> 9.21
Date: Fri, 14 Aug 2026 15:45:25 -0700
Message-ID: <20260814224539.1523174-99-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129163

Drop 0001-Shim-for-renaming-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch:
it was a workaround for GnuTLS >= 3.8.1 renaming GNUTLS_NO_EXTENSIONS
before a compatibility shim landed upstream; that compatibility shim
is long merged and this openconnect release range no longer needs
the local re-definition (build succeeds without it).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...g-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch | 43 -------------------
 ...penconnect_9.12.bb => openconnect_9.21.bb} |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/openconnect/openconnect/0001-Shim-for-renaming-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch
 rename meta-networking/recipes-connectivity/openconnect/{openconnect_9.12.bb => openconnect_9.21.bb} (87%)

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect/0001-Shim-for-renaming-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch b/meta-networking/recipes-connectivity/openconnect/openconnect/0001-Shim-for-renaming-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch
deleted file mode 100644
index 9dd3da75ad..0000000000
--- a/meta-networking/recipes-connectivity/openconnect/openconnect/0001-Shim-for-renaming-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e4ea64134cfe3763332c16dcac52dd894b935880 Mon Sep 17 00:00:00 2001
-From: Daniel Lenski <dlenski@gmail.com>
-Date: Tue, 22 Aug 2023 12:02:19 -0700
-Subject: [PATCH] Shim for renaming of GNUTLS_NO_EXTENSIONS in GnuTLS v3.8.1
-
-The constant `GNUTLS_NO_EXTENSIONS` was renamed in
-https://gitlab.com/gnutls/gnutls/-/commit/a7c4a04e (released in v3.8.1), and
-then a backwards-compatibility shim was belatedly added in
-https://gitlab.com/gnutls/gnutls/-/commit/abfa8634, which has not yet been
-released.
-
-We need to re-add the constant ourselves in order to build correctly with
-GnuTLS v3.8.1.  This should fix
-https://gitlab.com/openconnect/openconnect/-/issues/650.
-
-Upstream-Status: Backport [https://git.infradead.org/users/dwmw2/openconnect.git/commit/7512698217c4104aade7a2df669a20de68f3bb8c]
-Signed-off-by: Daniel Lenski <dlenski@gmail.com>
----
- gnutls-dtls.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/gnutls-dtls.c b/gnutls-dtls.c
-index 3fd78e95..50a4bb4e 100644
---- a/gnutls-dtls.c
-+++ b/gnutls-dtls.c
-@@ -39,6 +39,14 @@
- # define GNUTLS_CIPHER_CHACHA20_POLY1305 23
- #endif
- 
-+#if GNUTLS_VERSION_NUMBER >= 0x030801 && !defined(GNUTLS_NO_EXTENSIONS)
-+/* XX: GNUTLS_NO_EXTENSIONS was renamed in GnuTLS v3.8.1. A
-+ * backwards-compatibility shim was added in a subsequent commit, but
-+ * not yet released.
-+ */
-+# define GNUTLS_NO_EXTENSIONS GNUTLS_NO_DEFAULT_EXTENSIONS
-+#endif
-+
- /* sets the DTLS MTU and returns the actual tunnel MTU */
- unsigned dtls_set_mtu(struct openconnect_info *vpninfo, unsigned mtu)
- {
--- 
-2.42.0
-
diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_9.21.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
rename to meta-networking/recipes-connectivity/openconnect/openconnect_9.21.bb
index e1027747b6..2f7668c6e4 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_9.21.bb
@@ -4,9 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = " \
     git://git.infradead.org/users/dwmw2/openconnect.git;branch=master \
-    file://0001-Shim-for-renaming-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch \
 "
-SRCREV = "59f2e59eb3e436364ef82e630e5a2f88f32acd58"
+SRCREV = "8b702bf2dbaf11302ed98629214b1df5d50a12aa"
 
 DEPENDS = "vpnc libxml2 krb5 gettext-native"
 RDEPENDS:${PN} = "bash python3-core vpnc-script"

