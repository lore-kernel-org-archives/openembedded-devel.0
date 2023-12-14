Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80474C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 22:04:32 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.41505.1702591466540616906
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 14:04:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7b6f4ee4f7fso29325839f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 14:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702591465; x=1703196265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDI1S5h7YhCyolsPZx/7RwuQVcLwUJFT0MgYDSlP6DY=;
        b=lxYv3EcJDUucNMJDCroqWr5gewVgJp7QAHWJdABMLDjY2UEYVIumPtWMEoV0/g/gyT
         hhXybQ2qKNYG4arhgVL85tCf9ZeAXPnswDPGRd5Kbkpp4713LTPffW8X07QyTUxBB25I
         E3MoKASuzjKKSJCUbfy9lfLl/zy6I+/XiewmL1skzSH3gnhKXP3Q1a9uyX4zsJdstJlT
         HYCvsNjB4hB1xzrF3xIMRSGKAlvjX4M6FPIJjjmrqRTH2iRpQjj01aHh2+Or8UemWD1B
         BdBs3M2dScuwg1s7aIF80+4FAq65qhvovLcAxhzBKWxN7azLXDGYfH0SU3JavVnlzD2I
         jKJw==
X-Gm-Message-State: AOJu0YzoT6mhAaj6ACF8G1nI07GutSeBToAOwcFrSoftnRjQThQE4chq
	dTyWF9pUOqmrvTKF4pnIr4iMgdiFMLolGA==
X-Google-Smtp-Source: AGHT+IHiODS3sXI+VJMCbGtNQWj2hmVEeiv0w6yHp868paMiCrrN6OgLCWKA+dJKFAcdWuixXekevQ==
X-Received: by 2002:a92:cd87:0:b0:35d:6be7:55d9 with SMTP id r7-20020a92cd87000000b0035d6be755d9mr8439345ilb.0.1702591464662;
        Thu, 14 Dec 2023 14:04:24 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id b6-20020a05663801a600b0046662226e54sm3720510jaq.168.2023.12.14.14.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 14:04:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCHv3] nginx: update versions for both the stable branch and mainline
Date: Thu, 14 Dec 2023 22:04:08 +0000
Message-Id: <20231214220408.2366088-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 22:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107466

Stable: None -> 1.24.0
Legacy Mainline 1.21.1 -> Removed

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb |  6 ++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb |  4 ++++
 3 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb

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
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
index 8aa9fa026..d0371dd3c 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
@@ -1,5 +1,9 @@
 require nginx.inc
 
+# 1.24.x branch is the current stable branch, the recommended default
+# 1.25.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d"
 
 SRC_URI[sha256sum] = "64c5b975ca287939e828303fa857d22f142b251f17808dfe41733512d9cded86"
-- 
2.34.1


