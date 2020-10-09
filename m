Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.13627.1602249919176653072
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 06:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EUiUHixz;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id g4so9366934edk.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2020 06:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/+gqO9bafSNJ92M4sfMIqhjcUKY+4dHo27qkzN/EMmE=;
        b=EUiUHixzDEmFPC1e2Lmurbz0oD5zlCjpAXDlars4Y7fIxvg5FJXYGciDdhJSaF3ACj
         EE3Z9SnjXa8gUqGSzh/bxBJzaBoSm/cwOt3DSlY6EoulRYKMxnQQlLBTb6Q/7buvziss
         zNEQ5JG3dpUk7d3Hk1plq0sLT+JIb70LQnmAzpFNTpJ5vfzRW4HK7gV2bD6KfYhKsvgz
         94ayZb9cxVXKHyMIoTZG/LHR25rFxIeO6f6ua5xD1ctlZbtaun+lbXNTVCJScLMal5FY
         K90QpwhA9xHYL7XYyBNXbPdg/JrE/gxB+cZ2CNDMb1nDQeV+CIIKemldXP+wygUW9ghy
         CxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/+gqO9bafSNJ92M4sfMIqhjcUKY+4dHo27qkzN/EMmE=;
        b=Y4C8L+Uix/+9hxH/XtIxQQwQAwbE6LHCEr7++Sw6jYIaMcCw5czYqq4KSHczWcqb6P
         r/VxfNc4+ei35ChXyrwroabkc45kY9xUJWyJK2hWiBcZG1SU+Mf+e4x6vPk9oEFfAtgA
         oeT9cwfXSEc23xuroKIPw/x5Ra1EKXkC9jqC/u4h7D6JENY3s/tm0bpAhMjiXTmVrYlM
         BhhLo/UW496S7HW776obX/bglfFSxeezUAuJzho5NqqRhVQlwIyRu2SH+JqzTZ94SROI
         pyhyzmo+5rVYDo9frqYLlKpiLnAY8bMhoOV3Yl1cluenPAT/JjoD1yxua3HUE/zj2PBA
         rzNw==
X-Gm-Message-State: AOAM532+yB3FCs6as1qfB7wtb+nOmYLoi9Pvq4DK4olapOw6J4S31W9s
	7JsFvIxVE+Egth7YsCZW9oR9HYjSCN0=
X-Google-Smtp-Source: ABdhPJwvEZ5P7/0SiC3XbeaJ6zYURn+ZLtoZJIXgZo/A5SRZ7ESO+0Ey+N9BFVMFcHjwt/1fsURIog==
X-Received: by 2002:a50:e887:: with SMTP id f7mr10107248edn.276.1602249917369;
        Fri, 09 Oct 2020 06:25:17 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z22sm6330800ejw.107.2020.10.09.06.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 06:25:16 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] python-smbus: don't use trailing slash in S
Date: Fri,  9 Oct 2020 15:25:13 +0200
Message-Id: <20201009132513.3037656-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* see oe-core base.bbclass changes from:
  https://lists.openembedded.org/g/openembedded-core/message/143159
  https://lists.openembedded.org/g/openembedded-core/message/143161

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/python/python-smbus_4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-smbus_4.1.bb b/recipes-devtools/python/python-smbus_4.1.bb
index d146265..f881cf7 100644
--- a/recipes-devtools/python/python-smbus_4.1.bb
+++ b/recipes-devtools/python/python-smbus_4.1.bb
@@ -9,6 +9,6 @@ SRC_URI[sha256sum] = "ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a01
 
 DEPENDS += "i2c-tools"
 
-S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
+S = "${WORKDIR}/i2c-tools-${PV}/py-smbus"
 
 inherit distutils
-- 
2.25.1

