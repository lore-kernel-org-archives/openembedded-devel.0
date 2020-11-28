Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.36764.1606592845989904923
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nr1W/wvU;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id m9so7037250pgb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qp8t8LeSlVf2qZXXWDol5z9xqpRoTi4hpBg11nLGqMs=;
        b=nr1W/wvUc5eSCxadBuYEXVLZEVuIAn3ZMG1MbaQVKXey5heSzO6bJVhQDBqijia/mM
         vdey5cVmw0YmwYf8XUWRbFapsjbihonKSUJeBFiyYhedAykMMUnehzervDWk5h96AmUS
         yqiI5U0AWhtr8XjNrbqrqL/Lma8iil7Hu6VjQvDsc/xB5h5Mer++QaYUXdWw7+ickXIo
         PfMO/ue7fc1hAviOrBEmuBYTyRoV+O3LRZ5fjDEnbkZm7ri+lMbE3oTOu53SnNQPdHfw
         3XepVSR6r5nH/jS5ZiSNuBBwD0VSqsQHa1iueBkXt3R4sdoZVp4UhNYk3IPYicMUfeyM
         XiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qp8t8LeSlVf2qZXXWDol5z9xqpRoTi4hpBg11nLGqMs=;
        b=tFqfayrOwefiw5H0NTfsq+99N0R36EgeAwqyqJuFuWsyzRoD5IMeKb/RyC+yGN3Oxf
         BMqhqy1uTjxTBpLnqw0Kl7wyk/1jmUhOtkspjiQShhqu4N+mcc8Kh8I0q0bX22Sys9iA
         wj2Pa1xiQ8Y+Q+Shv4la3QovBp+9K9fJx21NeKR7bE3XexygADTvYuxqohLI3Yw2Mot9
         RciSNtafIeL0yINqdEXcCuSt1YbEUsNfNSUFa5xTEQ0qYYeOukJSVrvmDWz7NjnyEQPI
         JSvQIRmoFOKhNa599XfFoZE0ifvW60SrkCPOZxkr+qYGWs9ZuXKC1RJ8R7E4Io0JKynu
         BUrA==
X-Gm-Message-State: AOAM532Pm5w1ks90yqo0TrtRHm0Bj+Gth/4JYIual7nYKJKnjypn9pKu
	3ur7k2gDuXDRm9Jx7/nwdCfb+cjuLOMF0Q==
X-Google-Smtp-Source: ABdhPJydpUxANcnZdVXDCyyxezKq2okmmBWb6gdnzjPPEfHrYlO1mnGiA3JKf/GEEP2DggLErJnNbQ==
X-Received: by 2002:a63:fa0e:: with SMTP id y14mr11572338pgh.225.1606592845367;
        Sat, 28 Nov 2020 11:47:25 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:24 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 08/16] python3-setuptools-scm: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:48 -0800
Message-Id: <fe8128df729c4ffb236de0f6644bc2830eb9f431.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-setuptools-scm_4.1.2.bb    | 21 -------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
deleted file mode 100644
index 4ebbac6b65..0000000000
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "the blessed package to manage your versions by scm tags"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
-
-SRC_URI[md5sum] = "e6c9fad17c90516d640868eb833d5150"
-SRC_URI[sha256sum] = "a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090a7faa8"
-
-PYPI_PACKAGE = "setuptools_scm"
-inherit pypi setuptools3
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-debugger \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-py \
-    ${PYTHON_PN}-setuptools \
-"
-RDEPENDS_${PN}_class-native = "\
-    ${PYTHON_PN}-setuptools-native \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

