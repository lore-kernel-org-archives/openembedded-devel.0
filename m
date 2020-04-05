Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.19754.1586101790240453036
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 08:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rzn9VW54;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id k18so4902227pll.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 08:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rywd8F2YJcUTeAE/71AB/cUj91qSn+pKGvksmgSo4Ok=;
        b=Rzn9VW54V+ivwD48hAlbyKorz23EOG4jidcXoIy9cCzKAbFVzJcrnSac4UWZ6cGG1L
         MO367TSx0x9jOU2nNHFSZrE+3RYFTtEC2yburrwal2ez4TGRVhZYDMLM6g4rYCUNCOwL
         MOjWWWq+T2rm6WLLDW2ce9HAbtwdav1V3FC3AWYwpoE2cZmjxxZ6EMP4oZQa15acVD3d
         LzItyQ00HXqX4YUKe1QWtjWjVgdfe2TlDANrVH14ez4ojF61RsuCEcsjvupENnK6U6yo
         HsXJH4ZvxZ3lQKZ27AtSRS9QAMIOzXZvdcwHXU34LzLkem2Omj8PaXhhCymrmxQN/w7a
         XPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rywd8F2YJcUTeAE/71AB/cUj91qSn+pKGvksmgSo4Ok=;
        b=O3PPtKXAPIl/dP2i1lJIxg+A74guGNSgMH8GSGk+RKSTRWBKUFCQsMiCSGHJP//ZuK
         DdlXT+tEN28ugfeXBKhBNxESXF9RrNRvt1RFZqYavmheissKu3TTitkPsWTP0lUzdMfj
         aSBlDO7pkaB8esUzg21SjugvN8u+s3v1Pw5/o/QC2zs7JrxmGMFf8e6ixq07jzw1LGU6
         83lL4RP6gK7hmNP5mwBKBaWB2mVqMX8OW6SLG0Xl8Uizyag57UW6C1oufEsXXxwlmKpm
         OjtLxwEGaX3YVNOutGn5pEZ5D1JObFUl92ntCLg2/yjWCyA8UQjkp4dsK3qkVR7w5lsy
         JEuw==
X-Gm-Message-State: AGi0PuZ6Il8dVpm0GBt+lG4YLaYiRq6poOCrz3gG+2Ti/BGOODWehdQ2
	A/dLVDARHbPnK81PsMm/Etj2gh5m5xI=
X-Google-Smtp-Source: APiQypKQHuxWDPtzsO2w5c7SuNjZoRIjgkK9HQ5kcSu5wEF48hlOACp8Csyqi353cQpTGn1JFHoAXQ==
X-Received: by 2002:a17:902:8a91:: with SMTP id p17mr16706889plo.248.1586101789442;
        Sun, 05 Apr 2020 08:49:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id k14sm9692933pfg.15.2020.04.05.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 08:49:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] upm: Disable Werror
Date: Sun,  5 Apr 2020 08:50:00 -0700
Message-Id: <20200405155001.1816150-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200405155001.1816150-1-raj.khem@gmail.com>
References: <20200405155001.1816150-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New compilers sometime find new warnings, its best to report them
upstream but not break distro builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/upm/upm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 2e8ec0e022..5b3585c141 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -27,7 +27,7 @@ COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
 inherit distutils3-base cmake pkgconfig
 
-EXTRA_OECMAKE += "-UPYTHON_EXECUTABLE"
+EXTRA_OECMAKE += "-UPYTHON_EXECUTABLE -DWERROR=off"
 
 # override this in local.conf to get needed bindings.
 # BINDINGS_pn-upm="python"
-- 
2.26.0

