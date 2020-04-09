Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.19351.1586466496063122921
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 14:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pt4VOkhj;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id b8so81988pfp.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2020 14:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p039FWw/Lh3lN/iJISQMZuKwHsobNRNJhCzlDH4dVVE=;
        b=pt4VOkhjkp/dw8m356lYactnBPbCxWuuZsn5e3kbXWhIIk+YpWu4r31SgpVZeuUwQR
         pV2Ck19wYCK93NR/ACY7UqjE52kJ+qkJd0+9dbyA2jEXRJTmOF0F5V3B8Bz/IiDBuFar
         5SWmDBLnuI5PQVtX/Rkz8Htc0W+PPiQxZnci0lvafI7/fjtnWWbZ2wN83j0aYO0nJQN/
         kXUzEszO5ZHjHiWShMXELviQXnCYI1IqQYj/wMDE5CP57CiUbuPzpH4y20uK5Jues4hc
         F3jyC0RelulLWkyKACVLCmIfBsLoPVcbyE21dkapgXzebib+TBAMWBCHNDo/ur18byL/
         GMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p039FWw/Lh3lN/iJISQMZuKwHsobNRNJhCzlDH4dVVE=;
        b=VAtlbhzjNigAmz6kcW/6qon82xtpVXvfRKnTxjb/2qO5Su9/9MeQ8TBfIRWU2lEmjw
         eqGtWkrWnbj6FlnhLOlT0utr+74fR2TEo51tkV/0bJyW8tiT0/KkB/Vo/ppTJR+XWytu
         z7wgvfWyT4gUQQsm6fdKKNaxLLs6ejViD2tdJZGuMOjqdaFnRdYO3sd28DLpjlQu26Xx
         zXIwkRHcabjdITmsP6XgWlsNWlzmzmbxQjsmnTsANWAux2fIg+tAp/TSEsJn7q28wwqF
         AdzRfibdKw3oX7bosCP3hoCNNifF+VhUq9Wh7ZbUYSN9OYQTcFu6DckM2VrXPqylCTMI
         lKRQ==
X-Gm-Message-State: AGi0PuaFwKcG87qXtA8aYifeqKBtSuesjWDNkqJht8bKGuxDuXJTazvX
	Lc7+t9XaQmPuRzV8n/wdNqqs0M6q4fk=
X-Google-Smtp-Source: APiQypKEyw3PBoYZC1RVdjMd+iI/ePXHtiK14dnRDwAFxOBYWEuRRZ0Rz1i6A/oGozsPQsnWySTLNA==
X-Received: by 2002:aa7:8815:: with SMTP id c21mr1547556pfo.86.1586466495095;
        Thu, 09 Apr 2020 14:08:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id y131sm13082pfb.78.2020.04.09.14.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 14:08:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nspr: Use _MIPS_SIM_ABI64 instead of _ABI64
Date: Thu,  9 Apr 2020 14:08:09 -0700
Message-Id: <20200409210809.891452-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_ABI64 is glibc specific, to use a common define from asm/sgidefs.h will
work in every case

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nspr/nspr/0001-md-Fix-build-with-musl.patch    | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch b/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
index f3cd670026..d2b9bf6420 100644
--- a/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
+++ b/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
@@ -13,8 +13,6 @@ Upstream-Status: Pending
  pr/include/md/_linux.cfg | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
-index 640b19c..31296a8 100644
 --- a/pr/include/md/_linux.cfg
 +++ b/pr/include/md/_linux.cfg
 @@ -499,7 +499,7 @@
@@ -26,6 +24,12 @@ index 640b19c..31296a8 100644
  
  #ifdef __MIPSEB__
  #define IS_BIG_ENDIAN 1
--- 
-2.14.1
-
+@@ -511,7 +511,7 @@
+ #error "Unknown MIPS endianness."
+ #endif
+ 
+-#if _MIPS_SIM == _ABI64
++#if _MIPS_SIM == _MIPS_SIM_ABI64
+ 
+ #define IS_64
+ 
-- 
2.26.0

