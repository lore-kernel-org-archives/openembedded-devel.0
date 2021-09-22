Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.940.1632338569696971643
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T1YM/KTU;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id w19so3540217pfn.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oqnou93QRXpNpgsbxebiIwjLIteQj3FqmZsOTvmsSic=;
        b=T1YM/KTUfhGdkm5KozJ0r8E0q8xeD24+PxB5IzjlpHbEdzTkaOwE2UjY0dvxTvbaT+
         JB+k7RBk4JKeaVTlVddN6TMkCpzHYqlIy4s0WAi2u9JQ/WQQwXbTYZlkOpRbFcunPQkX
         NnSbZP57foklRPfUUydtdQVWgnBWyc7qV7wQWs4D65cn+MmBqWhEWczHYwNDFdLq0zRP
         HUGZhmCPxWfYTQg+B9GhvgQlMEd3KGthMJ5K3XWhZ5Q/wTiSyRVn2/eRJBsJYN27vMvJ
         n33RHtn+xgvnQPWriZglc/wQI74w9qX7MoJ1h3akEwjDIEoD46YWyTMHKKBGrENgpiKS
         988A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oqnou93QRXpNpgsbxebiIwjLIteQj3FqmZsOTvmsSic=;
        b=Mp0sxrbSexQQEg3tiY+J+5wHARiQCpBn9Ns1dLLaNQhReubojCBoEdVtvwaKcBSpZZ
         iRIsi010zhrf5VLyjLy0yIRwYzYPoCND8/BOZ5vBWulUCDrNk/RhCe+GRZWmCQqe7m6Q
         McZza13z2WEqmSA+HlX4zVeup+U4Som81pw5VPWpJQM3Ho3bp46rU7QeEg8jP62B6ZDu
         ZY9bjqKvpe/Xbg2UPpXO37AMc+BfuNfoscwFXSbIIZzSczdqFa18vSU/iZ4Q7SVROnEo
         BeRAd5W5c6aDVVyaXimCa7DHzgkESm0+w/gCyl+3AYmMpjttPUWfyTk8k8Ki25vYLHzF
         qRQQ==
X-Gm-Message-State: AOAM532FxZv+jPtvOQas7Ra8yQlXUJO1Mb7Hha0RhqeWtwkInKTrN8Qn
	ypO7gsgMzj4yYF3qQAi0RuiPZdrOMctwKA==
X-Google-Smtp-Source: ABdhPJzfVVQ33jpCQFX73JNG42+DnSypV9iDNdZsucrA+jKiGM0Wa7PoLNsP4mNtPBHkOWPdqefW0w==
X-Received: by 2002:a63:5942:: with SMTP id j2mr532408pgm.78.1632338569137;
        Wed, 22 Sep 2021 12:22:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 38/39] yad: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:12 -0700
Message-Id: <20210922192213.3062719-38-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../git/configure: line 4933: syntax error near unexpected token `GTK,'
../git/configure: line 4933: `PKG_CHECK_MODULES(GTK, gtk+-3.0 >= 3.22.0 gtk+-unix-print-3.0)'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/yad/yad_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/yad/yad_6.0.bb b/meta-oe/recipes-graphics/yad/yad_6.0.bb
index 46ce671317..6ede557c7c 100644
--- a/meta-oe/recipes-graphics/yad/yad_6.0.bb
+++ b/meta-oe/recipes-graphics/yad/yad_6.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "git://github.com/v1cont/yad.git"
 SRCREV = "a5b1a7a3867bc7dffbbc539f586f301687b6ec02"
 
-inherit autotools gsettings features_check
+inherit autotools gsettings features_check pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.33.0

