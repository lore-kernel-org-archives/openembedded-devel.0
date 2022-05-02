Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFF0C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 22:01:08 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.3587.1651528859297434349
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 15:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TG3iR/FS;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id o69so12418858pjo.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 15:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BaP2FyHCyBbBjaFXlbW5L2EttEAMUTvgLl7Vxf8wJkE=;
        b=TG3iR/FSkV655d7EMuw6UIYSVq9rfFc/VYKPxublkk/PM8pJpcwUPRD5pDmOGlUwjG
         nJogy7vp6UvekCIZs2UtjxrllTfAnlYDU7KMRE9xCzQPQjlMgmDho+vKdpUhbaav0mlU
         RzE0Q8t37KbK3sccSA5B3Ewwf7UKY3Ius7lUjCSlqOLuJ7sigm/jTUHI4md37fQe9EwK
         2ywWjYH+zEvJ9EUdaJBByaIcq/eHhGOXFYHwEJ+yED9o1dldBIa/QZGS6FT5YkT9LN1q
         +O9OgEMog3mfQ8w/Zx/Yym67Yu0ATQyq03wiNwK63lVyjfdcnSAlaTe5qiKsYEY5QLHV
         gWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BaP2FyHCyBbBjaFXlbW5L2EttEAMUTvgLl7Vxf8wJkE=;
        b=cqYd0KIIOyU6YmRU9Ijgl9jegwi6XYUZUxlmZqsjl8iQ5YiighY697vA/C4iKv4FUq
         hmdqsOt6NlCU98aRjdr7uEeZ2ZV1cqMZIaDmGd3+qUriIN1li2Qr+uWaEzZA/ZdCwt6l
         xaS/4MkQcW4rt0/R+RGYAmNwIgw9XQJvHiL80urpYmyc0K/dhirJddVXgBSW+XDOfp1E
         1nLbZVGvbxvh0p5sIZP3juyvehXWdQt3qSL4n2KONjtcKKkyJ7LQj1Hv2XETkzo6NHYj
         1guV08GiAzNrvpsfNT5d9PBldS00r9k3GMT6keB6QeV/Dni2hPYkEydsGlZoYHDsUGdo
         OIig==
X-Gm-Message-State: AOAM531DgJ/DqoySUx+w6hKnOnel5V+uElaxD1RjB3WrsEKEoyCDkx8l
	b44w0lUC/T3sDEil4CQoza6cICNWbcB51A==
X-Google-Smtp-Source: 
 ABdhPJwbRAwdmlUM8urgfze7Hg5ZHwQN/qSqhT5hwhx4TvRzSFlpcn1tZ8C6p+oweVk2I85ZUH7o7w==
X-Received: by 2002:a17:902:cec5:b0:15e:6c60:2d1d with SMTP id
 d5-20020a170902cec500b0015e6c602d1dmr14182664plg.155.1651528858519;
        Mon, 02 May 2022 15:00:58 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:31cb:c9ad:c3ef:c450])
        by smtp.gmail.com with ESMTPSA id
 x10-20020a1709029a4a00b0015e8d4eb2ccsm5145886plv.278.2022.05.02.15.00.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 15:00:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] meta-gnome: fix layer depends.
Date: Mon,  2 May 2022 15:00:56 -0700
Message-Id: <20220502220056.2003612-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 22:01:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96945

meta-networking no longer depends on meta-python so add it separatily.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index bf4834aa2c..d4d167d0fe 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -15,7 +15,7 @@ IMAGE_LINGUAS_COMPLEMENTARY:append = " ${@bb.utils.contains('DISTRO_FEATURES','h
 # cause compatibility issues with other layers
 LAYERVERSION_gnome-layer = "1"
 
-LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
+LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer meta-python"
 
 LAYERSERIES_COMPAT_gnome-layer = "kirkstone langdale"
 
-- 
2.25.1


