Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EE1EE0AF7
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 00:12:15 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16771.1770509529395422831
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 16:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mAW4zABa;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8850aa5b56so568857066b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 16:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770509527; x=1771114327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmfHBCD9d+bL2zB+syOz4gMPuoRwOAsxYHhOIkEEgJE=;
        b=mAW4zABaXYHsY1rhneMweA7Hh94HNFsrPKKVFSZzsJtlaygRvyoHtfJ9Ioaczwxx9X
         HcWLWV575Tk8eQRXYH7yB3uIgpYHmrQl1Q3wCRY0dUiFhQK+VD49RrpBeLr8M/d2OMyB
         EPrsqAxfU1zSPE0IcxXsMmu9PLzFhC8vRrNYTkMsyDnXRxAmn3lHsrpzSyWBgeIUT5wT
         ZB6H0yyYpDzxKES412Zl5BzQEXg6NwDT/6b5uEiu90vlCz0bbJKu1yMbWyXgsF6mEmjw
         2eGiAjslxeMqpJIjauRLSSGi52mElxJeAwZ+bHkXNA22WtMy4P+1kE4LilnmNsIsI5Jv
         qv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770509527; x=1771114327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qmfHBCD9d+bL2zB+syOz4gMPuoRwOAsxYHhOIkEEgJE=;
        b=AZPGLwIg6djYhUJDZa3LUoxB4Hrb9jPjFbPMTK9TIRqG5n5JDGWk+PiFo09wJIDvhY
         dP1vYJOZb2BmRLYM6chB5Ynb7J21NYyJhe/WbanPLv+4QzXEVvDgtopqcgztuxPmlloB
         sU/W+etJl396kclmXodfmfVW7ai23eopAffsExI7roqcLjijschb1JRIhruOjo1cfA1r
         C5yFgh61cxVFPuA+29paAFIjgFE3K4rheP1Xkh3c1yG3ZClj03QGNGetB/miinjmsBvM
         EQD7801pVJK1oPFEtvsLHV2C0s1UMAluYfqqGWJojFAWTsHztPhU7U2F9dcDObJAPFYm
         F9QQ==
X-Gm-Message-State: AOJu0Yzh2/hnWrwIIfgxcZ8Jlbrmf9KLJoZKgu4iXXEr7QRezzCHSidf
	Tzt+9ZNjC2XWvBPhecjF0SMmqs2rpNldZJ49glqD4hk/6D/MS0O6oJv+YreUNA==
X-Gm-Gg: AZuq6aJw2OHBEO/McC0jhhrg/euDE4pnehuRU3tXSuLfoCp9jTWhI9uQnASiB3eZIIS
	Z36bq5108ubel/IqwJfd90Elba9nMMh2PdNI2gNKfmB318Vu6J2q7Snnr6Yzd74TgallYiy8jZQ
	4pw5h2JXKwc8CtzULYwDF7KsLOa1YP3fucBJm9OCnOjviz6QUet9qEf9DFfXnEnEra8Fn4eF+ak
	UBzjWegTXObaXW7gkXg91uUKMwOL80IGBhE0vX8dF2lGhHDC0ty5fTwizlpNgLGR693eEx527Um
	SPXdR6VfldipL6nBtHgsqByhfwsHFkdT+5fCUiF/Aj35U9zo8Qzk5YAHvuH9VrGKmTstHvbjDQs
	M4yNbC1dVkeUDheY9pz3fc8NgitXn00ivViU4s3u5k39Y2AWEW+qjJdJdjrQu2JeI71dqJBeBJ2
	zazQwTre5pcZZsdpjgeXyYAjEWr69roxXMued8FKdFt50hbxdKlna53ZHXZqySvXb/
X-Received: by 2002:a17:907:a01:b0:b8e:8874:8398 with SMTP id a640c23a62f3a-b8edf1f2bcemr410423766b.27.1770509527148;
        Sat, 07 Feb 2026 16:12:07 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb18aesm227247666b.41.2026.02.07.16.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 16:12:06 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-sqlalchemy: add python3-greenlet as RDEPENDS as pip check does report this as a missing dependency
Date: Sun,  8 Feb 2026 01:11:39 +0100
Message-ID: <20260208001139.1767114-3-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208001139.1767114-2-t.f.g.geelen@gmail.com>
References: <20260208001139.1767114-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 00:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124273

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.46.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.46.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.46.bb
index 5c56c4ed7c..e7a831557a 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.46.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.46.bb
@@ -19,6 +19,7 @@ RDEPENDS:${PN} += " \
     python3-profile \
     python3-threading \
     python3-typing-extensions \
+    python3-greenlet \
 "
 
 CVE_PRODUCT = "sqlalchemy"
-- 
2.43.0


