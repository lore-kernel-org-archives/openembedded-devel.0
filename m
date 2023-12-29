Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577EDC47074
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:24:20 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.155959.1703877859613577686
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7baa8097064so256139439f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703877858; x=1704482658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXjlFkGd3cjLkOn4qfm+T/nxL/Cu6gSxLkGzFLV8QRk=;
        b=UGbjHCwY9EODjzzL7y3H1eqzUzYEdWzwVGRk3ZC//w4ExJHVdTMXxPuCidEFCVHswX
         eheiro8bHeexmNdy4rmTw9C0zbDw1Nk/uu3VccROY/+IJ/uqcOY+ObS8fF7CuZiuDaKF
         P/B99YGAWFGCq+Ha0u7RNo9V/KCR9U8YJfVJglmNd9Hd0Q9X+Hob7bD0ajaWIuEoDZTd
         K+RcCT+RbTUbo7hlSQoj4ECNSfxEQ4Yk8x1HC967G68jeFj/HejIc8xrt90rb9Fvx3/T
         akGyhEEn2jTbWRD21XkEe3FJp6S8qExUHNyuqjr/Ltwe49xbVEdwHK+bQnHSWsKc9gY0
         ZCwQ==
X-Gm-Message-State: AOJu0YwtLFhF3Maiuh1bc8IqEuQWxdn0hFQqVGwE/5HaQMVqbj2rOX1G
	/TvMmLVwOkAbkzb0EewKFcSMij6VrYi+hA==
X-Google-Smtp-Source: AGHT+IEmWcmO2iQ/X9wC8KOuPtUc7yGdwIuOugF5vFKra3oWmIGt5FC9belBoL+yy2dBwBTRa9gGJg==
X-Received: by 2002:a6b:d816:0:b0:7ba:9550:8b3a with SMTP id y22-20020a6bd816000000b007ba95508b3amr12783858iob.12.1703877857903;
        Fri, 29 Dec 2023 11:24:17 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id cd8-20020a0566381a0800b0046ce5f7e87fsm4884599jab.136.2023.12.29.11.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:24:16 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/5] python3-engineio: update to version 4.8.1
Date: Fri, 29 Dec 2023 19:24:04 +0000
Message-Id: <20231229192407.2736363-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229192407.2736363-1-derek@asterius.io>
References: <20231229192407.2736363-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107901

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-engineio_4.8.0.bb => python3-engineio_4.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.8.0.bb => python3-engineio_4.8.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.8.0.bb b/meta-python/recipes-devtools/python/python3-engineio_4.8.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.8.1.bb
index 1cc79f1a9..f88a3acf1 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.8.1.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "2a32585d8fecd0118264fe0c39788670456ca9aa466d7c026d995cfff68af164"
+SRC_URI[sha256sum] = "fadc39c66348f96476d8dc2d7aaee7ea0a39d96e333217f5321300677b980121"
-- 
2.34.1


