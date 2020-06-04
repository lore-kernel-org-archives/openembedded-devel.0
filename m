Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.12414.1591272797973410469
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2020 05:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YO722xEO;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id q11so5852066wrp.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2020 05:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0MqUgkWiAVPdeqrm4p9D1o6NV1iM66PYKd6lEGsw4J8=;
        b=YO722xEOz+jI/NnBkpAldBn2cv4Syj+KRy5m7QXVjkAjYM4eOUvV92Xx+MkNBFLmuy
         AszM9CnSQsOLt8DkvjZgqKSasMd2kHP728fCJ3whPfcJjJJ6rIzN9ZOjZ+hL4vCqYBJw
         Ge1gLm3ONZj3RQgoaUfiV0a0+Kl3QCSVy5eYQQA2Ifnme4TE2FYOxrPn/Xq3KrtYhtBH
         74ogRYaZ/YzkgmeUJEC4JBn6SAgW8v+VmYroQ39lRqUBWubIfOrmti9vhnhNHAi+u+/0
         uHBJi6vOrFXp9BIBMb0mzbLSlvUCjzm85/uFnmR7lvaG7z5vPW26ZpY/LpXynzlaOv1c
         uRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0MqUgkWiAVPdeqrm4p9D1o6NV1iM66PYKd6lEGsw4J8=;
        b=oWF3ogNPycza6eZJDqKOyWXrk0hdjhCQy3OCO7+84Aj1vIOIuaNX+a/tOAOtvU/u5i
         ji55floTUsuo7giuwRhINRYfOHLQOhbCfWZVdSOQpI6wIre2VabBBTZsjtAjIxZbEQKQ
         YtCaiXWSZ/RsXX4YSDi4+3NgEMcjeEzOIdeRYxTbaDNirreEfXqaWfXAWtjXQbAd1UrQ
         xxxj46STKf0jyqZ5MKjwaCLMThBZ5mTC7FP75pUIaiJbVgFLivQUfNnb+akkuo2KJPal
         Q0tavcdo9VxLHRCU0x5HZvOMlypoCZSs8qtfofkggQKwumvcFlJd87+Wx8qBJvsj6ZSV
         KMAA==
X-Gm-Message-State: AOAM531zE8fClHoPnn6bUE8zx1AW50TsZ+746aP/2auIgGiU4nPNZad0
	3R+YOXDpPK0pUV4tQ8CY/8lsQp6u
X-Google-Smtp-Source: ABdhPJwHfA+eWpyGsVIzQsAH5oyVvo9FN4TSnXDcTFp9htA08VnIFw0vNIyPr5BtKc/6R8QUc9fHTw==
X-Received: by 2002:adf:fec8:: with SMTP id q8mr4365755wrs.2.1591272796387;
        Thu, 04 Jun 2020 05:13:16 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a124sm7117726wmh.4.2020.06.04.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 05:13:15 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv3] meta-python: depend on core version 12 or higher
Date: Thu,  4 Jun 2020 14:13:11 +0200
Message-Id: <20200604121311.7519-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* python3-pyelftools and python3-pycryptodome(x) recipes were recently
  moved from meta-python to oe-core in:
  https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3
  https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
* core version was bumped now:
  https://git.openembedded.org/openembedded-core/commit/?id=2d503b27e7c88cee9a37c79c4605c77b11f230b6
* this dependency will make sure that people do upgrade oe-core when they do
  upgrade meta-python past these revisions, so the recipes won't suddenly
  disappear as a bonus they will get slightly newer version which are now
  in oe-core
  python3-pycryptodome(x) from 3.9.4 to 3.9.7:
  https://www.pycryptodome.org/en/latest/src/changelog.html#february-2020
  python2-pyelftools from 0.25 to 0.26:
  https://github.com/eliben/pyelftools/commit/8a40f295bc36f96efeb8633dc4a5314f6077d0bf#diff-e4eb329834da3d36278b1b7d943b3bc9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

v3: typo in commit messages "versionw" fixed

 meta-python/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 7cfeafe599..0dbc4296eb 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -12,7 +12,7 @@ BBFILE_PRIORITY_meta-python = "7"
 # cause compatibility issues with other layers
 LAYERVERSION_meta-python = "1"
 
-LAYERDEPENDS_meta-python = "core openembedded-layer"
+LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
 LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
 
-- 
2.25.1

