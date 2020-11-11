Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.11044.1605118410318877487
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2020 10:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ubbTjFq2;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id f27so1928659pgl.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2020 10:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=29U7rHOmIwU3s/19dUxYjAzlVQ4lhEbZOhUnlicn3bQ=;
        b=ubbTjFq2RRlkD+zxvscEnMHy2qPA9ST3WjqYQp2YWSuLJ1AjLw53ih46dZhV/VjQPC
         G15STGKuVuDJ1jgxJ95x47BK1g3mmp+24IgZmR+Xiwdo+s6ef6kflUIdqyb7yVRrblAV
         POadEcu9pHAIGqWZAqet2ahAlun2mvvVe4lDSC7AN5vf27AaHNobZMHJtJRJsXl2f8EQ
         LMGvhJDyZt5SNAB0SRo8AEn2mI7SnKsbcKs77dqZq4AKArOTnjil4ubVKKrq5OMdU7Fe
         En1RTYX9ktS47hHKo39muHc97OJQsM2h7Qn1Y6tWuE7mIgtasNZ4JGTy675EUsMg6Mx8
         036A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=29U7rHOmIwU3s/19dUxYjAzlVQ4lhEbZOhUnlicn3bQ=;
        b=M9wsSYdW9FNRBKi9jiEhpXi18vfeTzy6LDlZuJVnyYCQ3FblhZMFC6W7Sv+mJ+cjzN
         qiWBEA4ikN69SIWPOvCbh2CAK6PGm2+DGvkT2kJWNNNLu4VELrjCaCxPw1Taoj/fWSKq
         rbgTkMeAVMpZEmv0EA396TTim+GYJHpUneouZoTxf3/Crn4MQvkTRGWjBKtydrxLQXuO
         otCCAIUb9XXJgINg5guEbsQK9+D2Hx2ExoVrPhP+GAAyd8KOXWbnJ42tnfeHYIA8WvcR
         W6tH7LOxAanm52d8oGMjDzaofnMZE9cS5+IWba7hxjXp9wYR1UqY+BcohI2JNKuwuQ8o
         lHiA==
X-Gm-Message-State: AOAM530hK6VGpjhNpw0g7YLZt7Rahopk7ssWSyqWoJ9dCRhjUg2aGHe6
	SASR6NbZ8LLc/Iqto+DSSiX5ajzP/alzgQ==
X-Google-Smtp-Source: ABdhPJzL8naOiW9m0JtO8aZwrPxlgvAbL6MYUph+p0DrMED/U0S83J/9vcdnq33Dh8BPw6V5ZRPR7g==
X-Received: by 2002:a62:55c6:0:b029:160:1c33:a0f7 with SMTP id j189-20020a6255c60000b02901601c33a0f7mr24237787pfb.35.1605118409305;
        Wed, 11 Nov 2020 10:13:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id x4sm3264751pfm.98.2020.11.11.10.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 10:13:28 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] suitesparse: Exclude from world
Date: Wed, 11 Nov 2020 10:13:23 -0800
Message-Id: <20201111181323.897884-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111181323.897884-1-raj.khem@gmail.com>
References: <20201111181323.897884-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It needs lapack which needs fortran
Move suitesparse into packagegroup-meta-oe-fortran-packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb  | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index c08d32bbdb..1c53ea971e 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -276,7 +276,6 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     rapidjson \
     sip3 \
     squashfs-tools-ng \
-    suitesparse \
     uftrace \
     libxerces-c \
     xerces-c-samples \
@@ -936,6 +935,7 @@ RDEPENDS_packagegroup-meta-oe-ptest-packages_remove_arm = "numactl-ptest"
 RDEPENDS_packagegroup-meta-oe-fortran-packages = "\
     lapack \
     octave \
+    suitesparse \
 "
 # library-only or headers-only packages
 # They wont be built as part of images but might be interesting to include
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
index af8b1f8568..9ccf2d0bff 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
@@ -75,3 +75,6 @@ FILES_${PN} += " \
 
 FILES_${PN}-staticdev += "${libdir}/libmongoose.a"
 FILES_${PN}-dev += "${includedir} ${libdir}/*.so"
+
+EXCLUDE_FROM_WORLD = "1"
+
-- 
2.29.2

