Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web12.1518.1586020391184156233
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 22so10859936otf.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qkfg+vTHo3yysjCc40UpVio169XwtIi+Vw9Bg+naV3o=;
        b=sbQlixTH3cxVzSzAa0LOlHqS2brtZnoVwO/rudxCPG3BhJETjL0ONQMm805gjBMDS+
         Bg+yTSYG799OiHUe+14nlu4jhK9d9+ndMmj8hEKVKboB0V67hWt1qtOM5RRSiMYA4a5C
         iatZhXPY6XqGp7uYevDM1LnGkcCBoWBmUsRAgkNZG0c4OXOsLHzFtVyUnuTmNUcAdUGn
         k3vUj2c7td9yDC2ngxLzZKhGawngzBaqNb747+nlwqeqBOigm9tcL8phfuQEVEeDyr8K
         ZMR8tx2dxSZ8Oq4Kh5OJ0xT3r9O9OZfi2Q88QOW3p55c5rC9pjNRwI8t6JJzxmf5nHwg
         pppg==
X-Gm-Message-State: AGi0PuYPV2BmalfxlABYl+jGhZPFxK/Myof1Aj75gJwSQY4xGdLzUV0Y
	wXcghBwYk8lzVk4V6sJrMqlisp72snk=
X-Google-Smtp-Source: APiQypK+6z+KFzLid3zjlYQenI6ACnAOMOPZSDVw5WOZbMVpjKDweBIIR47LkNl9sikqjBkISWOShQ==
X-Received: by 2002:a9d:3b8b:: with SMTP id k11mr10650634otc.245.1586020389984;
        Sat, 04 Apr 2020 10:13:09 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:09 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 02/27] python-tqdm: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:26 -0400
Message-Id: <20200404171251.19823-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-tqdm.inc       | 13 -------------
 .../python/python3-tqdm_4.43.0.bb                 | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-tqdm.inc

diff --git a/meta-python/recipes-devtools/python/python-tqdm.inc b/meta-python/recipes-devtools/python/python-tqdm.inc
deleted file mode 100644
index 242bb3cbc4..0000000000
--- a/meta-python/recipes-devtools/python/python-tqdm.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Fast, Extensible Progress Meter"
-HOMEPAGE = "http://tqdm.github.io/"
-SECTION = "devel/python"
-
-LICENSE = "MIT & MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
-
-inherit pypi
-
-SRC_URI[md5sum] = "81454c26572e4e47911596ea065eb1b7"
-SRC_URI[sha256sum] = "f35fb121bafa030bd94e74fcfd44f3c2830039a2ddef7fc87ef1c2d205237b24"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb
index 348337f0d6..642246c000 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb
@@ -1,2 +1,13 @@
-inherit setuptools3
-require python-tqdm.inc
+SUMMARY = "Fast, Extensible Progress Meter"
+HOMEPAGE = "http://tqdm.github.io/"
+SECTION = "devel/python"
+
+LICENSE = "MIT & MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
+
+SRC_URI[md5sum] = "81454c26572e4e47911596ea065eb1b7"
+SRC_URI[sha256sum] = "f35fb121bafa030bd94e74fcfd44f3c2830039a2ddef7fc87ef1c2d205237b24"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

