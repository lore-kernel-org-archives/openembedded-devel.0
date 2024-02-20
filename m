Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982CEC54764
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:10:51 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.6203.1708402243769111897
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 20:10:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W6YR4urC;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d95d67ff45so36551365ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 20:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708402242; x=1709007042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HAlSW0/3CZMSrROnQ7JrDWToDE45PUv4UVS0TrbAWY=;
        b=W6YR4urCyG3cc7Sq9VzWZGTb2DF4JoD5sBeRCJg4M+AKr/+gNsxkO+TUGL6rza5wSq
         A9SwYjj/Ykp619CVJJJ1eqisef6CCNsBn+GjC+DaZK1/KSqi40nL02MomWgBuGwAj70F
         MHIFfRIvnuAQh8crMaCal9FvCpQh+aVgZCduscqYVUWSzHb7fmkfceNY/ldygKQPJ/4R
         0jYjcVKl3br7JiWHTUbWzHj9qR/bC5Dw2dZalCAFq8PvvroHwW8xnGWLNAZBH8tiN8VT
         zgAOEWCPj687c5SRU5O/zAZOhtfhqapxWX+7p0DSlyMrWblsCXDaXMsq4rLq7mTnbPUf
         TF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708402243; x=1709007043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HAlSW0/3CZMSrROnQ7JrDWToDE45PUv4UVS0TrbAWY=;
        b=EWdk6n9XpG5SyWmpMYCrOYglgUvAzIkhChlHaen+MGoZqrtPxRzhHcdqG5dIta513M
         bTZ7qoZ6SrmR1C7jeQv9oWTvoYzX6pzPgikVSGiaMdJmrcvJtkupDezNMhPLSHQS7Sdu
         yzX7HSjXGXhlppL26vZLbf11uB8ytA0XBPeIDhdFSi4+2c0hPzDjvO3dk7ucPpG3MKZA
         8cLs4XbPWJKttoShLQT/rz4VTj6El455qokS9Fv1A52WZjhY8Tso0rl6inBbZJzsTXXp
         jiyJeQe2mfwJJB4xs4tudu8t7d8t4YWnQi9pb+ktVtl7fYHfQNczrtK759qqtq6H2mT6
         aspQ==
X-Gm-Message-State: AOJu0YwwdXKqcqz+/APwHrT8UFW1+kg0HMQu1+aZMX3/YvYbtRuaNOWu
	/QkHQKqlnqZ0c4fuUvGaAKvoMsnvMKDx2RGR7hLEagRTiB4XJVbUHGF6Pd08
X-Google-Smtp-Source: AGHT+IE6J105h3z/cZ4zDP0huyln6Q/EFlGg4gNuXDw/LxwItE2fnjaGgTWMTK70C7MlswKkevScdA==
X-Received: by 2002:a17:902:dacd:b0:1db:e792:bb25 with SMTP id q13-20020a170902dacd00b001dbe792bb25mr6748100plx.25.1708402242624;
        Mon, 19 Feb 2024 20:10:42 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id w3-20020a170903310300b001db45ab819asm5229733plc.106.2024.02.19.20.10.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 20:10:42 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH v2 3/5] meta-filesystems: drop ${PYTHON_PN}
Date: Mon, 19 Feb 2024 20:10:26 -0800
Message-Id: <fbde2f24429780321c5f02caac2f6051df8f0799.1708401702.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708401702.git.tim.orling@konsulko.com>
References: <cover.1708401702.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 04:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108904

python 2 is long unsupported, so we no longer need this variable

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
Rebased on top of master-next

 .../recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb          | 2 +-
 meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
index 1d07061ff0..c85483759e 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-pytest \
+        python3-pytest \
         bash \
 "
 
diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
index 66c35010b8..5e532ba7ed 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
@@ -29,7 +29,7 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-pytest \
+        python3-pytest \
 	bash \
 "
 
-- 
2.34.1


