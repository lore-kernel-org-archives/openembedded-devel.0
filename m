Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E2DC0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 14:16:04 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.21443.1690294563433147688
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 07:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=U6rBaSM2;
 spf=pass (domain: baylibre.com, ip: 209.85.210.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6b9b835d302so3496188a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690294562; x=1690899362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYElikWe+cX7rgEPn4wYQ/v1QUdAqc7g4oSE/7/y73U=;
        b=U6rBaSM2AFOMusETWe0ulhPdtcFBDAZRkggRxuR7YJ5iV6jGc8dqutHaaUIGfN+FfG
         3zhMhabs8ZQY7VVKrEdHBdKvggrdZLHMcx8DbtZ9M57QI54Ti3gFwsUpNNw5U3reqxpC
         alGeyqvyrLSuGwuWmxF3aBKmu4DXIU4hH1xkNRXOVp5JkaPj/+Qlp61VLwNV45mDhyf+
         xRy1SiQd4yoMFNbaLu7R6DrVw6SuYKTs5v12vddYcR47zrCCOyJvR8qZDjt4niH5T4st
         3NA1VIXlxxsl6YdhW4PwRQRrGI7NY/o8Z1uML7wE+taOdtYfG4KDwsH2BxQREDZxinyQ
         0gSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690294562; x=1690899362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYElikWe+cX7rgEPn4wYQ/v1QUdAqc7g4oSE/7/y73U=;
        b=A6ABiVyq6XT91h9bN9CevZGn1s2EaQ7Oi9PNVJmZbEbRzTMlnZGPxgj3QTaC1go+f9
         Ofgt+mR3nKW5hJ53Uy1T0SHEn3crmxYziST3mTp6AU8k1eLWthh/78Q2q1HSRWEUluMP
         YWgXDCJPqajSpmrr95LxtWybVtaz6J85dc1q+rKGiq5tn5JCBHb6xN23U1FAzNKBJ1V3
         apPqYCkeTsMUvpDs1DdGOaaPny9gjPhSnlWlKLouCtIMiwSlEkksY+dxQL1DZQi/xA83
         x4NjjmZ+c8RtbAlQ3yR4ihoN4MRYCAhuj+6Rzu8is8n1nGqfvhqJD4FWA8LqfDvIvGFW
         rVvw==
X-Gm-Message-State: ABy/qLZKqlgKrLvoZOtVtry2woe3bWAb4u2vAsHdpzjSJz4hzJGLl+7e
	e7Tfi/Uj/RsbwEfST0j6ffiRuBEzPRKszS5jr4E=
X-Google-Smtp-Source: APBJJlFjYOk8cmbU03Wn3UHqhK5F8OX+Ph0DPSY0sM5VFJBsoDmPmFwFJ1Gh5qdqxqFQ65V+G4d5cg==
X-Received: by 2002:a05:6808:1451:b0:3a5:ae6b:135e with SMTP id x17-20020a056808145100b003a5ae6b135emr8676321oiv.53.1690294562116;
        Tue, 25 Jul 2023 07:16:02 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z27-20020a05620a101b00b0075b168fcde9sm3707399qkj.77.2023.07.25.07.16.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 07:16:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/5] python3-send2trash: upgrade 1.8.0 -> 1.8.2
Date: Tue, 25 Jul 2023 10:15:56 -0400
Message-ID: <20230725141600.118138-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725141600.118138-1-tgamblin@baylibre.com>
References: <20230725141600.118138-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 14:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104013

- Update build backend since they use a pyproject.toml file now.
- Add python3-io to RDEPENDS so that the module can be imported.

Changelog (https://github.com/arsenetar/send2trash/releases):

1.8.2

- Add fallback to HOMETRASH when cross device errors happen in plat_other (#26, #41, #63)
- win/legacy: tiny logic simplification by @BoboTiG in #77
- TravisCI is not used anymore by @sobolevn in #73
- fix(ci): Update to latest actions, fix python versions by @arsenetar in #78

1.8.1b0

- Add fallback to HOMETRASH when cross device errors happen in plat_other (#26, #41, #63)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...3-send2trash_1.8.0.bb => python3-send2trash_1.8.2.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-python/recipes-extended/send2trash/{python3-send2trash_1.8.0.bb => python3-send2trash_1.8.2.bb} (51%)

diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.2.bb
similarity index 51%
rename from meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
rename to meta-python/recipes-extended/send2trash/python3-send2trash_1.8.2.bb
index a20b0194f8..eac89e6297 100644
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.2.bb
@@ -2,10 +2,13 @@ SUMMARY = "Send file to trash natively under Mac OS X, Windows and Linux"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a02659c2d5f4cc626e4dcf6504b865eb"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "d2c24762fd3759860a0aff155e45871447ea58d2be6bdd39b5c8f966a0c99c2d"
+SRC_URI[sha256sum] = "c132d59fa44b9ca2b1699af5c86f57ce9f4c5eb56629d5d55fbb7a35f84e2312"
 
 PYPI_PACKAGE = "Send2Trash"
 
-RDEPENDS:${PN} += "python3-datetime"
+RDEPENDS:${PN} += "\
+    python3-io \
+    python3-datetime \
+"
-- 
2.41.0


