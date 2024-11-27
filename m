Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688BAD6D22C
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 19:09:32 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.79509.1732734562225374446
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 11:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PAex1huN;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: hiagofranco@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fbd9be84bdso6181a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 11:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732734561; x=1733339361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qbJgmSWaayh4sKMkMj4fGDuG7nvRgS7AJ5G7RJzXxXQ=;
        b=PAex1huNjQVrbpqzTHvpMrEAN7NHc1h2aIMH3qj7097SkrhGDS5VdxLVAqaq2ZN6+c
         cj/tMsLqR75vHEDXR6QQjEs3UNd4yFMxAOYNmwxLvz7l2O2Iystg/WqjZnAgGE2E9riQ
         d5BWhkqzJnLjRm4f7JbrR7WrrdYt2Y+OneDPXHKxJwwKQh/Oqr4GiiLDva347ZfzHlTu
         pdn0fnwOelSnc2zWkxC0H0TFGNhtiBuHjyYiGnhvUI20NEq9+ycaEKeP4812aEG0EjHZ
         DUjuVFFYVCBT9/DEH5lZdPAwaU+2mYpID8r2KueagQqRhcaGVQ5KOpjF6N2C1pHo+oj7
         oS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732734561; x=1733339361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbJgmSWaayh4sKMkMj4fGDuG7nvRgS7AJ5G7RJzXxXQ=;
        b=CvuFyLK0siYJUUzcU3StxJSbbieS4AykbgQDye+xkIvN2SmbaDxShn3cCDyowXPi4R
         0GTdQgVSOQ0/LiveX9n/vpensMn+36/0fiKyUTOkxGWmqvCfxkE709L0AZz2GGDKxyx6
         mx4TF+ueQU8JANubC6p2xI+kLwUa7vN/VGv+zDl3B1BZQS6kswkZ4f8Zev4AxytphAyi
         +YfiWWQbeeus/tS5pL6KS+oqMQVl7ouyIYIUqfo9E+lto2iQbQJFMbYV4m2x0rczmdLq
         fBqn+y2cobUkmo+8xwIyxgtg0yn7spDx3z6TESM8NAYDkhq8QO0/YpUVn1FEk0EU5WGs
         /SBQ==
X-Gm-Message-State: AOJu0YzvgVhuTvJUekRpfODDXUjW7FHU1Oz/iofW7TuP+iW14DlAWDMp
	nPmMGtTeVRXbvdpLpkp8p9U+e6SkBSr4XK8poOUHJf3uGz5OKctw3FLtfg==
X-Gm-Gg: ASbGnctRpJ1uxhe6sNQT03u3zAA/dwDHQyghgc7nUsmwe7TTf8my+nEQkYGGC0kni5w
	YApU/PDtM/bVrtoKUIZoq5f/QicyDMnXMSq9+eQx/MuH1GCvT1AzeiOvBMppX30wezktLWlLLwz
	9rcNlS0Ty9jYS+rpTRUiHnJzvAGaEvbmW8NduRYBX98PeVoc0FTvSWBE9p/7KxrARJG5YNQQUKt
	kU/NFdCWpJZ7mJKdWJHvJ97zpgxogFC4hZBS+30LiWz26ekz9qaYovMYhHcXswfWqugFTAG
X-Google-Smtp-Source: AGHT+IHBUiKqGoUKgzKcpm93AGW8QqVv+2Nr3cR/Q6lJy+uVgVVnuslg2DTxsmZ+lwXsFMdl89MXzA==
X-Received: by 2002:a05:6a21:99a5:b0:1dc:2365:4d7d with SMTP id adf61e73a8af0-1e0e0adc87dmr6479469637.16.1732734561137;
        Wed, 27 Nov 2024 11:09:21 -0800 (PST)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47954fsm10581348b3a.42.2024.11.27.11.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 11:09:20 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hiago De Franco <hiago.franco@toradex.com>
Subject: [meta-oe][PATCH] hwdata: drop recipe
Date: Wed, 27 Nov 2024 16:08:41 -0300
Message-Id: <20241127190841.137119-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 19:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114094

From: Hiago De Franco <hiago.franco@toradex.com>

This recipe has been added to openembedded-core layer, since hwdata is
now a requirement to build libdisplay-info, used by weston (see commit
3e5d5ba74bea "hwdata: add recipe from meta-openembedded" from oe-core).

Therefore, drop this recipe.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 .../recipes-support/hwdata/hwdata_0.389.bb    | 28 -------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta-oe/recipes-support/hwdata/hwdata_0.389.bb

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.389.bb b/meta-oe/recipes-support/hwdata/hwdata_0.389.bb
deleted file mode 100644
index fffd491178b1..000000000000
--- a/meta-oe/recipes-support/hwdata/hwdata_0.389.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Hardware identification and configuration data"
-HOMEPAGE = "https://github.com/vcrhonek/hwdata"
-SECTION = "System/Base"
-
-LICENSE = "GPL-2.0-or-later | XFree86-1.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
-
-SRCREV = "5313a12eb992a354c17fc895c1d69c8c42b09a06"
-SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
-
-S = "${WORKDIR}/git"
-
-inherit allarch
-
-do_configure() {
-    ${S}/configure --datadir=${datadir} --libdir=${libdir}
-}
-
-do_compile[noexec] = "1"
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-}
-
-FILES:${PN} = "${libdir}/* \
-               ${datadir}/* "
-
-BBCLASSEXTEND += "native"
-- 
2.39.5


