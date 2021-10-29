Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A1DC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 09:42:45 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.3244.1635500563728282107
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 02:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=6ngvWHdn;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id bu18so2750393lfb.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 02:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RgsXcLW6BP1BbJ90qyOf7stcyXwnbbLt3u9hofdcqss=;
        b=6ngvWHdnQruQYxaHcPUgltNmGoFcdebrLkCzz9Dj4wwt4J6QJJtSvS9q5cEBhdXmTr
         PuHzWgAAOxrkCUx9UIu53SZS1dOJkrB62b0NzmZ1uFxa2OH1C1d0o+TLGxIPAPdJYUYs
         KddLniu2MylKEbp+oFeWkK7ubY8gqXa8yY/ofe6w2aB4lIh0Un278cf//LKrNq2fykb4
         niu4ApJYkXl4XDBnel4vArlNwINoAn/lGsuyWWD1rVHaZNzpWDlVSFVrlqWrcwRl8Cz0
         jp/B6RcEE5+KCcqbVA7i9VgdO3cgotoJNnivZwdc9x1pHLA3JC3aa8lzdwHNThmF2aG6
         N8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RgsXcLW6BP1BbJ90qyOf7stcyXwnbbLt3u9hofdcqss=;
        b=odpOG3mrEjs7qVHbY/mIZlLrUZJyIaiIeD5FeJvKLyNFzbrWt+E1rC7Wbdf0wNUl6k
         4oBouwTAmEsXdehfB0qBbYsaVvBYhCApeJgFw6f7/KmJBgtxsvm+tVcjxjRogQXQ6gjd
         rJ2xT4rdzXTIgSJu2HFBt2VIOMXpqc3IYao7J+iUZK2kgRiP6No0i6qIKMtr0YGrf0yB
         apKNlgc9X1R3c8C0oZO/ZVnxZo77dVgrPDFs4lPYYw7QPT7o6QVrlaymHYJhbXBv0m0y
         +U9aNsxm7Wjk9fONLoOcovaPGKwRyiCbLOQPia470YLEMx2xZW+FKErcNvNYGhs5eE10
         c/4Q==
X-Gm-Message-State: AOAM531kUHEiuWZhZBkNSg8CpQr+ek+2XnQWR/cCllBsw5U+bGHTkzP2
	TU22hPJgAUylJAed0Wtjz6B2KN2nxrr1CWRH
X-Google-Smtp-Source: 
 ABdhPJy+KeSWqi90AeZhbqdIFseVXRyGNZD1lORuOORn/4fgn1Nrh7fXNAf/D0IS9dqQliT2RIvFFA==
X-Received: by 2002:a05:6512:3d24:: with SMTP id
 d36mr9313602lfv.78.1635500561440;
        Fri, 29 Oct 2021 02:42:41 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 i67sm537853lji.64.2021.10.29.02.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 02:42:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pybind11: update to 2.8.1
Date: Fri, 29 Oct 2021 11:42:39 +0200
Message-Id: <20211029094239.1414748-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Oct 2021 09:42:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93646

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-pybind11_2.7.0.bb => python3-pybind11_2.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.7.0.bb => python3-pybind11_2.8.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.7.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
index 348af6ec9..e954dbfb2 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/pybind/pybind11.git \
            file://0001-Do-not-strip-binaries.patch \
            file://0001-Do-not-check-pointer-size-when-cross-compiling.patch \
 "
-SRCREV = "65e95ea8675ea34bdd566d6461330f25c651e5a8"
+SRCREV = "f7b499615e14d70ab098a20deb0cdb3889998a1a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


