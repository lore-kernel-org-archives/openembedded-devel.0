Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B90C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 17:55:37 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.1496.1708710933003978801
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 09:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: straka.derek@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-42a029c8e76so6588241cf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 09:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710931; x=1709315731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSrSYkC4KOamMI36diCowWOybu5Sug4QUVY18XNVlPs=;
        b=AFsF7MKSdzyy4XjTlsATY71/h/7F39HtGoYDTNf23f61K/oErrKVJZBrfDbVqwSkrB
         P+lOeawYQCH9IXlDNY/rNwiAxHLyzGGspbdk8dUO6MUXE3m6YFautxyHYJPLI1HfqXnF
         ganPvS1cckTHUklMpvNjtRiFTHzAZEbMaBA6RG39igBeJLi+xppQ2YWDIg0Byc0ZUh9G
         Gy/TFnlKqClMYJhHJ0Ei8WXO2u26QLqQharLoIvi5wta62m5mD26+XNbS81f5vztmYlG
         N6qk2ZfR+/UyRlqgsrReZMfxOBJkDYvNdZNO81cXsZED7Q7S/fboMGAu8LJFMyhsaxyZ
         IWlw==
X-Gm-Message-State: AOJu0YxVakg5xwLhhor5x3GFZDilSNNCUs7vopGPy3Ao6rZdz2BvCf+d
	mJRYdKBgrZqEsNjSiSMVVPjUesPoGsOfN8QH7jaDP8PRSK8wEygOKTrX0TCpCTQ=
X-Google-Smtp-Source: AGHT+IFlRbq/rIiEqjDYlzArIE5oyh9IOsN/eWrx25DSWSKTyDqeAg/IGgC54mjYSVTAYmhhOI3BRw==
X-Received: by 2002:ac8:5b8c:0:b0:42d:fe2b:6e25 with SMTP id a12-20020ac85b8c000000b0042dfe2b6e25mr602922qta.7.1708710931019;
        Fri, 23 Feb 2024 09:55:31 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id op23-20020a056214459700b0068fcfef2077sm1463859qvb.93.2024.02.23.09.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:55:30 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-service-identity: add missing ptest dependencies and re-enable functional tests
Date: Fri, 23 Feb 2024 17:55:23 +0000
Message-Id: <20240223175523.2572935-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 17:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109015

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc     | 2 +-
 .../recipes-devtools/python/python3-service-identity_21.1.0.bb  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index b3ed60a26..22894487f 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -52,6 +52,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-requests-toolbelt \
     python3-semver \
     python3-serpent \
+    python3-service-identity \
     python3-simpleeval \
     python3-smpplib \
     python3-soupsieve \
@@ -82,7 +83,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-pint \
     python3-pyzmq \
     python3-scrypt \
-    python3-service-identity \
     python3-whoosh \
     python3-xlrd \
 "
diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
index 0a2f2728b..006fae290 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
@@ -22,6 +22,7 @@ RDEPENDS:${PN} += " \
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-unittest-automake-output \
+    python3-pyopenssl \
 "
 
 do_install_ptest() {
-- 
2.34.1


