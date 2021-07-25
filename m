Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.14666.1627188761367594250
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 21:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TKj3TH/p;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso3455428pjf.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 21:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mcQREV2zHCFG+89vuarh6MHe20jJdW9GrHoAYQGwl9A=;
        b=TKj3TH/pglBy+owsAcUpdTqdcfYJazvfMhbgZPGm7G9d4TwVPXDdvdqiHV3G7lo8PV
         kF90tVsZOH14jMP/h6nvfZpNKtCrujg2o5ekRnvHdg0SnI5KEbobSxlY0k0HNeM577jM
         GUerVO0BdLgb4HBiyp6BCT4pKDbxBNiYnRJadjN7f2sDOT6YlxhYftIhEnZHg5PGMLZp
         h5ZowCFUPz9OsR40tesjwP7CLngSLha1fJWMCljLlOqjbdFO08taKhR4GBxdYfivr50J
         aVoBIWfRgmXM7c53EU/ZbEoU5nwEJz0MYwNNBzGzhWQmnN8/X657f6fA+lI2Kl+7SwL0
         qZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mcQREV2zHCFG+89vuarh6MHe20jJdW9GrHoAYQGwl9A=;
        b=jwFUiYrcb/CPmZyEpZ2DctCAPY5saCb4jJYQfRR90wyKzQJUlmfjncrwsprOWCBBBW
         NZW/NFa+yThhFvgwC7q+A2DB/hUQm8jKI0nH0iLAjiBjCC0tonP3oqA+FJCBdnfMmAF3
         QXCx0Lh7hIYiQQuas81nllC+ao+wv61rp4IvyGfX8fw1GdpnUnhz+C89G3RLlLQzxyqb
         jd9GfHmdB6dwlyi5Zb46+h7LJJE7WwbTXrDmXXxpKxi/TjdJJzNDcsnI31CHS6AdYNTE
         pd2tI0QPY42nSxZH1riscCMg+2jjy50Yn5yQ4g+R5qgEa8FDMnDhpoiwVeeKVkIg5+VP
         TcOA==
X-Gm-Message-State: AOAM533Upr+kf0hOIIzbFDam8LrV5cfZlDkUFHEmAEuM6dxjCz5SJXbS
	ZdVPLGQwRbdwzBspds1UE6igesb7QnuDQA==
X-Google-Smtp-Source: ABdhPJwGgiFQS5g5Hmp260deAFFgBDyHiOlmIoLGWkzEbwTCR2Qnf1Ok1G3/vcjMmrCdyie4y1+Esw==
X-Received: by 2002:a63:686:: with SMTP id 128mr69666pgg.55.1627188760825;
        Sat, 24 Jul 2021 21:52:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id t10sm43368804pgv.52.2021.07.24.21.52.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:52:40 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 11/15] vboxguestdrivers: upgrade 6.1.20 -> 6.1.22
Date: Sat, 24 Jul 2021 21:52:17 -0700
Message-Id: <9b7a52e06b59a8f132e2e6defeed869fb0ee0018.1627164868.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627164868.git.akuster808@gmail.com>
References: <cover.1627164868.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianfranco <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 319490178b999a74a82d092320de5d9d2e5c67bd)
[Stable branch]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 97a5a4b40c143f71c8bff403c51a061a0d5e8b6f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{vboxguestdrivers_6.1.20.bb => vboxguestdrivers_6.1.22.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.20.bb => vboxguestdrivers_6.1.22.bb} (95%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.20.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
similarity index 95%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.20.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
index 9df2e3960e..a074d0a558 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.20.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
     file://add__divmoddi4.patch \
 "
-SRC_URI[md5sum] = "f2fe05e72c37d40afb36b9fb3aa38b78"
-SRC_URI[sha256sum] = "e690c91974a2e7a5aca2c0939ad514382f9a2136797a5e0b96aab778e42bc8a7"
+SRC_URI[md5sum] = "abb1a20021e5915fe38c666e8c11cf80"
+SRC_URI[sha256sum] = "99816d2a15205d49362a31e8ffeb8262d2fa0678c751dfd0a7c43b2faca8be49"
 
 S ?= "${WORKDIR}/vbox_module"
 S_task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1

