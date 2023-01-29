Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546BDC05027
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 21:00:53 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.25730.1675026050244231285
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 13:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yb4g0mBn;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id o66so8569259oia.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 13:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOM153X1ZnnckDtbrpb7WoA3UdJoVvibL7kWDeCo5yk=;
        b=Yb4g0mBnLGJsmFKd3nU0wHBUPigaDm4o2l95BQaLvNzZbm7gIcyWPtpgtGHc4onjoD
         4Sb6wiG/w3wMV5lMHcVA6Y2oeCNjyZyhV7A5JXBTkEYeuTXR8u82nVW44QwMP4NpnWQt
         hCzx6UUUSl159PTfF0OiNw7ikqeEufLa5boQQItha6wqCVAUU/kZdGAeCBA9z71c3ILx
         zsIKIOJa2FQqaa+ej0hmJ4WIuHvidu+S0AiHkX/kpGpXQgC2LNq7z5QOqGL1wSkUv/IP
         ueJLP9a9yZtBY+vAcQy1VsvF91+XeBZuC6Byy4qWTH5uryKgfS52KTbzEivmrVfT7eES
         pOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOM153X1ZnnckDtbrpb7WoA3UdJoVvibL7kWDeCo5yk=;
        b=pCa1aXWcILUk4n0dbJVMIYf/QGRtxRAHkjGua9SrSDBfmzTf1rv1coPDn68Z6CoQiy
         4y353glbRons848c1n04TUBqetj5kwS8jrg0T41PKN++SHsAa5Gpve7OlqAcygZU1Xiu
         zlX3wlOG5hs++S21ZtdGTVisDd8TPsNu3Pu8l+sCUwi9fZCv4Bud3l4vY3Y7ob2qGJ3W
         fwtlkh2x0HTgCxDEXHupPtH7j1375x+t5e3sv5SHMy3kZM4BEc41wE14Eklp8jxsWsWK
         IQPHrU6XUTKTRQOiyjl1tykX4tVgAbHap3Bfm7Mcnul9jgFVfRFFsqbQ2H7cooZhc1ZZ
         qjaQ==
X-Gm-Message-State: AFqh2kpaJXB+pAqDWoMyLrrCzQNHR17m4bGq+fv/QPBA3eNrS994xYW7
	uSry3i9Pe2/wjwK7b1txjWq3uv1FMqI=
X-Google-Smtp-Source: AMrXdXt/ChdQCyrPPopHmtuhJ9Lt/HmrcPlURu1ZHUck44JyNU7Ch/3u7+K1lpB2EOx60N4cmbq2sg==
X-Received: by 2002:a05:6808:1982:b0:367:7633:30dc with SMTP id bj2-20020a056808198200b00367763330dcmr31162589oib.40.1675026049462;
        Sun, 29 Jan 2023 13:00:49 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:9bdc:8bb4:6dc0:aa04])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568080f1100b0035028730c90sm4024065oiw.1.2023.01.29.13.00.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 13:00:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 10/10] Fix missing leading whitespace with ':append'
Date: Sun, 29 Jan 2023 16:00:38 -0500
Message-Id: <16ae3ec7c33f9163feb075cd6727cc134e0d8c13.1675025970.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675025970.git.akuster808@gmail.com>
References: <cover.1675025970.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100844

From: Niko Mauno <niko.mauno@vaisala.com>

Mitigate occurences where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6a87f2ba9cdd4b9689b0d1c86b2e99071d1e069b)
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb             | 2 +-
 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
index c8dabc5ead..44804545de 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https \
            file://0001-Include-typeinfo-for-typeid.patch \
            file://0001-include-utility-header.patch \
 "
-SRC_URI:append:libc-musl = "file://fix_build_musl.patch"
+SRC_URI:append:libc-musl = " file://fix_build_musl.patch"
 SRCREV = "73532d6a5faae9c721c2cc9535b8ef32d4d18264"
 
 DEPENDS = "\
diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
index c95a5b2d32..1c2c6e21e0 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "openssl"
 
-EXTRA_OEMAKE:append = "PREFIX=${prefix} LIBDIR=${libdir} USE_SHARED_LIB=1"
+EXTRA_OEMAKE:append = " PREFIX=${prefix} LIBDIR=${libdir} USE_SHARED_LIB=1"
 # We want to statically link the binary to libfsverity on native Windows
 EXTRA_OEMAKE:remove:mingw32:class-nativesdk = "USE_SHARED_LIB=1"
 EXTRA_OEMAKE:remove:mingw32:class-native = "USE_SHARED_LIB=1"
-- 
2.25.1


