Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.6293.1627353356748318508
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jul 2021 19:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mtE0HfjW;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso2003925pjb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 19:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d+vq9Ycmr/ycQdddakqyt/g91htm+wHWyXV1tSuDrdc=;
        b=mtE0HfjWRuqsuiaOqSyL0hlz+meZ9OAq5GhgyMLxlEbxh1ioUEGJZ3cTeWPAk0nVjD
         bQ8SrAjZZf581xml99gb6hhrtdxW0C+4BUoDtECw0ZTZQHDo57auOwjt5bjuw/2GGAhR
         Xx2oAeAzvfdhovjVovoU/nmdpli2AEaCRWxeXO0GOIpcU/88xyTH7BdCvguTfF2znWov
         nvfkl/7rSLmKmTFlPb83hp10h63DGRkMHX4ZEGQ1h6KTmFGzpwXZBr05OBX4PjN42Pqg
         kscfj2wmH46ytfgge7hFtibgzp+wnuUcQ7AfOhbwI6Dbd/BnoxGD/X+fQnSF0zcy5J9v
         mozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d+vq9Ycmr/ycQdddakqyt/g91htm+wHWyXV1tSuDrdc=;
        b=WzlxxPDOS7rQbXEqweTOI5nkMgq5yhP8dM9Gdcbd2ymSi/3EvWTlAYALFTsu8khL74
         5PyEWLNpJmH1q3GLg91e+RBrR7OJZezQ72/J2b/8JJP6dNQIzUHd30wSrH8HR7suq+8U
         W11odvRcM4PC2u1xhae6M/1YHLRAPILOJPh2H1f9zbITrJyBrW8afrjvfWATJDHBHh/D
         uYz+GTj6SK6V2+du5gvTCl06EipuVWGxV0LqKiqKdFDajH1TIJOlH9D5yDBRvvA6XmK4
         1dK3yyt+O/95TxqLzuQz28hbp+EwqvCmu6spK8vh+LrYcGvXp1jiZ6blUZCQH1q+NZ1Z
         KElg==
X-Gm-Message-State: AOAM531td3s1RE6jkxQ/EZEYtAuJ3KgPiO9dIRczjUumYjdnUP70k+h6
	N+hFtrTuP9cBASPzVQCJ/cwVSd7Ja/XTIg==
X-Google-Smtp-Source: ABdhPJxtw2lEt40nG3lDGdCCYAED0WHLgsCBUu7/LigxjDxbXZ0L/8UnXyLpypFAc9q8RvhLpYxwOQ==
X-Received: by 2002:a63:1661:: with SMTP id 33mr20829848pgw.443.1627353356196;
        Mon, 26 Jul 2021 19:35:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:84ca:24f2:48ba:ef1a])
        by smtp.gmail.com with ESMTPSA id y82sm1425340pfb.121.2021.07.26.19.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 19:35:55 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 2/3] php: allow php as empty
Date: Mon, 26 Jul 2021 19:35:52 -0700
Message-Id: <20210727023553.2223746-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727023553.2223746-1-akuster808@gmail.com>
References: <20210727023553.2223746-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Since commit c4ffcaa2[php: split out phpdbg into a separate package],
package php is empty, we might met error:
nothing provides php needed by php-cli-7.4.9-r0.corei7_64

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9be6b4f5a2ec857475626c74457a94b8d9236fd5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/php_7.4.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
index 451c5e69f8..dd8404e688 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -213,6 +213,8 @@ RDEPENDS_${PN}-cli = "${PN}"
 RDEPENDS_${PN}-modphp = "${PN} apache2"
 RDEPENDS_${PN}-opcache = "${PN}"
 
+ALLOW_EMPTY_${PN} = "1"
+
 INITSCRIPT_PACKAGES = "${PN}-fpm"
 inherit update-rc.d
 
-- 
2.25.1

