Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.10082.1613844201618442795
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 10:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KY0eyJcg;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id f8so5180511plg.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 10:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zoc3oc3PxoVJ8EWTdC6S5W60wSiFSyiqEx6n8GF2zhY=;
        b=KY0eyJcghzPviBFNTagap/yAln/j8PeS4UMPRV3U3lgMZiNvxfKHdlwpMEsURDKHQY
         YOPjF6yS6OzaPxzGJFgSjQIDodoMzi0lrIN4dePKrtiUKROdChKqSR7uSjkjSWqRkAzZ
         Y6HKPXTG82cU3GClrUvZOwMzCxvneIMGG5DYgCJXF2GbsdCU8kQ/uJ6C2KOCeCx+VOL/
         5P9AxXvQ6mgnWm0UC792sPu6mJnntmbP5/n0xy0tFqFD+OcZzbXbv9fLt0VY2c1+Gs7A
         /s5v135GScoEi0fxZUXr0IoENAsWbPOiQ8R3t7h3sqVJ8BIubWhm3tPZOEVW000r6jN/
         jBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zoc3oc3PxoVJ8EWTdC6S5W60wSiFSyiqEx6n8GF2zhY=;
        b=QTMzQ/O8gQ2MNPFwv5DxmQj0W4OJ3kW3mz+PwX/Catm3qovRSB+mheGHPIZm0x8XDS
         gXa/APGFZ4tXU/3r4c5Eiu+pmRt0RH7s5rBTj7EmOylqyWB6hLpB7tMAbaA6IZ/0NUMH
         E3HOCcAjlFGekLwavpPU/rlsWQUmk3nDEFSEVp2wsvp+ZsrLs2yt8T+xXqYRkHAh4a4a
         gNuPtEhWraWOAWLdU/6TGnOHOOQMqaEijMsNffxIhC3jPhp5UnCDaxA5dZaJenI3UJgE
         MwmyThhkhySmEBqcdfG+N3/T4Fcd8Ddko86bPC37CRCZmelqBv9FMl849yfGbAlC6YCA
         ixjA==
X-Gm-Message-State: AOAM532oZU8GomZn0X0At5B3P/mfhk3LKul/S9XETfsejeikRC4g3mFk
	bP6+yvOD93zPznVwiJeiyYA7myfooEwsaQ==
X-Google-Smtp-Source: ABdhPJwZDy8lxgersivGERYzJvkvwTN/uFjzENoch3AutwnQlXSUeci7sFkVlSsq1AweyZ/1TFTJ5w==
X-Received: by 2002:a17:90b:110c:: with SMTP id gi12mr14890612pjb.48.1613844200963;
        Sat, 20 Feb 2021 10:03:20 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:70a2:885b:8c45:14d6])
        by smtp.gmail.com with ESMTPSA id c17sm12106267pjq.17.2021.02.20.10.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 10:03:20 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 5/5] python3-pykwalify: Do not unset _PYTHON_SYSCONFIGDATA_NAME
Date: Sat, 20 Feb 2021 10:03:16 -0800
Message-Id: <20210220180316.17789-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210220180316.17789-1-akuster808@gmail.com>
References: <20210220180316.17789-1-akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

its been shoved out of setuptools3 in oe-core now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 50bbf80abf570d1d652ec2f4bc5878e939c688d3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit fbe2e79ab0dd4e0b2fd6433d0cfe10d66c7c7181)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
index 1bbde6986a..9251eccebe 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
@@ -10,8 +10,8 @@ SRC_URI[sha256sum] = "7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b402e8015de
 SRC_URI += "file://0001-rule.py-fix-missing-comma.patch"
 
 PYPI_PACKAGE = "pykwalify"
+
 inherit setuptools3 pypi
-unset _PYTHON_SYSCONFIGDATA_NAME
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-dateutil \
-- 
2.17.1

