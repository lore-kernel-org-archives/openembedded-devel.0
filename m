Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DEEC54E41
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 19:22:48 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.3060.1709061765632581871
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Feb 2024 11:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mCUQaOlC;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e4f5e84abeso1770087b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 11:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709061764; x=1709666564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=39TFx1j0CYUGJQJ8t6Aer49X1+K379i2r+mHHrCGMQ0=;
        b=mCUQaOlCCPSb1JDBpsqcVdBzLz1Im0R/uiVjVmk34iPNgRzldxRfyO6t47oAPM3Urf
         u5TE+IKMz4GT6acPjOoBPkzkB1uLrnwhVmK+1zJUMvxqaCBGzMEFyMOT82Je8H4xwL8o
         DzjG40yDQ9+QwfmWVECPm1AzNwbKRajCCIHGOvldpbZw2IrbTGsmEJQcszauLNPxpd69
         c8xXHEsM/qanuHly2CWouIJTcr0rhurVgQ3dLlVsdaLO4ihp9W4DcXNjxbTGqbNxhaP5
         qNGEd94QNsCi/C6DZKXVOIYiWy47pn5+hcvvzPYRzS4yuwcBgysQGCTEFJYgnkb637JO
         4TLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709061764; x=1709666564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39TFx1j0CYUGJQJ8t6Aer49X1+K379i2r+mHHrCGMQ0=;
        b=paPIZXGKTRwTKW5eOUMlcgYJ2WAUKbfiPIlckL4Q+Jo9wanlGKlNRrCd2N68dAdWqv
         dP3YHi3E/mN48ignS/GYvM0ArAF5qdu7lFv5M7S24O2jlns2601tN1vIW28UuUzGwwWJ
         GV2MCB+bk1pyWOWYbxpAv07tuULvghz6WHcCQe5ytAAzRTmxpvtKxGeJLmENwPeUDKTn
         fYFdzKeM+QHhIAE5nBbmQGaytptMTaRaOF4v2KTFT6Zs01itzE8pW1p3fk44vDTtgcmu
         ZZ0ev3AGKOG7+mbQH/jWKl619fxpkDX6GZ59FQOCtYyG1x1ENh6iHVOOGivqLiaBO0AH
         HhZg==
X-Gm-Message-State: AOJu0YxTIfMOrBX8JPupgzMns850EOCOjgFOC6mW2bpzIGIZ4HXEg5CP
	ssxTQkA04+/5G20OGiWIYSZ80g2Dq89qy57EPnF+a+fivv4CF9MnXr894M26Dfw=
X-Google-Smtp-Source: AGHT+IFQ5dlcwg/2uKAv3NvkLzt/Qa2CZb+mYwyfQs70gkqIu0hvG57GSSleq1Oit5pJwr73DFoSUg==
X-Received: by 2002:a05:6a21:2d06:b0:1a0:cb1b:390d with SMTP id tw6-20020a056a212d0600b001a0cb1b390dmr3477207pzb.52.1709061764407;
        Tue, 27 Feb 2024 11:22:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::95e0])
        by smtp.gmail.com with ESMTPSA id k62-20020a632441000000b005dc3fc53f19sm6223199pgk.7.2024.02.27.11.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 11:22:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-pydantic-core, python3-pydantic: Update to 2.16.3 and 2.6.2 respectively
Date: Tue, 27 Feb 2024 11:22:41 -0800
Message-ID: <20240227192242.3844005-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 19:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109046

below is changelogs

[1] https://github.com/pydantic/pydantic-core/releases/tag/v2.16.3
[2] https://github.com/pydantic/pydantic/releases/tag/v2.6.3
[3] https://github.com/pydantic/pydantic/releases/tag/v2.6.2
[4] https://github.com/pydantic/pydantic/releases/tag/v2.6.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-pydantic-core_2.16.2.bb => python3-pydantic-core_2.16.3.bb} | 2 +-
 .../{python3-pydantic_2.6.0.bb => python3-pydantic_2.6.2.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.16.2.bb => python3-pydantic-core_2.16.3.bb} (94%)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.6.0.bb => python3-pydantic_2.6.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.2.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.16.2.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
index 7ac2b076c2..ef48c0020d 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/pydantic/pydantic-core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
-SRC_URI[sha256sum] = "0ba503850d8b8dcc18391f10de896ae51d37fe5fe43dbfb6a35c5c5cad271a06"
+SRC_URI[sha256sum] = "1cac689f80a3abab2d3c0048b29eea5751114054f032a941a32de4c852c59cad"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.6.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.6.2.bb
index af465f4230..dadb3c07f8 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.6.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "ae887bd94eb404b09d86e4d12f93893bdca79d766e738528c6fa1c849f3c6bcf"
+SRC_URI[sha256sum] = "a09be1c3d28f3abe37f8a78af58284b236a92ce520105ddc91a6d29ea1176ba7"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.44.0


