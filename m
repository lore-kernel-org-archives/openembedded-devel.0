Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0541FC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 13:46:36 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.23063.1703252790872782578
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 05:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GUi4vC0p;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55359dc0290so3321528a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 05:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703252789; x=1703857589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4g35RygnUXnQ0P7zgvNNlccIEbmT3vMUfeHBOl0hrd4=;
        b=GUi4vC0plLiimPiD/ZVKtp8q6UaagXTMR6slmfeamDXMrlO3NmEI4HVB6L+6K5pkXp
         cvTa1dPSGrNw/Fe3rUkvB0XjfNGlOaUKw7ZrBaybEzVIq8WNyLIRhOEi0L8exLQqNN88
         VvTfXpnzA90OOnfKMMgP/Y675kDw5JpiLwD8BD2Syz/6GNcYSHI0Bq7vMLUM0qdi+YPY
         ucW20JMZzR2jRWgW2gnryeCzRumMFDAww3WACT5U/fHmasF5IGG8ybNAHbkGtxMMWRe5
         96tYi+OF1tU5pGDy/e2P+2RwwKcwkoQcvpaIcDo7RNU36EC1S+kTGXnkE06HV18vfOLd
         aKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703252789; x=1703857589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4g35RygnUXnQ0P7zgvNNlccIEbmT3vMUfeHBOl0hrd4=;
        b=qO1JM4MFOGjFBUGr2400iEA2mRQy0WLPgnHasxZMU2oRM4ZrBu0mtpz7TUg1iCN/sY
         UL09Phd5XOSnZou83Vg+dLdNPmXLA7H+g7CbnaAejiNZoO1AzQWo5cuSjkT9OgfnnkRc
         sMH77HmQaezJRriyDwFHRoiCZH6tTNunfu27pTutv+PTK+Wjd7C/OMI39I49DFeI1qgF
         gmTmbq3OYo9UZd9we7EHrpmDlADna6a2PfFSjnKJQ2e9KI6DfvviL3qTbWt/4NxZBrEm
         FWvkB2G3Zt3HGPwMFFF6a/EMCbVoOkH3UwFHtEPiEVLGR9ReTXZKgg4RxgIWF0k0Mayd
         yBIQ==
X-Gm-Message-State: AOJu0YwlMKicxjRcRv8/Jn3IosSh+fI6iLquzcnQBRROkWHBRaOKLbzY
	yTj11P6y0tvw3tuhJPSO1Z7tJsn2kJk=
X-Google-Smtp-Source: AGHT+IFI4k+m/zPvjituWMU7blgM80+xFVnnC7wOKcfhTU74REWCxnI0B5iElbl5ftWikTC/Bd8NFA==
X-Received: by 2002:a50:aa94:0:b0:553:8e37:6168 with SMTP id q20-20020a50aa94000000b005538e376168mr1316259edc.43.1703252788497;
        Fri, 22 Dec 2023 05:46:28 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b3-20020aa7d483000000b0054c7dfc63b4sm2598115edr.43.2023.12.22.05.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 05:46:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperyasinak1@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] wavpack: add PACKAGECONFIG for shared and enable it by default
Date: Fri, 22 Dec 2023 14:46:20 +0100
Message-ID: <20231222134620.3710023-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 13:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107748

* fixes gstreamer1.0-plugins-good build with wavpack enabled:
  PACKAGECONFIG:append:pn-gstreamer1.0-plugins-good = " wavpack"

* 5.1.0 built shared libs by default, 5.6.0 build with CMake doesn't, causing:
  http://errors.yoctoproject.org/Errors/Details/748247/

TOPDIR/tmp-glibc/work/cortexa57-oe-linux/gstreamer1.0-plugins-good/1.22.7/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/13.2.0/ld: TOPDIR/tmp-glibc/work/cortexa57-oe-linux/gstreamer1.0-plugins-good/1.22.7/recipe-sysroot/usr/lib/libwavpack.a(read_words.c.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `bitset' which may bind externally can not be used when making a shared object; recompile with -fPIC
/usr/src/debug/wavpack/5.6.0/src/read_words.c:592:(.text+0xb88): dangerous relocation: unsupported relocation
collect2: error: ld returned 1 exit status

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
index ebbc59dde8..1011cd4c03 100644
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
@@ -9,3 +9,6 @@ SRCREV = "e03e8e29dc618e08e7baba9636e57ba1254874ce"
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
+
+PACKAGECONFIG = "shared"
+PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
-- 
2.43.0


