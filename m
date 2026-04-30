Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F50CD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:48:04 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18389.1777549680340199007
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WwvUPrzr;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so521791a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549679; x=1778154479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqIzDI9Lja5uLbVCae/bz6pQlo4KteeX5dUW+7c7hfI=;
        b=WwvUPrzr+BAl+54JsQpvnZr908EtF7JA3XbgWOtpyRF45J6dJW4ZvBPwml0VPhmqiy
         DIvwRqLLpwgq7nBGjL4CSxlB0uGZ7DHBeDrAqxRi7O+o1aX8f7cXbVrmblDatHfd5tm+
         MMpDNyelbvYLsuP2xLgCi9J9nPljSAWvRuI3fqQBO25muQFqeVJjFkRPK9TIVVSUnHMK
         1M/IKaGiDNq79fwTGqGEFYVXOyV9cz2oAaF58jX7w8R1Hiskfd8ah4IWHEa3BG3qbkhw
         C1Iklu34dqc2wk9YTzsjo4axhyboeSIEsiIDL5oOMCdHOuxitkaN1vO6KMFRNgrMQePi
         gzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549679; x=1778154479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqIzDI9Lja5uLbVCae/bz6pQlo4KteeX5dUW+7c7hfI=;
        b=GJQ1vLv8YvziR0N1p1Ci+UNhwcLIlDTiOZJCQDQJfZZJz4mmOHqBkHxlQZW0OJpgRR
         6V41+6M4gify0TmIA8+Mj6BOyrdBGqdqH0eELh9g/rWV6fohI3aqtyWgHjv3f1rXNTyc
         6gnFjQJI7v00vqJ3s4pgFelrMovMAqPgRdSiSxVZjecuRTOgxAVPUVnhuTDlHH5nShCH
         ItbmiW84lGq6gnXIWikZBcD+mU0nyeKPPNxGINiAG1qaCbNEqiHLj40D2KeRgdF9ZE3g
         Af7etyBzT/4qxZD8umJljAvN5BomvJf/NdrJ474qwXrpTyRtnOo2H5qrKlpUjrCZZj4o
         yPWw==
X-Gm-Message-State: AOJu0Yz2JvfzTWih/y2lPaS1ZVu711TvhgTy7IrUYUHcT7eOd1RQ8oPK
	7iY9Ya5q9baSuCMy8J6TSW6REk/jH4u4k/Nyjq3J1OhzqveXN5igv/ICHNAbjXee
X-Gm-Gg: AeBDiesC+rCTumTqeI3Nk0LO18lWF//Gu35VnyddJ9z9LdZDQuBMpMkQORimVZU0gQ6
	TJ2qdCsJAOa7voIE92b2Lkj+1WONJaLN9F2CyqgA0XAE5CJEZlmxAG8eYOAW3dXgA7lAvM1whL4
	rL968vdMrU7IwR19Jq3ApsPQiAI3eIsx7roh7LgiAoznqACh0/E0nAOXWg+gnuJYZ/rR+d0GqZU
	IXhHOOPgn6U0MaWcUOi7cuIorg0uaLAdD1gLhGQ18OrpwO6hxp3/sjfqkiFUa14Z7n9IFlj0TvR
	mI5gkEXspKL//+spOnsu/i8TUTwgNPTy24p0z3Ti2mcPSV3CQe6YqQpdOuQYUek8BdJaZeDdtVB
	zJIYDLUS8CYLdVOAnRur9zkhlqIThjjqQSzlec5H/UxoMsrmaBBs8G/eDuelLQgwNcy1eY61txW
	MSuQZMuiC/QSyPusSW8HP+dMjr5E3VXNk4ieub93qj1RV5fio=
X-Received: by 2002:a17:90b:3cc3:b0:35f:bd51:cf60 with SMTP id 98e67ed59e1d1-364c2f23fd8mr2409049a91.1.1777549679480;
        Thu, 30 Apr 2026 04:47:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 23/24] wolfssl: patch CVE-2026-5772
Date: Thu, 30 Apr 2026 23:46:46 +1200
Message-ID: <20260430114649.4184890-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126757

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commits from the PR[1] mentioned in the nvd[2]

[1]https://github.com/wolfSSL/wolfssl/pull/10119
[2]https://nvd.nist.gov/vuln/detail/CVE-2026-5772

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-5772-1.patch       | 25 +++++++++++++
 .../wolfssl/files/CVE-2026-5772-2.patch       | 35 +++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  2 ++
 3 files changed, 62 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5772-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5772-2.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5772-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5772-1.patch
new file mode 100644
index 0000000000..cc285ed58b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5772-1.patch
@@ -0,0 +1,25 @@
+From 9fe2213ba1fd8a05f7fa9b95fa940530b445bae9 Mon Sep 17 00:00:00 2001
+From: Kareem <kareem@wolfssl.com>
+Date: Wed, 1 Apr 2026 11:28:45 -0700
+Subject: [PATCH] Exit MatchDomainName if pattern or string length reach 0.
+
+CVE: CVE-2026-5772
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/1274c7b5e7e9e28d88caf60662f6f9624bf834b7]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/internal.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index ccfecc235..1c217b902 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -12898,7 +12898,7 @@ int MatchDomainName(const char* pattern, int patternLen, const char* str,
+     if (pattern == NULL || str == NULL || patternLen <= 0 || strLen == 0)
+         return 0;
+ 
+-    while (patternLen > 0) {
++    while (patternLen > 0 && strLen > 0) {
+         /* Get the next pattern char to evaluate */
+         char p = (char)XTOLOWER((unsigned char)*pattern);
+         if (p == '\0')
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5772-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5772-2.patch
new file mode 100644
index 0000000000..3ca26a8d9e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5772-2.patch
@@ -0,0 +1,35 @@
+From 89938195b946f709f40f653d90ce215f868c7d79 Mon Sep 17 00:00:00 2001
+From: Kareem <kareem@wolfssl.com>
+Date: Wed, 1 Apr 2026 11:50:17 -0700
+Subject: [PATCH] Rework check to avoid changing existing logic.
+
+CVE: CVE-2026-5772
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/90d631232308a59a03f6f6f455f9ac373db7af3d]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/internal.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index 1c217b902..6af03cbf0 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -12898,7 +12898,7 @@ int MatchDomainName(const char* pattern, int patternLen, const char* str,
+     if (pattern == NULL || str == NULL || patternLen <= 0 || strLen == 0)
+         return 0;
+ 
+-    while (patternLen > 0 && strLen > 0) {
++    while (patternLen > 0) {
+         /* Get the next pattern char to evaluate */
+         char p = (char)XTOLOWER((unsigned char)*pattern);
+         if (p == '\0')
+@@ -12964,6 +12964,9 @@ int MatchDomainName(const char* pattern, int patternLen, const char* str,
+                 wildcardEligible = 0;
+             }
+ 
++            if (strLen == 0)
++                return 0;
++
+             /* Simple case, pattern match exactly */
+             if (p != (char)XTOLOWER((unsigned char) *str))
+                 return 0;
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 17b0960c47..3b3db9ad6f 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -34,6 +34,8 @@ SRC_URI = " \
     file://CVE-2026-5446-1.patch \
     file://CVE-2026-5446-2.patch \
     file://CVE-2026-5447.patch \
+    file://CVE-2026-5772-1.patch \
+    file://CVE-2026-5772-2.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

