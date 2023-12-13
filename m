Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9BDC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 22:25:43 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.2606.1702506338176601976
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 14:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b6f4ee4f7fso748839f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 14:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702506336; x=1703111136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idAdmjb9n99scqU0gQEON8ggbFfWn5g+pTXJCPQM9mA=;
        b=PF2khE2RkNHE7w+o4TR6o1LbK0G3D3SP4/bxdu3m+FRY+soZcaxhf3r93Py0kAAHIS
         jdJ7vmqH/1mQ4KqdjoW/jPhnWJLm+PCsIma9j9jNsdPoVy4RLpSUn0H/bi6OUOzSVjAL
         PMDHYnjKx1TPHIAGLz3+KiCJFALxJrm5LUpBnVpwullAiDdn1C0k87FXqALDJ4e0g/3d
         J7X3fFzWIB8gixWCoYaZkOntjK0meoXsqv1bNPyFk9xDIBaZsl31uzfns5df7veVKjUq
         +qC210TpDN7pxicobk5sO/pYyrV6UFiRq24wKoWhzR6P3qzcnuOSmg/GGsWrX7t9Yitv
         lXNw==
X-Gm-Message-State: AOJu0Yzk99rgWPpXFqZTJ4Il0y/KGPT0644KsskzJHKaZOoy9+rOJPpD
	wV0YdcTnAdbZfqN/udfU+fvS+o28NXY11A==
X-Google-Smtp-Source: AGHT+IHDTl8SNPZQXEo4rS7iZwSp3TUueG6ufR7DyE/f+GEcYM5IzUUuUr9QiNlqysCwhLxft6vt1g==
X-Received: by 2002:a92:ca49:0:b0:35f:7986:ad50 with SMTP id q9-20020a92ca49000000b0035f7986ad50mr607200ilo.30.1702506336412;
        Wed, 13 Dec 2023 14:25:36 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id cg2-20020a0566381bc200b0046675345998sm3118132jab.96.2023.12.13.14.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:25:36 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-termcolor: update to version 2.4.0
Date: Wed, 13 Dec 2023 22:25:16 +0000
Message-Id: <20231213222516.1124207-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 22:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107400

Changelog:

Added
  - Document terminal colour detection overrides (#60) @hugovk
  - Add support for Python 3.13 (#55) @hugovk
Changed
  - Improve isatty check (#56) @XiaoliChan
  - Improve typing (#44) @marcin-serwin
  - Drop support for EOL Python 3.7 (#47) @hugovk

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-termcolor_2.3.0.bb => python3-termcolor_2.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-termcolor_2.3.0.bb => python3-termcolor_2.4.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-termcolor_2.3.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_2.4.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-termcolor_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-termcolor_2.4.0.bb
index bbaefc7ec..212a29351 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_2.4.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e5f5f7c9b280511f124dba5dda3d180e"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "b5b08f68937f138fe92f6c089b99f1e2da0ae56c52b78bf7075fd95420fd9a5a"
+SRC_URI[sha256sum] = "aab9e56047c8ac41ed798fa36d892a37aca6b3e9159f3e0c24bc64a9b3ac7b7a"
 
 DEPENDS += " \
 	${PYTHON_PN}-toml-native \
-- 
2.34.1


