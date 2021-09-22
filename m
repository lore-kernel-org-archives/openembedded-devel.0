Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.929.1632338563558683820
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HNd2r07D;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id h3so3780640pgb.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4YJtAfGXQlhVfAvbPMJ8CGZaNnCvfpADPouOsZVFnS0=;
        b=HNd2r07D6HGDzcAmHILHSGYHJ1uySEEotZH1lT2ivWJsye3ikszkbE/Ms/lI0InY6Z
         H2YQCShhv0TNJnpLXrLERfw42J9c/b6pyaef6R11eYlGvORqCHF5MOZIv1lA8762aWML
         1TKe/Nea9CCVbrxZAHngo8pzqr6Pkl6LGbFoVW1/1jpOOSYdMVmoMxSbtb8+7FeC6CiN
         A/3ShEkVUFPMRwalo91xIPlI0PwrQR8gqlNT2XpKDE6cVdSv4dxg12j5vtDIbDVA9PRP
         SB5rwvbH+wVzCZrRLytFp7QTGA+m3yBJBhepOhN+VmiU4m1TYG5BSdrTaUQtIY8T1VCl
         Jc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4YJtAfGXQlhVfAvbPMJ8CGZaNnCvfpADPouOsZVFnS0=;
        b=XjbIziI7Ofkh0VMogaW+C3BQkRAUbAJEdRwJSnGfm+9WZeoHCnVNwHsCZctuRkGb6k
         ZoezJtqNb5GD0dO2qsFFGz6j9l17iMmfprNHxcRVJjsXY+eA/XOBZHnjhMqspLqSXh7D
         McYJ9WBT9neTuxYtikP9fTQkLbzHkQzK8B0c5mUl7zsFojl/QX2YEgbfTOMdRFN0j8x/
         MsNwvvLbEcUylJ2bGnQ8Vev4XgMpJcb6SAaWrhn5lHD6bOV+GozXoqsn4J8QV62HKuf6
         M+ttOActQ8A11IfkS2WM3JOV96yMuc2OcwOmyrAqY+pAG2DxXkTuNzEwjDj2epjoB3GA
         I0Lg==
X-Gm-Message-State: AOAM531HktAfijJiBidnzYdctpkDndrCWZNDlGeOGDY8eaM+05GPCxBA
	dz6Xl2k+NlNNgRE7/DgHnErKnIB6hTrYbg==
X-Google-Smtp-Source: ABdhPJzldkvPh/EgFqqlJIkFN7PSl4uPkc8BdnaZCEu1REhD508n04B9f/eY2A0ASsK8ekPd0PJGZQ==
X-Received: by 2002:aa7:988c:0:b0:445:13a5:67bd with SMTP id r12-20020aa7988c000000b0044513a567bdmr698951pfl.16.1632338562880;
        Wed, 22 Sep 2021 12:22:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 31/39] crda: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:05 -0700
Message-Id: <20210922192213.3062719-31-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
/bin/sh: pkg-config: command not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/crda/crda_3.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index 7b663cdbb4..f99dfd66f9 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
 SRC_URI[md5sum] = "0431fef3067bf503dfb464069f06163a"
 SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
 
-inherit python3-dir python3native siteinfo
+inherit pkgconfig python3-dir python3native siteinfo
 
 # Recursive make problem
 EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D} LIBDIR=${libdir}/crda LDLIBREG='-Wl,-rpath,${libdir}/crda -lreg' \
-- 
2.33.0

