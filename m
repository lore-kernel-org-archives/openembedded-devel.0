Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.937.1632338561811638322
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IUEJvKJj;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id k24so3771856pgh.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4RPoYkeypgQI8d4oNO5mEpFl7/0S4Zlc082DNKXT4vI=;
        b=IUEJvKJj7/RntS4GXH+xLpuJEt5XjHJSUkXjD2IKQ+6K0qot7CK6earjIQ4qZss8mU
         9vyIFP6L3pGY0Jlid0teiX9qPzYXUDke76bTLm7hKbDpNahVFktCb0fu2KUnayxL/lPm
         +6FEAhTsN+ulOk/P3wAEDerM05L1wak8vx43N4Vj6oThznMAg0nWrtJTWXs850oErnvk
         6Q8FSVbQ23Gp9xl5N+8qpYbnhn+9VNW1jYVlkRv9jvIP8DUUTGMzIdoGkcL22aDoaGAP
         hocA9u0EfmPyhol4mBataKW9Ke5Pub84XDrI/g+9vowpXPd7BzCUYLdM1XzgbSYPM3X5
         Z7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4RPoYkeypgQI8d4oNO5mEpFl7/0S4Zlc082DNKXT4vI=;
        b=SVpNPUMFlKayxZGaloxeNLOnktuRPm9rZJ5RlzvlRqUi/c7GLkVNVhYV/aoNNuJvKQ
         jD6yLS1zSxeEs5aFZ1V4q3daIo3v9q1HXo2zRoB/DVstS74nVx/X+4atYvIRSyuNoJVG
         A2cntwDdYW9erZ2vc/VRpnKNjBAaXZkuli8jKqC8vz9+uYUC6KyGFk1RFnfQGPNrhUce
         muKPNeibW3L/kITWJai0VKkfhGueSHkX7gstBGASiYaN1gnPba/0wwfTmCePcEqkoULJ
         T3FsOZWFMBKjhQ+y/IdKQ4rKDMDRrJrTDjr0FmikI/9xs54ZhTh28w/B+YQ3nvWVAXa2
         ATUQ==
X-Gm-Message-State: AOAM530XkVUvVrk8aKQnFeqybfy0/Wcqih9gSrGpobFA/gHbynqS+01s
	lPr9mmPFNuDZYjaqTYVlLIAFXR7nth3yLw==
X-Google-Smtp-Source: ABdhPJxQOyTFbDZ5n7RdyBtDSySkxiIPWjpF8VQ2tGvNUMAUiwS6Qb3O+qKBxiyWwEVhz/lnwUq35A==
X-Received: by 2002:a62:ddd8:0:b0:435:4de8:2652 with SMTP id w207-20020a62ddd8000000b004354de82652mr360061pff.53.1632338561171;
        Wed, 22 Sep 2021 12:22:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 29/39] transmission: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:03 -0700
Message-Id: <20210922192213.3062719-29-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/transmission/transmission_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_git.bb b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
index 74902500d0..43b000e7df 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_git.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
@@ -18,7 +18,7 @@ PV = "3.00"
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep gettext update-rc.d systemd mime-xdg
+inherit autotools-brokensep gettext update-rc.d pkgconfig systemd mime-xdg
 
 PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
                  ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
-- 
2.33.0

