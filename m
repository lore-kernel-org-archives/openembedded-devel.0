Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA9FC52D7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 04:45:36 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.116211.1723697129496312843
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 21:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aabitrai;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70d25b5b6b0so448378b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 21:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723697128; x=1724301928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DUcYrvX2UI7vQOY9kUgiqYhMlLfisTwIGEySxOvtZ7Q=;
        b=AabitraizaUS1edFxLHBhn4hGZIxB+dXuVoyHFOOs0VG7F+2RcGzsL8XtBHqmubw8s
         OGI459Ll0fWF4LT87GZ5/oqQ68t3IEvs4xm1Bc+ZU7RpJ7BzCM7J649zFc61eTE+Uklv
         FEB1oxZaxqjE80D9gwJeP1vHNvrItUbM/55OXeXD1kLxbvMpntX4yRuyDSH8NMzpcYY7
         4JN1BLTwzNHdu5xBIHT9vwh4BTwkAlOunb3UEoNhWNqLGy5j8zzB3v0Te9M98aa8JLS3
         GQJpd8vdTCz4c9TtF3YaK61mGJvcHQqj3SgFmUvqGmyJMm5e1pkrb+Cr8cscVUI/MKtL
         GOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723697128; x=1724301928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUcYrvX2UI7vQOY9kUgiqYhMlLfisTwIGEySxOvtZ7Q=;
        b=PaodY5dMPv8wJsXCemuVUMY3XhvG4P5UEyDZcGnm9n0tjTLP1tQEu22Cnwt8hZbkCc
         tmBdqtFDxOxK94VATxlGcR5fODrISvSyWtZ7N9jW14bDt3JD6PKOeifEyMK9D7koGMaJ
         3Fi1fqeM8Tce6ZLAO2B8Y+CS7g3uB8fs3RAatzykpdZaJjGy5yK46oNR7A9XNHV0bqYZ
         z9k3NYK0WMGJudWYuzrGM2lKFuCQ2XT/UAyZJLhiV1xt7xj1R9MxihgH9Nis9mIFQAbL
         l/HfGZrbXeLiG18PJQ+XR2s3C8qSSU8GNXDdtGwvhFWuzC3xwOeoDVxlzdwImN1ojoP+
         P4MA==
X-Gm-Message-State: AOJu0YxgeWOpQBzsBe4pyZWB/iaYddYs3jQMg1RSOW0DBTXBmzoeGRUP
	M6oTy0IE5iCUqmxzKu6VGo5lg6wpuDmu2OBQnT+ZoXoeJGKyyOWdZYsR9Q==
X-Google-Smtp-Source: AGHT+IEQK26x0wW6UL57BVaZEK8J3Wn7RtA1zVhWJ5wS8/YTSS+RZYei7Ddt/Gr9FtsY2kssE4qflQ==
X-Received: by 2002:a05:6a00:2da4:b0:70d:2cf6:5f4 with SMTP id d2e1a72fcca58-71267407145mr6589830b3a.25.1723697128420;
        Wed, 14 Aug 2024 21:45:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e55d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6357a86sm316856a12.58.2024.08.14.21.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 21:45:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/9] glibmm: Upgrade to 2.66.7 release
Date: Wed, 14 Aug 2024 21:45:15 -0700
Message-ID: <20240815044523.1030831-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 04:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111809

Changes are here [1]

[1] https://gitlab.gnome.org/GNOME/glibmm/-/commit/a33c12cb694a46f97fe46372e6a97a22bbcd601f#9f621eb5fd3bcb2fa5c7bd228c9b1ad42edc46c8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glib-2.0/{glibmm_2.66.2.bb => glibmm_2.66.7.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.66.2.bb => glibmm_2.66.7.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
index c78dd55ca6..4651938499 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
@@ -12,7 +12,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "b2a4cd7b9ae987794cbb5a1becc10cecb65182b9bb841868625d6bbb123edb1d"
+SRC_URI[archive.sha256sum] = "fe02c1e5f5825940d82b56b6ec31a12c06c05c1583cfe62f934d0763e1e542b3"
 
 FILES:${PN} = "${libdir}/lib*.so.*"
 FILES:${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"

