Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7922BC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 21:48:27 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.1130.1708379303891604090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 13:48:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c031a077d5so3035923b6e.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 13:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379302; x=1708984102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnYNBVHV4Y2AhYGHZWj0oBYIh+6kIimauMvgyqWijo8=;
        b=GiY/6QHj34EtyaCVCx0mtGCUXBkBXrf1fb5oKe6RLWhpEyuQ99t4JHbSvqJGVOH9j5
         j1XMOU2fssY4qOmvaH1gMVkkhZPB4zdfeNKVjhb10RrGsDCDvYLFoI6BOnk5ue1WhrTZ
         vbsUh93GroTm9kOK0+PZjtDliIrJ++dcweiA7UwxdJm/+ntdnFIIMwbTf3HsulqNpIgd
         eS0EBRojq8vPGWexSUin9VVfqlEZ5UewJuve7fmHXozdbZfOIMjylBnR/VzqERprswa/
         7YFtoXzqBoT5+sAyGF+oAD1C0ttdnioFXlPOMJM279Ua6G9KHPxrlSOCpPWLiEUhpNkQ
         dG5Q==
X-Gm-Message-State: AOJu0YzKb5ukJEiEOLCoHrsGsHI6GlOjyH7VLCSbx6SxRPgpeWOrShkh
	b38i8YuPh3bnt0LHIcZ4w1rTinDXApm8czzBncvmrgBC2pEBjEvrCVcobX7CrSA=
X-Google-Smtp-Source: AGHT+IHPAtUd/brmIghsrDgg73e/KivyD1ydUCow/h6+MCZqITUspwwD2RKUxNA2JkWI07Eh0bY9hw==
X-Received: by 2002:a05:6808:1928:b0:3c1:35de:8440 with SMTP id bf40-20020a056808192800b003c135de8440mr16391360oib.47.1708379302150;
        Mon, 19 Feb 2024 13:48:22 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bw10-20020a056808244a00b003c03fde4611sm994747oib.2.2024.02.19.13.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:48:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 8/8] python3-license-expression: re-enable passing ptests for the package
Date: Mon, 19 Feb 2024 21:48:01 +0000
Message-Id: <20240219214801.1514843-8-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219214801.1514843-1-derek@asterius.io>
References: <20240219214801.1514843-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 21:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108893

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 5e4e5d45a..fe8f07c85 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -27,6 +27,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-iso3166 \
     python3-jdcal \
     python3-jsmin \
+    python3-license-expression \
     python3-msgpack \
     python3-multidict \
     python3-parse \
@@ -76,7 +77,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-dnspython \
     python3-fastjsonschema \
     python3-gpiod \
-    python3-license-expression \
     python3-ordered-set \
     python3-pillow \
     python3-pint \
-- 
2.34.1


