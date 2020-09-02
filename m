Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.1373.1599086338844889488
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 15:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Au4nrrcG;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id s2so478960pjr.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 15:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2LMaRGWILhg+xXfMaq2bcEtpssxiVb1ZzQDzUN3SwVk=;
        b=Au4nrrcG5whYENhiKUZFJQJYOzeSkshg3y0+/zg48dBtz4kPf/hs062LbucGAIPWBW
         sbtcAtQ2EYUtjg5nqiDm+JCmtJSW+oXFv9KKES82FckISQz8KssLuvbz2rAeTUqPNJiu
         5GuZJcxxBwnSf1GWZ/GQQEmw7SRk7yG7id2mRmO1OOfwRD1KjtvA/G8ZwbC4FQu/98RG
         JywRJaBHlxZrk2+bZOMK+d3g/kUpL0iVq1UXZldepfiTsUAqCYxidVFlFCxcmZl0DCIF
         OInc+xqEPJwLEUf2d+5kXOaWurdPFjtqlAMrbLD0XozHnfpOHaDX8uPQzxr+mXFiF/9x
         27NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2LMaRGWILhg+xXfMaq2bcEtpssxiVb1ZzQDzUN3SwVk=;
        b=aTjKmpNVXCXAwQMJAM8ev+KDBqF2iueWj8BSQKmpqpWZ9x3NHCC4V5WuNxoHpR4Ku9
         AkB6dqdleLo2HUArJuEFW9gTLUUUZ/NCaSzXfA9Q0sVBjhSS2OLIeusqKv1Uq9esh0Nf
         XsQvFF2jX8HNHSY699eO1pH3zyUG46YuWrh5QDsCwy/VdJvwcvP37H0kmfu8TwBS39Da
         GXaRTMRD6dcOeo2fM2XWZsd+ecSjgsWNJkME5XfseQEExfOugU3lQNfzldsYSsxqVKoz
         GWkMBBymOQadLpQrgJREBnoGN+X6ODP5aTYSIbHLpEecizEmU0wmRRqkflf3pCDzxq6o
         eO8A==
X-Gm-Message-State: AOAM5312KiSSf4VFsJoPFE5j6HEDB4LJtWQEmsQ3nyyjmRGn2IJ8C7/F
	uOkrNvX3VMRPAWuMOrNs2UX9f6e69J1J1w==
X-Google-Smtp-Source: ABdhPJx3mX5KuhY21q+vXblDG/y07VEh0I0hOfbC0B4DxCIezxMMbiW1XXQP4MWIuIhbKKYOAO0vrg==
X-Received: by 2002:a17:90a:4608:: with SMTP id w8mr3906613pjg.1.1599086338134;
        Wed, 02 Sep 2020 15:38:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id r123sm552256pfc.187.2020.09.02.15.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 15:38:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 5/5] meta-perl-ptest-image: Depend on ptest DISTRO_FEATURE
Date: Wed,  2 Sep 2020 15:38:52 -0700
Message-Id: <20200902223852.3467735-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902223852.3467735-1-raj.khem@gmail.com>
References: <20200902223852.3467735-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/images/meta-perl-ptest-image.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-perl/recipes-perl/images/meta-perl-ptest-image.bb b/meta-perl/recipes-perl/images/meta-perl-ptest-image.bb
index 3b776f814c..a9b4cc3c7d 100644
--- a/meta-perl/recipes-perl/images/meta-perl-ptest-image.bb
+++ b/meta-perl/recipes-perl/images/meta-perl-ptest-image.bb
@@ -2,4 +2,8 @@ require  meta-perl-base.bb
 
 SUMMARY = "meta-perl build ptest image"
 
+inherit features_check
+
+REQUIRED_DISTRO_FEATURES += "ptest"
+
 IMAGE_INSTALL += "packagegroup-meta-perl-ptest"
-- 
2.28.0

