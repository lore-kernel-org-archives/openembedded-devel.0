Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418CED18128
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 15:25:47 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.58016.1728919544923002305
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 08:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DM7r+Kag;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so23423401fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728919543; x=1729524343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=beBzO+PFex9dLfIw848iCOHzauTewLqkhhCNsNV4czM=;
        b=DM7r+KaggloqyHUHSUBsyupp/AwJvzjG86sEZBUnNnuOGDLNUXxfiju8ATi0I+DjpI
         6eV5+T3CbX1UdSWshvcVmyj61OmIRjfM14kBxqgUooGSQg4wVlH0Kpo86nI857ZFXbIw
         qtk47DYBuSxkjDzKv5RCjFrWsvQdpQo25hai7RXT0HoMM1LjytTyN8iHuN3AvF0kqvBv
         gtL1ZGAH6U7GXdYIFuU9eCFm10F7cpRA9yab3o4O7w3AOgds/BMAbrd48l7UWmEVjCXC
         L+OwFBh3Ei7serj2J9x/m25fFD+vbmCjVPLrgf+h6wDwK/jE6AFM9ATo6tDjuR8D4ao/
         rwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728919543; x=1729524343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=beBzO+PFex9dLfIw848iCOHzauTewLqkhhCNsNV4czM=;
        b=Lh5PJx8VTRfnYlBFYQAiTypMr61i1Vzb3j/om+5JnT40fZaRJdp9zRpjTvZum9MpCR
         ooAqLD4lhET9AuqkzpczQSYGqdN206uqO4m4s6y0mTktmPW6bKFQ4cr4U1U8X0LoqlLa
         9QqvQfxWQilrWfN1oLOj6Gi5RQDgy2VPUNKtFo1djspVfa0XxQwAhn76Db7emtAvj3ru
         qhcrJ08Otj2UzvbtGV18T5a1N7sKqXYq+hQbvNozO2oikygcgRcODOG6TEUUUxXNlhx0
         LUTuHcc7BaM9tP9Y9IU1m8F9JCea758dApcIl5FvTp8IbWuQQEjKtM0uST8t2rhPQGJB
         Lb3A==
X-Gm-Message-State: AOJu0Yyb/pBTXyFvPlPkPb7uZvuTsK/YDRkRuE5otNGCrPVWLw18GieM
	JUhTLinY7tWzWF9fWnEHYVgwIJhMYxQb4Zo2eWAprGaDHFEzafejL6JdqA==
X-Google-Smtp-Source: AGHT+IHNqnfpjd5qDaRDC4teeIp2FC2TsO9zwtCkaMR5zXmF4b9+CQljXrgskI+WA1hFYHpyNvYwcg==
X-Received: by 2002:a05:651c:551:b0:2fa:d84a:bd93 with SMTP id 38308e7fff4ca-2fb329a764amr55089081fa.32.1728919542625;
        Mon, 14 Oct 2024 08:25:42 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c936fc69d8sm5193225a12.0.2024.10.14.08.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 08:25:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [mickledore][meta-oe][PATCH] xmlrpc-c: update SRCREV
Date: Mon, 14 Oct 2024 17:25:39 +0200
Message-ID: <20241014152539.258278-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 15:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112910

* github repo was force pushed and git history re-written since 2018 commit:
  69ee98df Release 1.43.07

* $ git branch -a --contains 00870af80021aa0a66cc72c9aeb00587cbfde560
  $

* $ git diff eff6cb488a644c1378318ff301392fb757fad2aa 00870af80021aa0a66cc72c9aeb00587cbfde560
  $

* so at least the 1.54.06 content is the same

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.06.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.06.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.06.bb
index 0a7ad33c64..f691895e99 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.06.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.06.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
            file://0002-fix-formatting-issues.patch \
            "
 #Release 1.54.06
-SRCREV = "00870af80021aa0a66cc72c9aeb00587cbfde560"
+SRCREV = "eff6cb488a644c1378318ff301392fb757fad2aa"
 
 S = "${WORKDIR}/git/stable"
 
-- 
2.47.0


