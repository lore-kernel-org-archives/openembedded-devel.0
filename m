Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83A2C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 11:32:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.16851.1724153525784062441
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 04:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hHGKiQ/f;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso58910225e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 04:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724153524; x=1724758324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vF/zSE18E03QefpZBxRozkqnAB2/drohLr0CQf+vJlA=;
        b=hHGKiQ/fDjJZbG2PMR4OObuXqm6jvHLxlqnjWtoA9Tr73s170vocj2x+PL8ZebRYn5
         vwMl453zXRk0ZuIyWwOvuKUY27lAR7os82btQqphhde22XPML9Kv5XWPrWjimHvGsSyS
         a3LkFD3k3i8pjyqP0GWesVc95QnSCBU+y52xRDlBs1SK+3h71/I6TOcsyDqrFFN5mSXn
         Ickv4MFHdE2lVJpdgirh7RJiargy2yeMGmzA3nqIM7OSrbX6C3ydmURRSpGbkvP8nDQZ
         qJqTP5YmzJqhidTU2ZgzYSI44T0TvhM97TS3IWe+lf3O8jpK8gyfqt+Dj/1BZu7jBL6d
         RKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724153524; x=1724758324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vF/zSE18E03QefpZBxRozkqnAB2/drohLr0CQf+vJlA=;
        b=FakvJx2os6K4WDy8zBaEZELFWUHdY5sLWtMhUZDckNwNh18TLpJMjelKhEh3moel+A
         i6Vs//wcVeR7FqS04K3EkS+AOQ62gbvGKkoFF8ygU90ET9HcJHnOMis1AduL7bG6Wy6f
         Q0QMQaFdIu4AIooKqb5KqL9vIjnyhHgr3AT2Y56FRpBntXT42EJ2LiAlYV16BmNxW+r9
         1FEwXmHmCK7sUQnfA2Hk2MT9kluZPaj6oBiXjO0U7TXrkTXy2tTUH6c+7Bl4u8m2Syt/
         grAAe8bTtnd87m9zvl5B3FNZ08f/mUyVln8vN4Hbspkm6Foseh5AFqdVJu8+aqzTLyxv
         tbbA==
X-Gm-Message-State: AOJu0YzsB3wgj2JTbzofudWYHfvWjTximgTsOsxg5+miTPc41bZ6f/t0
	K8uxn0sEJMpZvEtDr/fQiyuIXvkuE3onNRFN1nZqLULpot3laX/1v8I6Gw==
X-Google-Smtp-Source: AGHT+IGMwvQaYzucmftLTBGYukmB99KFxAL+1Cgev32AO7vDnz1QnQQ8d6hkN5SLp/g5llRXbggv2A==
X-Received: by 2002:a05:600c:4584:b0:428:e820:37b6 with SMTP id 5b1f17b1804b1-429ed7ed57emr124388425e9.31.1724153523498;
        Tue, 20 Aug 2024 04:32:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189849611sm13003158f8f.25.2024.08.20.04.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 04:32:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: bluca@debian.org,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] polkit-group-rule: package polkit rules
Date: Tue, 20 Aug 2024 13:31:50 +0200
Message-ID: <20240820113150.41210-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 11:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111867

* broken since
  https://github.com/openembedded/meta-openembedded/pull/859
  which moved the files from ${sysconfdir} which is packaged
  in ${PN} by default into ${datadir} which isn't packaged causing:

ERROR: QA Issue: polkit-group-rule-network: Files/directories were installed but not shipped in any package:
  /usr
  /usr/share
  /usr/share/polkit-1
  /usr/share/polkit-1/rules.d
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
polkit-group-rule-network: 4 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit-group-rule.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
index e2a2cecbe9..f57ca2611b 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
@@ -5,3 +5,5 @@ inherit features_check
 REQUIRED_DISTRO_FEATURES = "polkit"
 
 inherit useradd
+
+FILES:${PN} += "${datadir}/polkit-1/rules.d"
-- 
2.46.0


