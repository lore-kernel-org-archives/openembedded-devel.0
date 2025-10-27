Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298C6CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:10:24 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.1236.1761595818486767101
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L207zcP0;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4710683a644so42791985e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 13:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761595817; x=1762200617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QKknf4YRcvqsLOksMEXuhkvOMQ5jmZEsQ3sKfT13H90=;
        b=L207zcP0kyeoT3HPzHcNl/2YL3VXGmBurC9bypM4qPuHHo/lZC2XHXEnXy5UWhVvQ2
         FFy8TB9DtdwavQzexnGl9tT/JoYJ2ZRAHjkY5oHHryAB8vKAQghaKak9KQl10z97s9SL
         /Qqhv/d+a1QTYVpR7Bchtw9Fk/F9q0VN35VPwtdHe9jIKOjNNUcSjItsKDfUjEL4DwCp
         L3S6xWFgNtjK14AVcqapDV8H0z7w+Qz0xLOJ5j2v1kUBrTDnmOlmNMCKAZKCnJkT+G+8
         bEQLat2asV+7TVEZyrNVNokOzfZFqvlz4Z4P1zJJjsFoaO6aE5MRqN2geFQAjMX3wj41
         u6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761595817; x=1762200617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKknf4YRcvqsLOksMEXuhkvOMQ5jmZEsQ3sKfT13H90=;
        b=EjyyXXONCBwU2HC2VpAvZDRIDHOdC+5BrtBg1LMb79j58wHlr0f13q1c4vJ5PByCbV
         zqGfn1XswIXcw4EFkgV3FAb52U154S9yGnLtZzFn+nUmg5WZ3qju3ZD0Be89j/9ic86b
         Abr7QEM6MNwXSE42VQ6JECgAEq9/oMR8d6w5gW8HdP1wyxfCDgArUa6c2EahsTUpiBBy
         A5Q4C9Bs9S84nRmiqSADVNiWT7SFRHcvUiEzNThel0bP8pLLlNhaNgKPDy+4J192vi5o
         vgighWn2+mS3xwM2I5ynmYzZlcDaITBIwcDw+LkcUo1luIkj62XFRkweGxJOArC56rS6
         ECkw==
X-Gm-Message-State: AOJu0YzEbRHjF076yca5jZHnJ5HoyOXSS5+fEZ4mh+dLtvFOlMeVsCos
	Kd5cu39XynTWrR08t4AlHkXYas3ELKVWHC0AFPGSdStUZgrSq4U/qmVWgqEC0w==
X-Gm-Gg: ASbGncskUeht6WQUPasoFEFNGP09BwMEAIiZSPpkj54bUJmAGBVd8BdO/pARkxW1iFD
	vAmWzB0++Zt7Br19oBrEcrwVfZa8RIwHZsfqPFCCwEFUbzIO8RKMrPb1rDULwFM2SMyXP0N7tQk
	vYy8hInwFGXsupDic3M0GgwOZITzwW5+jT/XnTsJSYm5hiF2f9ydBwh7h4vlo2FDkcSlotKqIMg
	VHAp+jCVDTM5+/sjQC0eR4NiVryds90QgBe2VGNN7p3MNkq9BEsVTmCUXNehCrMRkj/hOIDR1qb
	hp0/wwUgnwMN4zbO73y4NKvsUJ3h6xV5rofQAF7xIBHmVpVa2IqdC2KL0NI9jTRlFVE4P+RxSM0
	nf49K/gswt8jn3gCC/FbdugOGliF0pTAG2Fsb0ovgA0sByrgkWVuSGI4Q19L58MzA2yS0/jBwGg
	==
X-Google-Smtp-Source: AGHT+IFYbZpXq861bdeLvjBXXGwCZZ71YxbT/9Fg6XRZVoZPCSD7d9f4sitRbyabLKT4bRLbcpa9AQ==
X-Received: by 2002:a05:600c:608c:b0:475:f16f:6e10 with SMTP id 5b1f17b1804b1-47718170f3emr6146655e9.18.1761595816567;
        Mon, 27 Oct 2025 13:10:16 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47853csm155508975e9.13.2025.10.27.13.10.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:10:16 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH 1/5] libxml-libxml-perl: fix ptests
Date: Mon, 27 Oct 2025 21:10:11 +0100
Message-ID: <20251027201015.4098472-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 20:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121056

Add missing dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
index c2ea47ae5b..60352bc648 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
@@ -47,6 +47,8 @@ BUILD_CFLAGS += " -D_GNU_SOURCE "
 FILES:${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.debug/"
 
 RDEPENDS:${PN}-ptest += " \
+    glibc-gconv-iso8859-2 \
+    glibc-charmap-iso-8859-2 \
     liburi-perl \
     perl-module-encode-byte \
     perl-module-encode-unicode \

