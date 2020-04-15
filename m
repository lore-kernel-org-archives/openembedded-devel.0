Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web11.8190.1586921368153538201
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 20:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G8btqBu6;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id 188so863343pgj.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 20:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1oouysV/ZH0UJRYyN2K5SeRjoptRtF4hhgctCMcRNmw=;
        b=G8btqBu6u9x06LCogTjd5xbrR6up4fJyp6T9359QREWNzAmVz9YKtQ83FpeZFvmf66
         lR0hG/z6VipIO3r1pbXdMl0RjNhH4KGXBPrt2wuf7om9FWbPRwJY87YGr2A8BrAjqmOx
         4JzwnApZQQLqaqIA3DjikoDOqCcC4YDx5jb54z6NEwP/BOiPGEHjKdlcDi59ryB5lMkp
         A40Mk/tLSA6Dolm897gyeYqVSDd0BulXMDNizKZfnRU8xCASie+Yp16igGp2b/IJp9SH
         WZh61WsImhCQ1tRWrLev0G5Spafg8uiFJpPJfmrYEcKgN8b2J5kf0WPZl8WxddO1M+zF
         OlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1oouysV/ZH0UJRYyN2K5SeRjoptRtF4hhgctCMcRNmw=;
        b=bqstIgKNPoIpneoMOd3ZvnzVvzv0ju7hsnZ2gdGgYJyAKaPevg09k9mNTq/6LVkUcB
         z1PRWWMgCDuZCHKqONdeCMj6r4HYmVC+hlkbozgJGcBx9YyiBpAoFOMpMoBbWtMc9xvc
         FcKlfU7E7wg7Xtu0r6Yq88cHqAW7OURI49e2uHCi4px6G+hZEUh2gY7Q/p7DoLzsmNF4
         eYvot3yzusXf26FX2AkQkIU4BV9umSTungtKGf2JDQPJaqMXmq3CK+hBVIAVlDN9QyxP
         q9uj7mF7hqSvYRW0HJ8cXdrHvmw3IupySJkEtPa7rO4EN21rIPFoLv7JvMSEFV/nWJLf
         DYuw==
X-Gm-Message-State: AGi0PuYCLttb/6ZoJRbmIKNyehw7atwO9T0Kdj0OaHvNSO6ySlJU9+yi
	hHtKYjwswVH42+Sz/mCQqQVfdqHiEvI=
X-Google-Smtp-Source: APiQypKf7DQN1AXwd15xnVY6LffjELLDMCJBGYXPilPCvEiQHZrCrZ129Z+UMBsnr13y5q4J/8S7Bg==
X-Received: by 2002:a62:7b93:: with SMTP id w141mr4692687pfc.158.1586921367066;
        Tue, 14 Apr 2020 20:29:27 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:a097:5ffb:4a26:b07b])
        by smtp.gmail.com with ESMTPSA id y14sm3963321pff.205.2020.04.14.20.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 20:29:26 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python2][PATCH] packagegroup-meta-python2: add new recipes
Date: Tue, 14 Apr 2020 20:29:13 -0700
Message-Id: <20200415032913.30253-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add python-docker-pycreds
Add python-websocket-client
Add python-docker

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-core/packagegroups/packagegroup-meta-python2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-meta-python2.bb b/recipes-core/packagegroups/packagegroup-meta-python2.bb
index 9a8826ab..2cb57223 100644
--- a/recipes-core/packagegroups/packagegroup-meta-python2.bb
+++ b/recipes-core/packagegroups/packagegroup-meta-python2.bb
@@ -58,7 +58,8 @@ RDEPENDS_packagegroup-meta-python2 = "\
     python-parse-type python-ipaddress python-dbus python-cpuset python-distutils-extra \
     python-futures python-jsmin python-pygobject python-pytoml python-six python-which \
     python-netifaces python-configargparse python-sqlparse python-soupsieve python-wrapt \
-    python-deprecated python-booleanpy \
+    python-deprecated python-booleanpy python-docker-pycreds python-websocket-client 
+    python-docker \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "python-pam pamela", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python-systemd", "", d)} \
 "
-- 
2.25.0

