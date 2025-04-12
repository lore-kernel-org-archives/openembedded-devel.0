Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9C2C369AE
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 15:30:38 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.12853.1744471834942671899
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Apr 2025 08:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AAg32jMS;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so3868754a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744471834; x=1745076634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TitiX8slirIQ9LXmoD8A8zMlo0izaN69VFwdMM+RZA=;
        b=AAg32jMSxIjWWYQKnNhZkPU2AfFlwQf9TxySzwXh/GiMwSISjEECyZqIA0phAyDEEA
         TaVxL0fcOy5QI2G9v8HuDlzmDnlqY6qWMFiZ0Yto0871KWJq09+fTJUnTjQmkCdTt5j4
         FXlTY8iw5knaEXEkbLR4bXcJ9n7RvB2PS2oX1hbJ3pW8SRYlHljTk/xgkwUr2q+7/CxV
         oo3ubq/37uBvmZO3+OG5e2CnahJrrMXELHNecV+C48hcXyEU1vx3nxaj4OLYTfjZnnkQ
         MCxUrFR99w98ufMzf0Pm3ddfw0jBave9bYAV5D+4w9jqF3Q4oBn18Ek2nh/wme3ytTzT
         rLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744471834; x=1745076634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TitiX8slirIQ9LXmoD8A8zMlo0izaN69VFwdMM+RZA=;
        b=F6nAADeQagkTABUx+RCrnWAv/u7kdFG9wdf4q2iotdhhWgIw/JKcdiUGfkN43KfwVe
         xBkGa40lzZ2D7aNpGb3RTFUQhzp0YLkHfGrlBGgHD0wFS2pnmVLqgNUz6lT/NzsrooQ2
         W5qSyvVlPGno6XS9Gs6B1swFEchGBhHBFufViafohihIoFir/5b7OT0dbqbe10HN2Jaq
         wXoi9HYj7z4D9nDtfUVijYf40lrM5ZvX+AeE/83pHfOCqWP5GywArs69TRgLS4Q5Lm0M
         3ekaSwHMSq7iUBxWhbjtq9MQULDM2hdBsNuUb+8NPJRyduDDZk32DN4m2RLaj1Dk8VzU
         3FKQ==
X-Gm-Message-State: AOJu0YwpWQbatL3rrzosTvzOuvmiYHYzOcGd6F1QNdNm2bhv7XTZ9Jvz
	hV5Y2mzkA36R+kVa6JxKQ/K5KLJpcrWeg32WlJySXa8+eOVaFCS2+kCvQiHg
X-Gm-Gg: ASbGncsHW/tRt5unx5SOOq1WIZyjCE9emOWQ5uCyAHgHN4YkM03B9ptr+Vn+j3MZ+3y
	wIS8volcpLhBZGwgWGHrT8EeiyourHyfLjEyn1NIz86ud/EYOntAMdj4mVuDM4AYAlsN1ZbaMpN
	8lqhSPqn9T59gmpmcTg4Rmvgle1eZgK0WjUjmSDh/OdrJan4i8IJO3GIDujdOJdxPdPuIHyr8Sf
	77SAlFeFut4RVxXqLOxsZuhfi0Z/NUs6zHfEc1mm5Q/mQpiCg6y/VzIDSpXG/TaKXI/W+7foiJc
	LOzCgzspj+jmWavWyAO4NYusaDKuH65hiHkABbEQld4=
X-Google-Smtp-Source: AGHT+IEoZtIKYa8Yu5hs/LuUpxwCw5gDGPxf+5UrlUMa+qGCpurbhYuOVfr2a0ZfwsaPduma5JSVOg==
X-Received: by 2002:a17:90b:5111:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-30784d3f77emr17014573a91.11.1744471833991;
        Sat, 12 Apr 2025 08:30:33 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm7686659a91.47.2025.04.12.08.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 08:30:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 8/8] meta-multimedia-image-ptest-all: Do not run PTESTS_PROBLEMS_META_MULTIMEDIA
Date: Sat, 12 Apr 2025 08:30:22 -0700
Message-ID: <20250412153022.2343322-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412153022.2343322-1-raj.khem@gmail.com>
References: <20250412153022.2343322-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 15:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116820

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../images/meta-multimedia-image-ptest-all.bb                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest-all.bb b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest-all.bb
index 8accba1bff..8ceb617fce 100644
--- a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest-all.bb
+++ b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-ptest-all.bb
@@ -9,7 +9,7 @@ REQUIRED_DISTRO_FEATURES = "ptest"
 require conf/include/ptest-packagelists-meta-multimedia.inc
 
 # Include the full set of ptests
-PTESTS_META_MULTIMEDIA = "${PTESTS_FAST_META_MULTIMEDIA} ${PTESTS_SLOW_META_MULTIMEDIA} ${PTESTS_PROBLEMS_META_MULTIMEDIA}"
+PTESTS_META_MULTIMEDIA = "${PTESTS_FAST_META_MULTIMEDIA} ${PTESTS_SLOW_META_MULTIMEDIA}"
 
 do_testimage[noexec] = "1"
 do_testimage[depends] = "${@' '.join(['meta-multimedia-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_MULTIMEDIA').split()])}"

