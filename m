Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web09.1565.1619229034654416967
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 18:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TiQMM6yW;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so46911402otn.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 18:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1x1wTWEYnsdtWmS6CdQKqIYw2Lsd/rACdmx5jaNYwcQ=;
        b=TiQMM6yWf9AoBkTnAeHGxXT6L4cLTNElspuL0Mdbmfhrt76HCw6MCOh/NZt9gpupWw
         /VXKClupaguPvpWx84qqyZIxLgdihR3bURJkZ28Fm6PHjAol4q5zjzFHD+Hxnk+ywdcb
         r+JwiOpIcY6OvngDOC6i04sChOKjDUUY86Oek2HPcQuWI3/ynkAc7cQBWsVe5UjhWuu+
         T5pddpNrNEHMeamhpkgotTltH9iGV/JD1TxD7+IBhwVq6+Pov9Ppug+X5yGudvbVo7EI
         wQXRfXfJ+gqJ6YGhW2Zyiez8wa1YzRJSfzcIqbTd4lpHjc7JLDIUg6LcLsd8PK9Q7oo8
         PcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1x1wTWEYnsdtWmS6CdQKqIYw2Lsd/rACdmx5jaNYwcQ=;
        b=c+mFHX2TiQkzfP/mjGN55HRYyUjGoKtyie4qozNCnh3D8++aY29JP1HKkaXW6LW6JX
         jZfcYF5VP2/C4b5KGmt0nfwfl7O0fpxG25uhEGwUBr8AYBBsc0icAZFh4HKuVj/dmLtX
         wW1Gx0uEb6OT9l0qqDQrWKIRMWcfjsHaAqYAdaJFzlpDRmF/DGq5y8/6vq7O1rz8p9gU
         SF8LoQfddj0lULpEg76j75dQ1kAYLqgZ8QLhs5PPRodrJpDtdhaAs1IBqLt30bes6ZkP
         UeqisW7QNI1HFTDofZXcwWHuLbmTgVD0bGhFnN2SW5juEDYNJao/J6woqEBmkDZ0XnTK
         r8bQ==
X-Gm-Message-State: AOAM532ao0UOtq/UF2UHkm5YMA6zm73foyuDe01GEcxBHb/I8UPUax1t
	rlNuPH9rUMTK0tYu1BmT1zlV3PMxVNSi8A==
X-Google-Smtp-Source: ABdhPJymPYm6jpXEt70ZchPbZ2J/g0312wf/kQn8bY6PLh3CIfE73Rn9KyEBfk6Wp/eNoW/5mf7/kQ==
X-Received: by 2002:a9d:4713:: with SMTP id a19mr5436113otf.71.1619229033886;
        Fri, 23 Apr 2021 18:50:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e183:e120:a0a1:83e4])
        by smtp.gmail.com with ESMTPSA id s19sm1748075otq.6.2021.04.23.18.50.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 18:50:33 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 2/6] telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
Date: Fri, 23 Apr 2021 18:50:24 -0700
Message-Id: <f8ce4b1030d32c8a40d719282b2440ea03565f84.1619228936.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619228936.git.akuster808@gmail.com>
References: <cover.1619228936.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
index 2b05c61a0d..4d4e841f62 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
 inherit autotools pkgconfig gettext gobject-introspection vala
 
-EXTRA_OECONF = "--enable-vala-bindings"
+# Respect GI_DATA_ENABLED value when enabling vala-bindings:
+# configure: error: GObject-Introspection must be enabled for Vala bindings
+EXTRA_OECONF = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-vala-bindings', '--disable-vala-bindings', d)}"
 
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
-- 
2.17.1

