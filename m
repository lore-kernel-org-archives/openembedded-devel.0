Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653E8C369AB
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 04:28:45 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.4568.1744432124202814606
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 21:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q1CMa8BL;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7399838db7fso2705204b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 21:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744432123; x=1745036923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FWWF+TpX+IEA0eBp+A9t25+pMAH8rdbyR7x4j7TZ8u4=;
        b=Q1CMa8BLKvRwp1Bq+S74hAnaybQebEv/1t2j0/hywq2tsugcfqh1apCvZuR2b99V7K
         t++qBOrBH3vczUhvc1+w+kc3nzv9+kPhmLYJ7z15XTZ6r4FlNmGOAmXIj2cf20OnVtDS
         xkmWxH+7+tYJOS1tpp5RRYwZ1HzA01cMTk7/wedE5Qye0t8uxriQc2oVAIhUgOuOFiIo
         2uSrLxCsIkpwSrBd9aymCSF5PcyBXrkFzS398IiRqSQjDUsRP4Tgx9xkkVXzECjf7qSU
         k9onYKYNFhiIOQEGYHFUCVQCELTyLCy+l2fXQJBXKHvGOVEVFcH89o8W3YFItYC33Qyb
         q+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744432123; x=1745036923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWWF+TpX+IEA0eBp+A9t25+pMAH8rdbyR7x4j7TZ8u4=;
        b=PSG0CBkNFTyy2VwCKdbHQfz0FJmSAGmPN2WPveJLclyD4LGvkF/jt1i1w/x3lv8dLG
         /pMNXBZ/P+B3TdGrSoDnuZ5vcLVG+nbNhIoCJzUGOPpeon6g1OY2KyRUl8XbyLGu/Eut
         BINmsGiCiJImtyEp5w+2RODP4P8Uf41dv2GQHQPYUioc0e081PQBjTZyisK1ec5T9cjT
         wPxSSKk7y1a+WDmD87hfAB5rMlZGT3pGmSNRFojbS7goqHQucuk6EPXpWrC2PVYFG9nw
         puIIE8HqNLrWBdqg93aeY/7r/vymhdQlRZ68v7WNKGg27zDKmGzTaP69t7L4hX4svYBC
         N+7g==
X-Gm-Message-State: AOJu0Yxa3BKXrJgT+404cNfQh716/50UzxbPcmuY8VjssWlCMrhqFwjI
	Z3sST+qyMT8Z9LBCuw55j1kAj5/nrK5KDtR4uMrVVf74lhe2+hW6cN8/Y/f6
X-Gm-Gg: ASbGncsGfVrQ7h2MjXiWN7M2TninfLzZ6K4h4MmGSeB3FgPx+qZQjOa/McSnOw4SlhW
	o7YgNgg5UpdbSRaxSoSc/8sVysoqLGIrq2fA7qEwcplvC7VXpmf4Y+PYJVM/X+rUu4OI5T5csxW
	ZNtiD730UN2z+gLX2lS6VeHMp0qeCHu5YeVW1rSyZGahToLTQGRREC4LzEyx+8xEsxKt8uWlIWT
	cbLDzre+k9wN/WgzO70GcBkTvrbxTaaFFyMliljD7ksC9FL5BvBFUJFp1r+AN0PawX6JyRVKh6v
	GcLYCGh5WLa7/+vhb0o0VjmZTqA2XEPU
X-Google-Smtp-Source: AGHT+IHG9b7qUJ0V4U/UTEScjNtoz/DUwZPauiqfL0rpB4j0opdFyV1j20lNKBMuG5uq8QQ9TcjKEg==
X-Received: by 2002:a05:6a00:6603:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-73bbf48f9demr9644869b3a.1.1744432122982;
        Fri, 11 Apr 2025 21:28:42 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2335534sm2535786b3a.168.2025.04.11.21.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:28:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-matplotlib: Add missing dependency on scm native module
Date: Fri, 11 Apr 2025 21:28:40 -0700
Message-ID: <20250412042840.37892-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 04:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116808

Fixes
recipe-sysroot-native/usr/bin/python3-native/python3: No module named setuptools_scm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-matplotlib_3.10.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.1.bb
index d6523e7770..6d678bd66a 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.1.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "\
+    python3-setuptools-scm-native \
     freetype \
     libpng \
     python3-pybind11 \

