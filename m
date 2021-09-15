Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.7957.1631714125813908687
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 06:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ieUAMj8n;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id w19so2689388pfn.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SY1oSu1/be9TU4fbU1e4ruQvH8AuH+EQPdD5THT0TYI=;
        b=ieUAMj8nQN7UXcw3m4ukPY0i6mLYJKjJEYCdCBKD3h/5hxU83MA04/f4ZA9LotPKPr
         O45efVDqlb7DYoW0P5Q9lQWgxRsKzhrZarKhRvbWaNhi+0U76Yqu/QoOqEac0oqS1ZCz
         hLQRXapq82W8yrB+XieIhvDcpcnGJfmQH6PabyhNkgL6b5r2mBt2tPT8NN/o5uoGDj9h
         g2mK4V+ry09wVw12NzBTRQjKb1zS7QK64rwslVV2Xo55TbUjyUsmryfu1cs3oOyclJbG
         i1H2IUpDX/c6+GEcr32uOd2qIfE9FwK+TRtErSNIkPnEQ8a5Irp4pIaiOV5m9UfhNrDE
         FFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SY1oSu1/be9TU4fbU1e4ruQvH8AuH+EQPdD5THT0TYI=;
        b=7guXWAZ+B4zNrd8HD3CtQ4PpYuNUwzBz3bB9kaEAQsuU9ozfO2iDzEW6+bZ8yCDFbS
         fp/+m+JkvLiRVNTSeoEri5Z4dsHSczV7sOMhZOP7YNeZ+7Z33U3Q/EHKFn3CIuc+J/Km
         wcrWC/H+BDyyD8/PxTwz19O+C/Bm0OciW/x2UbbnJGsXkySPh2XVSWNhU+s4bq8Un802
         l2fO+oIRnQt5eLS0GkdMIExKaFamKoOiytD6bXHLAJTb5Yb8dc6xghqc9NTzDXCmyGdK
         tIRtDveNF82COlKiC9hK/WiDNi0MAbD/VdlDWJi+3sOomnxJ9a43SpFusCmJ61q4Kui3
         C3pg==
X-Gm-Message-State: AOAM531W/LikavotVO/7aMvTFrMdxg9KHfss0PVQYGiwkrc7LY7OJPU/
	tk+bD1FH26B7dBaE5lHhGPsh5a3E2R0=
X-Google-Smtp-Source: ABdhPJxkTc/pK8PNdyQ+dzKxYhyAUh88cfG+R7J191sAzXgYRYEebME2UP7UTTb0981YWUNUQnVcuw==
X-Received: by 2002:a62:7e0c:0:b0:43d:fc6a:59d6 with SMTP id z12-20020a627e0c000000b0043dfc6a59d6mr9732266pfc.34.1631714125181;
        Wed, 15 Sep 2021 06:55:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:35e:ec78:cef4:300f])
        by smtp.gmail.com with ESMTPSA id v7sm4824941pjk.37.2021.09.15.06.55.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:55:24 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 1/9] wireshark: upgrade 3.4.7 -> 3.4.8
Date: Wed, 15 Sep 2021 06:55:12 -0700
Message-Id: <011f049c20c5b9967039373fd3e27c5c1c020f03.1631713963.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631713963.git.akuster808@gmail.com>
References: <cover.1631713963.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 340ec8b25eafe644ab760fd784ccef217b7ee864)
[bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.4.7.bb => wireshark_3.4.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.7.bb => wireshark_3.4.8.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb
index 2e0fdae63b..73ccfc5f30 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "6c4cee51ef997cb9d9aaee84113525a5629157d3c743d7c4e320000de804a09d"
+SRC_URI[sha256sum] = "58a7fa8dfe2010a8c8b7dcf66438c653e6493d47eb936ba48ef49d4aa4dbd725"
 
 PE = "1"
 
-- 
2.25.1

