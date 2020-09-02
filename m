Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.1337.1599086338115162465
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 15:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r2dy6hV5;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id mw10so484773pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 15:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F8wOnyiL3JlogQICa9yEJIiC52+5x5JvdAiARclzqeY=;
        b=r2dy6hV5wqxHJdvyx7N8vqoM9O7OpyikEZyG7garkQenenpwodv1VWEBW/b8flfSgy
         N+bMk371kwZ0DoF36xG1Rw1Sf8MVhEUCe5xrzRV+J+Fb6Djq4MtwUQ72hD/QsPaVJwXK
         JtpPW3RGBSEfl6SFZeQcWzyVxmgojVmY7QHsM1CWedi3ApB4xL5CCjLhv6kxfqjKBPJv
         ZqjUPuXT4tCMHD2JabKlqpFzB31J6Vm1otzNLV6wcl+XnFpaD3WX9IL/BYt08tj8kROZ
         BufXnPeduGKPer3pr1j4y52WrKyGi6nusPFd31okF7X7swP+TVBjac4cwYrEitQwYRrz
         XaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F8wOnyiL3JlogQICa9yEJIiC52+5x5JvdAiARclzqeY=;
        b=gqKqkkWJiPw7B/YyOsFNP472RgZJGt+bAcUgKsR6ek7Jqbs9qCF7yjaZl560Xag28B
         YVtBr/7YHkVGALQ0LvxLAq22ocjbmfvdwA0yxyCKDUFGcmHmN6rNpiFQ3/RI+TQVaUaw
         oSd+Xh9YQdkxoqI68pA8sKGbQEFYC6OjJSI4KquOCT9hqYK79DVFHgIQ7SHEO780km3l
         +TQH/fw9jf5TGBo2fxSp7FqwspQUS5zNxgoqIfddnAEUR0NrkscW0bRLFj/ah6ud4HBD
         eamia6z2wOVFkrfXmznHh3fWpKLE+T1VtzY9bLxJVahdvh5vsdOtw90Rp4YQxNU7VuWL
         4ajw==
X-Gm-Message-State: AOAM5339/q4Tsq7YIN+GEl8MqIP/na8CqoDSTzjv68hmogO9b/5mA/Kc
	4lD2al3DRA5RY3F3r487XBLDvQxFfYpnRA==
X-Google-Smtp-Source: ABdhPJyET9FKF4GWySaDxTuM8/sgz/E9P14tJN4dOw+NXmXMSTly7uA5NZs9lYTee9GJ7meMYpVPvQ==
X-Received: by 2002:a17:90b:4acd:: with SMTP id mh13mr4212863pjb.147.1599086337287;
        Wed, 02 Sep 2020 15:38:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id r123sm552256pfc.187.2020.09.02.15.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 15:38:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 4/5] meta-perl-image: Add packagegroup-meta-perl-extended
Date: Wed,  2 Sep 2020 15:38:51 -0700
Message-Id: <20200902223852.3467735-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902223852.3467735-1-raj.khem@gmail.com>
References: <20200902223852.3467735-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/images/meta-perl-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/images/meta-perl-image.bb b/meta-perl/recipes-perl/images/meta-perl-image.bb
index c10d20a647..b8d3a76e6a 100644
--- a/meta-perl/recipes-perl/images/meta-perl-image.bb
+++ b/meta-perl/recipes-perl/images/meta-perl-image.bb
@@ -2,4 +2,4 @@ require  meta-perl-base.bb
 
 SUMMARY = "meta-perl build test image"
 
-IMAGE_INSTALL += "packagegroup-meta-perl"
+IMAGE_INSTALL += "packagegroup-meta-perl packagegroup-meta-perl-extended"
-- 
2.28.0

