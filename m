Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.1931.1621647335507008299
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vJ1Mgjkb;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id n2so33005643ejy.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gbtSQbfIm7tnLx5Hl71F7epeZIIWnted0XeAbsT29Jk=;
        b=vJ1MgjkbHZTPUxUCma55f9sc5z3Jbu1N2hg7/rUQ2VwgqP11Ra6cIOCyTixVAgjJE8
         aLrAusABxjZ7brQsWSdAUOVHQx2V5pfPC9owl3+hbSGlb39kAnLg08bIOYklmpDQO6qy
         5l9ZcG5Zldzn+c62cU0liLyvsuxwf/ORqKXY9FSjRyrysblDMhH1bhHN7Iz4/PDXnzir
         3HMMMczHRZ+a8Nl7cCPEFjFB/kt4CKpbZIphDNCABp7bdPg5eatlUCSo+QXd0H2NdrXn
         qBKyI00WXQwLWlUPcIDaOPxPhtBCuG/AZhYdLvPTVT0yFf8oRxQ2beZXSalObxTIHMJp
         eI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gbtSQbfIm7tnLx5Hl71F7epeZIIWnted0XeAbsT29Jk=;
        b=a+s+UAQyOG0p3IVdfhviWAkXAfvT5lcGsiUwLPcvVJzt0Il5gPq7qCd7ITT/7yj+ku
         xEaeC1Eh6UGZoUIwgJSRGgzvSzsQovIcdkXwvGli1Kbz3j/HCYD5EBj0DtQw3ZkMfqkO
         ek7jMitfsmR6WAY04vSR5eG60EnERFxyDCLgS9M/B8037YG/56jGBZs9BsCcm/vlwTkY
         j5upQaih5oXVBU0tpidED6OnBXUyKDocSz9KkmJSfZsiAu6VQmnQI4TsU3cWWF0H3u/V
         fhx7wDAUOSyCeQeaDi19aP3pE6brHaoAIE6w4DbaTiFwSVFTtp79CNRgzpmjBqkVBg11
         LPJg==
X-Gm-Message-State: AOAM531XGSxesTXrEB5p/DYbedJmbDj2IYy5KBZiNrIxARrsmNNFNJxC
	X9bNSiPsDCZCLDoHBMTzsZPxJfXdqx0=
X-Google-Smtp-Source: ABdhPJyvDhkxkb+v94AFI+bgeorMNNKW26EiqRliwVYDdKi6odx5Iv5mYhXbc2JqZIpMsZ19zIbx5Q==
X-Received: by 2002:a17:906:4a5a:: with SMTP id a26mr10759581ejv.548.1621647334172;
        Fri, 21 May 2021 18:35:34 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:33 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/17] xrdp: upgrade 0.9.15 -> 0.9.16
Date: Sat, 22 May 2021 03:35:09 +0200
Message-Id: <20210522013521.588774-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch     | 11 ++++++++---
 .../xrdp/{xrdp_0.9.15.bb => xrdp_0.9.16.bb}           |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.15.bb => xrdp_0.9.16.bb} (98%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch
index c06aa7b6c..ea3eb11f0 100644
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch
@@ -9,14 +9,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  common/arch.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/common/arch.h b/common/arch.h
+index 617feb5e..6edb39db 100644
 --- a/common/arch.h
 +++ b/common/arch.h
-@@ -84,7 +84,7 @@ typedef int bool_t;
+@@ -85,7 +85,7 @@ typedef int bool_t;
  #define NEED_ALIGN
  #elif defined(__x86__) || defined(__x86_64__) || \
        defined(__AMD64__) || defined(_M_IX86) || defined (_M_AMD64) || \
 -      defined(__i386__) || defined(__aarch64__) || \
 +      defined(__i386__) || defined(__aarch64__) || defined(__powerpc64__) || \
+       defined(__PPC__) || defined(__LITTLE_ENDIAN__) || \
+       defined(__s390__) || defined (__s390x__) || \
        defined(__riscv)
- #define NO_NEED_ALIGN
- #else
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.15.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.16.bb
similarity index 98%
rename from meta-oe/recipes-support/xrdp/xrdp_0.9.15.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.9.16.bb
index 039ba1a76..d7a371b08 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.15.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.16.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/neutrinolabs/xrdp.git;branch=devel \
            file://0001-Fix-the-compile-error.patch \
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            "
-SRCREV = "f24b7b7988140b18202908654db3289659303772"
+SRCREV = "a4c7ee077c049202d73f82f518b2de958d722890"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

