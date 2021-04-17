Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.3565.1618693581590734805
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZfISWAf2;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d124so20594593pfa.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=qjtbLXkUPyUOEcezSw+QHzXu5r6PoFktSJ0+PG5m25w=;
        b=ZfISWAf2R93AprTYyWYE2VROXF+nAPxLwO+8YPry5iyGkZhZdd0LYMqPkD0kTdpJN9
         S7peYmPtcQp8dxFJr8q70JzCDEwIG7kzc9bBIogWP42xAbxrQ17TCQbh7T8MRw88ixbm
         sLdYVP6kSvF66DC3R8QQVTutpOSMTyp9gUFrEkTpWfSm6wPRJGLg4UUncFY54IaG5SIw
         g5NRNZbHNxU7Tfj1xrR5XxzvFIPEPlMbbLQlXddrHvZkrd3YR9SnZfFfQe/NobvbWwtv
         8dg6tQlE13nEK8zElwIdiAGqxBvGTbLxlQsgnHVSOd1MSsJZCbRyZPoRu4fVzVIH/jrr
         DFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=qjtbLXkUPyUOEcezSw+QHzXu5r6PoFktSJ0+PG5m25w=;
        b=LgVyXUPP+X2Y1s+RY1HLCZzTgW3sfeIkv079JknsIGKiX63X//SN2HjYemVkliLgA0
         v2AyiqJHILUpQk005bxyKRcnFjYzHgFVtbOIh+yBuaadD1TNVO+0ZCFNkuP0XjFQcpZ4
         MrwFa3r2jQdvavBGumcRHkS2C/q5j5TPHWn6oTNEtHZ+zAoTPGfmnmYqPBXIpVkhkAL6
         gwbvtxKHnCn4IEPjNbFzJum1+6zk/ktN28bxsSf8KBtHvJzdFEGfcnGBObVuVF3NSHVu
         OyRFQjkBgNai0yItUMSyKB7NKCLUtYXldB5W6zrXIWiBsjj8OeuLElJnn9Dq7/2XlX5U
         rq4A==
X-Gm-Message-State: AOAM532gSlkjXpDKKWH1FV/3x+BChPSKg+kHm0m1nqKwEmUl92vybluD
	e58/y6bwG8TcChQweCDE9kfwNcK0uZkSiQ==
X-Google-Smtp-Source: ABdhPJw4F+2PHlaYVOneZsBVM62B1B1VLYaFTsTZNYvXItBobLeRVYAx4ZJ+X5p/xpS+1M/qSj1ItQ==
X-Received: by 2002:a63:b09:: with SMTP id 9mr4891273pgl.107.1618693581086;
        Sat, 17 Apr 2021 14:06:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:20 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 16/50] python3-humanize: Upgrade 3.3.0 -> 3.4.0
Date: Sat, 17 Apr 2021 14:05:25 -0700
Message-Id: <488b3f82c9e42c7310f40a7ef0f3908c48224fcc.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.4.0:

- Add Catalan translation
- Add documentation and release notes to project_urls
- Fix tests for Python 3.10

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit e8bcc60fb5b5880a215cdd44592bdc797258ac51)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-humanize_3.3.0.bb => python3-humanize_3.4.0.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.3.0.bb => python3-humanize_3.4.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.3.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.4.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-humanize_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.4.0.bb
index 3d54cf0c433..f9c22e89148 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.4.0.bb
@@ -1,10 +1,11 @@
 SUMMARY = "Python humanize utilities"
 HOMEPAGE = "http://github.com/jmoiron/humanize"
+SECTION = "devel/python"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "8bf7abd672b867f38b8b04593829b85b9b6199a61ef6586bf3629cc06458ff35"
+SRC_URI[sha256sum] = "096b9ae6d1d56321d3d81f17117c2068179d7b4f7f73ba4baf302726923b48ec"
 
 inherit pypi setuptools3
 
-- 
2.17.1

