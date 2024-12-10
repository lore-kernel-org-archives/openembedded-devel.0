Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88370E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 21:34:27 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.4721.1733866457250805598
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Dec 2024 13:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a7e108b491so47275775ab.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 13:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733866456; x=1734471256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/VXTyRUXcudvE1TxWLObf6w5z+A819ZJHKgdbmR8kI=;
        b=gzELoxOlTEulApdpbRD4DwHKekwH/PtZsNugKgiCM1IHfRgSu/P56+qEnw/l96kEMJ
         MIGPmK8sCOmMmUt4YCl9taGxnoSyfsbwkRoUT2Vekq+jpyVMXLSGAwMDKJ43lgXjaC2o
         i2BW6ziisUY1GjlqvIaAjcKnNaCz1dVvFbzTD3Qs228PPnYEFc3ZKhJQghBsYCYOk4y3
         u5RZnZAGvX6r+gPMwLFCRa5IaVbsIqB7oYG7DqrmLH59EaPiEExX94/gXRi3+YtdRWgz
         94HavH+GHiVZySzxVXwfvw/QbceDLbZmt8+vRY9+sDFD9tYS8CWYU3WvC6z70IF9+h5+
         9lhQ==
X-Gm-Message-State: AOJu0YyDXt2hRj/rxLfRnE3VHLs0Se50P39ObKRqJ4Qt15CsmJu0K7B0
	YH45eMTLlFK6YcMWYstXUW6ZYr7aTQs1pZaRdRW1WUUoykoKlXAJhkMp8g==
X-Gm-Gg: ASbGncvQ1+fMYXj9+wLLPKyGkzZaEblMWf1Ehib8sj7Y6W4UkYkTq4LdQ0qZxhNxX4z
	l33DN8Obu/Ng+n8SmdE7t+EgtS0juLA7a86jkhlZS6fNfKuh7Ir4rJqhNHHRTh+jb0p3aDwvFc8
	3d7sVZvxGTiqbehb2VvyhFKmS+pf+EfQhnQ6gZxsADd3wI/4nK5Pmi2rHR0RB6NG4n72RROaHis
	tqPk+IkYxP8M48wg2rECWrs1g7pP/jI2CtqlZZsBMupHaixT69nPLsocJBMUwsBbK+Pf9vBRLRb
	TsUJ4yQMkMBbZi+quNPUbCc=
X-Google-Smtp-Source: AGHT+IHcGlxaz2HJ87e3Ie7azRmD3Jd9xQIaID2+8Qqu5LztFA9s7Ab/Gi3RQkr5jT0xj18hhR8L1A==
X-Received: by 2002:a92:c54d:0:b0:3a7:c5c8:aa53 with SMTP id e9e14a558f8ab-3aa06dd708emr5406535ab.13.1733866456107;
        Tue, 10 Dec 2024 13:34:16 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e2bf67d0a8sm1315781173.102.2024.12.10.13.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:34:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH] nginx: Upgrade mainline release version 1.27.1 -> 1.27.3
Date: Tue, 10 Dec 2024 21:33:34 +0000
Message-Id: <20241210213334.1489570-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 21:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114265

License-Update: License file negative and empty space changes

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.27.1.bb => nginx_1.27.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.27.1.bb => nginx_1.27.3.bb} (53%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.27.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.27.3.bb
similarity index 53%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.27.1.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.27.3.bb
index 5927ecab0..2f1bfa3b9 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.27.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.27.3.bb
@@ -4,7 +4,7 @@ require nginx.inc
 # 1.27.x is the current mainline branches containing all new features
 DEFAULT_PREFERENCE = "-1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8323c46a4f3aac555a90caca346bb3d2"
 
-SRC_URI[sha256sum] = "bd7ba68a6ce1ea3768b771c7e2ab4955a59fb1b1ae8d554fedb6c2304104bdfc"
+SRC_URI[sha256sum] = "ba23a9568f442036b61cd0e29bd66a47b90634efa91e0b2cf2d719057a9b7903"
 
-- 
2.34.1


