Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2300D3F288
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.30083.1729278812777096138
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jkWsbmk5;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e29047bec8fso2843638276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278812; x=1729883612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVqoZ9ZMl7AQGx6dC2+PIBsTtRQRP4fzY+8lwXJKbqE=;
        b=jkWsbmk5mwDMTz/LKQPZz7v0WQmOQRjxUhlRr/fEa2X7z/RUjg3Qo10JOeWoKMwNGI
         B7NYXbNTn4ih35IvDc0Wy9cLf2gsZMR92qWWUfCijOv/5XDLWf5FkxZxcpXlm7N07r1b
         P+uV9q5uMP2UDprmYMWzqJC00fA6sYKoW0ZMTr6WC5KKpU9D03dpH4dwOsicOTIbn6PY
         ooPXNKYAyLDGmQxpgHT2k6aS7hGL2md+pQfeX2J8mTgjbaoIrdZf0y2OyFBdHYvZOkkE
         lyCQjdcQ3Gk/KNFt7RJ9kUq7SGWx+SWy2rLTska0ADtItuzcnm71FeWY7qNi2MjGRpjE
         jOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278812; x=1729883612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVqoZ9ZMl7AQGx6dC2+PIBsTtRQRP4fzY+8lwXJKbqE=;
        b=lT+MKIL7R15olGWkQXyl82px8FCVqPsNK0DP5uKSz4KtNZsHMMgU5oRjVrJia2qVxQ
         EIg9T/FjjVo2ZDtukxDblPGUddEQh5reHm60kSXi/vPT1PkIgVegnFaE0MrMW56rdWSp
         Jq5SXsgau46kvU55+Qp4J1lpoBlSMyVoHTdHSlENdTclJ9JiEwTOjtxFqIU3e8pygCjt
         K1BTesqtq+OytCrSJTWNUPRo0tBawrfCRwJeN5K5QhDxJeh5yHI26GjtNrkOybouIwQJ
         rQ1N8lWr4+We0Gy2f7kTSSKOuuguiDUtGycaFv7QEkJ+jfHjVBxR17/8VhCN56LLt2Nr
         hkcA==
X-Gm-Message-State: AOJu0YwZfZRqfgHw1Tnr0fSBzZETLXrtSbcfCyrDF5lO6GMjmcHlX9DI
	uxjfR0jIvnAb1HWBQr0j/y5cLcZfsN4w2BTMG2pJ/5YbXhD3Ld3H0zTyVg==
X-Google-Smtp-Source: AGHT+IHGKrDjIf9LE6al2lWzv3+jzKt1Oc9zO04sL/osnPaeGk++NUIbgl+nrs2OSsxtbbuO26iVYA==
X-Received: by 2002:a05:690c:284:b0:6e5:2adf:d584 with SMTP id 00721157ae682-6e5c19a7e7cmr30399757b3.14.1729278811479;
        Fri, 18 Oct 2024 12:13:31 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:31 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 32/68] python3-jdcal: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:19 -0400
Message-ID: <20241018191101.25184-33-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113019

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb b/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
index afabe14a8..d20c9ad42 100644
--- a/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=bd236e1f590973467a427bb354be0f46"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[md5sum] = "e05bdb60fa80f25bc60e73e0c6b7c5dc"
 SRC_URI[sha256sum] = "472872e096eb8df219c23f2689fc336668bdb43d194094b5cc1707e1640acfc8"
 
 RDEPENDS:${PN} += "python3-compression python3-io python3-pprint python3-shell"
-- 
2.43.0


