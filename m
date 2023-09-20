Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA692C04FEA
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 18:57:29 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.4223.1695236242340433921
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 11:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: straka.derek@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d8521c7172eso245284276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 11:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695236241; x=1695841041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vupliQOqtkM7R/yOQ59TcHuqY9FSafe0X3lZLaosllY=;
        b=h3I4SmdDmfn2s4ol3Fhdmt/6x1r+UycY+xmlM+U2hlBSMZNa/2DT0fFfExZ07M1lQI
         26KebpiD6Pa3UqhEiB2FTBNd8mV07xXkIMEYJSQ2KLe0V2M6D046gix8eUA4gerRa9el
         Q8OOZjPAu2CGbEqKvlLJl7LDyMMMEbbz1qykfJfK1/Z8954GIDwnyXeemnjKbqtGlGF1
         XBEHlo3QsBubV6Syg1QixFTW/cgOVLm/mJBrV1rVxgbVQWFiKLtG/Lo9VED5U0ZcXvHb
         jNiFTn3TOGHfE74lP4U76TMNlgRL+1rEHnEsrg9bVxH6nqV4GwwFsNsIRxt+LZeKczJB
         JQJw==
X-Gm-Message-State: AOJu0Yyk9yGNo9aHsAM1RE6moUbkxETFEiiZJuW+NEBU9yA1I29N6TmN
	8btHC8WriNsCi0lXTUdGtETbxR0scAYnOA==
X-Google-Smtp-Source: AGHT+IG2C/JRZB9Kl5CxFegB8B4dBeIC/lI7v4OybEQNjACSLkwK2ebWpfijPudc88hHmvvH1c/62Q==
X-Received: by 2002:a25:b910:0:b0:d4c:6b49:fed7 with SMTP id x16-20020a25b910000000b00d4c6b49fed7mr3337411ybj.45.1695236241091;
        Wed, 20 Sep 2023 11:57:21 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id d17-20020a258251000000b00d8140b7e641sm3351553ybn.18.2023.09.20.11.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 11:57:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-custom-inherit: Update version 2.3.1 -> 2.4.1
Date: Wed, 20 Sep 2023 18:57:10 +0000
Message-Id: <20230920185710.1334368-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 18:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105023

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...-custom-inherit_2.3.1.bb => python3-custom-inherit_2.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-custom-inherit_2.3.1.bb => python3-custom-inherit_2.4.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
index 8ff3b9e3d..478abbf1f 100644
--- a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.4.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f910a85a4c3da51edf780f17a7608434"
 
 PYPI_PACKAGE = "custom_inherit"
 
-SRC_URI[sha256sum] = "a0d104847b4cc1ae24e00061fc2e11da8766b019bf4c8c753822347366c8c49f"
+SRC_URI[sha256sum] = "7052eb337bcce83551815264391cc4efc2bf70b295a3c52aba64f1ab57c3a8a2"
 
 inherit pypi setuptools3
 
-- 
2.34.1


