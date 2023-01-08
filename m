Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297FDC677F1
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:12 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.46796.1673191271117305859
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VJN1ukSa;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id e17-20020a9d7311000000b00678202573f1so3834255otk.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AW/8H+l+Nndz61G3jXQXx01s1WSdgvuAKdESOnjfWzM=;
        b=VJN1ukSaJFkzNuhIsYMKDvgFHHQq0gGsiavRcQHt9zakJxlu8q/f9DVJV+4D41tXN4
         DSwg8prt8K15Q169IpQ96tyM9r2fGYc8qkSuUPQUuJTiOoyfxUrQ9TcnZibtJGVasgLo
         5NNDM+G3TW3HQJE0QwMqf8X+XVKZdBSiIUbKDHXmy02WloftwDRIP0ComNhNFf5DqO+R
         QvdR2RdhATuIYdKMqPETdC5quws55GpfvGDqppt0i6vjoBjb12OHzRUsg60IoUJHc19r
         m8CEmdxa6CtPVCzqWLwbFip+hWFuveC7UsIRJuz6UnJZTsG/KkNqJsOzicfCRnj8mIgl
         HSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AW/8H+l+Nndz61G3jXQXx01s1WSdgvuAKdESOnjfWzM=;
        b=1jyNYkSN5RdCH5SecVAFyDOVsmNyXry9sIWxzN3qPJCXy8ZrpdqqVT8PZzVzE+gq0p
         IJqKj9UG9FKuw1wUp7HWMbp/8mP2yjNIphcycD2z6Twbb2hDxpG81RXhk75BAYKThhwT
         16VKZRcI45I7kr3whF5/MXgC6FRa6ggLDHt4pRf2WFmS31V6GqL6D8qQ1B17HgkYr5TC
         DhZKCl6ImGft44XVzKqWLUWNLcYuSfWsNpOkX47hDCmE94I2GhkWbnjUVGaP660sZyxd
         VB6VeaJ+i/TxeBTqyxVKAmvcpsBelW3PXvmGzJAoWuqa6Y2vFONcGm88nbAOM3PwiZ4w
         UzMQ==
X-Gm-Message-State: AFqh2kqcVpSJxkXuS4728MpzohUaISY8llKpdL8anhcw6JUd0QbH1N2v
	EdIoaZBaSAxoJ6A7ILr23KFQQKg8h+I=
X-Google-Smtp-Source: AMrXdXvzpEdWHlt9JEXFGe2CaQ/3bFIu4rKwkAH1xZPhdZVNjaQ06R/jr6sN71vwU6qAkQQUfEadGw==
X-Received: by 2002:a05:6830:1b66:b0:670:51ea:f267 with SMTP id d6-20020a0568301b6600b0067051eaf267mr35427408ote.37.1673191270312;
        Sun, 08 Jan 2023 07:21:10 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 02/26] nss: fix SRC_URI
Date: Sun,  8 Jan 2023 10:20:37 -0500
Message-Id: <ac9ad1d512ef49cf7195e08cf61d11e11b1080e9.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100447

From: Martin Jansa <martin.jansa@gmail.com>

* http://ftp.mozilla.org/pub/mozilla.org now returns 404, but the SRC_URI still works without
  "mozilla.org" directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 74f131ffe8d33ac4fe8225d8102eddc31aef3e90)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.74.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index 333bbdfef0..591b12a917 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
 
 VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '_RTM'}"
 
-SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
+SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
            file://nss.pc.in \
            file://0001-nss-fix-support-cross-compiling.patch \
            file://nss-no-rpath-for-cross-compiling.patch \
-- 
2.25.1


