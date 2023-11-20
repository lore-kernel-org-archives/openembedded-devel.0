Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BA9C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 22:32:35 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.18149.1700519547153070419
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 14:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=YQfn3MZ1;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4083f613272so23804675e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 14:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700519545; x=1701124345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUSGr7d2QJ049ikgyGy7KUG+2IZFbR8rPLQRlpWQBck=;
        b=YQfn3MZ1yB0LM37IcyH/8uewhfdoRoyn/3J8AVHRsH8u9PvDjvfjMUmxrM5gvTM1b8
         Y7Nb7/9NcNH2TSK2UwwmkMDKYp3JgR46nObwvRG6vUxzsx8a0LGkcn8Orrf6OnRgjeey
         BLK89lSc4nK4Qy7xL4Bsu6wOqAtPCoV/J9k/uyGUyXR6kUBLJhmlo/avlxgREOb50jO3
         6hNnl8ml9yWzTtujiKhHwoLubyOC8nJajlzvTGa6FX1wfJgQ9BHlBy3xV4bZpH980qaf
         +tdChuUaoy+xcU/UQ8r/HUN6VB98QVIb4NXu6cdyuyLzudEvWJ2Nx+UVUr1bWcOVGQ8A
         LWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700519545; x=1701124345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUSGr7d2QJ049ikgyGy7KUG+2IZFbR8rPLQRlpWQBck=;
        b=QCthly9m1uPabgdXduXrSfJpoo5U4L+ZwkOtk9QMbdVt/pPMkuYa2Hq+b4K8dF+KkY
         twvfLZ+YxnSCN1pnuz4/ciIUQh7w8Rr7cGC5GGb4Qgs2Q6LB2seWPr8MV+f9XjffE8qY
         wyWaIbpX1vdNcDdFjQve9tpZy5kIjy8DPei24jChlskkPohSrj3rxs7p7CAN+55RZA/x
         hSkOBmp8lt4li8qKJIBjGiXooIJQ0h48SbXBF/GRouGqAMa2pIYS12vm4YnAt+/M+BD1
         JCAN4hH3bO+4u/WlYKDXYXrMdJltsJiL1ceYNO7tzD6R9yGmUxi+CvtOwU5GxLBDOFsU
         wmOg==
X-Gm-Message-State: AOJu0YxYYhjxPAwSvhZE+1ZTA+oyREeLB1jVJxNTEIkjP/2QhIuT3xCL
	yx9PptxTzp6MwO0e+KA0Gk9kvtnO+kCHsg/XzOQ=
X-Google-Smtp-Source: AGHT+IF+4Wv6weUpGt8DHZsojhHDCnkChEgXuP86vKR3STFprjeFpzu8a4POVyonhkyE5mSDf+JH4g==
X-Received: by 2002:a05:600c:4ec6:b0:409:3f53:c9c7 with SMTP id g6-20020a05600c4ec600b004093f53c9c7mr6694983wmq.35.1700519544662;
        Mon, 20 Nov 2023 14:32:24 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id o5-20020a5d4745000000b0031ad5fb5a0fsm12470704wrs.58.2023.11.20.14.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 14:32:24 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][dunfell][PATCH 1/3] python3-cson: fix run-time dependencies
Date: Mon, 20 Nov 2023 23:32:16 +0100
Message-Id: <20231120223218.2397154-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 22:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106969

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the missing run-time dependency on python3-json. As a result we no
longer need to pull python3 native and can drop other *DEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 40b4cf5a83098a5f1be873be5c29f26380bc7993)
Backported: adapted to old override syntax
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-extended/python-cson/python3-cson_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
index 4d234d311..8e8f3fb2a 100644
--- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
+++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
@@ -12,8 +12,7 @@ SRC_URI = "git://github.com/gt3389b/python-cson.git;branch=master;protocol=https
 
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN}_class-native = ""
-DEPENDS_append_class-native = " python-native "
+RDEPENDS_${PN} = "python3-json"
 
 inherit setuptools3
 
-- 
2.30.2


