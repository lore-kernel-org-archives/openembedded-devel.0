Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.961.1632338551069657877
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HTKXp/mF;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id f3-20020a17090a638300b00199097ddf1aso5270809pjj.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8OPKXsh5xvrk4aLfcwAxSqYlSKGgHHqJTnUGSR9g3ZU=;
        b=HTKXp/mFf4qGikxEgz7CyvEXQGUGmXTHPaOdH+B9Y4G79Kh3dg27IaLTfNZjg+zUvP
         Ekcor4wadLneX4Jj69UHWaGMDwFrJbXswlPoau5EcEE75WSecnK8SV+lVXqoNjtepZnt
         hUbPD+sbjr/+0L4WS4CM4Lf1j7KKmCMdIJDTjpFi9/mYp8tND1ThLpUCxIN3jVsuKvV3
         7KC7c56tvCGBBa8hpvP+EYgE7eGYrBj8onBLpzNtZ15qdIieIz+zorka4oaglEs+oxrA
         yuK3xMaeJNDhPXG1FwJw7ab/LUnhaFsz9PZQaDkThWM5sGS3Pd+1maVQM655g3mFj1R+
         nq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8OPKXsh5xvrk4aLfcwAxSqYlSKGgHHqJTnUGSR9g3ZU=;
        b=PW/PLtoM7skVbDVhj44DmIAZ1nzdMrLrFMeLW2uCbMNizR/PkgM7TVLBqoDK6NjPNi
         mCKRnOpTOx5qCSsuQswAOoh/Q2Ia14MQVPCeZDRRoM/6IBxa0StX5hTDG5ZF6GfcRQZ0
         HW9xSi1JDimPOrEW4FFcLIY4NtaCBOdvBAZYNERs8z0rR9othrLPEHFSutJbMlWKV5IH
         G4UGXtanfLC67rEEwxNO91RzzuTxkIpkVQwEjzmrXTkuIxeIwlV6BKEjh6+/Gte6XpDl
         OT/q92kDhrWo1OZ7i2YLvBY2kF44l2Sf6rXI4JsJjsLP2eaUl6eQs5o7EXYLj9zuBzoL
         OxcQ==
X-Gm-Message-State: AOAM531+xI/8blj3FDj65cKJrrGzIyMY9LVsbX9KojqoyTS0RIzq6UD6
	qhEH8c1q4O5O4NyxJ7Omt+S7AwczypqDkA==
X-Google-Smtp-Source: ABdhPJzyuZz4bNC3EDHjU4c8G9+xcJ2mt3PRFq9Uy2BlhIgsaOuT4S1Wc+xtpCcLIG9k+4QS/lsdGg==
X-Received: by 2002:a17:90a:6283:: with SMTP id d3mr716077pjj.73.1632338550455;
        Wed, 22 Sep 2021 12:22:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 17/39] mimic: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:51 -0700
Message-Id: <20210922192213.3062719-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
configure.ac:132: error: possibly undefined macro: m4_ignore
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
index f4e26d52c3..412a272eed 100644
--- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "git://github.com/MycroftAI/mimic1.git \
            file://0001-cmu_indic_lang-Make-cst_rx_not_indic-as-extern-decla.patch \
           "
 
-inherit autotools
+inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
 
-- 
2.33.0

