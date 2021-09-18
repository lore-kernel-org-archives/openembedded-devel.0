Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.873.1631984270365879146
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LNHktWMo;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id m21so3703896pgu.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xHU5vmhX6DSIshk5j0D5LLCvwLntBfu6+VBFDtW/pD4=;
        b=LNHktWMo0EweiLGY2IIByc7d/vhYxgepN53689B48fcSCdhnMVMKuXrkA/ggLU/PUv
         ZXB1a35vl5fTeUwe5Q6A6g5RIIpXNyZ9THGWQs6EUHPPA9kTQM0jjQocuLAuqOfDQVas
         l85O+wJUU8UrrlaOyrnx4q68eqkNkFZaEm1BX4CBe17bo26AIblAmf0UJfRFvQQofaKo
         T5nAapz0RTfoAQfic/SQBV5X0xABh07DXbrGSr/SFzXI061jQdGm0UCfgOy8Exd/BgQk
         ckw/oTE5l6ZFnQ1Tt6EhT9Qh23M5+Fa/aQCeh1pb+/DRCKCWyf4OfYP8Ae+kDp+tXH8V
         Z3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xHU5vmhX6DSIshk5j0D5LLCvwLntBfu6+VBFDtW/pD4=;
        b=edBYZTa17IEv7H1ZAQ2DWX6P2mFUlHS2ojayfN1dMrcJj9ernYaEIox7TyaLLqiEP3
         kAlKZHv+megu3VkKxgxgwFimhxPCz3KK1elCSE/oixD2zcdrYet0TdfauAiMJQU1VdeU
         KYnEBa7gsLgntnz4amI2eDI3iQ+tJfkUtnI4o4kmJm6VjQM3qrFCPaxG9/+xTJzXSbMu
         hNIwldBOZ5/DhBVrx6kz+hn1HRh4rwBJRqJE+JRV0Jo7KWmHYj5JptzPCshCWKmgXcV9
         b9dsIfpZQYZM/vi22iLUNyY2QFnq8uulLgI8/v1IbxDrt/c8B73HHZROY370b0+fAFI/
         KEkw==
X-Gm-Message-State: AOAM5309AO6ykDnkdnTCY5iqKWWhwfX9jTLLzFksLl41BTJvwxm573uo
	qWpZ06LIvXm6aeoJxLKbUaglcknzCLc=
X-Google-Smtp-Source: ABdhPJzKbsSXvB25WahFGCJHhN+sE8fsNmrjVhmYkqyEybckoaP9wQ9e+eeptFQ8wBwYgWx7O4bL+Q==
X-Received: by 2002:a63:b20c:: with SMTP id x12mr8361183pge.10.1631984269725;
        Sat, 18 Sep 2021 09:57:49 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:49 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 13/18] python3-aenum: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:33 -0700
Message-Id: <20210918165738.2581429-13-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-aenum_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.0.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.0.bb
index cb5eab15ae..999fd5a3d1 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Advanced Enumerations library"
 HOMEPAGE = "https://pypi.org/project/aenum/"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
 SRC_URI[sha256sum] = "87f0e9ef4f828578ab06af30e4d7944043bf4ecd3f4b7bd1cbe37e2173cde94a"
-- 
2.25.1

