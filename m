Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.9833.1600425302638834675
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 03:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ldbb3J52;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id nw23so7426070ejb.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2020 03:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OiNhrF8GIj7O7sot7cehTJD7H5iGm+iuLwvMiWfEZgk=;
        b=ldbb3J52xn04aK2R17k8urIw5i+WiXc2lqEw/5sJ/FsVCrvRvnndm0jWx7wtrTxCvk
         kOfl3W7y/KoBrC9b5EexmnYaTjzO9dDYG9ZSafOlwzXlihxxsMV/BgEH2fHbWeZr89Zx
         xYdAwmyNa64rih4IMIasjYNbf2QVjYjLD9Tb6WpRccM2JjzI4OvsZbZihibJlY/lpRLm
         wgXErqv14DpmxpPs9yP1FZv2myw2l8gy6i5WbnRusEKitXsrtPCASotnjvywEDuGpb2F
         ICHL9hDTIsXQwkBSlbkWWiKUxXUAzB9IQtkdTVtz6qFarmkQbCjAOSjVkXf/cDXtulmM
         vzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OiNhrF8GIj7O7sot7cehTJD7H5iGm+iuLwvMiWfEZgk=;
        b=El0wWi3u16FhQSy90WeErC4M3K6irb3Ob0IJYRLrXaxPFgzl+j/9ZwxrQbZ2O6bUX5
         VS6jZW55lVsWQ/UwJFq1EoC8zXGJk/2IhEj71s1lGrZnEqzeJ4bY2wek+bG2IkP6nOZJ
         9VleoeHsPOtxOSiUdGSKbFlhPfxrDJVtQxrQEVyyswU9O+M/pu5el4LZpODNyb7+T1fA
         +2gevmdJlWDLgQgwsy4mAAyASVTMLYLCy+JDH9jr3q1lW7rhJoJZluHtiYl+PWLdBnsm
         bSgHSkcKZBhUnagjJuE+HHmllIptmABEaBZv8ONfgozGt0zA6O3TQwQ5BeC7LBQvHbfN
         D3tA==
X-Gm-Message-State: AOAM530EBMyRCLT6pgKFGOC2FatynDx+vnzUSojJ1xmw1iRNNiAnz+hT
	teCcjcpI42QnqdFhtFyJu3pC7wivh9g=
X-Google-Smtp-Source: ABdhPJzmvNbi/u6GMZnQBRXdjP4Bco/KTK7TXlA2JdfK/s1yAYjKgSPSwnCvPYdpoO5XYTCuWV/Wlw==
X-Received: by 2002:a17:906:3c47:: with SMTP id i7mr34437093ejg.554.1600425300951;
        Fri, 18 Sep 2020 03:35:00 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l21sm2020804ejg.124.2020.09.18.03.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 03:35:00 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 3/3] iwd: Upgrade to 1.9
Date: Fri, 18 Sep 2020 12:34:55 +0200
Message-Id: <20200918103455.370682-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918103455.370682-1-Martin.Jansa@gmail.com>
References: <20200918103455.370682-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Need this upgrade to work with ell >= 0.33

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.8.bb => iwd_1.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.8.bb => iwd_1.9.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
index bfbf3c7fa6..25500e6501 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 DEPENDS = "ell"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "a01754f56aacdc641c819f983c3c0ad374be77b2"
+SRCREV = "aa3dc1b95348dea177e9d8c2c3063b29e20fe2e9"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.25.1

