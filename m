Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1925C0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 04:31:37 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.4683.1739248290589627304
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 20:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LKLnwGg+;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-308ee953553so17971591fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 20:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739248288; x=1739853088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b2FADu8KXFBRagjkghR8iSSmb+BGC6b3wVvgBIvrsxA=;
        b=LKLnwGg+YXPUVq5gdhFM2AvpMlKYcolAh+QT5udE7UM1OHnVq/+DugZGdrrzrNePcn
         nKEJCwyK5ktLnKzTK1DBRpXZ3zwdydY1zM3R0a+vYC+QAyewzeqTvvNiL52AAYPTljFT
         WoQmwDK6pXOi8YviAYqliJFUpyG1DJ5agTLKCtK2+wBoBi6cS+rllY3q6K17XCQGW6lT
         KG5lRClTRCBAG1pjzNZh7c9TV/Xg9HIKboqIaZ+0C0LXm07XKDN6tB/9ACQK0UHsFnyI
         mkXw9Y8/69da0ItyRPCgJ5exngqH+IRENfn01f06UTmHLYgM2zwdiLh18Eay0th1xuc8
         z1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739248288; x=1739853088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2FADu8KXFBRagjkghR8iSSmb+BGC6b3wVvgBIvrsxA=;
        b=u16lTprS01ILkdkqEpOd7spgUGQx4IG7P6JzvOeYQ5wIORDJ5sgxzYbjBpGvH4pt06
         les7Cci+KQvcrUB3a0yQWhYxaJGtjFuLBAHwmAUidSvVpyhh1J7FWSRGSFwj61sPI3tw
         j+HrEelyK6Zy84LgdXOlOAsj4ZWYjPksL0mMeHX1plPBVj1BPK7WO2S4m0mT91XvWIG/
         fj9F2r0yDyDq3PKOt9c3zWf3mFjPOCU3vM7A+7y6OADz5P3Yr9E/pdBRWORdh4nymdn9
         IJTRp47DW5vjHT8GDJIIOlFikZHJc72892Q/tERmgS9Cjyxf6zE4pN7iTX7UDeLzjMiS
         0kTA==
X-Gm-Message-State: AOJu0YwUqXA3aGGmdqHtX+70iGhp1eJPLSXpcZPJnsdC+CcyVTmXxlEd
	rA9vBww6JgY/+HDTPQMFwdJlpTuVraNoGUGDHiukFgaDcf16nR9qmI2er/T54VclMiYWZK0tiiY
	DHTk=
X-Gm-Gg: ASbGncvoI0ye0zS5FjaXdmrE4Gd0q6b0T1bsMvmfKT2HDjLpHC3XaI00lwfHGYUKnJN
	P9z+ZBtqIZ5vmt5wwz+4AJUZ8ihr+KTWmVadQcNUmlPNZ0nA5p8X1okTslnCR/lcqtG2C53HQis
	npfTc0AoP8wahmU8oREfPF98OmKUkdd+u7iigkO/PtGq7riQsutZNhdTHe0rGMq5BO3G4R5h7Tt
	56SBp3Z0JwEQTsiyW0uhNNrJSiP61pEoai147/3s39QuPhBp7ATG7Hg2dfLaM8C4EtWHyY6ADEp
	dRc4UMbtq+G/iNygyQIQQxFZZJx5eKM=
X-Google-Smtp-Source: AGHT+IFzZhJqd/1MukkjQQYXL38WNsz5HmGx7tfs+MPVFjB31bZ9vqGNJon2Lpv2tjBOYj7jcNhJzA==
X-Received: by 2002:a05:651c:892:b0:302:22e6:5f8 with SMTP id 38308e7fff4ca-307e581b0eamr53808311fa.22.1739248288085;
        Mon, 10 Feb 2025 20:31:28 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308f92fcf00sm1238351fa.41.2025.02.10.20.31.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 20:31:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] android-tools: build without gold
Date: Tue, 11 Feb 2025 06:31:25 +0200
Message-Id: <20250211043125.2241514-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 04:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115421

The android-tools recipe has been using gold linker to create
executables. Recently OE-Core has dropped support for the gold linker,
which is now causing build errors for the android-tools recipe. Update
the build-system patch in order to stop using gold for linking.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...ols-modifications-to-make-it-build-in-yoct.patch | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
index 5ce375134c54..a35428b5b488 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
@@ -89,6 +89,14 @@ index 9769b68ab793..58c9a63bd225 100644
    -Iexternal/boringssl/include \
    -Isystem/core/adb \
    -Isystem/core/base/include \
+@@ -28,7 +27,6 @@ CPPFLAGS += \
+ LDFLAGS += \
+   -Ldebian/out/system/core \
+   -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-  -fuse-ld=gold \
+   -lbase \
+   -lcutils \
+   -lpthread \
 diff --git a/debian/system/core/append2simg.mk b/debian/system/core/append2simg.mk
 index 1599bdb8..598c751d 100644
 --- a/debian/system/core/append2simg.mk
@@ -114,15 +122,16 @@ index d5c9a285..a59ba1a4 100644
     -Iexternal/boringssl/include \
     -Iexternal/avb \
     -Isystem/core/adb \
-@@ -49,7 +49,7 @@ CPPFLAGS += \
+@@ -49,8 +48,7 @@ CPPFLAGS += \
  
  LDFLAGS += \
    -Ldebian/out/system/core \
 -  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
+-  -fuse-ld=gold \
 +  -Wl,-rpath='$$ORIGIN/../lib/android' \
-   -fuse-ld=gold \
    -lbase \
    -lcutils \
+   -lpthread \
 diff --git a/debian/system/core/img2simg.mk b/debian/system/core/img2simg.mk
 index 11adf014..8baf5ba5 100644
 --- a/debian/system/core/img2simg.mk
-- 
2.39.5


