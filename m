Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A578C04A6A
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:47 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.11196.1689607237559193071
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 08:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=jtXYbUc3;
 spf=pass (domain: baylibre.com, ip: 209.85.167.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a44cccbd96so1141168b6e.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689607236; x=1690212036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lv+eDlAexmJRRI7UUSczZ+gTZ6vsDvhqRcmMUSFepEU=;
        b=jtXYbUc3vmyvSId7Dklo5wo/eFW5zsa165EyPPqhFI2P5wK/DTgFKWz0mW0hTs0RFM
         RrzwPrfGoks11dLzTsawA1wRomKyuq/XWvOEVyGYB5Pz/6GDmiRGShSBQCktlMgZGTed
         43IwABNzdYndLESfPD4tjqq4ozJi21UvpkwNqvj+l+JPoQxvTyL5AvNNmD8Cc60Gljhc
         Cf5H9mEWSgkbacCwJBpoIMEitgbDpqYs1eOwUctvAGmw9rHJy779Wk87xSf2X1XQ7dFX
         j882RzlNRQR8JRNBlPnATdfuAF7iaWPjiu2aWCGSQIOrWVIHhNYmg3hMSN3kJq+oAhld
         sMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607236; x=1690212036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lv+eDlAexmJRRI7UUSczZ+gTZ6vsDvhqRcmMUSFepEU=;
        b=DNLMNNx2lbeKeVTQezYcXW81FgnOwJWi3PTfY6njs9TfZaRvpv3KA8dXTvvtaWCEw9
         rrWfbbk/E9Ds7RzmMb3JGkVjBPy/em6ftqOb3VzlY8MPUXm0j0Jjc0ogOQDOG0FkcVTd
         A2eXA8Zdx7Ia2I0Soewn4ttabVJzV9VBvXVKs954h/SSGYIkbymbpIVMPvbR4uzmfMwM
         HGUeM2UTMUZY0wVk4PUWPr7D/JQawRrWFJ45UlScucV/vyk0OQYywsT/zAxN1kKn1+EY
         81e02ryhuGVMjgpCE0Ja6vTG8R0nQSGchmrTVCojsdhcX8baYuTbzszhlYsBvHdBr3sK
         erMw==
X-Gm-Message-State: ABy/qLblU9D03vgv3q/zYnlqDNENTbhBJY+yvT/Lt/tJFxA8ct6CsQN8
	EPR/G0bS4sIh+zq1C09+5OQ3PvY33NUwX3MWrYo=
X-Google-Smtp-Source: APBJJlGngHp94AI4tVw0dBpuV/NitOIIg/g+ndk90J5RZI0GV4X3P+veY68v1P6UZVznFi3Gw+N3Iw==
X-Received: by 2002:a05:6808:10c1:b0:3a3:f92c:3f38 with SMTP id s1-20020a05680810c100b003a3f92c3f38mr14611379ois.6.1689607236672;
        Mon, 17 Jul 2023 08:20:36 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a144800b00767d2870e39sm6144226qkl.41.2023.07.17.08.20.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:20:36 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/9] python3-astroid: upgrade 2.15.5 -> 2.15.6
Date: Mon, 17 Jul 2023 11:20:28 -0400
Message-ID: <20230717152032.3161667-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717152032.3161667-1-tgamblin@baylibre.com>
References: <20230717152032.3161667-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 15:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103882

Changelog: https://github.com/pylint-dev/astroid/releases/tag/v2.15.6

Changes:

- Harden get_module_part() against ".".
- Avoid expensive list/tuple multiplication operations that would result in MemoryError.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-astroid_2.15.5.bb => python3-astroid_2.15.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.15.5.bb => python3-astroid_2.15.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb b/meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
index 7c859107cb..7325eb13f3 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.15.6.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "1039262575027b441137ab4a62a793a9b43defb42c32d5670f38686207cd780f"
+SRC_URI[sha256sum] = "903f024859b7c7687d7a7f3a3f73b17301f8e42dfd9cc9df9d4418172d3e2dbd"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.41.0


