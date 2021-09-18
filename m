Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.893.1631984274316122228
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VhvP5FX2;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t1so12943679pgv.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=c8h+yzrRIyStGm4g2ZmSBgxXHG0oqziVV6I2r4nuoZs=;
        b=VhvP5FX2dWIJ3AFjaAkgdSWMsNK2JTcaioIgnss+PblmpKn8jOlytCahC5CC4z3RAt
         MurZGtwkHD0kUsB2B/Q8HL4pYcAXGnQ8OuQw0kAcueQf421uxdsmf996yqlaIF8qudhs
         kg7q7LPZmPRjnJKXZosgofLC8hofSguMnDKggweGkoArv9TR2RUhAXednjDqPNog7ShD
         4DA5lgCUERrIBaa9Na2VfildEr4WOtPX0NbvXmv2oXBz4Lji/5in8m1S0cNyfYSBtb8f
         nmlPURofOJr/t283CXMVtMlySKnGl/So3ORxzL801PUZ5k5iD2owuvNWRbtKQgD93/j8
         EeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c8h+yzrRIyStGm4g2ZmSBgxXHG0oqziVV6I2r4nuoZs=;
        b=EbhCbrNt9jifepaIUiddb7J5Ftia1y9lhKExsPPvb5O+JNnULSKRFHM/+w8XfIxMfl
         ODWrDVnJ9ymWrNOkGTihRNYm/ePp4vD9m3qbG4PYJp4kzGuoFOc2lfISO+Gcr8M4e8G8
         TXSDHemkPUQjHeMv6+QTS3Y3MBIjufNrpgHJvxt/lQMMAb/6w+AhSCQ8MouFxXgY7Lk8
         2s4n9/GwivySyN5PJZK2yNvOH2iPIoL+UpOIUc8iSk/IqRfrkzYbNlTY6qpNuDGVKrvr
         QIoXX1yFfbUttgjH28r67KDN9o9V2jn2khY8udrzE9MR2E+sU2vJ8C3z6bpKX6g4f6aN
         CNRg==
X-Gm-Message-State: AOAM5307El3mdWb8YQZ10CwROjNdOUnrohe8/oV6wdIhEWr28ybKv4Ax
	AB2UQUsX+0nSW+B3jhwnyurQRRh/9pc=
X-Google-Smtp-Source: ABdhPJzpD+C54eiCpt7W/gZB5S/b+21duccYl4DUtUW3RK8EP2TFZXwAHcG2OOrjwsabxwzukGuiTg==
X-Received: by 2002:a05:6a00:14c4:b0:412:444e:f600 with SMTP id w4-20020a056a0014c400b00412444ef600mr16922617pfu.83.1631984273743;
        Sat, 18 Sep 2021 09:57:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:53 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 18/18] python3-send2trash: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:38 -0700
Message-Id: <20210918165738.2581429-18-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/send2trash/python3-send2trash_1.8.0.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
index 76f59e2853..963351a2e2 100644
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Send file to trash natively under Mac OS X, Windows and Linux"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a02659c2d5f4cc626e4dcf6504b865eb"
 
 inherit pypi setuptools3
-- 
2.25.1

