Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.289.1588631083491831053
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 15:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=asa4/mru;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: bartlomiej.burdukiewicz@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id j3so11358692ljg.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2020 15:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fyj6gbrQNPTlHTzWqAoI32R/X4uuFHgnWkLv78Y4Mi4=;
        b=asa4/mruOVBNQHyryFSZSpJtr+AQUGTAweBaZO92apW7TMHNo6zqFVy17UV+rgGQ5W
         Qly59wsXkoWehUk/ZUsJPEfSEmfUSBV8cBT6eYFiG0AYJQzCufBlqf3ol4uJBXf4HR5f
         YyH5Gh9RFqC01PFycnNEM9j7bVGIf3ApgAlpsO1f+cW/qdFlYnaR8mD6zA5ZtzhX3e73
         RVVDtPVei76ErR+ERhnx23+8QflZSeAGQWQd1kQ9adLQKhDQRPXiUaS68w2Spl54y25L
         MQHfE4YTSbdGeSIGDYyf6V5OubZ8MkChH1/sz/Moj2RkKqoAOV3W4ha1BXuZA+Gb5hT6
         TeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fyj6gbrQNPTlHTzWqAoI32R/X4uuFHgnWkLv78Y4Mi4=;
        b=FVR7qj+Md6/FZV0v4F7qM8jxOuulwg0TvcuND0o5X6kpt7Mq9hGk1F8KfJcaurfHY9
         LyrqjtbMYZZL0nFjfsGYUGkTvBjVWnQuMMPwH7BuxaJKWBY7X3V0dJVGVBGxqKUxsO3Z
         QhYYIsup1aPqqE1ZAZ9CF8KNV9ubQjio7tYfqMfF4yedgqaSYJwATTAjxhCT/tUmkUsO
         wXmTq/R0boDJlIOqrRwkDY2LNbUyRck9bUtXZe5coNqaweeccOVIGgl9tVim72IKDMOg
         nfUFqE6UlA3rurNlSBdWsXk4zwUmQAGEKzGsGs3Tl9Wc2BM4dAmW5MndptA8t0xRrJjR
         t+aA==
X-Gm-Message-State: AGi0Pub1E88OueaBeqMde0aq21rtfk62ntiIRiPVFPhP25ixQnRGarwj
	KmNPH796vaX8Q1l8LrbZJSIjYTpT19c=
X-Google-Smtp-Source: APiQypLBSwngNYiWJT6cTAYZOuMM0QqDIZXCC1Yy2fEoZKs5/rGJLv6otLdOznqOCjlby1r5QYn2vA==
X-Received: by 2002:a2e:6c08:: with SMTP id h8mr11125562ljc.48.1588631081539;
        Mon, 04 May 2020 15:24:41 -0700 (PDT)
Return-Path: <bartlomiej.burdukiewicz@gmail.com>
Received: from localhost.localdomain (dynamic-78-8-50-212.ssp.dialog.net.pl. [78.8.50.212])
        by smtp.gmail.com with ESMTPSA id g6sm147205ljj.78.2020.05.04.15.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 15:24:40 -0700 (PDT)
From: =?UTF-8?B?QmFydMWCb21pZWogQnVyZHVraWV3aWN6?= <bartlomiej.burdukiewicz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Bart=C5=82omiej=20Burdukiewicz?= <bartlomiej.burdukiewicz@gmail.com>
Subject: [meta-oe][PATCH 2/2] pugixml: add native and nativesdk BBCLASSEXTEND
Date: Tue,  5 May 2020 00:24:30 +0200
Message-Id: <20200504222430.388879-2-bartlomiej.burdukiewicz@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504222430.388879-1-bartlomiej.burdukiewicz@gmail.com>
References: <20200504222430.388879-1-bartlomiej.burdukiewicz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Bartłomiej Burdukiewicz <bartlomiej.burdukiewicz@gmail.com>
---
 meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb b/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
index 73ddf77d8..9a814de23 100644
--- a/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.10.bb
@@ -21,3 +21,5 @@ EXTRA_OECMAKE += "-DBUILD_PKGCONFIG=ON \
                   -DBUILD_SHARED_LIBS=ON \
                   -DCMAKE_BUILD_TYPE=Release \
                   "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.26.2

