Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7740.1793266018322670961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=O3cbiDO4;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1239578a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 02:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266018; x=1793870818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7qfaTXW+kh4WKFDNXUkXzEAXya0eXqZPzK8Qt7taUIY=;
        b=O3cbiDO4MLsVoG43nTAIIgKeuMkRax5G4OyeEHsFyzXE/ZokJqDkoIsOfvu0PyMJf/
         6WO1w5lRXvXVrjqde+CkuqtpfNXrdKtG2GRQJ1r77gA9aEzW/zXf26jbWNrkYlPeVsdb
         IYpt905nj9YhUDbKrloZHQi8dFKz4O3UeqYJMyIqZW/KbVeYibuiXIvgwHOoFZdiq5c0
         V81ubZ2atY5IWRWOrnqUVhvXc+NexSWHBkg48pjrKQuabhWmj+M836Ye6tHjutX8u/Tb
         8pVULMw+9nOeTrbz0xIcIqZIn5/uhu3fFO69cYagh5df8NRgkiYiioKhM9WLNx3beX8B
         8HtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266018; x=1793870818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7qfaTXW+kh4WKFDNXUkXzEAXya0eXqZPzK8Qt7taUIY=;
        b=XEp0tbximHZxPyuIHNklQYiBHAXrpIbTI8uC+P9iKR7ftPoUO6wwuHBXvA038iiVrL
         MQWT1vT7wYrnVGPoJmAYarIe6bWuTMKsZtAqVrDoSoaYdmzuQ9DuPoO9JaiE9E1SArzh
         JODEqVsDzHWw0Iz3dAZ7oAT7365Xq+ppPDHIw/s3giSS31xDgSbgolh8SJSQIpxjhVed
         S7PbWHV7YW/Zcp0JxqnWxIuSd7aV5bcwHKqVAr4ocG2wEf0QnqAD2ovJvVFR9bg8TobP
         HYIQxslowcex8ASt9/+fGllYOfreUQ4SslAYk7/6Qom9NJ/jmqwbIFpQf42w4t5n2h7t
         P7WA==
X-Gm-Message-State: AFq9FYLruGVHgRuAOG/NCSVhPEYt0ie027FD6wDBHWz9wuWcjJ+EiVXD
	6YfVUulOLKX0rgf5u+sqDDxqTW9mvROcgdbH2aaigCljoZb3GQINsE8DWxTjmg==
X-Gm-Gg: AYBFou1PmAUsCksv7L6LPfJ+L3DUkkcWIETSH1hAHF4rKk64EeRuBwEKjruX29Q3OqQ
	tddDQVvFGqah3D4IKmvOv5P1oJuBP9Tgu8//hI2PAC9b79HGKcxSka4ifC4ecHAhFP9Hxhn7ziV
	2y9PVkB9TFORotz7eevw9XqFdWruPUm30sC14e35jvaoax9An3VzWG1hBOCAp7q2rYZJjiGmIGl
	URWUjmVSCOs8/5kcQbEwCqTEIpIb9J0lRUstaeSwmr0CuQ6J4l1zUXbt4/ieFDzEwPXdTWaXvZu
	pJCvwN484ANJVSKkSL/O8AIAFjgipiMVZTHyMi0o4aBzB1J2mOQ/hKe0bMz45YnuxbC7vtteW9y
	uvGiAcNqmP6C6iUCWFoD8y410fgVOpFGXbzedYCRyRWDSF4rwJvmyIApnqyNCb0ZV0ZZQjNgzxv
	FJ4mIE8zAsf+Cj99HL+aYkQYqJS59ku8JMYmkfiFUyhnABD38jmEQ2JlzRr7V+/gxKUJTqPHB43
	XIK2JeHB0BoKD2fGaYLkDij/g6B0rt42cuFVUtlix/K//cvU9IXhv5a6mI0GZCSLcMG5Ju4Eb9i
	CeyMDI2ZPxNnBt7jqWwmQTouc2rixBh/ybGer1r7dlKUL7SClU8zQpdChyWxOg==
X-Received: by 2002:a17:90b:55ce:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3ae5832af4dmr3942620a91.67.1793266017576;
        Thu, 29 Oct 2026 02:26:57 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e874bebsm3513079a91.14.2026.10.29.02.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:26:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/7] catch2: upgrade 3.16.0 -> 3.16.1
Date: Thu, 29 Oct 2026 22:26:41 +1300
Message-ID: <20261029092646.3634215-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029092646.3634215-1-ankur.tyagi85@gmail.com>
References: <20261029092646.3634215-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131650
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/catchorg/Catch2/releases/tag/v3.16.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-test/catch2/{catch2_3.16.0.bb => catch2_3.16.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_3.16.0.bb => catch2_3.16.1.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.16.0.bb b/meta-oe/recipes-test/catch2/catch2_3.16.1.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_3.16.0.bb
rename to meta-oe/recipes-test/catch2/catch2_3.16.1.bb
index e9ef1e70a4..f98c31ffa8 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.16.0.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.16.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https;tag=v${PV}"
-SRCREV = "317ac1ed4c0bb6e6b91eafc817e05c488feffcb3"
+SRCREV = "08092139210881f01a34e60c5f2fd6afa0ea4024"
 
 
 inherit cmake python3native
