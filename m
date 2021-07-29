Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.17222.1627601826202901291
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OICjzz4p;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id t21so8788853plr.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rRDst6infKBC5/zhorUKNlDLCRHXVdbipeN97OhGH1U=;
        b=OICjzz4p89ZH18DYjf14isTEbFlfyVTwQgAwQmIc9V08b1+70Fug/dQD9kG+y2TiCF
         W6+OgkUkokliXqIf/uOURqJukJKi4NYKHWYe92J6dGv9a/69TV4PoQVqlH3ciVtU5qvT
         3bIMNaDxIu2DszWAZRkX32UMhHtV723SWWo+vWpnogK7VbNGZyNlWJ5QmqK3cI78jocX
         ADuUaaPjdu4NHg4VpWz1ML+vsDLWqLf4cx69/+90Jkls+3NFe+B47i/ZL0aBbM+hsVo2
         9jyBk+XOU98AUKgYxRP2u+bKLzSqmGiE9Ca3/PbiO1YcOcn0oI8rfQMybcvTsZLPbAa2
         UKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rRDst6infKBC5/zhorUKNlDLCRHXVdbipeN97OhGH1U=;
        b=tWFjNfnBCeo20qV6kppa21S57nXmf2WktYq5w2pWy5hoV+jW9g/WVxw6j387/x24Xu
         R3H1kQOtZ+N6HIshkYMMegwJeAlO4oaSgCtooRZGcdHAeAZ7dtgpUHm2nqgEUPD//orA
         NdzWLc+pWGnwlE+6qiRFweRL7Rdz7aNYo1VP3M+wgroNvk9Jc2xVc9oghuEEWUogCx7q
         Xfygevutt/1vf5M02PFE2+LuaXCxrDh64FB7JxETjET9AlyVO9cSDBevSPDaR0eN5D1o
         WQfRPYr5sC0vvs88VoGvAFQknHrNh9BgkAF7hObx18fX6MT69KPYGnNwnJVIHfyKuWqf
         ZJtA==
X-Gm-Message-State: AOAM532wvu4jJXT7hgv1v+I3OinhIGlR5yldA+gOtk+/EdTyFbPALjta
	amAslK3MidgP+byDjgxmEhNhFmdSKSzIoA==
X-Google-Smtp-Source: ABdhPJySoPH+Nv3rjfXOmz8D+eOojexJ5N6r/BiHrNksk9gE1qTGWiga0dw67DiGfJqNjcmKaJRPcg==
X-Received: by 2002:a17:902:6905:b029:12b:8f6a:7c60 with SMTP id j5-20020a1709026905b029012b8f6a7c60mr6743024plk.24.1627601825716;
        Thu, 29 Jul 2021 16:37:05 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.37.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:37:05 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 14/15] hiawatha: fix url.
Date: Thu, 29 Jul 2021 16:36:47 -0700
Message-Id: <76a6070e6886fc7d623742bf0f7c4167b8b8dae8.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

files moved under a new dir structure.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb
index 89910841f6..f0be75f5d3 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb
@@ -6,7 +6,7 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-SRC_URI = "http://hiawatha-webserver.org/files/${BP}.tar.gz \
+SRC_URI = "http://hiawatha-webserver.org/files/hiawatha-10/${BP}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-- 
2.25.1

