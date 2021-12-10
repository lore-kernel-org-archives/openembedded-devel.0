Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D841C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 06:20:25 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.3877.1639117223948968577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 22:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Bh5fAyWA;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.43, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f43.google.com with SMTP id m6so4385040lfu.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 22:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbD5vfC7qilR5sDbAKy0L4rk10c/RGnYuQ4TqMC2zlE=;
        b=Bh5fAyWAXBsWcFKRO6OmiVyPkJ6AKIgTXvWcwMl6fCavOprWZhvL79q420ABBRmAyu
         1JufLRC1dv5Il0/yDYTSMwe7syxNGMi9fxpVxKcWOvXDbgq+aKt9JSMBb9aY7Z9F9uFI
         QhzTt4pgy3gx8XKDx3zCuWWyqe0PjoPb7pmZ7y27CrASldeQg7lvLCI0sgmMgja3mXFu
         E2Njy/ykrou/lZQUg4twwQ3h4oOaHdeXq0ljYW3ID1aJ9QPNqALktfA84E/SzkXVFXEh
         gtQDu4cuRYNIO3BJzLmkKPxCbQv2OhSim1M0Rfq4ZLhD9BdLfx54yprjnFt3oQkERBf0
         gFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbD5vfC7qilR5sDbAKy0L4rk10c/RGnYuQ4TqMC2zlE=;
        b=qnuuaalKFXbWdgmQ/NfjHUr/j+lnwU0khpmJwCwsrNygrOf/5nDu0v0A3WpB/5fAnC
         Wyz4vzGiTy028UOQcmImV9/6ElzwhEWbwLRvM9PG8jp27tsVo+iFuDgdPkKuQVHBNs7p
         bvZAzJ3p6/FKMJsq8h6LK1H7vV3F5opYgNK8FpgxwEwHb+WDmL+qNqGNpiuPHAAmgWzP
         e1Cz69XH9OZJkX7DLiqe69iLv8QZavcch9t0wh4EZ8UHKSThb4mHgvH5bp83IMDxPoJO
         wSyMKGMqHqcciw0ysnvH23z1j+wwAnFFK9KLsv+4xjrll2AsK6iqjQw72D5XlPO349D7
         wpzw==
X-Gm-Message-State: AOAM533dAzdZIIy/lsTIWNWsRrDd70gaZDyOBXsr1nQAECe4XbLYM6v6
	7ESjBQBHQPCSoGeKWweUIlVOE0hKK7LHNWfy
X-Google-Smtp-Source: 
 ABdhPJxN+ylKXHHlHGJuqZVVfEUfzBcQ787d/F8lRCXjcgMgHQPGGsMW5zFX+TPYIWRBOPM1aDk0QQ==
X-Received: by 2002:a05:6512:3a91:: with SMTP id
 q17mr10069461lfu.425.1639117221607;
        Thu, 09 Dec 2021 22:20:21 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 q3sm208296lfr.295.2021.12.09.22.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 22:20:21 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-gnome][PATCH] gtk4: set UPSTREAM_CHECK_REGEX to stable versions
Date: Fri, 10 Dec 2021 07:18:24 +0100
Message-Id: <20211210061824.1393858-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Dec 2021 06:20:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94268

Check for even numbers only as odd ones are for development versions.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-gnome/recipes-gnome/gtk4/gtk4_4.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gtk4/gtk4_4.4.0.bb b/meta-gnome/recipes-gnome/gtk4/gtk4_4.4.0.bb
index f15e2d58e..07ee853e1 100644
--- a/meta-gnome/recipes-gnome/gtk4/gtk4_4.4.0.bb
+++ b/meta-gnome/recipes-gnome/gtk4/gtk4_4.4.0.bb
@@ -28,6 +28,8 @@ LIC_FILES_CHKSUM = " \
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
+UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
+
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
 SRC_URI[sha256sum] = "e0a1508f441686c3a20dfec48af533b19a4b2e017c18eaee31dccdb7d292505b"
 
-- 
2.25.1


