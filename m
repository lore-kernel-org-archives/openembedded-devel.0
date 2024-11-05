Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A70D2B95C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.19571.1730817441896841761
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AMLcy0ac;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e3c3da5bcdso50809397b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817441; x=1731422241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZMmFnaAhXkJgycfaVxL4BG5uup4fAE43v+WkO9cJWE=;
        b=AMLcy0acCtyHYTAZHVHdYBALLcYeOEHun0VlDVUWNCFoh8INzrQP+uzlzqjPrk/Pre
         ICt506lRHlc1vgifkZ7+1TB2H8WSq66qd5mb1X/vmOJF5jn9DA+3zV8asVtO0OFqkRYJ
         fNieUhiSXbne0+wppN2jjsJlShW1otuJM38olbiSpAfRs8y3dG43yaVOZBHM8yv6iUyG
         JSGh6l1AhXi5Yvk8uUIkfg3KXJEi07m8Gr21ZTNq8IRVCAPzULTqPuSB7b5toc75F0we
         eF/CB/vv8H0v4iTlEMsrgeyN1EBuQZ9glHDWmCt1S80jAl01AHncjBwZgy3WzNWCGV/a
         DyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817441; x=1731422241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZMmFnaAhXkJgycfaVxL4BG5uup4fAE43v+WkO9cJWE=;
        b=R+ZHq1Es+2L3DJ1/4gGa4M4EHDnyvRhStYcL1S2JzpJB3OuWiFoGGceRmZIYW7p4aC
         NtqSbf+bSnwI2ToBTmYEMXtG+IEP825mf7OvXlu8Ebr1Rn+QYFWCG3xUQ23jXPBfFZIH
         Sa1xnSlpQWQggX0QvJQr4bPSuM7wRrH3Hkplveu/4g5hrHQlUV9X2RYxsYQSQ3v3ov7G
         Rxh23EW7aoHUGr8cwGhBuvpXvkwai7EWVRnHwBOs74PpswVkX/vnJyvGat8mVm62nT/P
         Q6C8giakvZfBGuItLvZU7x8luL4ShG/Vhqx60r2i2jyfSKGHJhNloSG6OLX2ZqSq8HAE
         5lsw==
X-Gm-Message-State: AOJu0YyiD3rjkmFOjUCqjHW/WOWtere9ZVUaJQ/MZgZ9wrJP8LRu97ws
	/BVBfBEtnfHg+XS2TgAnpLJRioUlnDe+8Vffz75Q74gUbK4Reta6OHU9LQ==
X-Google-Smtp-Source: AGHT+IFuHNPzxSvLecZTpBIhB9EpQelQ6CZ7bMvSJTVrnbellcXc/gWbOLFYZeOkStTPqwlQ6Ai40w==
X-Received: by 2002:a05:690c:7001:b0:6ea:8148:f6b3 with SMTP id 00721157ae682-6ea8148f81bmr100530487b3.43.1730817440985;
        Tue, 05 Nov 2024 06:37:20 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jeroen Knoops <jeroen.knoops@philips.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 90/90] nng: Rename default branch of github.com:nanomsg/nng.git
Date: Tue,  5 Nov 2024 09:35:55 -0500
Message-ID: <20241105143638.2301245-91-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113507

From: Jeroen Knoops <jeroen.knoops@philips.com>

Default branch is renamed from `master` to `main`. Commitshas are the
same.

Signed-off-by: Jeroen Knoops <jeroen.knoops@philips.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 58679b6a515b51d28c480836ad598fca6f0cc655)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
index a6556249b7..9ae3b89371 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
@@ -5,7 +5,7 @@ SECTION = "libs/networking"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 
-SRC_URI = "git://github.com/nanomsg/nng.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/nanomsg/nng.git;branch=main;protocol=https"
 SRCREV = "85fbe7f9e4642b554d0d97f2e3ff2aa12978691a"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


