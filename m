Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1861C4332F
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:00 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.25967.1651346334832618907
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eqeDrc/j;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so1182364pjv.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IFgI4DLjJjGekj1/spm+VaGS+TO5olMNJgms1DTv9yU=;
        b=eqeDrc/j2ZwI449rywiN09lS5TXUyXTWQt2ECqUvLEgPGZJb5zWKlfXtnClrDS0Cip
         2mLetBcF9XE1eTN6CKzWH4lvLu/t6n/v+TC7nF7jan5dbpOaUhsO62HDmeGdgvSzWi0i
         5Y5loHcz4IgGST3jdLrTyyFizb1RYbPV2yO+RjKuv0UXfpa9D97YrXcKBGRs2mHq+I5l
         wM+50u5GqrZBFp7OkXIPEwlH9J8LjJJ0hZby7kDedzZ8yVZstxGS0wnxvMuopQhtwkAc
         HEHNz+eVWWpMwDbop/lxGjYg5x0PE60JmxoaXiqp2NoRI3Fyva2Ut+b76VQ8K89ZzpL+
         aw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IFgI4DLjJjGekj1/spm+VaGS+TO5olMNJgms1DTv9yU=;
        b=nBEs7AkDTFyk23jPlGJtrPwT9KPEhrWRl/VdtjFzB3mNKogbZZhClzycTJAAPQg2rq
         FXiGrtHxXpHfspPeL17MGdoLHbwpHag4YgWcNUfowtVNmBDQkawGtDNRqAkgn3oZxHUn
         9WP1wSET+/wSeGJGHwLB5Jo9ctvk7cTw/x4TPFC2JFncmUcdIphfzCjp/3W2JdODB8Cl
         gK7Ly1PVfNIyild1mpjZhxdoE5MuxfaatmeJSTrLIyEaoHDk2zjesCD2x3WI7xxTq7vg
         jD4CPMxjGETWpQ5Gi7X2fTzyFLZzpYWOY5gHlgDPRtUHshFfH0qSPUFkasE1OQq8SJOq
         X7sQ==
X-Gm-Message-State: AOAM531Sj90LYi9qJCAp3tNTphEhi/I/BnnLSNncAgsQVP9aTw3+QAUT
	Rp6W1AkKtaEx7Ez5pQO4hxqJAIW6YqCQBA==
X-Google-Smtp-Source: 
 ABdhPJykonbkAoYRVUTed4n5tFdnfcA8+Tr4KS1/7YT9RdvyaLZPI/Hk0RdfH0zAkbnNGW39xcJ63g==
X-Received: by 2002:a17:90a:cc6:b0:1d2:9a04:d29e with SMTP id
 6-20020a17090a0cc600b001d29a04d29emr5329802pjt.136.1651346334057;
        Sat, 30 Apr 2022 12:18:54 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 18/39] gspell: upgrade 1.9.1 -> 1.10.0
Date: Sat, 30 Apr 2022 12:17:58 -0700
Message-Id: 
 <78311ad8e01cba0aef1be7d97e05a08a02f4a1f2.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96885

From: wangmy <wangmy@fujitsu.com>

News in 1.10.0, 2022-04-16
--------------------------
* Build from git: some updates, take newer version of autoconf-archive.
* Build: distribute more files in tarballs.
* Documentation improvements.
* Translation updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2e84305baaf951caf84a31834a7ce0cf06890745)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-gnome/gspell/{gspell_1.9.1.bb => gspell_1.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.9.1.bb => gspell_1.10.0.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.10.0.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
rename to meta-gnome/recipes-gnome/gspell/gspell_1.10.0.bb
index 15f1cadbab..fe1b3ea67c 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.10.0.bb
@@ -7,4 +7,4 @@ DEPENDS = "gtk+3 iso-codes enchant2"
 
 inherit gnomebase gettext gobject-introspection vala
 
-SRC_URI[archive.sha256sum] = "dcbb769dfdde8e3c0a8ed3102ce7e661abbf7ddf85df08b29915e92cd723abdd"
+SRC_URI[archive.sha256sum] = "803bb884c0215d3fd22a85d7f30423aff88d9792f05a5199d8a489a2ffaae1da"
-- 
2.25.1


