Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E449CC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 20:22:30 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.13562.1641932549840564236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 12:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ib/DUGrc;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so7465365pja.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 12:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kkroJulsFwLab0cxdBAuJJ3cwBZUM9IT2md4fN50Hl4=;
        b=Ib/DUGrcNHLsh/JK/IS28cNzQ49N40XPDcluu9igtuhMGg1I8zqbYq4aNz6lX+kXWo
         pDTj1YuqCZpbS+p0izB3qQ4cJz/po83wOKVYA60DhxsuBaph+dI8TUKXE+8qN7SYa1o5
         /hqLtnz1VKVyvUan3cPI1LdfT/7vgw2iV9bYbnr0cx3IKiHqiYS3HSY/6TLnG9I3xfha
         ks9lXGeCjX+a0OdizXn09SogZTUDMp8Y7ik/VyQG1+nUzZFUAEH/FMPn2VYzJDoqbrKa
         AGjwe91jIN7ik6A9vu2etAoSRESetKcgcXvIUHHC5CRLisO52o6QT8kOFumy95Btnu5f
         xo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kkroJulsFwLab0cxdBAuJJ3cwBZUM9IT2md4fN50Hl4=;
        b=3pjlOpDPEgb9ZZ/JQ5lxOjnoBkpzA4VTKJYOfy6Q3CmY7Xw/HgDYxbI39O6B8ODZ9U
         vOLsHFlsAV/wZytdkBqln+95YdK5Kx1hpug4mcJv3rmg8UURyZSVdQxNYlT/OXCZMpty
         l9V5scxp1nwLrk1ZAhMWQW5DUh01BQ6ss/WdSLPmALGvEXrT9T3RxNJyRJyeGIr9o7CF
         0BYQq9b5X6jJdi0wLBqRpWNvqmDmrMjYEPSBPjTgJB5UD4DmPvSmWE9J4DilbDaRzCC4
         BdvfeoSD1RzNhYTG3ykngViKHt+ZtQaBC9FrGgBqNOmZQa2nXXyswPZwrvzZh5AKNGJM
         pjqg==
X-Gm-Message-State: AOAM5328ussxPnwzOX8b9xxLAHkBNxIACg+akLM/kyL+ypTb0rcYM0Xo
	FKKSV8nrLlvIi8mOFFhtwBYmbNWXPvqCUw==
X-Google-Smtp-Source: 
 ABdhPJw5pPqdmierBKOLoFoEJkUwtYPjD94ApculfRnLVyEK9Pa5oK/vL04I+Yf4IYRWupgmRU0k8Q==
X-Received: by 2002:a05:6a00:14c9:b0:4c0:2223:ad4 with SMTP id
 w9-20020a056a0014c900b004c022230ad4mr4997977pfu.1.1641932549101;
        Tue, 11 Jan 2022 12:22:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 v7sm2378224pjg.14.2022.01.11.12.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:22:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-pytest-helpers-namespace: Enable
 network during do_compile
Date: Tue, 11 Jan 2022 12:22:24 -0800
Message-Id: <20220111202225.1526283-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111202225.1526283-1-raj.khem@gmail.com>
References: <20220111202225.1526283-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 20:22:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94758

This should actually be fixed in the package's build system to not
do the network access during compile task. Lets workaround it for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pytest-helpers-namespace_2021.4.29.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.4.29.bb b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.4.29.bb
index c1f9f96ff4..141f12aef7 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.4.29.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.4.29.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "183524e3db4e2a1fea92e0ca3662a624ba44c9f3568da15679d7535ba6
 
 inherit pypi setuptools3
 
+do_compile[network] = "1"
+
 DEPENDS += "\
     ${PYTHON_PN}-wheel-native \
     ${PYTHON_PN}-pip-native \
-- 
2.34.1


