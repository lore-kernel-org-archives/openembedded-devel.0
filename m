Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3229BC4707B
	for <webhook@archiver.kernel.org>; Sat, 13 Jan 2024 16:37:32 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.22137.1705163851238575879
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jan 2024 08:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e/+H/D2k;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e5701cbbaso21707025e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 08:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705163849; x=1705768649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nIXlairpPHNWwJpH6rWTOI2E2VntdsiPfm6JJZQrg5I=;
        b=e/+H/D2kgTQmqDGRlsxw7Twdjc0DeJG9MPWBRcjUtsNoQ42eGJQQZnIa6QS+06C2nM
         ZH1i9k/F/UQK1Jb3FhSl2GRLY94Lvb5hgwZJeEOhPxaJ1ltiIZLkMDxLNS12+C1BiPR+
         FObbERVcC9HZMUdpdP2OCgFgo8ZhYTPzefiqBpgY0OPUjydHTNMoYtiBaUC1wrI0C2fk
         i3GbAnXJPnDT1Gwx6c9qU1m4tUytFTVwXTdcn4zv5YRDO4hMn8LEmKqNwzsSheXlXint
         3lHnPOCUIsGSOPFx0qKRfSg5YHbZctDFM4a7hFG9yJCALfFD+JaT9UA6oyN1j0ojNiB3
         8zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705163849; x=1705768649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIXlairpPHNWwJpH6rWTOI2E2VntdsiPfm6JJZQrg5I=;
        b=sQoVNaDD89fSgVKl8LWXPqVRHzHiR5542hy6HMMqdBQm76uGoh1OhJHwCff8dfsD9J
         aAVNlkCi2i1RYxcQynTsDb4hv+9wrHOYr80Q7C+llhC6B7tImswy0wI6BqafLWn+WdWZ
         KjhJ0j4TPT0ko9Jdq0HDqVikU87tTxwAhmCUgwug7LrqcpGKeo51StPlk6jRoR0AWF/0
         mDmDua8NP5YuL8IWncFeq0KptucOS7ZyV5d8i1vChoCpKAdV7485sJLbfognwnQZMuGT
         mjUqayD8hLMu8BVTH4qCeZjGQMIll8OdxSqoc6A6AovhpH0XPBvkZgu1uDuA3vWFUPTJ
         B3pQ==
X-Gm-Message-State: AOJu0YwkcJO3vjQJJ6vXkmbuFBYzr+VTTmKZpeGRgFo7LOYKZMMdoli7
	b/g6nmupdwzqRzFG3zOtKxZKw4msCd5VvQ==
X-Google-Smtp-Source: AGHT+IHV3DIdI6dV7Xi+b+i0O0z4B7wq4aBYY8rhp81CcpTcMajgdm0nCLJfqBhGy6y0GgBO4ZtIpA==
X-Received: by 2002:a05:600c:4fcb:b0:40e:45c0:ad64 with SMTP id o11-20020a05600c4fcb00b0040e45c0ad64mr1578225wmq.14.1705163848986;
        Sat, 13 Jan 2024 08:37:28 -0800 (PST)
Received: from localhost.localdomain ([176.33.66.82])
        by smtp.gmail.com with ESMTPSA id j17-20020a05600c1c1100b0040c46719966sm13812808wms.25.2024.01.13.08.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 08:37:28 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] adcli: use https protocol for fetching
Date: Sat, 13 Jan 2024 19:37:20 +0300
Message-Id: <20240113163720.965972-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 16:37:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108266

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
index 609282394..c5dcccbac 100644
--- a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
+++ b/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
@@ -6,7 +6,7 @@ SECTION = "net"
 
 SRCREV = "8e88e3590a19006362ea8b8dfdc18bb88b3cb3b5"
 
-SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


