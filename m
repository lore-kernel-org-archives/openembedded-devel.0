Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FB2D116F5
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 11:20:59 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19323.1764588050373385930
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 03:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EhO2ZBsy;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e77f519so982274f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 03:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764588048; x=1765192848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTXjzCc1mw4plCD8robJWieMlevnfb31xN2qksopRqg=;
        b=EhO2ZBsymOcCA+bJ9fPYPbYdDvJCV5JqGavqDxIxUNV5eg0JcycXudHa79FjTJUbLN
         lxi6o+nHZ02VdBdli5ctcLkdnRdAq7WpGpK+AiRAh/LotvuMLGr93siVowP617ZhYwdV
         KblAbNyHq34bt0LI31dRBwDgRY/1JdDTfHLh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764588048; x=1765192848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTXjzCc1mw4plCD8robJWieMlevnfb31xN2qksopRqg=;
        b=eGsKKwgTL5o36m3CCnodRcxr7G12dd2j4hUJbCYhfKtjYX8/SKf2v20xq7HIf/I0+Z
         NAKZIGJi1LyOGuWbstTjPe44d2E0ozV+m/apF+3WyolsTh5Wk+V15+vHXC1fnaBqtsgZ
         lamHkw5a8npQXDupLrhYE1BSZ1lvcDB8r3FlQm5FmRZk88odzhDPQQRDNj1CtqYsZ0hR
         ZipEgcz7cRvEhW21o0AHgCNQn0KNfUhlpU9g4iYQECGUxAgs0fRHCuoPoMvzbv3L7TCi
         FD+JPBlWv5Bg/trl3TBGkK7rNgTpCF7RYds7RRIUQmKGNm6OddjaXpvf+IRF80/Y9vPc
         akDw==
X-Gm-Message-State: AOJu0YzxqTLS8DAuUQIRNd3Wd4HirIOLlQ0xvRPbW2pMbffdyuGKT0Va
	OVStEAV+04Z9U8eXpYtHUZ88EC8jxx4RKqAnja/B5CziyYU9kkyVMQVaBTWNERMOA5wsYfh3Wlj
	vNDns
X-Gm-Gg: ASbGncsHck0rjZWpCHLe1mkeCBVxghBjgwMlToVHyy3OfUEUgW5/HDMmKFsr3wZPl7a
	qj0NODkN9NDbC4dVieChXFm0GFaN4knXsnqzDfCQIT5cBmuXTLfmGnH05APX95wilQwNqEn4OVy
	U12L24TRkV1MlpJuTEbl2ckRuGKmDGejLxULsNgs6BmdW1g42jBT9rdZBiEM4MDHyeKQrILw9/y
	vT9dD4vLNhTaDJnF+BbMEJbkZfq4gtX5U+U4r/QsKQScDVvwaqfS+uYMNL7EGG/v9NXWLMkURVF
	jqTu6YohrAPxvwpzmNrx+JnaYZ3ytp3iU0kqZqF2F79ujQAQFLtdBmYEIdIrJjgdlIxi20eOFWO
	IxnFDIVl8f1/ryaxsamrAnTWs8bK1ylkiRx+/fToyGSQxDFth1r8v9aMdDxn2LEhvTAaRIiBRCL
	4qvgNe+XLa0ir7f+uRlhNApU5q
X-Google-Smtp-Source: AGHT+IHDsIsTDqyF5FAy+V7SgLwffxgwzWSu7whOd0YXgeVZ1MPM4ilFJZdvKfBgpJ2NyIZnEVAQrQ==
X-Received: by 2002:a05:6000:610:b0:42b:3366:634e with SMTP id ffacd0b85a97d-42e0f3567d0mr24694601f8f.50.1764588048100;
        Mon, 01 Dec 2025 03:20:48 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3041sm24524527f8f.6.2025.12.01.03.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 03:20:47 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-gast: Upgrade 0.6.0 -> 0.7.0
Date: Mon,  1 Dec 2025 13:20:42 +0200
Message-ID: <20251201112044.369630-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 11:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122202

Upgrade to release 0.7.0:

- Update unparser to harmonize output across revisions and handle
  python 3.12+ features
- Fix support for TypeVar, TypeVarTupe and ParamSpec￼
- Support t-string from python 3.14
- Adjust test incompatible with py2
- Support _field_types field for every AST class
- Make gast.dump more generic across python version
- Only pass existing attributes as keyword parameters in gast_to_ast
- Initial oss-fuzz integration
- Support [g]ast.get_source_segment
- Fix gast.get_docstring implementation
- Initialize ast node with known fields to avoid deprecation warning
  in Python 3.13
- Add missing type_params attribute for ClassDef node before
  Python 3.12

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-gast_0.6.0.bb => python3-gast_0.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gast_0.6.0.bb => python3-gast_0.7.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gast_0.6.0.bb b/meta-python/recipes-devtools/python/python3-gast_0.7.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-gast_0.7.0.bb
index af46c3feb7..93301f0943 100644
--- a/meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gast_0.7.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
 
-SRC_URI[sha256sum] = "88fc5300d32c7ac6ca7b515310862f71e6fdf2c029bbec7c66c0f5dd47b6b1fb"
+SRC_URI[sha256sum] = "0bb14cd1b806722e91ddbab6fb86bba148c22b40e7ff11e248974e04c8adfdae"
 
 inherit pypi setuptools3
 
-- 
2.47.3


