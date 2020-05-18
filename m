Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.43720.1589813427021833578
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A44znGKt;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id r10so4941458pgv.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=YxEmK5zpaTAlhh3xSkG7gMtNeQafoZSPk0AuE2QEnAY=;
        b=A44znGKt3IcquNcWBYG3Vp8yoNKTiyI8n22a/qsQg8IgTRiZAFEh9qTbwx6LZ4BXzz
         rBlNVcI9dNLqYI99ZcHrZ0VR3HxhrBnfkrVVzsR32X/Wwc4DfMew0yW16YNzl2O7IkrR
         zKou6SVID6HBEcWxMQvQnNDK4p2H4cM8rcst3/AMnBqsY6nTp/5aSVosZO3ToSPPL5Ex
         fZrUL6O+zIFMAFazjWErjqOPu/hhR3bnIzjRCLtfsWYe2y8P3D2b7nAdTZK8MXrqAbjG
         pp0UUrSWV91rYEca+YUlbcxyt9dNN9AmL8w39YjgNemOsXa9e4J5ZVOexBBW5QeSFcHO
         tCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=YxEmK5zpaTAlhh3xSkG7gMtNeQafoZSPk0AuE2QEnAY=;
        b=ZhsRDz+ya7uqKctAN1TLoN6+0jegybX+1uGtuR6Rj49ANrxzd6Bm2MfsKIOjmVLjqm
         Uhrndw+M6xc2+ZLY+W4kdyeZJ920KvnS3iHL2tTB8bgl4HEM9vsWb/pZq4ENgUCBXO1l
         4dmDjbt1wZeqYIcGieJfA78Bnt0OAPpcglDTr3R4d3NKiw8B7LRPQ+wQPc5L/AswhP9o
         C1ubox0mEXe7iSJqdOxXv06MPj5Fr6r4ZA9Q9QC28d+gY2oPSWDzkjcAOFuGctcBCEQ2
         G5s24pyH5jAP9y3ce/5pn8RChi37AFk9tYtM64TPDfd51Orw48Hd3jw1zKxVZlWcckhx
         H8GQ==
X-Gm-Message-State: AOAM532gMVpTT08QHVJqgRCDKarqKounLcHGJ6pJivic4rrO9NYANt7p
	+aKZ63m2UqPw0iHNCS9zqH6ApC/J
X-Google-Smtp-Source: ABdhPJxZi/oQaiuuQZHM+IFEKsJUOvUSyVjo7jRS7V6w/7+V1QMU62iSUR2vDLsMniMU9+Lg70vpjA==
X-Received: by 2002:a62:7acf:: with SMTP id v198mr6065167pfc.166.1589813426400;
        Mon, 18 May 2020 07:50:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:25 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 19/57] python3-zipp: add the missing rdepends
Date: Mon, 18 May 2020 07:49:24 -0700
Message-Id: <07f1e0be8d428d0a643dad67adf81dd76ce53579.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import zipp
 ModuleNotFoundError: No module named 'zipfile'
 ModuleNotFoundError: No module named 'random' python3-math

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 16b524d00a1f0684093b278a45f98fa736dda1e2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb b/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
index 1019081f38..40db3c071a 100644
--- a/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
@@ -10,6 +10,8 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 inherit pypi setuptools3
 
-RDEPENDS_${PN} += "${PYTHON_PN}-more-itertools"
+RDEPENDS_${PN} += "${PYTHON_PN}-compression \
+                   ${PYTHON_PN}-math \
+                   ${PYTHON_PN}-more-itertools"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

