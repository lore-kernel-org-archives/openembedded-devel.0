Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D08C64ED9
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:09 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.8634.1676550486226938168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qYTE/X+8;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id ch10so1814170qtb.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFEHRJuk4cn9eu8kSmUNdIH03R+1WMOvllya4ZwsYUA=;
        b=qYTE/X+8tEb3ppUAA4ZU8J8Qx2YXNfREAySzRkOTVtGXoS9tpL+nSjj8hDXtcJzXED
         zY8JKOqQav+SSj/XS6oB4YX3/lgFDwzyiS0hJvi1Hpu7U7/V8VFH79FIuuD93bFnlDgz
         JjKV+3DV2pFOq7t8b19zN96JNZBfsbcM3BtnHOvHsQVi6ZHYlLwBWymckvP8nuYGdJei
         G0+7s+ZkDHW04ZOfCtadTJ2c8myG6Uf5H6mstWGmAWN7/rAaWivRgrDZLnc2TvDrjKCU
         xyR0HTzbrf73d2NtFmD/tN39XsKlrEWBJCOGeHaeYc4yO/hL3vu2vXq8imbLEvQsmlc0
         aqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFEHRJuk4cn9eu8kSmUNdIH03R+1WMOvllya4ZwsYUA=;
        b=iJiztmSuW7df8zGxFst0/Vzlm393LtP4EBm2jVOZ4gPiP6YiyEVnhrIFRMU14cE9RH
         y/VBhviS/F4s0zIJ/AMq4yhGR2S2nlP1oOghAP0pjwnSGZBdEnbMUWw/7kJiTR64HXum
         CraZ0Pgpj+haLgHOgY/bcGyKnSwjFdwsZcvR/PT7Rw6g7aAwlkLMr1PFhf0HS29zqgux
         TjmXov4Cmz9TfEmemgckLsPrZx1JFmfdh6UNGesgyB2CTnkKXsPhFNq6H5NwKsHMmN/q
         ANCA50mJuHhiZ1hLn/jRUYa14lZuJFu+tkhu4lr6woJQMQQS9Ba1VnHg83ulVzwtj9OQ
         2Z0A==
X-Gm-Message-State: AO0yUKUX+WiAJF4F3o8VOCKTL9RCniKuhDB7PT1z9wSEBx5Ca17QhAPA
	W1U90ag9x3b7hHtlLZYtV1ySTUk8dM0=
X-Google-Smtp-Source: AK7set/C26u0ptIIGMyOxUeTIDe/zMBxM0CMJCQkHPY0FtXNr5odHuSXtgZMMw2R93FfFqARkty5/Q==
X-Received: by 2002:ac8:5e0b:0:b0:3bb:7ff8:1977 with SMTP id h11-20020ac85e0b000000b003bb7ff81977mr9015218qtx.16.1676550485215;
        Thu, 16 Feb 2023 04:28:05 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 08/15] python3-django: upgrade 4.1 -> 4.1.3
Date: Thu, 16 Feb 2023 07:27:18 -0500
Message-Id: <47b3e40f7933465e2834f7307c27a6fd6a3fbe76.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101110

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1e4fd5514d2daf4b9b233bed42683aebc78d9fcf)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-django_4.1.bb => python3-django_4.1.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.1.bb => python3-django_4.1.3.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.1.bb b/meta-python/recipes-devtools/python/python3-django_4.1.3.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.1.bb
rename to meta-python/recipes-devtools/python/python3-django_4.1.3.bb
index 44ea5394da..6d800982af 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.1.3.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "032f8a6fc7cf05ccd1214e4a2e21dfcd6a23b9d575c6573cacc8c67828dbe642"
+SRC_URI[sha256sum] = "678bbfc8604eb246ed54e2063f0765f13b321a50526bdc8cb1f943eda7fa31f1"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


