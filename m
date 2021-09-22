Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.1421.1632322911135880030
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 08:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=juFBMw6u;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id v19so2276779pjh.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 08:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S1fbvCWyRfZ93WJQ40bz1veOktktQ9oV6u6tVb66rjQ=;
        b=juFBMw6uf+NhDig4YYM3QUCWCvLslvwcp1kbjiO+8+eUi4hAmLvyURJGUrmQAH25kA
         6QK+bxQ4CNo1uf4ra4vc05+ii1jAOkXacDJUEuToj6RvA2PellCovm5awkE90EXHWLz2
         9ElTG3Jf5xiACAgrG4mJQgzto6xU1v7VKgXXfGX4zdCu7kdUZBtT7AXAzT4GcqaFpjus
         n3QzSv58cOUYpFeRCNAlZj0vZSFRzVwTV/YLIPCe16faYIJTOO3KdZ8YsqXqkmNob4o0
         gB+DSkk60la0BWJzOZVPOBvVD0ZASbAT41awZKiT3/amIKKpR1h+/Y81igflcSJqORjy
         XHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S1fbvCWyRfZ93WJQ40bz1veOktktQ9oV6u6tVb66rjQ=;
        b=uAsfNOAZVR/NHvi+QuBIP0Sb8jx5qbjFsbMDwa6G4b+/MK+w/cbPUJxCGlmoZevZ85
         p59ZVKc4clQdF/b/jl62nXvoLF+CcGLYg8nMZVdrA3WFudFlA/IgxtwgTpSejKAhVzx9
         3LPx4W92gfGE1AHF1M2idVE5OdqcHkNe9hhCx1Yb8Ge0jkEkBVxRM7HpYkKHXQoEupVf
         Do+eRtBEvu8DrzECIJE8I7mg6biXnd+inyFqvFhhkoos6Ma3cYei7AK9piz+wKDUekQs
         YeIb76ZPBWTvg7GrwnxTjvvICINGwQRIlG5lmL/WZL4VSZSPz9iFqzJZe98wb3dVX4M+
         yZJA==
X-Gm-Message-State: AOAM5331v3RZuZyXKVibB+gPVPWDerti2vHutUxzVL28TQhyFp/0LF8D
	UOf52uZc+PUpZsZsGsD7BAZgz6JV2vqhFg==
X-Google-Smtp-Source: ABdhPJyZSWPaFKK0iVNoOWp2mdoZ1eLNxiSlQA1bpqfgDlw4sRZ4siZUt6gGfPm6AMHBkomIlO468w==
X-Received: by 2002:a17:902:bc8a:b0:13b:78bc:9e18 with SMTP id bb10-20020a170902bc8a00b0013b78bc9e18mr271165plb.53.1632322910442;
        Wed, 22 Sep 2021 08:01:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id t15sm2767392pja.1.2021.09.22.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 08:01:50 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-lxml: Inherit pkgconfig
Date: Wed, 22 Sep 2021 08:01:45 -0700
Message-Id: <20210922150145.705595-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922150145.705595-1-raj.khem@gmail.com>
References: <20210922150145.705595-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was part of default dependencies before

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb b/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
index 241ffcfc0d..669c2eaeeb 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
@@ -20,7 +20,7 @@ DEPENDS += "libxml2 libxslt"
 
 SRC_URI[sha256sum] = "39b78571b3b30645ac77b95f7c69d1bffc4cf8c3b157c435a34da72e78c82468"
 
-inherit pypi setuptools3
+inherit pkgconfig pypi setuptools3
 
 # {standard input}: Assembler messages:
 # {standard input}:1488805: Error: branch out of range
-- 
2.33.0

