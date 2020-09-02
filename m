Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.15992.1599073958164616518
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 12:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SyN5Wq7b;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id h2so224422plr.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 12:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2wMj90ea2rBZ+2UIgsJNzC9GQjhe/YjWG+s2LtisTls=;
        b=SyN5Wq7bj5ejUIwSOSXNTQJfYiY7AkWiOhyuyXYCnjFXUKWcFddTN71JD03crNwC7R
         Yg6Cqeo0ntvxp834zhpZwYolIABi5XvFN5j1WHkQdZxD5U5AkyVYEIfz0MQonodyvLO2
         w/xjUcZ555YjToV27aIaxv1fgIKeoyJg4yEeoJ2b6RvixRBQ3uPGU9hJRFp22wIgapir
         wVFqDkbN5GCqroUah3YErToE7UNqKh0P+CQRZg+24OkuM0Vm8WlrOpFkx8W024NgCCfF
         VoIiPnprewiiE2PCpJXoMzxNsSeL3mqVu51G9uNcXb2wTmFFmcn9xIPe/TEfrCpceA62
         CvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2wMj90ea2rBZ+2UIgsJNzC9GQjhe/YjWG+s2LtisTls=;
        b=VEF6hJOYarpp0pII+mJSizRojD4nIf0v7LViT+l210zviprJP2HoU83JoiS8Wwx8Ho
         WuuDbQTF03NS8vMkdMQ6NUWrWyzAAR52o69w83BqCsPHnzh6+3f0tzOmoC5f2Oek1tu8
         EbROQOQpuY73BiRItksns4HSMbr8FzakVCFrBe+xcQUEPJQVa4IvSsQcOol2y9FFAS6k
         TrJcykyQVg8vem7XKrSIlpI4txQXqhuf82OULo80sR1ZbwLsyOO+JQ14ZzjDXENrbA6d
         72Rxp/bXc+ItOIOGZZYJVetPrIGlbik420LehKtlhXJtDH96FxD/VNEd7U32676pP4U7
         rB8A==
X-Gm-Message-State: AOAM530/i4YiyXk2e0o3ncEO+K/htvKhE2mVg3M9rVxmWxVmqrAkK2me
	03Jshw2Ck6sgS0yJMux7xR5xf/En+L6A1Q==
X-Google-Smtp-Source: ABdhPJyluEm3i1w0KGixl79b7U70+7Cb91s3Nyd2xGk9BXxCiU9RGDf9N8pbJstzM98Yk4C5BMZIHQ==
X-Received: by 2002:a17:90b:245:: with SMTP id fz5mr3339671pjb.131.1599073957315;
        Wed, 02 Sep 2020 12:12:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id o63sm254700pfb.190.2020.09.02.12.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 12:12:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] meta-python-image,meta-python-ptest-image: Use python3 packagegroups
Date: Wed,  2 Sep 2020 12:12:31 -0700
Message-Id: <20200902191231.1224543-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902191231.1224543-1-raj.khem@gmail.com>
References: <20200902191231.1224543-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-core/images/meta-python-image.bb       | 3 +--
 meta-python/recipes-core/images/meta-python-ptest-image.bb | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-core/images/meta-python-image.bb b/meta-python/recipes-core/images/meta-python-image.bb
index cc75fe6e4b..6353d389b5 100644
--- a/meta-python/recipes-core/images/meta-python-image.bb
+++ b/meta-python/recipes-core/images/meta-python-image.bb
@@ -2,5 +2,4 @@ require  meta-python-image-base.bb
 
 SUMMARY = "meta-python build test image"
 
-IMAGE_INSTALL += "packagegroup-meta-python \
-                  packagegroup-meta-python3"
+IMAGE_INSTALL += "packagegroup-meta-python3"
diff --git a/meta-python/recipes-core/images/meta-python-ptest-image.bb b/meta-python/recipes-core/images/meta-python-ptest-image.bb
index 7ee15354a2..d497016d41 100644
--- a/meta-python/recipes-core/images/meta-python-ptest-image.bb
+++ b/meta-python/recipes-core/images/meta-python-ptest-image.bb
@@ -2,4 +2,4 @@ require  meta-python-image-base.bb
 
 SUMMARY = "meta-python ptest test image"
 
-IMAGE_INSTALL += "packagegroup-meta-python-ptest"
+IMAGE_INSTALL += "packagegroup-meta-python3-ptest"
-- 
2.28.0

