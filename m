Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.247.1617899789079971467
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C7a7HKSZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id m13so2757761oiw.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VDH+ISROFChO9Ggph/ksvSVqKGzeD8QmEeWXp0qIH8M=;
        b=C7a7HKSZOKByS5sUFvA/5ky+yg3fnoZ+qh5tOjvvVUlsedTrkwG7j3r9YTD78qVSO/
         SlngRLrh/5RljfZURQiOX4hJ8aCqhW06scxEeHORnyOYMA2O97jWLMki2aWdzbiS4uuB
         TbsfsD5/FGu8llMgOtPVJenRQez5jeNrUeWAgQhRoBXTE5MMpcWmDDxxPilHbDMYbRRS
         lb3QqEo07AtwjJQxd555agmtRnhZAsBMF1A0hMOsODgclGpoCIOVsWAX+L9srbaAzOt3
         Nxf87CCg6QaiAwg8lId5friFSM5B08jHMbH4/3OnCaWzVWYwql0CeF3bdD19rURKPzN4
         uLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VDH+ISROFChO9Ggph/ksvSVqKGzeD8QmEeWXp0qIH8M=;
        b=Eou6XLJPHqUuK1zcG9tzXKIs+CMsn2wVivW/WMs8Svcy0aIOttdKknpmZxAf+48CV9
         gmMWla+4PyH4Yj1TDgFtn/gzy5kbvzQDimxQTd0/acbRUpVM7FH3JUisl4/YX0dkqjJ3
         BQe/6f7PX1NxlqpBho/benKYVcxMyICKunURF6v8hZ0WEAY+c7/Pu0eeu8EVfNPb8C5w
         2PxaCa87uBAG/l8HLZ6tDA/Dj3LFdGS6B4KFqkZ1ajpyQm8G1y+TZoMsGLmyQRbrForh
         UwuyilnARP8bRspZdJ5oLMWL1j+kKke1DZwpmsZy6V1yW/v6h3oBJykBESYmZKhMTLxR
         IwaA==
X-Gm-Message-State: AOAM532uVlKPvNF5NStuwXcZ67GnKZ2pUEWY2TEft3Q/9r0encqn74mp
	TPFZRNZxhW91JHpk5PL24WOvd6iBEeQ=
X-Google-Smtp-Source: ABdhPJzt7vWuhAwHQh1GqtMUziEDslb4HfRNjI56NiSSWAdfH3DQdOa6YsNnAozIp/QFDNmvrelVCw==
X-Received: by 2002:aca:5ec6:: with SMTP id s189mr6846749oib.112.1617899788321;
        Thu, 08 Apr 2021 09:36:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:27 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 16/64] python3-httplib2: Upgrade 0.19.0 -> 0.19.1
Date: Thu,  8 Apr 2021 09:35:23 -0700
Message-Id: <6b42fcabeb21a9ff65a5b8f0c20bc601e5bd1fe0.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.19.1:

- auth header parsing performance optimizations
- Use mock from the standard library on Python>=3.3

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit ce5a70222c3951a1ca54d767f7badf363e65a8f8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-httplib2_0.19.0.bb => python3-httplib2_0.19.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.19.0.bb => python3-httplib2_0.19.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb
index f720723a65a..a16f8d9d202 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "e0d428dad43c72dbce7d163b7753ffc7a39c097e6788ef10f4198db69b92f08e"
+SRC_URI[sha256sum] = "0b12617eeca7433d4c396a100eaecfa4b08ee99aa881e6df6e257a7aad5d533d"
 
 inherit pypi setuptools3
-- 
2.17.1

