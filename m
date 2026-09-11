Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B75FC88E58
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:18:16 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40468.1789136288543614342
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nqAZboAK;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1479545a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 07:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789136288; x=1789741088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDKuqVpilpY4QQQtNnbbBq3253SQs6AU5YSkRM317vA=;
        b=nqAZboAK/d3IyYKrYb8o8TEJCab0lcLWJrVm7hG4Fxg2BD74K+LiNkjgeYdddtluVq
         WG3R2+GjGsaR34sJJA1z31fvbC6G5g8Q9YsrORYMMMC/7gM7Aduz3cDEEP+V2U5C5ATd
         iSPrtEiKAuzVUfr7FTE1T4wPqZXZS3wrHx6gYt5XZHecG+68f1Kw+IlhF3s1rgTJUA6h
         t9HIn2IWQbSTvC08Eu4zzgeP1f1VVjJSQE147rD6ZBuOXVji8j2p9NkPIVynWRo6zatI
         b6iEr6nFTdVXwBToXtGbLp8ER0gq8p1UaTCio30yYe1WKPt6RCoaGJFE6ApVNfdh3tSI
         oGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136288; x=1789741088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDKuqVpilpY4QQQtNnbbBq3253SQs6AU5YSkRM317vA=;
        b=nb425bvwBf4C/eGsfkKcPQSIbAu/hiuNUXV9amrPwe8oPOcVEHVM60O9CCbC8F4uX7
         QSsLDoiGSqQUqr/pQWm/pwvS568Zwva1vLjOK0MgiPDfXP5Q6ZX2k0S103h5/VOLPN/V
         LM3D9EByKamhi5jP5JIcVcxMQXGFhB57GwUNhW3KOmvAbvELaenurFUDSXe1kZWjhP3N
         hy1DWQavuPkm6BOdd0u5LY/OlxuuiPPo42Y1XOK1qxYBPUV7dCsgQTienHm8gQdAgkBR
         LC1PlIcKqUX58p+QdvYnv7WsSdJiScmhsdi/luVc0P9CioKWQpApeq15wGdY9Z9qJ+Gc
         rk7Q==
X-Gm-Message-State: AFuF++kB7TRFQPDlrWwruuwfKgT/3EFgztW5o+a9X5RXMrDhGL8lPu8T
	XthMTqpJUR/giX9lD70ClGrkWeCrPFaWBUPlIABVdMQo5tL2xBDI88RlaAe/gQ==
X-Gm-Gg: AYBFou1q07mZR9LvsLFXalHQYDOWp3yxGGm+AqzaJvT6ix5upDVXozBn5mxTfVWUmHb
	eM8VP3lsoK/pcz33LpsnL3aHFqIXDe5irxjsfLqbDymcrdoUYVBRzzQ+HJBCAEveTuNlBd68YH4
	0f9a1QlI5Rdj3FoehllxniqIVyO9FLzg509unRKM82Ugv149NuzwiaKOO6taQbOKA3wEgrYczgi
	OHFTuug58+bGriKT4Ni5axDUQ5E+vhN0ZM5wseEx1i32SOyAn+dNIhHSuwJ6VtZXQvP8rb4lWrz
	G1eWP/njSd6jnxuFNCb2aqw1ZtHGGEvZBpLog1mjc/0zo4gEV7N1EUeiwtpO9r7icOJQtyySq9U
	8jNXb1GqI7eJBusaYdDxS4Y4cwi2xM9UM6KAUh/U+87n9yYJXSemLLjU40i+MP7kL8pfaTUrDO2
	qZZ6P/sl/xS3xA8i0LUI2dPXS2hwp+rUH7gnSJ93GJvtEtxYNpgj650YtQ10H9qYal5QSguU6HW
	bWMUzGPdn1YIhHPVgW5t0DVMf1IjoLpjPwV1azlP34hAYHG55Hsvl5mOkZ+7l9v8gNRPz/aoJv+
	aXiCcvlzlW9xsDBKR3XetYlD76gROJG4uqtfj0tgrR8wUfsMmH1mypLAiN31JtoEGerpapjmlq+
	sby71kLwaRJDS2FD+sRWcv/A2MVAvchvIdZDQJFLu1Ylgv9Dmjtuh2pMl3IhHDIZfQ2E=
X-Received: by 2002:a17:90b:3e47:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-39d77964296mr14149204a91.10.1789136287121;
        Fri, 11 Sep 2026 07:18:07 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm7840791eec.28.2026.09.11.07.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:18:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/7] synergy: fix build with OpenSSL 4
Date: Fri, 11 Sep 2026 07:17:56 -0700
Message-ID: <20260911141756.2275517-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
References: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 14:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129971

TLSv1_2_server_method() and TLSv1_2_client_method() were deprecated in
OpenSSL 1.1.0 and removed in OpenSSL 4.0, so do_compile fails:

  SecureSocket.cpp:386:18: error: use of undeclared identifier 'TLSv1_2_server_method'; did you mean 'TLS_server_method'?
  SecureSocket.cpp:389:18: error: use of undeclared identifier 'TLSv1_2_client_method'; did you mean 'TLS_client_method'?

Backport the two upstream commits that deal with this, neither of which
is in the v1.10.1 SRCREV pinned here - they first shipped in v1.11.0:

  4fea67e078479cc00afe6b1201c54c997a41fc70
    "#6390 Updated OpenSSL For better security with TLS1.3"
  4d3cf2c6 "Preventing older insecure version of TLS/SSL"

The first swaps the removed version specific methods for the version
flexible ones; the second restores the TLS 1.2 floor with
SSL_CTX_set_options(). Both are needed: the first on its own silently
drops the minimum version the original code deliberately enforced, for
the PCI compliance reasons its comment describes. Since TLS 1.3 can now
be negotiated, the hardcoded "TLSv1.2" reported to the user is replaced
with the version actually in use, retiring k_tlsString.

Upgrading the recipe instead is not an option today. Upstream renamed the
repository to symless/synergy and the latest release, v1.20.4, is the
rebranded deskflow codebase with a different cmake layout, a Qt6 GUI and
a changed LICENSE; more importantly it hard requires the ext/synergy-extra
submodule, declared with an ssh URL and carrying no license at all, and
its cmake aborts without it. That has been true since v1.16.x. No pending
upstream pull request addresses the build failure either, since upstream
fixed it in tree back in 2019.

The backport differs from upstream in two intentional ways, both noted in
the patch: upstream's pre-1.1.0 fallback defines the client method to
SSLv23_server_method, and upstream sets the context options before
checking SSL_CTX_new() for NULL.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ot-use-the-removed-TLSv1_2_-method-c.patch | 113 ++++++++++++++++++
 .../recipes-support/synergy/synergy_git.bb    |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta-oe/recipes-support/synergy/synergy/0001-SecureSocket-do-not-use-the-removed-TLSv1_2_-method-c.patch

diff --git a/meta-oe/recipes-support/synergy/synergy/0001-SecureSocket-do-not-use-the-removed-TLSv1_2_-method-c.patch b/meta-oe/recipes-support/synergy/synergy/0001-SecureSocket-do-not-use-the-removed-TLSv1_2_-method-c.patch
new file mode 100644
index 0000000000..890cba69cc
--- /dev/null
+++ b/meta-oe/recipes-support/synergy/synergy/0001-SecureSocket-do-not-use-the-removed-TLSv1_2_-method-c.patch
@@ -0,0 +1,113 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 Sep 2026 19:20:00 +0000
+Subject: [PATCH] SecureSocket: do not use the removed TLSv1_2_*_method calls
+
+The version specific TLSv1_2_server_method() and TLSv1_2_client_method()
+were deprecated in OpenSSL 1.1.0 and removed outright in OpenSSL 4.0, so
+do_compile fails:
+
+  SecureSocket.cpp:386:18: error: use of undeclared identifier 'TLSv1_2_server_method'; did you mean 'TLS_server_method'?
+  SecureSocket.cpp:389:18: error: use of undeclared identifier 'TLSv1_2_client_method'; did you mean 'TLS_client_method'?
+
+Pick the version flexible method instead and keep the TLS 1.2 floor the
+old code was after by excluding every earlier version through
+SSL_CTX_set_options(). Since TLS 1.3 can now be negotiated, the hardcoded
+"TLSv1.2" that was reported to the user is replaced with the version
+actually in use, which also retires k_tlsString.
+
+This is a backport of two upstream commits, neither of which is in the
+v1.10.1 SRCREV this recipe pins (they first shipped in v1.11.0):
+
+  4fea67e078479cc00afe6b1201c54c997a41fc70
+    "#6390 Updated OpenSSL For better security with TLS1.3"
+  4d3cf2c6 "Preventing older insecure version of TLS/SSL"
+
+Two deliberate differences from upstream:
+
+ - upstream's pre-1.1.0 fallback defines SSL_CLIENT_METHOD to
+   SSLv23_server_method, so a client would ask for a server method. That
+   typo is still present upstream; use SSLv23_client_method here. Only the
+   OPENSSL_VERSION_NUMBER > 0x10100000L branch is taken in this build, so
+   the difference is inert here, but there is no reason to copy the bug.
+
+ - upstream calls SSL_CTX_set_options() before checking SSL_CTX_new() for
+   NULL, which dereferences a NULL context on allocation failure. Check
+   first and return, then set the options.
+
+Upstream-Status: Backport [4fea67e078479cc00afe6b1201c54c997a41fc70 and
+4d3cf2c6, adapted to v1.10.1; the two differences above are not upstream]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+diff --git a/src/lib/net/SecureSocket.cpp b/src/lib/net/SecureSocket.cpp
+index 1111111..2222222 100644
+--- a/src/lib/net/SecureSocket.cpp
++++ b/src/lib/net/SecureSocket.cpp
+@@ -37,8 +37,16 @@
+ 
+ #define MAX_ERROR_SIZE 65535
+ 
++//Add the new function names in case older ones are deprecated
++#if OPENSSL_VERSION_NUMBER > 0x10100000L
++#define SSL_SERVER_METHOD TLS_server_method
++#define SSL_CLIENT_METHOD TLS_client_method
++#else
++#define SSL_SERVER_METHOD SSLv23_server_method
++#define SSL_CLIENT_METHOD SSLv23_client_method
++#endif
++
+ static const float s_retryDelay = 0.01f;
+-const char* k_tlsString = "TLSv1.2";
+ 
+ enum {
+     kMsgSize = 128
+@@ -376,26 +384,33 @@
+         showSecureLibInfo();
+     }
+ 
+-    // only use TLS 1.2 (latest as of 27 jul 18). previously we were using
+-    // the SSLv23_server_method and SSLv23_client_method functions with
++    // only use TLS 1.2 or newer. previously we were using the
++    // SSLv23_server_method and SSLv23_client_method functions with
+     // SSL_OP_NO_SSLv3, but not SSL_OP_NO_SSLv2, so there was a potential
+     // vulnerability where it could fall back to SSLv2 (not TLS). also,
+     // the SSLv23_*_method functions could fall back to TLS 1.0 and 1.1,
+-    // which are nolonger PCI compliant.
++    // which are nolonger PCI compliant. the version specific
++    // TLSv1_2_*_method functions were removed in OpenSSL 4.0, so pick the
++    // version flexible method and exclude everything below TLS 1.2 below.
+     if (server) {
+-        method = TLSv1_2_server_method();
++        method = SSL_SERVER_METHOD();
+     }
+     else {
+-        method = TLSv1_2_client_method();
++        method = SSL_CLIENT_METHOD();
+     }
+-    
++
+     // create new context from method
+     SSL_METHOD* m = const_cast<SSL_METHOD*>(method);
+     m_ssl->m_context = SSL_CTX_new(m);
+ 
+     if (m_ssl->m_context == NULL) {
+         showError();
++        return;
+     }
++
++    // prevent the use of every version prior to TLS 1.2, as they are known
++    // to be vulnerable
++    SSL_CTX_set_options(m_ssl->m_context, SSL_OP_NO_SSLv2 | SSL_OP_NO_SSLv3 | SSL_OP_NO_TLSv1 | SSL_OP_NO_TLSv1_1);
+ }
+ 
+ void
+@@ -848,9 +863,7 @@
+         LOG((CLOG_DEBUG "openssl cipher: %s", msg));
+ 
+         // show user a simpler version of the openssl cipher output
+-        if (std::string(msg).find(k_tlsString) != std::string::npos) {
+-            LOG((CLOG_INFO "network encryption protocol: %s", k_tlsString));
+-        }
++        LOG((CLOG_INFO "network encryption protocol: %s", SSL_CIPHER_get_version(cipher)));
+     }
+     else {
+         LOG((CLOG_ERR "could not get secure socket cipher"));
diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
index cf411b7c78..7f508177b1 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -11,6 +11,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "git://github.com/symless/synergy-core;protocol=https;nobranch=1"
 SRC_URI += "file://CVE-2020-15117.patch"
+SRC_URI += "file://0001-SecureSocket-do-not-use-the-removed-TLSv1_2_-method-c.patch"
 
 # Version 1.10.1-stable
 SRCREV ?= "1b4c076127687aceac931d269e898beaac1cad9f"

