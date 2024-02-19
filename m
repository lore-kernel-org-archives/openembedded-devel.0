Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588DAC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 19:23:37 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.3063.1708370616137383585
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 11:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iRpUGTG/;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5d3907ff128so4157647a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 11:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708370615; x=1708975415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6hva6QxH5Nl6DQfneFuc46vSWIRCZI8CHPLkKVgCxo=;
        b=iRpUGTG/T4oEWf07gynPGWZR4PXWvMGF91+fSmMxGB8YdQJUZAVKkwyOF8FhcbFKqr
         DZk1dq0wFX3TDgfZh4LGQUKnJGI/wNE9Expy0SsgrmqxAxRGSsZCXYyBeFL7zrJXdcdN
         h7364L4skwfbbDNfxFJgVTH4wUWem7B3cfKes1c956t2tbwg0woY1JuAbFeXcMQCB30j
         +5HECyrzOqsQy4dHv0yFcSqXOedKe06XHi4xVCRLoQDdQ2CEMeln+jsks7K13C5NtNZQ
         tbw6ufZFJB9gHBkkXRLeHqhjVSpPDsGBXvQ2Jt1cX9LWl04TVfhpxGYxp4pXg9KbNpA7
         WJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708370615; x=1708975415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6hva6QxH5Nl6DQfneFuc46vSWIRCZI8CHPLkKVgCxo=;
        b=ngR4CaRUOOjpJk0drBaNaMhSd9CAsjYTbY5mftnmzeTYsVR9zyQ79nXK7HqrPUc7aT
         B2kx7wMN3s6xGkDkDBeUw5LJKG0Tm0igwPbijlsJYntOReVWKXS8GfhHf8y2lA5l8wKG
         Aog0HwcKEVR5UMaoMWTQhUQ70IXiXaojOjlFKf8iG4l9BSj1DprtsiYQrhnyxPiKqHly
         prq44++JYWI8OwN0w8PM/NwswYNDxbO930KugrYf6rKa9n2sl/61jMjFxOTbkdDAel+5
         +XaNjIXX6niPijU+dELjFzCK5eWL6uUoOL5eNXMZQRC7EGS1fW0bEHXzJcrQcLh4UYWj
         +cOA==
X-Gm-Message-State: AOJu0YyxO48B2MiIVh9Rv5ecY44fB9ozj6QqJGLEUKdw/8+Kpq3QhEsg
	vipwMPGc2pNcQyz2+nV6bOS/zxqkQK0PA9B8XvbPCkJ8YsBJGSpn39CipJjF
X-Google-Smtp-Source: AGHT+IGoQVr+Q0+0zqL+DzgyOuSpFtHkqGB2wLMqbVdKNTheP67X5vFy36dqCaMUJ3JinPoUu7THsQ==
X-Received: by 2002:a17:902:d542:b0:1db:e7ae:e2f4 with SMTP id z2-20020a170902d54200b001dbe7aee2f4mr6277803plf.51.1708370615134;
        Mon, 19 Feb 2024 11:23:35 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id u10-20020a170903304a00b001d7222d8caasm4797723pla.50.2024.02.19.11.23.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 11:23:34 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 3/5] meta-filesystems: drop ${PYTHON_PN}
Date: Mon, 19 Feb 2024 11:23:17 -0800
Message-Id: <a3461bfb3fe0b052f0501409efae6913fca86678.1708370337.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708370337.git.tim.orling@konsulko.com>
References: <cover.1708370337.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 19:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108882

python 2 is long unsupported, so we no longer need this variable

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
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


