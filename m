Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.11644.1629037602413973631
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IQo1zUIz;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id u21-20020a17090a8915b02901782c36f543so28344828pjn.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=umu56zORYF5eso1pY8q/hwvukQ7uAcDhiBSwC+wqIzQ=;
        b=IQo1zUIzxtm3usMZbjXIZT8Q8UPnR7rgCuVrbwq4t4B9/UM/lCCOVj+WCOmEuqFzCs
         xD2QZ0iO19p04cdqnw5urxw+0daVYLrfvEBrClgEQlrpEDW3TKdQzkHo/7KQwhZ1W2d0
         xBHpNdKRK2A22c+197Yq4AzIcVT4g99dKkHXBNOx5Wx0GdOIhVev9dK6OWXrnmPxvpHf
         gxGJhkW3a8YlcxtpRRxj6uDiGL3U+XDAm8EjgoTFQDL7ys11Xh7Wn5k0Wtq2klYcezzP
         Wr5cIsvPHn/w6DZGGQW6QIA/04c0dd3dAwwJsSS7Ul4ti/+5yWvUgQDq/8F7lyI1o+RM
         IYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=umu56zORYF5eso1pY8q/hwvukQ7uAcDhiBSwC+wqIzQ=;
        b=XTjWUoyrG+jd7aNLdjg3kcxhVoPQpS8L17knSu3hY7KMXhCSow/5uhPXb6jDDyng40
         X72kc5K8erQx94zjiN0h30+3dM/2dYP+7dk81UwhGWG1KVuH84gp2uthwfTl+Yaoi8AF
         08hBeRsZp2rSbvljvIlWFbH5juJvaOqA3Kl8KGbTMZ65FyyFSZj8UXbS8ENo1hrjRyQx
         0zKP+7COmDKuQspaKUcnqYSj5JD826zWQTD/jh5Fo5GNDrGu/vXRm/XoA78+Bt3zhsPU
         PPvCKAxu3I78q2H6Crwinpxw/TQkjDs8OXVRLilhjuCahZ35vyE6dDGnPLvRsM2gpPc0
         e2Cg==
X-Gm-Message-State: AOAM531OqpWY7thprcSNcoySgxMtum2YpUChBUK5ATK5r8HxLfTqWTXA
	juwnj64jV9T6HAgaGKT4Y5bw83GceWAY6w==
X-Google-Smtp-Source: ABdhPJyQOXqB906+1pWYmmMoKiLzsie1A1/76MZeC1FE4SlvsMVpf+HGdL4hN5K1hjYz9KsONdAZsw==
X-Received: by 2002:a62:7c4a:0:b029:3dd:a141:c932 with SMTP id x71-20020a627c4a0000b02903dda141c932mr2046256pfc.68.1629037601736;
        Sun, 15 Aug 2021 07:26:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id d15sm1668901pfd.115.2021.08.15.07.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:26:41 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][hardknott][PATCH 1/2] fvwm: Package extra files and man pages
Date: Sun, 15 Aug 2021 07:26:39 -0700
Message-Id: <20210815142640.2929628-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Avoids using installed-vs-shipped

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 566049b4f1ddc049c1f89a5838d1a71bb429faa3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
index 51f5a4eca1..c93c510976 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
@@ -88,6 +88,8 @@ do_install_append() {
 # as well)
 PACKAGES = " \
     ${PN} \
+    ${PN}-extra \
+    ${PN}-doc \
     ${PN}-dbg \
 "
 
@@ -98,12 +100,16 @@ FILES_${PN} = " \
     ${datadir}/fvwm/ConfigFvwmDefaults \
 "
 
-RDEPENDS_${PN} = " \
-    xuser-account \
+FILES_${PN}-extra = " \
+    ${bindir} \
+    ${libexecdir} \
+    ${sysconfdir}/xdg/fvwm \
+"
+FILES_${PN}-doc = " \
+    ${mandir} \
+    ${datadir}/fvwm \
 "
 
-# by default a lot of stuff is installed and it's not easy to control what to
-# install, so install everything, but skip the check
-INSANE_SKIP_${PN} = " \
-    installed-vs-shipped \
+RDEPENDS_${PN} = " \
+    xuser-account \
 "
-- 
2.25.1

