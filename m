Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2079FC433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 18:58:35 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.25379.1639249113614883947
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=icNewtAA;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id m6so11976310lfu.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oYvHkf4KMuLXGI4pU3ntrRulVfWFnGBF4FKrc0MK/aw=;
        b=icNewtAAzNd3w5X9xsZo4wmHwsscXuGAEALM1nEyPFjhqgilWOwoMVQEFv7q/FEdzu
         pI6+N67OjgGm5RxxfeV+nCanxvSTauWDqbagta6SXE+a9w0NxKgjsSHNHheUCfcqgKbX
         SV7xpvEOxwkxsoeu81GxU3Ty1kEKn2QfWaq8XrUJh+B093/KfOfWFY/9lWAqt2ehcfMJ
         4PQO6PnMF3AoaIxOtkGc/d4FWi6DtaxIDoRRE5Za8s7nt97ARX3ZRSKdJ49lCGiKhE0A
         ygHdBCes/Wc0uZq3yXrNdWjje9dqzv4J647vsDa+Lpvr1BbK6wL0i9tdsm/CSexa8WiA
         AqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oYvHkf4KMuLXGI4pU3ntrRulVfWFnGBF4FKrc0MK/aw=;
        b=C5PQ0HOFi6VS4odge5RV7hCaOEdBY24BX9JNQyRW/wPogy4zgbGTCLEzpdYU+r6EQW
         FcgcPVR2k+liGQ8TtKJ4lUs2d2SP9l1RwxXgEkuBdpohiqfxOxXGJRzI8zbqfImPBsAE
         xcKg/sSC8dvvB5cChcVBo0wH/d2rFj85dxwl+K1/gSx/9o1i9NdVSBUOpBOg3pTxCy20
         0qRz4fbmYW0nvE1F7eWO7mtxUndo323MYrQ619BbgVp3eWaYWHM0Va55eaN1LtZHp5mS
         N97xI7YpbC6Rr4xZ6O9T08fkWM5cQv7wx83cTQgTYbc1IQiF4tztZDhGUfib4zDfBrZo
         UfqQ==
X-Gm-Message-State: AOAM530Ph2EzqD/YfZBLdrKY9atQ8VmGiHjMP9Ib3Wqf2UVyQKTTgZta
	+G386Adw1miY9i+PmteyfMEO4CbzxYuBXqho
X-Google-Smtp-Source: 
 ABdhPJzly7branqJIFrfqzuVT63g9NbxgbW8w7NSwSX3hip3XdZu2dWl6+ml6OGptv3aBV0GsE1azw==
X-Received: by 2002:a05:6512:2809:: with SMTP id
 cf9mr19053861lfb.429.1639249111707;
        Sat, 11 Dec 2021 10:58:31 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 l11sm731407lfe.22.2021.12.11.10.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 10:58:31 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-diskcache: update to 5.3.0
Date: Sat, 11 Dec 2021 19:58:29 +0100
Message-Id: <20211211185829.2546544-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 18:58:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94294

License-Update: copyright years updated.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...python3-diskcache_5.2.1.bb => python3-diskcache_5.3.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.2.1.bb => python3-diskcache_5.3.0.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.3.0.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.3.0.bb
index 4a028d769..55829bd1e 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.3.0.bb
@@ -1,13 +1,12 @@
 DESCRIPTION = "Disk Cache -- Disk and file backed persistent cache."
 HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a3e7dd5bc8f0053fee7c5fe9692b932d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c60ef82f0f40155453f6d5f2c94b6e8e"
 
-SRC_URI[sha256sum] = "1805acd5868ac10ad547208951a1190a0ab7bbff4e70f9a07cde4dbdfaa69f64"
+SRC_URI[sha256sum] = "3f1fa30b29fdff26cfddcb3ee7d61376903f82c769ea2907a2b82a5bfb8abbe2"
 
 PYPI_PACKAGE = "diskcache"
 
 inherit pypi setuptools3
 
 CLEANBROKEN = "1"
-
-- 
2.25.1


