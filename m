Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A39BC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:55:53 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.4312.1634338552703121957
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=zs/aBi3F;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id n8so47471269lfk.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQA+UMrGVAKN0eDCuRYx9cGihNbIzBcegH7MMbKaVgA=;
        b=zs/aBi3FZLJ9YKTRfIu1rORDDPjstqxgMeTy0XiAw6yZeMo8Q+hodKGNP826YMosX9
         3pOZrGEUcHhcjhjU4z1Uh+ektjyQIv229TwsAEREKIvtssor/XIvSGHTIhXBdq+fdM9i
         zXovsUTRP/cYCAd1tfXNKaCuPeq9dSAuKpE+YwYqpI+5d7EfhR7iajvEXgwOYkWgMxT5
         yJeKAucpQ4rDD1ECZBiHo8+2MUtsRBttWMrTsorXlF3TJGYkJAvgRbBumuX5P3NdBMhu
         sjP70Uk4KfJfdQRjqxHbTYmq6N5+Symni/hkLaNX2mTJ/nzhn8HhpXYg5+Mjs/FsfIJU
         ZOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQA+UMrGVAKN0eDCuRYx9cGihNbIzBcegH7MMbKaVgA=;
        b=EzWTSXkAAe9crEggDGUuE3C3y+k7N5YMsOSWKbDJyIlbrfn8DTycqtd5RLrllF4Lyk
         Tdnc6uyQOIkIm7wI67OB5GkTg50ff3VTdsdtBXZU34hIMOCudzFhjMb+4myb6dHnB9ib
         CV+U0NRGQCJAK3VFz+Ts1U21/ADhgpwsgHhxX4Ur/ZwGVarjxqAo3LlI0zKD07Qo1OW9
         YkUF0WUpgBTwSho+2WdufTSdbq8bJOWZQc9JwtaDVO9AG9+Rk5j0W8F+sANVDTX/qcMm
         7NskH2dQt5KGphJYF3ylIAzxc/bL8525iY67jcmmFg8GJBuQ7QQ6HJ4Xf/IHcOKOCW0X
         sW6w==
X-Gm-Message-State: AOAM531gZOtkf3zUuyy8BntUNR10cVQ895c4zYHYsm0qrGwJHveQviiA
	wU2HrRgxyopQ1s8ECjnQvggOd1FqMdHHow==
X-Google-Smtp-Source: 
 ABdhPJw922lR2b8mXWSU8Q7l2tMzeJD/9Fj8ndxL5D9Yc1YEJRfChtVgLbWQoa2UH2QQx0bj7GlxIQ==
X-Received: by 2002:ac2:5469:: with SMTP id e9mr14044569lfn.466.1634338550649;
        Fri, 15 Oct 2021 15:55:50 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 bj38sm706143ljb.138.2021.10.15.15.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:55:50 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-websockets: update to 10.0
Date: Sat, 16 Oct 2021 00:55:48 +0200
Message-Id: <20211015225548.4161854-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:55:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93340

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-websockets_9.1.bb => python3-websockets_10.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_9.1.bb => python3-websockets_10.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_9.1.bb b/meta-python/recipes-devtools/python/python3-websockets_10.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-websockets_9.1.bb
rename to meta-python/recipes-devtools/python/python3-websockets_10.0.bb
index a44c2d823..004d3beb1 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_10.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78c2cc91e172ca96d6f8e4a76c739ec6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "276d2339ebf0df4f45df453923ebd2270b87900eda5dfd4a6b0cfa15f82111c3"
+SRC_URI[sha256sum] = "c4fc9a1d242317892590abe5b61a9127f1a61740477bfb121743f290b8054002"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


