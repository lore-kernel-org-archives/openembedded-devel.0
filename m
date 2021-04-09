Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.3672.1617934863906356343
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YKd+l4ve;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id n8so4264821oie.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=soZSo2KPfZqZ6GX+fF0rBT3lkGZ2ilMrzWzVGxZZ36A=;
        b=YKd+l4vefZpteQuQfO1SXbp+VUgXfMS/2+MzRTbN1gzOi4bTlhFNnNApGhkGSZPheZ
         kHz0XQRQcni+pMhKpfWXRWUR3Bh6vAt0JtUoqw4Hgl3aPOfVDTHA2/r6GSrxf79qkX9H
         lF9XsUKMsp8t3/w/UhOb7/Yjyhxi7ukP1Er1wplYPi8IFEAB72MMPYh8O2QTNo2xNcMg
         bh2G3j8WjpSz4FLIvYFtLP4ze4/hNCPXYX0GW8QQwyPFgojtCc01rACXRiwoaACWgKgR
         sV/eXru4gBdhfGWBSkdnpO+2sGvi2nE/IRLiOucDziaz1wDFdAvkY3gBliRaXJHT78ZQ
         YAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=soZSo2KPfZqZ6GX+fF0rBT3lkGZ2ilMrzWzVGxZZ36A=;
        b=tirsS+nzr501XXHg3L2QPj0lDSpcQ0d+dXcc/cvr7L8NGvDSF1roPX73ieyVkah893
         b+gCaUCNALxCJQ6WF35MhcnS+ivubFpguMpAPFLTuPZg47HBAyNyL+vzVZ0uzJPlEImp
         2kLhayANH5kw002J7B/T9rMozGgnqH9nnFVQlt92g4slgujGi2VBDhmTGKcPFRCuveNH
         6a95e9opEE7x3fxVraLyFDfEpLLnmAEG8CDT4DlJU8a1Os3dt9ig05EPQQs8d4EsxoOE
         MUparzJWqKsQhRaAEAMTpw9PZ9tNtodhZujJ9m0Vnosk6zi5gsvTCrfQ9kOe06/ak0T0
         MNng==
X-Gm-Message-State: AOAM533WSBjeu1pj6YZNVXYO627JP950NTHAO2wlRHemiPhPiwqv7Mxx
	8vtkphIn88S/TAcN2Q2ml+aVIyTgDHk=
X-Google-Smtp-Source: ABdhPJzAPhmvEgTuTCPARH8iis+xeJqE9qAIFF5F7d/umdgKXxFlbn/eTKYvWEUo4zn+glQF0tBQHg==
X-Received: by 2002:aca:ea06:: with SMTP id i6mr8534550oih.82.1617934863126;
        Thu, 08 Apr 2021 19:21:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:02 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 11/36] python3-pymisp: Upgrade 2.4.141 -> 2.4.141.1
Date: Thu,  8 Apr 2021 19:20:24 -0700
Message-Id: <796b538871502b6b2e753d0a09c73bce62d7d47d.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2.4.141.1:

- Re-bump changelog
- Bump version

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 0eefda892aea7f69189d1f3b1f99949d4feb5321)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pymisp_2.4.141.bb => python3-pymisp_2.4.141.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.141.bb => python3-pymisp_2.4.141.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.141.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.141.1.bb
index c8bd52f105c..df6f1c762d2 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "4a0c1e1dc42af171d3c1bcaa12436f79ff6cfd9b"
+SRCREV = "62cd5173f087e88834e88472060181b681b0b4d2"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.17.1

