Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3367DC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 16:26:20 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.27000.1702571173114336153
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 08:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7b724fa9d09so248003839f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571171; x=1703175971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pu16twnbBPbu6sDNxk1CPHbQGiHiIFKopG+BEOGrOc=;
        b=aGcPTgCLh/RHuCv2PdXdMucv9sAZkqiivxZgGaFQriBjXzuIjV59XUlRniRw09kzrv
         /iD51ViuKDoqQ/ZYlQwvMOBx1nxTvS1kcka4tAdcetO0Va9F1EAgJdQS9KIfHgF+lky4
         8r8LAYLjebcenHtgC0z8T9tnqE0M2aVHBOBPrINXRgh+LA02n6LZo8wkomw1lez698RX
         KayPnmqf7++ia/s7FffkwuMdypCtP2O3+t41eKCrn0RK+Od8yYOuSjE5vYlgVcfEGlx9
         lOue1QIResbL+yNoyDinPfekcw2lSOFXTZr/14xF8AYAVAts07i+fmbwoYLyD4W6wP3t
         y/+g==
X-Gm-Message-State: AOJu0YwRthMpbnzR7Zl6UrljijXzvIScMjuDp3dj8p+luYSC7Y6TvU43
	vwyxvaxl5GJqhfXfDPQ3SeK9bTMUdarhTQ==
X-Google-Smtp-Source: AGHT+IE+hl6yPy0DrzEm3TK3RlZICiu10lbb3SDhpP2d+qa40XJWxK13isgTaojJxdYFlfEL33litw==
X-Received: by 2002:a6b:a16:0:b0:7b7:cd8:7a6c with SMTP id z22-20020a6b0a16000000b007b70cd87a6cmr10430328ioi.35.1702571171348;
        Thu, 14 Dec 2023 08:26:11 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id r17-20020a056638045100b00468ff38f201sm3306225jap.39.2023.12.14.08.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:26:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCHv2] nginx: update versions for both the stable branch and mainline
Date: Thu, 14 Dec 2023 16:25:58 +0000
Message-Id: <20231214162558.1753304-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 16:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107453

Mainline version 1.25.2 -> 1.25.3
Stable: None -> 1.24.0
Legacy Mainline 1.21.1 -> Removed

Updated license checksums to reflect changes in copyright year.  License terms remain the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb |  6 ++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb |  6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb |  9 +++++++++
 4 files changed, 15 insertions(+), 16 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
deleted file mode 100644
index b69fd7dab..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.20.x branch is the current stable branch, the recommended default
-# 1.21.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=206629dc7c7b3e87acb31162363ae505"
-
-SRC_URI[md5sum] = "7dce9e2136ec32dfd823736e871815b1"
-SRC_URI[sha256sum] = "68ba0311342115163a0354cad34f90c05a7e8bf689dc498abf07899eda155560"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
new file mode 100644
index 000000000..2e865e400
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
+
+SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
deleted file mode 100644
index 66eef2389..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d"
-
-SRC_URI[sha256sum] = "05dd6d9356d66a74e61035f2a42162f8c754c97cf1ba64e7a801ba158d6c0711"
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
new file mode 100644
index 000000000..e893fc3a0
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
@@ -0,0 +1,9 @@
+require nginx.inc
+
+# 1.24.x branch is the current stable branch, the recommended default
+# 1.25.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d"
+
+SRC_URI[sha256sum] = "64c5b975ca287939e828303fa857d22f142b251f17808dfe41733512d9cded86"
-- 
2.34.1


