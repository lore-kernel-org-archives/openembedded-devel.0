Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.11478.1629036402127641130
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T7NkCLS7;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso16650074pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+Q8MikAoCit4ydmBsYOV1dMMX03rpcd0k2eKGBqZQAo=;
        b=T7NkCLS7mBjoURSrXhzcXB8bAl1LSSxLAE3oWSaFN20hbdpViyPKh3eGaN6Kl4f6yO
         n4X6kvVWyy9xNcT6vUMIEDBWMh6rkeoXm5UbC69WzqxTYjO/Nxp5ijfnxfCKnz0/pCeC
         CIGa4RJE68GSIX19/D5wZllfUY9qMB1Z2qZh3yiUMxQj9nNWebcd9QtKcM+6z4acWitp
         8bSmytUbjVq3Y1DK5z//6ztVKuEkX5hYi+qzDM1N2i7r3JCoE2i2b29ttsC+b6CnNlWN
         8SG82ZhDCO7DRJIcQVCxfLsDeyEKl5WyN2r+LEWJP5LV07lPZmpw5b7AGOsUhOcWu5d0
         uCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Q8MikAoCit4ydmBsYOV1dMMX03rpcd0k2eKGBqZQAo=;
        b=Ns08vASW6VQXLTJHpM30gEe2Dc7Wyi126axaTFMMD5s0Lu1UTUPhEBSd33OptBSoX7
         th27TlQIeMM++8e7k1K/1VKpKdpB19D9oVO9gnzWVqtCTkWaTI92kWLQnhcXmp0qMUtK
         m47RBcN3naV65EqqRSxnX9ViI9JBb869NMab/NDwax3vQ2AdKAGcCVovK57mtea5zv5g
         czonPFu/onxO5/boJw1RYNfeMSmcdk7Wxnz3A96AQpZ2WHwP6eJWbFgowASVEac5WqEr
         VsM7xPYA9UAVPbaFfSC7ouSr5CWCE8gtUJgNH0caojig3wlKZcWzG8wfQ6Hb/zWmaY47
         FYhw==
X-Gm-Message-State: AOAM533nMQmArE05ug4y6cyGMyGaN5ZpdtVAc+0Mi2dfmR7O4cBMiG4D
	Xf7XtPVe980nNq6200aYduPVaLkTjJ1wIQ==
X-Google-Smtp-Source: ABdhPJxudn0SCV0qa3eOPJwR6u0gh7AWBQ9p0QeEvq3xYG4PBaricSeVGvkgrzFC1ULhIQgJ1JUUiw==
X-Received: by 2002:a62:1641:0:b0:3e1:aa47:f0eb with SMTP id 62-20020a621641000000b003e1aa47f0ebmr2621876pfw.58.1629036401610;
        Sun, 15 Aug 2021 07:06:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:41 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 01/18] wireshark: update to 3.4.7
Date: Sun, 15 Aug 2021 07:06:13 -0700
Message-Id: <a473f6d52dfaf30a065b97b8454c865add93743b.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stable branch bug fix update. Includes:
CVE-2021-22235

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b68fe48192f0e029a1ca60a8f72199fbbccd3c1e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.4.6.bb => wireshark_3.4.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.6.bb => wireshark_3.4.7.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb
index 6acd849f89..2e0fdae63b 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "12a678208f8cb009e6b9d96026e41a6ef03c7ad086b9e1029f42053b249b4628"
+SRC_URI[sha256sum] = "6c4cee51ef997cb9d9aaee84113525a5629157d3c743d7c4e320000de804a09d"
 
 PE = "1"
 
-- 
2.25.1

