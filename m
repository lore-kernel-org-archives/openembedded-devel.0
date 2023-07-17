Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CB7C001DF
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:37 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.11118.1689607236802520048
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 08:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=QeTWj/IF;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7659db6339eso196871785a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689607236; x=1690212036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sx2lLh1FZU4JDP3L5KPD0Fv5Bw1RgqTghBKslp1R5Rs=;
        b=QeTWj/IFEpDdPREtZcB0GdEUt6KN27XqrTekCEGXCH7muba2gZNXgTZID8Y1LPcPIW
         yc578MSbCGSRcNRNA2EBPlZgmA7cQRP9VqNKu14Vnfli7TINbg+nXHLG6zHUa+xj4rAs
         v9m4MM7lgxaivoJTOVJ6cN/vt0wEg+0cCOIz/NVTSjpNnXwyE3fRnTWg5RTSiSyL4Zag
         DQ+rBDv+B7KwBpex40WmzHipxUJTKsHbMUsPTM/ZZr7zF1pipSPIMBJ1PhM3eiv8FjuE
         jAloq5nHNrCx4BlQ3UbVB530EqatS6N/kn2ckINcxPeIqIcJu0VuUmGo3kUWLPw0lXdZ
         5EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607236; x=1690212036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx2lLh1FZU4JDP3L5KPD0Fv5Bw1RgqTghBKslp1R5Rs=;
        b=H2enQ0P45xeniwF9cut8HwwXzzNJwDbclZ8fwWuOcKOkHrCh6ZIAfDmbGBD1rTGE33
         0C5Au7p0rtf2Mj59dbxhBr9kVFe3UxqBRr2EFf48xJ5g0GmDeaFhV1M7Gf63wYWSii0T
         vgGzj9equglbnpwvN4IawiF6jm0N263OSAlMxu3ZqNmAIlsfhH0DJiTTHvVJpxQ3bkdv
         AnWSomuRywpcA3ajazTzB9bV4P/i7MwKV0KW4WL4ZMgzyB2sLoKUqQ/Vd1ufvsCJyxl0
         2Qyc0rHs4EoPJC+afRlTpjgEg/uEC3h3pYBj/l7a3Sc+e6tJgWY6SeItyF2WluYtcnmn
         WbdA==
X-Gm-Message-State: ABy/qLaY2i1t0/Tl2lcmzZbNmvYOceeKSvISz3qnLSTAPsA2M3uC/WJU
	5GK/KDb/WNBbWQYkd4Qcxfynsv57edm5bSgSsC8=
X-Google-Smtp-Source: APBJJlEQ3sLXpYujlyTAz+0UgMZB8yBwZarOee/mZe9LQGtaa1K+1ARkEhxt1Q9R3oVhbR1tPcTFmA==
X-Received: by 2002:a05:620a:29c9:b0:767:6cd5:ec8b with SMTP id s9-20020a05620a29c900b007676cd5ec8bmr13245123qkp.27.1689607235852;
        Mon, 17 Jul 2023 08:20:35 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a144800b00767d2870e39sm6144226qkl.41.2023.07.17.08.20.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:20:35 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/9] python3-arpeggio: upgrade 2.0.0 -> 2.0.2
Date: Mon, 17 Jul 2023 11:20:27 -0400
Message-ID: <20230717152032.3161667-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717152032.3161667-1-tgamblin@baylibre.com>
References: <20230717152032.3161667-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 15:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103881

Changelog: https://github.com/textX/Arpeggio/releases

2.0.2 (released: 2023-07-09)

- fix: drop deprecated setup_requires and tests_require #116. Thanks @kloczek.

2.0.1 (released: 2023-07-09)

- fix: replace \n with \\n in error reports for matches #99. Thanks
@mettta and @stanislaw.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-arpeggio_2.0.0.bb => python3-arpeggio_2.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-arpeggio_2.0.0.bb => python3-arpeggio_2.0.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
index 96d6de6a69..1a48a88c29 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/Arpeggio/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb"
 
-SRC_URI[sha256sum] = "d6b03839019bb8a68785f9292ee6a36b1954eb84b925b84a6b8a5e1e26d3ed3d"
+SRC_URI[sha256sum] = "c790b2b06e226d2dd468e4fbfb5b7f506cec66416031fde1441cf1de2a0ba700"
 
 PYPI_PACKAGE = "Arpeggio"
 inherit pypi setuptools3
-- 
2.41.0


