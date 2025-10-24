Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B87CCF9EB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 17:58:06 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.30.1761328677819725565
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 10:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XBRnkeF8;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-475d9de970eso2915895e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 10:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328676; x=1761933476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57M610ewdjRrRN9/kYTUB5BMxPtetBrW1CRnEDCtUgk=;
        b=XBRnkeF8vuRHKPnPAIFJlG6HMmqmkkMaouwTfevQl5s/eL5GJe2Xk6G2FiaCU6kYX4
         hreIMW+ZYp6wDRV1oSMEWFEFijE5pPqi0TU9iiDJ9OPka2cJR/x/r0IhTyiHEPQRUFuN
         ucCgJEY3dPiRDMKxPiAsaSYZ+CYTMzjj3K88uXgCnRWe4meg/C+0EgLbvk4s9e185fN/
         rVPuvWXLJjdNRlytzjc91mqV4zEumpbodBQBVnIjX75PFXUJmg3CzQwhJBgYeg49Wsto
         P/F5LhXIPA4yxj7oXEpC4n3XhxRmR/37yuGQ3xMkh9AEFzdBFTbWWLWqD2auhsNyqeb/
         wdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328676; x=1761933476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57M610ewdjRrRN9/kYTUB5BMxPtetBrW1CRnEDCtUgk=;
        b=JGM8yfpekabZwdVqNzWpVOPbuzpehYm6azo0EYcuX2ela6ED8SD3CRe6Lbd0N33+ta
         eIF0eB62GnFsdjeMtWdcqD+bU6rf21UcZJvKs6G07nOJHU0g7nTj8fhYERckh3JRpME3
         qO+GuRpyLKJq6EJm/pWLAtRCd7kJ52sBfE/4OWThYI+OnUo4H33K8HhnDnJ+x24Pmz5a
         JvF5gpm2tf0hot0sPH6Xc7FAGJknPkCqXFDk2Fmak7C4Pch5Gc1O8rJLUVCPEbRIsSu0
         Ndh4lx8xh8ZtjgsehM9hyHBmnIb8lgWvAAs7W2xMo3SUyzFXK8h4tYKF+xlfPL4saj2y
         sllw==
X-Gm-Message-State: AOJu0YyjcpN4wtthLCVSttUwY4T5M5XwoO5YXiuXbPqEC7apxxzlu9p6
	hxyoR1jC7MZsBKWWwRkfYUkPIRVFbf0bD1j8GyotKCGMrwjONJV5MAoXf4Cepw==
X-Gm-Gg: ASbGncvkS0qpdI7WEXxGhpxb6f1NZtQpiDlxd0gdky5o4yL3TTV8GuOxd6JJd0x7hu/
	GJXJsg7ZlUwHF3PHsPgdS0IFwc+T0CqeL97OJdS3t9k2RR0wHfgG4yDGOviUEjK7Z0W0+5nFfuA
	M3xEGQnHxQlMOQvOeYzP32hXuATTMOuG2R9S52D3rnOYAHtYZq/+1nn830KmzuDwlwiYG+42ZW7
	juauSYcg5fDUsfUKS5Bqm0JS9KtW+IGaYdRGkJF7uxhFhHi+ADpELphcd26DIy6o3pZWprySWIP
	iP9RbKVYTGP7X+aWOCfQns4mVbni0i636bsdLPYKqR2gkbQfVt73O+NvB2EFNPgGn5cYRW9V57S
	Don+HHQggzkjP4UvORJKPCxX+c8NbdIKxE00F1fX9yQBznnodZ0J+r+NcN09wqBJ3rlHwxbgOS8
	JXIHgBTPQT
X-Google-Smtp-Source: AGHT+IF1OCoUIZzSj+pffglgGVzr+wiLzP0jDlIwVnmr7azbClgFjokoNTbeMCsnMEbmKKFSYqXA5g==
X-Received: by 2002:a05:600d:439a:b0:471:a259:cdd2 with SMTP id 5b1f17b1804b1-471a259d091mr123504345e9.25.1761328676127;
        Fri, 24 Oct 2025 10:57:56 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm192686925e9.17.2025.10.24.10.57.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 11/11] libunicode-linebreak-perl: fix ptests
Date: Fri, 24 Oct 2025 19:57:47 +0200
Message-ID: <20251024175747.704498-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024175747.704498-1-skandigraun@gmail.com>
References: <20251024175747.704498-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 17:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120969

Add missing dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc         | 2 +-
 .../libunicode/libunicode-linebreak-perl_2019.001.bb            | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 189a376f80..24968d8ca7 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -32,6 +32,7 @@ PTESTS_FAST_META_PERL = "\
     libtest-nowarnings-perl \
     libtest-warn-perl \
     libtext-diff-perl \
+    libunicode-linebreak-perl \
 "
 
 PTESTS_SLOW_META_PERL = "\
@@ -46,7 +47,6 @@ PTESTS_PROBLEMS_META_PERL = "\
     libnet-dns-sec-perl \
     libnet-ssleay-perl \
     libtest-harness-perl \
-    libunicode-linebreak-perl \
     libunix-statgrab \
     liburi-perl \
     libxml-libxml-perl \
diff --git a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
index 6b552d9502..4560c28e5e 100644
--- a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
+++ b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.001.bb
@@ -40,6 +40,7 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+    perl-module-encode-encoding \
     perl-module-findbin \
     perl-module-lib \
     perl-module-strict \

