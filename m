Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E070ECAC5A8
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:13:32 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.11487.1758194009243235846
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BfatJj9G;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: zboszor@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-266fa7a0552so8548655ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194008; x=1758798808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YetxR6FPul53Tq51hRHMzkeJOUr4I0//WRTs5Txpgr8=;
        b=BfatJj9GdDj9TYfedoOUN37hS3MgDnRJs8RtcKH45rTHiEM0WjIqsD79EHCjqh8IKF
         pTkuO+uboHgeMY3tPbm0dXstaNyBt5VX7oclzysDdzlXfptEkayX17tRFWykj0/4kIMJ
         rXNzgFQ96WritwajdrDVWJj2XSBB72UpU4xzBib2JHwuJW5tbPz58m4oMNGPD7tmV73c
         XbfcK9oyp0c9VQ88gZaJI9slQgL5/svMDEpdB3TFIpr85EaeQvTMrUWLq1ASg7K3KukF
         X0U7BGGp2rluGhM/Y9GdFeEpheQSiao5BgSRU68Oupvw/Et/77yhKYt/ucW5SG/GcSTz
         owiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194008; x=1758798808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YetxR6FPul53Tq51hRHMzkeJOUr4I0//WRTs5Txpgr8=;
        b=P/u7uDUeylZlGa0qiroRWDpbdBxAQNvEgh5eQ6+aosATfFC7V1Ew0Mvj0zfpwaBW8t
         U9aeFDL9NqzXE22K2JIcl3j0bqn1nfN6fNVLlzT24q2uYIKP47BF48U/w3IaNiyHdb3Z
         WlRldNGMtjE+6nGRKd0mu2qV5578quyrDiY2GwZfUAh3+zVMdofhgMYw1fg36VcTG4aK
         iaciJEuNxuJ6s5pMHTgbPJSMavy79nafUBEL5r1K1uf7pPM1CYpw/Hsi+Zu9V452Wbru
         RSKHiWHaNQKQV9GbrbMKqdWkK03hHg2lAUX/E1UXlgybWr5jgOnt/HbVAVKB7Wv+Onzc
         EqtQ==
X-Gm-Message-State: AOJu0Yy9lfwFjrDcT8SYqM0xb6avsQqSxiGeuD3obSn+VMKRAOIa0n+c
	5CFQWZy8NFArPA1CwO9MCyJDqZHiMpPOoYNETpwSyca25n06Eeo3Ntrkcp4DPg==
X-Gm-Gg: ASbGncvQp3b1Q9bun5pgcsO+KS0nnUnKSwVLpVZaCwWA/oKiHrW0LzO7SGf6STpolvn
	zV2zawPCklXGyhkftV5bBH5vu3db9EwMlryWYS6aTFhIC6cgZMW/Q3CReCt7Liny9xAWzok3J3G
	J07mn/hPWiDChZ17hyrSMMLPWKNmpafx7p7UelJicuUzbeFNHl4/885Y5KGqKdGQ1kSFnS4E+qW
	mNNeF/JZ4eF5wruI4TYZ5qHTrrQfGFBK1JOIiI4Gan+yj+CCRgdl1kwgI0vuHK/YuqMucuPbrKl
	a0Yxytt20LDyScqqweD+DleuPHMVMjxZ9+6MvYx4zqkVSLQX0Za5VvCiugx+5VcR/89fntp6IcW
	Y2hOQ79NRRe5Cuddm2TS9RC8JW+/28LmZ3eeeO9MKjHpeLd/EiiNrBe2dZinp4vk=
X-Google-Smtp-Source: AGHT+IH4oNlV6QhFrrXiXu8t1dgH/QpPtx1zUyOR2SMY7l7ECO0xBYbaQV6X2L/Fn2bfD2+KuLwiSQ==
X-Received: by 2002:a17:903:4b28:b0:269:a4ed:13c9 with SMTP id d9443c01a7336-269a4ed16cfmr6496715ad.30.1758194008135;
        Thu, 18 Sep 2025 04:13:28 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698035cd39sm22766475ad.146.2025.09.18.04.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:13:27 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] gutenprint: 5.3.5
Date: Thu, 18 Sep 2025 13:13:12 +0200
Message-ID: <20250918111312.716726-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918111312.716726-1-zboszor@gmail.com>
References: <20250918111312.716726-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119557

This fixes an installation error:

| make[5]: Entering directory '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/build/src/cups'
| chmod 700 .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint
| chmod: cannot access '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint': No such file or directory

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../gutenprint/{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb} (96%)

diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
similarity index 96%
rename from meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
rename to meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
index f90a123293..82953b798c 100644
--- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz \
            file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
            "
-SRC_URI[sha256sum] = "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
+SRC_URI[sha256sum] = "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"
 
 inherit autotools gettext pkgconfig
 
-- 
2.51.0


