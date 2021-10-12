Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFCBC433FE
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 21:48:31 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.634.1634075311161911699
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 14:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GiQlKje6;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so679921pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 14:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jIXLxQiOY7q2HKdOnRjbXVqMQMsGzkzTQxHZj+8aeYw=;
        b=GiQlKje6XKpYSbUlD1EW/OqUzA+6PBmS1LiNfG5sCrZnhNL5MFAoSWer7g0JJcvCo3
         fNCcNQ3kLACveigFtbqiurdDX+a7y0P5TjYKtGknG+9Cj5c25Z0QkSaA6VSxyq+dUxz+
         QBrpmODlXHiT24Jxrcf0KA69G0jDZr50MIZ+9ZGrIhECiBClJ1rDp1rbK3N6yavQ1dj5
         Isbr/mpo0Evs77COFfP6n4H8P3X/1Nm+Jlvs/1LLageMFvmpKViuTL6/ABPISquUVyaQ
         ZQCM3Vwv/xpHrH8wQut2QAUblnRDtkb7F9dssRP3T6iYpaE91KgpmxF6xTHdwaEpsZqL
         BpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIXLxQiOY7q2HKdOnRjbXVqMQMsGzkzTQxHZj+8aeYw=;
        b=nzceF+TedDA3bms+JBOO7z2AhE5WEPeer2JbiIkbwxprvszJvVu3WgoYt/lOHq4Mvv
         fsK5eLwdnaQ9Y/uUZAHOOKq1TddTZ5wbBT9OD3Bjk59iEidlidQvedc/72Ju4Fq20Df0
         7Wn6JMNsT8RmtTLmMWTK7Jhbu9TFkz2yvqHB/05fh5JjTtmJDmCTfglL7oKhEjzgaJPg
         at2yfhj5WgIXhZKo7VYo6PBN1KqeNpK4MWTTob4bsJeeBE28bUfGDlAGcLTZJGNBfaSM
         gQinXgi6uybxMxhqRl6kzjMFmlmWqYqkU20pdFYNJzvxxpsexeVYJMrLTYznZZGpsXIA
         T2lg==
X-Gm-Message-State: AOAM5332uHbgYeIO66xwoDTwMSUsx/5Ny3U0pMpKBpnbowanz3/teKPh
	WnKBhDYurefyjjek9e18xqkfnzVgthazlw==
X-Google-Smtp-Source: 
 ABdhPJw7d6GFL5+oXSUIau+jJbclcpjwDCQURHFAoAkkP0oCerpvAQXEEp/ykQ9zDDAEOVWrVK/JmQ==
X-Received: by 2002:a17:902:bcc6:b0:138:d3ca:c356 with SMTP id
 o6-20020a170902bcc600b00138d3cac356mr32314688pls.6.1634075310501;
        Tue, 12 Oct 2021 14:48:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 e15sm11555948pfc.134.2021.10.12.14.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 14:48:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] luaposix: Use lua 5.4
Date: Tue, 12 Oct 2021 14:48:26 -0700
Message-Id: <20211012214827.3477092-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012214827.3477092-1-raj.khem@gmail.com>
References: <20211012214827.3477092-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 21:48:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93258

OE-core has lua version 5.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb b/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
index 720e2eab8f..9a66d8fb28 100644
--- a/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
+++ b/meta-oe/recipes-devtools/luaposix/luaposix_33.4.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/luaposix/luaposix.git;branch=release \
 "
 SRCREV = "8e4902ed81c922ed8f76a7ed85be1eaa3fd7e66d"
 S = "${WORKDIR}/git"
-LUA_VERSION = "5.3"
+LUA_VERSION = "5.4"
 
 inherit autotools pkgconfig
 
-- 
2.33.0


