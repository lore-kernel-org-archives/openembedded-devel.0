Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.966.1632338558317977328
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oNdQkG2g;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id 203so3531178pfy.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZQgpbz8i5vwsPXFZtMV+dGEckfOavQbEL484IPIIJnU=;
        b=oNdQkG2gGRNVc6+ufNvJKbqgd8OHn16gxiWeITKj8F3U3czfsd5V11gjmSpklIk8tt
         hiZQc/NrF6Qamw5z/vfwrpff+l+IKLlXxxEnnZdjdjXuD5SBuNpDabiSqe0AnhsrIu8F
         Kzssg1WfOyAG5o/7qgMfK6d6Hz462wCN1JfGOoMKSN/SprnEsPYnQG5k2YD9XSZ5MIhz
         haNsF3dVRb3hihKiFFTyPeOYANbOan/aiBhadnvyvFiWOy3VrvTkcltBi+F07wbkNINd
         +JNz1DRODegApDsm787EAaz2wuxLrQBublhbGTb+o9F/j7HHIljhk0VJC9WfzITYaGGx
         Vz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZQgpbz8i5vwsPXFZtMV+dGEckfOavQbEL484IPIIJnU=;
        b=OgdDtwlc10HIp6JY1A5itG0z3qDqRCIGXhUZMTu6B6tQqGeGAUsun1LiRA+R6i101u
         4SX5B7EVvclPlS4T7PH9Vh5QgalqMezSE751f68mXOeQzjPomsFbysG29q/RHebho1Y0
         8EIyHEhBUVC1KER5aIVWLGrm1BoM1KR9lhoe+7ueJGhdLu0srYu5dGb/5dgNXBdTuKHf
         5OxKvCXMdhDkCpUyHz525jF0ZhALOnvXQOwrINdThXNEli5thW4lvSReIZxrtQm7zaMA
         SeV3BlIIsNSqHxqZfmyMpDcNQEwb3C0J5NCWHKFjVL/pdMibbCofImmExu/LHk38HO+E
         qkkA==
X-Gm-Message-State: AOAM532SH48BwPspjpKGtd3QHVLPJYOHiva7h9KXCnmsuE3/BBk7iIXD
	t9Y2f3wUdu5oWETi3xsfAib5DZ6QLDzHSQ==
X-Google-Smtp-Source: ABdhPJwbwD3HX4Wl1v3mxTpQoXMIA8IfjWru8PLU8cX0yOgG8s9kJDUOwVHtdSqA+Asbk2z5YA/dNw==
X-Received: by 2002:a62:31c5:0:b0:447:b30c:9a79 with SMTP id x188-20020a6231c5000000b00447b30c9a79mr632054pfx.67.1632338557711;
        Wed, 22 Sep 2021 12:22:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:37 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 25/39] avro-c: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:59 -0700
Message-Id: <20210922192213.3062719-25-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
-- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/avro/avro-c_1.10.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/avro/avro-c_1.10.2.bb b/meta-oe/recipes-support/avro/avro-c_1.10.2.bb
index b86bfead76..98f464fd04 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.10.2.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.10.2.bb
@@ -14,4 +14,4 @@ SRC_URI = "git://github.com/apache/avro;branch=${BRANCH} \
 
 S = "${WORKDIR}/git/lang/c"
 
-inherit cmake
+inherit cmake pkgconfig
-- 
2.33.0

