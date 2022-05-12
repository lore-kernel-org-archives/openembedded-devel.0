Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96DFC433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:21 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.1837.1652344932655006804
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=54z/mowt;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.50,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f50.google.com with SMTP id p189so2588584wmp.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wzLBMhM+jtCpqQsiHz+RUr0hXwKWr6ghgDrY924pp4c=;
        b=54z/mowt9pG8oRmBh/Drozob6iPD1y0j81XTGCLf+czaBksW+WmmsWguNuFOb6cxNV
         /mj9wNmjLTCAeolQvvYgxvojIBZzZwkQVU8A0gzfI4rcoVN9gqC7V7TOSBLCZMOT89Ys
         3/BeAfBUf8jjG5OcffhL4xDxzT6VYRBaGsHsjGwYzMHc5/WqBd3HMUVkIfIkgW9ehWQI
         TLX61yDqDvU3pEs5zIp4JXCKlB7+0PC0M8swXc3yeUmOh3KQjfRN9OnL99krG+v+6vip
         Fw7YMxxTfcjN6yGTdWkuJ3nPnJ6oJcD0lSouQTKONIh+k1Xy0wBGtQ950V4kdxJSK816
         +8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wzLBMhM+jtCpqQsiHz+RUr0hXwKWr6ghgDrY924pp4c=;
        b=GoiOMuMukbshYpldFotVlQc9Q4p4dGjJ+Gg+Syq3WRPLXwS0Sm4rWaQHuq76baMKNJ
         8H9WLu7J8gh7UrgrTlkRtbb+Izx4VVBJT+i5AcvrC3zGoAGxP7lr+Gya+TCN8PPB9ekW
         RMrgUNqjHDRv1PrQURTgbVcyMX9orjt2+DcKMbycvS9fAYYAr7BowB969746PXV8vwiy
         2iesRuSocJfT/jlTNOEqQ86MRKrpde+TYyrcOIiD5ZU9EUuGGH1YBxB7iAiCa5ccVKkf
         dLxKlJRjhMS/Hrg7R55BKPzpwS2AKjf3O8Ff/rEZykJuvtnRXjAYzWbPrCPFy4vw3lmT
         m+/g==
X-Gm-Message-State: AOAM531L+3InNSk5L2WXC0lgIZA2CR/mRYHm/daVCjD3codOSqa75QJT
	EAEOUDWyFn4ebBTSsPulqAKv6EpMN4aNN6f+
X-Google-Smtp-Source: 
 ABdhPJx1GL0V3epVgjikvGfZsfu0bWMaZRIEDuQc8iIU5toC4To3RiR9sb5/vgfYCQ18RDqFKdAsPA==
X-Received: by 2002:a1c:38c6:0:b0:392:a4f2:20b1 with SMTP id
 f189-20020a1c38c6000000b00392a4f220b1mr8842972wma.7.1652344931191;
        Thu, 12 May 2022 01:42:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 15/16] python3-lru-dict: new package
Date: Thu, 12 May 2022 10:41:51 +0200
Message-Id: <20220512084152.1388464-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512084152.1388464-1-brgl@bgdev.pl>
References: <20220512084152.1388464-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 08:42:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97064

Add a recipe for lru-dict: a fixed size dict like container.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb            | 1 +
 .../recipes-devtools/python/python3-lru-dict_1.1.7.bb    | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-lru-dict_1.1.7.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index da83aab48..2bf26fc69 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -223,6 +223,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-lockfile \
     python3-lorem \
     python3-lrparsing \
+    python3-lru-dict \
     python3-luma-core \
     python3-luma-oled \
     python3-lxml \
diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.1.7.bb b/meta-python/recipes-devtools/python/python3-lru-dict_1.1.7.bb
new file mode 100644
index 000000000..0a0682e0c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.1.7.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A fixed size dict like container which evicts Least Recently Used (LRU) items once size limit is exceeded."
+HOMEPAGE = "https://github.com/amitdev/lru-dict"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9d10a486ee04034fdef5162fd791f153"
+
+SRC_URI[sha256sum] = "45b81f67d75341d4433abade799a47e9c42a9e22a118531dcb5e549864032d7c"
+
+inherit pypi setuptools3
-- 
2.34.1


