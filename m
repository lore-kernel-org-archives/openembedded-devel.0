Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D92FFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:48:04 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18387.1777549678224792790
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EQdQf5OB;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-364c5317d67so536276a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549677; x=1778154477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4I3PPpN2v5bXwtF9YaY6OieSq8UYivgJC+qazygldv4=;
        b=EQdQf5OBUupw+3fW1wvFZJa6n++hsk9G6+NLOc2kcR+/pTgFjvmM1saQkBtEfBALJm
         QmNppQo9JjrA3NH3G7sxagmn0UdcJiAv3AwpALnZGB3spLgoxMc9ZLD6ZdThN0mvweeW
         d+l87Bt7ZH6a0ncpGFdGxK/kvazBaeVmPpbVZVYWkkqNpSsMuWeJfc+EIQHd1PaGDLCf
         oU5Z2Ug0+FqnCuAwd0jigcwY9+1tUmQw3iFkwprghW6OVaPSHI1wnkQrwbW20/Lohrqx
         pwg5XlB0lMyDHIJuc2pz7SGBKAM6UK9gs5Uy+wZf5FP1BClP8kek9d8pS1hp0uJwtq6J
         USSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549677; x=1778154477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4I3PPpN2v5bXwtF9YaY6OieSq8UYivgJC+qazygldv4=;
        b=IPZatzeb4B3EHFnZkh5bSyhHZJXFMn7Ht2pfDrzrEG8QEq+mXqUIO00zAW3HU2OVRh
         3oN+FjYrLZklo/IDKhkhKNypC6yjYkYVysSO2amxwZgsMb40DNYxAaTsVkyZ5q/ktQ6M
         9R0dFBfX+MRkzLqSkPZNAAINeDPVeDpvvTXMRcOg2uxzucn0O0Mmx7zag5FqkPdP1AVd
         ah4KPxL2WJsfonT7sJmRizJw6bUucu1UzJwlOpK6jtN684q7Kda9wmAdEEqQ3L0FJPn6
         RvxNgnm5BnQhZFMGzlb3E+NvNYOnOulsvlRJy5VfkSVzYrTh2pfioXZqvdBsKQR6qMQl
         l+1Q==
X-Gm-Message-State: AOJu0Yx4bWzlUC64UYpunIwUfA2HOtYjnSUabgKRyNRrthE8V6CZPhfJ
	AKnz79G9mmBr4n3e98Xe/alR/ouUR5Yj67xvYl475lSt388oWsCKl/7Wol7wsAZA
X-Gm-Gg: AeBDietYG3FLOqpRPJbfN0awUg1z2xS14S/LjQ3aZMF7A0xgk9r7ZlDrTp1vQYY3ieQ
	CGAeVnbRcsw8c0gXCkSkA0STgmO5rVyILCEqPk6Aa7hRGQxToEJ2VMb0nscJcXQctlwU5jli0Tt
	h8/mLW3Yi200V42ptg+fKXgrwddzM1STJkljUDu3czV5MeSn+oIODytKflpdRBcdLGZjOmUNv3w
	CDCNGsdTVynl57TI7Be/ahtbd/D+v+YU6gzu3ld5lAAWMs6ia/VSU/NUjXc8WkU2Xg4i69nvJLp
	cFMLgLf353RQbR1BSqoQyRKRhEQz1xABYGFbvq1V8E0KwkrpAfU9QhN/EiTfPXESPA1tldZWjqL
	q5YT0PVaRnaAqQUImQhUglDjwK50eui0iBX1htQZEo0+L3v9AYJnNO9kzYvIUlfpCU8MMicOPS+
	Lm+XNNsFMR/PFL2/ERJ2Wl+QC6VGgHoQHQi4DWaouLNYSVU1o=
X-Received: by 2002:a17:90b:384c:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-364c3065ee5mr2846996a91.12.1777549677351;
        Thu, 30 Apr 2026 04:47:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 22/24] wolfssl: patch CVE-2026-5447
Date: Thu, 30 Apr 2026 23:46:45 +1200
Message-ID: <20260430114649.4184890-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126756

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit from the PR[1] mentioned in the nvd[2]

[1]https://github.com/wolfSSL/wolfssl/pull/10112
[2]https://nvd.nist.gov/vuln/detail/CVE-2026-5447

Dropped unit test changes during the backport.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-5447.patch         | 65 +++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5447.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5447.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5447.patch
new file mode 100644
index 0000000000..b296603816
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5447.patch
@@ -0,0 +1,65 @@
+From 4d7eccf50dab080185d3a8763491e3febbcc257a Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Tue, 31 Mar 2026 08:56:23 -0500
+Subject: [PATCH] Fix CertFromX509 copy length check
+
+(cherry picked from commit 772cda3d489d867935202d59393a2ac85a5e6ef0)
+
+CVE: CVE-2026-5447
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/772cda3d489d867935202d59393a2ac85a5e6ef0]
+
+Dropped unit test changes during the backport.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/x509.c | 33 ++++++++++++++++++---------------
+ 1 file changed, 18 insertions(+), 15 deletions(-)
+
+diff --git a/src/x509.c b/src/x509.c
+index 62e3774f4..cf44c7146 100644
+--- a/src/x509.c
++++ b/src/x509.c
+@@ -10622,25 +10622,28 @@ static int CertFromX509(Cert* cert, WOLFSSL_X509* x509)
+         return WOLFSSL_FAILURE;
+     }
+ 
+-    if (x509->authKeyIdSz < sizeof(cert->akid)) {
+     #ifdef WOLFSSL_AKID_NAME
+-        cert->rawAkid = 0;
+-        if (x509->authKeyIdSrc) {
+-            XMEMCPY(cert->akid, x509->authKeyIdSrc, x509->authKeyIdSrcSz);
+-            cert->akidSz = (int)x509->authKeyIdSrcSz;
+-            cert->rawAkid = 1;
++    cert->rawAkid = 0;
++    if (x509->authKeyIdSrc) {
++        if (x509->authKeyIdSrcSz > sizeof(cert->akid)) {
++            WOLFSSL_MSG("Auth Key ID too large");
++            WOLFSSL_ERROR_VERBOSE(BUFFER_E);
++            return WOLFSSL_FAILURE;
+         }
+-        else
++        XMEMCPY(cert->akid, x509->authKeyIdSrc, x509->authKeyIdSrcSz);
++        cert->akidSz = (int)x509->authKeyIdSrcSz;
++        cert->rawAkid = 1;
++    }
++    else
+     #endif
+-        if (x509->authKeyId) {
+-            XMEMCPY(cert->akid, x509->authKeyId, x509->authKeyIdSz);
+-            cert->akidSz = (int)x509->authKeyIdSz;
++    if (x509->authKeyId) {
++        if (x509->authKeyIdSz > sizeof(cert->akid)) {
++            WOLFSSL_MSG("Auth Key ID too large");
++            WOLFSSL_ERROR_VERBOSE(BUFFER_E);
++            return WOLFSSL_FAILURE;
+         }
+-    }
+-    else {
+-        WOLFSSL_MSG("Auth Key ID too large");
+-        WOLFSSL_ERROR_VERBOSE(BUFFER_E);
+-        return WOLFSSL_FAILURE;
++        XMEMCPY(cert->akid, x509->authKeyId, x509->authKeyIdSz);
++        cert->akidSz = (int)x509->authKeyIdSz;
+     }
+ 
+     for (i = 0; i < x509->certPoliciesNb; i++) {
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index bad03c5f2a..17b0960c47 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -33,6 +33,7 @@ SRC_URI = " \
     file://CVE-2026-5392.patch \
     file://CVE-2026-5446-1.patch \
     file://CVE-2026-5446-2.patch \
+    file://CVE-2026-5447.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

