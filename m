Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7992.1794465766386651665
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=osYnqYgt;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc147d86bebso313108a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465765; x=1795070565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rNHFvuaCWmB5RnxAZZKIdW+PRj011jNKmsshin+LTI=;
        b=osYnqYgtkdttdOJKIc95o9GxfGvmS03dN+OPUgZKaxPteuDj8tSo9DH+myQUbRzlc6
         GogLfAFgDS0a6alZHtGfKPSbEBSvZrVXKM4xKJ4k8wzWM5vaKVRN9tLs/p/CSuMZN7al
         uYEFI1rvO+sDBPcScc8ye4B93HtTQhY6KRtFrCcjGqolGZmGS804Tu8/uGiTl/QVUncl
         Cnq3UdK1Wj13uYLNheSnWoUIE+xmBRLWTQ1e8BJxd7fltv1EUu2tvZA0uphcS5y+cm0a
         WwwvXCC8fToOUioViFi4+2502LigYPTy/kQwJ3g+J3Luxbt6K46evA6AZV44pTV6yQ6R
         xGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465765; x=1795070565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rNHFvuaCWmB5RnxAZZKIdW+PRj011jNKmsshin+LTI=;
        b=ogvA3+Xfyj1BuLuTrJeABe5nKo0DRDIBs2UzUkND3Vp7MFLy3l4C5uVZByddRek7GK
         QxjRzv3wcV+ylDFIc9SKEDEtfmWToqC+FENAWdFQu6/yvUEEipw2e0kcqrvbV2agg5IX
         XPrN4JvGiem0pC4lUNFDKMbVWieMPjE8uocES+f5OiGqCpolZnIL7Ooot+Ta6DODESm6
         6/Mq9kb2QKT/oxuZbUAJ1pswaKi82HguaoANAung/T47Cjq5hjgoIME41aIUdXO4MHfj
         1R/QRDYSt5hGom69ZgRH2+WdzPI9kkkwGjOlpSHi1Ebvg7JVW52XJOpdOSgX1XkvfWx8
         +B4A==
X-Gm-Message-State: APuU4Z/8+hjeGf4/ceIwbc5/RMImoq+GAoZalKw113dIr6o9Gs7bZ3gG
	siQSiWgt5ir1YwlbymOP/tnbJ9K+zMKezNtP6BALNN4l2Jxv7vYB/kEaS2fv5w==
X-Gm-Gg: AYBFou3gXeD+NhGwYtTtVjzbmglB4oEY5iO5fHDXOkdaSn90Nt4QoO6QlfQDj4IRDzE
	9N5kpTCRnh/Ubpw5j47IUDIZjjnAJHyBvdB0zwvXCL/m//r8wz1uaDZR17hDGaxjXgMbK8AzodE
	E/f0fmU0SWeymjTEAtKzT9W77dUrXamZl+60mvnLN0VXvj00F6qV6h9t1TB+K+JbJkCWkcgHzk9
	8Co8ciB77XP+4jbmR8+GLHWX36WR1fSQIOL+v9I10W7sojyKPbY444t7zfHjVz8Bkrwye0UMl2Y
	bC7SUAogRO98k+QTX44njr7dBQkmKrQMPFlfpR6I96/Z2m/xZKeC76DcSYEGD97qfeZm96+cAOX
	LmBCBb7EqTO+5pbGMwjtYQE0VoiSqLoWJbNm5qQCpvFxDxCC2LHL3n6bn8q/gPJVTunrhLG5whe
	mAdYkbH0gKY+JKkyIcz3oNnS9Cy90NAB6Ka5L+ubd9Xx16+KL7IDkaDNhRicAdLXCjdxpLd1RCV
	MC0o3fEl8Ox/14Axto8uMh2qzdqP6+Z7EjG4Lw2e9JQdp/BHM0ucAZ9z5TVusVALwRPEcYidK+A
	sA7+rUwZ+wnkZf+k0Ib2vbV6qnaTnWC2dKTxeAgCgnZPg/rZU0y0lhr4QDW3aPaVevZo4stdXNZ
	4cYHru8JPtZ//TIBOy0aciM/K0qY9bAtI8vX0uFIfQQVG6lhFed+9CnMmgW3jalsMK+ZSKiMEzW
	p3XxVYE46wX3CL+nwl+iOqxllaCyZFvdykOvMPPTGhegWIViv4pzfTv2uzGtT1gK+3k2ML8zgOc
	AUtIAMHPXr6aT8EglLBI/kqT8NplEdS2ILmVfJR7f6NRV4fj54ncY/xUIxOuTLoikUROrs42nRK
	Gngg
X-Received: by 2002:a17:90b:50c3:b0:3ac:b6eb:e0de with SMTP id 98e67ed59e1d1-3b197c81808mr1069608a91.4.1794465765546;
        Wed, 11 Nov 2026 22:42:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 14/24] stunnel: upgrade 5.80 -> 5.82
Date: Wed, 11 Nov 2026 22:42:14 -0800
Message-ID: <20261112064225.2410019-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132183
Content-Type: text/plain; charset="utf-8"

Refresh fix-openssl-no-des.patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../stunnel/stunnel/fix-openssl-no-des.patch  | 22 +++++++++----------
 .../{stunnel_5.80.bb => stunnel_5.82.bb}      |  2 +-
 2 files changed, 12 insertions(+), 12 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.80.bb => stunnel_5.82.bb} (92%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
index 0e94a969c0..47ee5fd3d0 100644
--- a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
+++ b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
@@ -17,10 +17,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/src/common.h b/src/common.h
-index ada7ff7..8484144 100644
+index 8c441ec..48d9c31 100644
 --- a/src/common.h
 +++ b/src/common.h
-@@ -489,7 +489,9 @@ extern char *sys_errlist[];
+@@ -537,7 +537,9 @@ extern char *sys_errlist[];
  #ifndef OPENSSL_NO_MD4
  #include <openssl/md4.h>
  #endif /* !defined(OPENSSL_NO_MD4) */
@@ -31,19 +31,19 @@ index ada7ff7..8484144 100644
  #include <openssl/dh.h>
  #endif /* !defined(OPENSSL_NO_DH) */
 diff --git a/src/protocol.c b/src/protocol.c
-index cddc381..ae0f374 100644
+index 7a2db00..dcdcbf6 100644
 --- a/src/protocol.c
 +++ b/src/protocol.c
-@@ -82,7 +82,7 @@ NOEXPORT void ldap_client_middle(CLI *);
- NOEXPORT void connect_server_early(CLI *);
- NOEXPORT const char *connect_client_init(SERVICE_OPTIONS *);
- NOEXPORT void connect_client_middle(CLI *);
+@@ -86,7 +86,7 @@ NOEXPORT void ldap_client_middle(CLI *c);
+ NOEXPORT void connect_server_early(CLI *c);
+ NOEXPORT const char *connect_client_init(SERVICE_OPTIONS *opt);
+ NOEXPORT void connect_client_middle(CLI *c);
 -#ifndef OPENSSL_NO_MD4
 +#if !defined(OPENSSL_NO_MD4) && !defined(OPENSSL_NO_DES)
- NOEXPORT void ntlm(CLI *);
+ NOEXPORT void ntlm(CLI *c);
  NOEXPORT char *ntlm1(void);
- NOEXPORT char *ntlm3(char *, char *, char *, char *);
-@@ -1392,7 +1392,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
+ NOEXPORT char *ntlm3(char *domain, char *user, char *password, char *phase2);
+@@ -1472,7 +1472,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
      fd_printf(c, c->remote_fd.fd, "Host: %s", c->opt->protocol_host);
      if(c->opt->protocol_username && c->opt->protocol_password) {
          if(!strcasecmp(c->opt->protocol_authentication, "ntlm")) {
@@ -52,7 +52,7 @@ index cddc381..ae0f374 100644
              ntlm(c);
  #else
              s_log(LOG_ERR, "NTLM authentication is not available");
-@@ -1435,7 +1435,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
+@@ -1515,7 +1515,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
      str_free(line);
  }
  
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.80.bb b/meta-networking/recipes-support/stunnel/stunnel_5.82.bb
similarity index 92%
rename from meta-networking/recipes-support/stunnel/stunnel_5.80.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.82.bb
index 9f14f0fd85..78fd89b7db 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.80.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.82.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "6d0841d48de07cbbaf4a055919065bf7bb5ebc63cc15c97a2c76caa2bf285513"
+SRC_URI[sha256sum] = "8e7438ccd6b3a2ab05182d0846e112a56a7f557ecdee40de07bf67820008bef7"
 
 inherit autotools bash-completion pkgconfig
 
