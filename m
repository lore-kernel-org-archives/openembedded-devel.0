Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.21347.1627633437180145788
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 01:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Av3woDOn;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id b7so12032607edu.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mNF9G3eGwAs8rrMCQqZw5FxOhPvxAJR0/z+IdAbtcu0=;
        b=Av3woDOnCC4tdvEf13Mxfffm5v1ROUXyWM79WJaqWOC5JvSZu8SQLuftTyEr3ihsR7
         S7pnYvli96e406H73LmDo6MNytmcrYWk1DuZZXCoJD+EPOhNLiE7lUws1t0B2aGUATNY
         U4ThcK8yFVUVgp0crgWyYvGdjFwScrm7NWF2bGwwXHegS5q5nkaUAWgGqJs1BSnogjKB
         y9uSgVIqOWJ44+affyO7sKrvZschSb8xnGt3GJik1Up2MxCEtsUyJ3wVup6KXB54B2rD
         rIODOW+96Yl4c8zgp9nhlJa9PHXoL0g2o0h4sqBXYFlLIB3eaPZlOJGYefxna0RQuAgV
         Z44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mNF9G3eGwAs8rrMCQqZw5FxOhPvxAJR0/z+IdAbtcu0=;
        b=gv7EzLlfnq6aq3fuMrPQuxZscAPTTOUAAr2TZ0P2XWE0UTdFP9ymE3hZpHy0jIe1QE
         k52ZCHQKXFnpvYvDdKESOkNUpbP/v2n7DUCCz9FQRVl7IZg8Ysd3Inn/Tnlxhu0v2ElO
         i1G6Uqa2t1K1f973QmqszpohZuz0iJZHU0w9ooe6VPYyLoWiYWjQBAlccJkyM/RQ474P
         obSFezxiiEMO9fK3a/2D5K9MQ6EB6GlxEelG39YCHb9WzVMLnREic53uXOOqXb/n4iaA
         lJvplaEeyAvSN4qpz7rFbAbt5GnwhSgDsDWTAIEX88EOACBp7tUlYpklddEqX947j+L2
         xoyw==
X-Gm-Message-State: AOAM531C7683SNPUa5GEdkL39umcA6HLySzV7ElOPOUgob0J6xq+hFiz
	hzyK1zjce8uEFSxfj/VNpMJNaVw0eu72KA==
X-Google-Smtp-Source: ABdhPJyCGf6ssQXcgx7Wvxf1hMqZUPSQgUQipoEAe9VFTxwE4iiBL5q832/k1U0jbkQBv+zb/+jNEQ==
X-Received: by 2002:aa7:dd84:: with SMTP id g4mr1636881edv.134.1627633435788;
        Fri, 30 Jul 2021 01:23:55 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s12sm309816ejz.36.2021.07.30.01.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 01:23:55 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][WIP][PATCH 2/2] layer.conf: Update to honister
Date: Fri, 30 Jul 2021 10:23:49 +0200
Message-Id: <20210730082349.8729-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730082349.8729-1-Martin.Jansa@gmail.com>
References: <20210730082349.8729-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This marks the layers as compatible with honister now they use the new override
syntax.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 68a2561..2142b9a 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python2 = "1"
 
 LAYERDEPENDS_meta-python2 = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python2 = "hardknott"
+LAYERSERIES_COMPAT_meta-python2 = "honister"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.30.2

