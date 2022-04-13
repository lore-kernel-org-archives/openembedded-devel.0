Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E677C4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:06 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.2916.1649828099766761455
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 22:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kNhKUEyK;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id c23so1080932plo.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 22:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RIDIwCV8JtbZDS9tiNBIx8cv8XMTb/MzVKeAXWTfTIo=;
        b=kNhKUEyKc/bBK9savBqHKEA7S/zlSjDboo59+Zk0aFACm0bzDN7wHKoC+r96y7RuUz
         nbsodyiaLltA6ofg1PaD8ln6SaFMbT8RhBLvbcSCpFj0wMgkHSYf8mhWl56X9/gAX4Cx
         zbNvZSjH3KNNqNjd6EQPu0Q0YFSWZMa5InkeH97I03j1XgasP2NL6G5uAcqKNpalspEE
         BAhNRgmMel3mr9Fr2JzMqyTJ37JTv+1KZC6dnZH10fGpFc1o89v3aHoUurN6RrF4/oMg
         Uq7ZUU4VH8ikjeq76BloYrrfGbVPT8+EohKl6zGOyqG0vXE70bDyN0hWojRXxQQPnjGE
         aQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RIDIwCV8JtbZDS9tiNBIx8cv8XMTb/MzVKeAXWTfTIo=;
        b=0toOyCNGgTsQj96rQkMI48pQw56oEqJCB+Wwj/dxa7NjwOlsQYEikG5bhh8E9pqJJL
         9bwrigbM0XxUynHnbGmIZxi+5kfgUt+5aFGqsCqrO+QHNte9QDC7TIQelSqieB+QLfpI
         oJnXTF318rBzNPw9Dbcc84o1LHl2WmGaG0X95/it8aWKWCEmCbJcpda/2yGNSCXkgKkF
         JTzuKWmWA0sdeYXoELAFyBjzXbwkQYks0DmWUfCk5rq4UFOAcuN0Z83RBbdrW3Nf/mP9
         Vxj8BG/nCWatBwDWQ2UG1zBbFnVzE+FExV/9bJiOR3X7IdwBdSxKcgC34G1BkFiu/QVa
         FcDg==
X-Gm-Message-State: AOAM531znmy3bwmYJzfyNTMn03MMnwFyES/L9deuaUkF0DPHHsEritB4
	VEfi/3TeUnrf0cKPILpiXClFXewBtIZtNw==
X-Google-Smtp-Source: 
 ABdhPJy8qMaSP+5I73rO2K8ULqC/IgdPO2gbvOalMAfmATm7yu32vk2RVmceIbkl5vQgoZgci6U55w==
X-Received: by 2002:a17:90b:1d0e:b0:1c9:b74e:494 with SMTP id
 on14-20020a17090b1d0e00b001c9b74e0494mr8860716pjb.238.1649828099057;
        Tue, 12 Apr 2022 22:34:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 j18-20020a633c12000000b0038204629cc9sm4733992pga.10.2022.04.12.22.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 22:34:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] boost-sml: Disable examples
Date: Tue, 12 Apr 2022 22:34:55 -0700
Message-Id: <20220413053455.1460109-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220413053455.1460109-1-raj.khem@gmail.com>
References: <20220413053455.1460109-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96607

They fail to build with gcc 12

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/boost-sml/boost-sml_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb b/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
index 97c04899bf..e22eddb72d 100644
--- a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
@@ -19,7 +19,8 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 # Building benchmarks takes a lot of time and requires additional headers (euml2.hpp)
-EXTRA_OECMAKE:append = " -DSML_BUILD_BENCHMARKS:bool=OFF"
+# Building examples fail with gcc-12
+EXTRA_OECMAKE:append = " -DSML_BUILD_BENCHMARKS:bool=OFF -DSML_BUILD_EXAMPLES=OFF"
 
 # [boost::ext].XML is a header only C++ library, so the main package will be empty.
 ALLOW_EMPTY:${PN} = "1"
-- 
2.35.2


