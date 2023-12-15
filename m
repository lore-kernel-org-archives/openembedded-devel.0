Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C44C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 16:01:25 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.66301.1702656075441377095
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 08:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OS7w6XY7;
 spf=pass (domain: konsulko.com, ip: 209.85.167.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso1043867e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 08:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702656073; x=1703260873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuhXpvuboC1lqEruQuFu08IBbjK4TVfkx7ijcKADWRo=;
        b=OS7w6XY7fYYaae8wOFajMgIfVxutW57igWBVnYyZPQutc5JlDcXgUqrG+XSSX+EhiN
         1o02x9oMenoNpSw5kOAWZjomgv68tykvQUjmZ5szRu8R9/BMttPKZKB+dCkBLTArrJfj
         ZiNe3VHek2zidCukdlxBYH2T3HlkF+kDswcm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702656073; x=1703260873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuhXpvuboC1lqEruQuFu08IBbjK4TVfkx7ijcKADWRo=;
        b=tmusNoWt4lpmrIBQvRsQRq5cytuEkH95yY3zG0L/ZVsqfyYIChAsaE8Q0uB6uDzI2w
         v2XgXeStyr0dA751k1H6Zuq6ertyCLVk9d/z1RnUNnTr1r7o44FnB5ScEZHIXajpp3/n
         jkeHRoTLEBSyipOY0ySg2CC+xDzrkoltY9qzW7/3urcCGWbn+btXBOPVwkjuFN+u+l+5
         qqhynZT1cFnwdiSUOntB5FRSipRRE4eCTo++h3tAM3D4a3vi7Tn7pG91EIUyfmp2dr3W
         yFsmusUV0vbcZl/JeJ8zKEXgRc8FfFNcbWlJ4pX4855hgVRM00m+lKjpOSNNrI+m+0tG
         ESEA==
X-Gm-Message-State: AOJu0YxQpKTA9Y1S2BKZ9bGdYVxbbcU1DTa/BR8G16jAa7MUycWIHyus
	7TtNuS2yDB8Zt0Co4zbVmwxlQ3PveGsFF78pa24=
X-Google-Smtp-Source: AGHT+IFhLy4xDw/paeHfkd4l8ErEzLbEBpDXHsLaRgSsfIgh+1alI/7e5AQ62Ynz/x+LTYo44QLCFw==
X-Received: by 2002:ac2:51ad:0:b0:50b:e967:ddf0 with SMTP id f13-20020ac251ad000000b0050be967ddf0mr5273679lfk.30.1702656073406;
        Fri, 15 Dec 2023 08:01:13 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id mm20-20020a1709077a9400b00a1a53e9f401sm10926896ejc.132.2023.12.15.08.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 08:01:13 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-aiohue: upgrade 4.6.2 -> 4.7.0
Date: Fri, 15 Dec 2023 18:01:03 +0200
Message-Id: <20231215160103.2164505-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215160103.2164505-1-leon.anavi@konsulko.com>
References: <20231215160103.2164505-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 16:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107527

Upgrade to version 4.7.0:

- Backward compatibility fix
- Update project and CI
- Update models for updated schema and new resource types

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohue_4.6.2.bb => python3-aiohue_4.7.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.6.2.bb => python3-aiohue_4.7.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.6.2.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.6.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb
index b9256ca20..84aace451 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.7.0.bb
@@ -4,9 +4,9 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "069af6bb0a7d34d566538af57cc10fb691ee04f844204e4f67d95a57f0b91a46"
+SRC_URI[sha256sum] = "3ca727b463e55bbe7c69b67f5503ffcd7d213c9644c4e458e3556ee6ea33855b"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
 	${PYTHON_PN}-aiohttp \
-- 
2.39.2


