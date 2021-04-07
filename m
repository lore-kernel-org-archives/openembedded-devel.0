Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.398.1617833921302968326
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=poRafshl;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id f6so13467033wrv.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2ODWVJZQb3opqL7FEyHLT4p0Hx9GHy48JxOl/4ue+PQ=;
        b=poRafshl0/kV1Yy3boJ7CNw9/bgLiSATcRI6H0Ak3Bsfib/c9GZQoG2GlUBnQQacje
         3h3eCwS5qp0IqdQtrw1kpO9NCcs0wjo6SOU2s1SDZdo0v0Ya5/wV1DMtJLHvwhiLScHW
         7AGR1QWqWkFPpZ9MYk0EuIwAMJ2AIEPPhEpHoHCKQsUzRRprO4Ro2i9GO/TJHqrO9h7E
         6y0ZkMkc5AXcLdDN/nBQSyxCDeRhKIBaMzU0Ljd6Ujsm/M/EAGKvXVK3mFQEYr2wP2Uw
         2Mxrxv4HcvNIl03eQ38BMONZM2TE6Y2Wuph0cul4X6uPBLCCgsJC4+IsYkgcwIuDdbpV
         INSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ODWVJZQb3opqL7FEyHLT4p0Hx9GHy48JxOl/4ue+PQ=;
        b=QmEqZCjVO32O5iLAGmKJBLZp1cV4rMVSGwq5cIvlMM+AeqXRnOMgeuP4SToDTBOFrI
         zfLosJkpszxQwPvWr8d0DjlI9QrDxXm+c+Bu5k2SRjlk2YD5fkuFMk/PBzylpOv7OqEb
         nDWf2b4P2Q6cVdmBIXUWEjPqOu/svn/MxC4ToXlizfQvT4h28K08EEBrmrQleysvboke
         GC6Vw3M5fl//s+2GKp+IRmSiWy9pciojb47P+7fF/uITje1QyWWL9WhddAlCPvL0birL
         VVeTBejBXN1wq0wwWkh5nCmnoc3Fo620HCiy1HRGMc+Q88DUwJ/o5/s9jNdsEfPpU/j3
         61Kw==
X-Gm-Message-State: AOAM530o5iCPHWcjTl2im0kmJyrp8Hfb2ZHQLDRj3rmUENSqWfpEIy0z
	hCCztnrWhlKKyAI9YszEF80+Lmt0SQU=
X-Google-Smtp-Source: ABdhPJwQ7xULT0iTQWaPoZtEt0TqxZZ3xxakaRy+1JNwO6np5IzIAE17mBhDEKCquuMHqlIktegTJQ==
X-Received: by 2002:adf:b350:: with SMTP id k16mr6908037wrd.55.1617833919944;
        Wed, 07 Apr 2021 15:18:39 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f1192521410777e3304dd72.dip0.t-ipconnect.de. [2003:f0:7f11:9252:1410:777e:3304:dd72])
        by smtp.gmail.com with ESMTPSA id e9sm27462434wrv.92.2021.04.07.15.18.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 15:18:39 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/6] xfce4-battery-plugin: upgrade 1.1.3 -> 1.1.4
Date: Thu,  8 Apr 2021 00:18:25 +0200
Message-Id: <20210407221829.606871-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210407221829.606871-1-schnitzeltony@gmail.com>
References: <20210407221829.606871-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.1.4
=======================
- Add help button to properties dialog
- Drop subtitle from settings dialog
- Fix labels alignment for very small panels
- Fix compilation warnings
- automake: INCLUDES -> AM_CPPFLAGS
- autoconf: Some updates
- Remove unnecessary boxes
- Remove GSourceFunc casts
- Add new README.md, update AM_INIT_AUTOMAKE
- Add basic GitLab pipeline
- Update URLs from goodies.xfce.org to docs.xfce.org (Bug #16154)
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...4-battery-plugin_1.1.3.bb => xfce4-battery-plugin_1.1.4.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/battery/{xfce4-battery-plugin_1.1.3.bb => xfce4-battery-plugin_1.1.4.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb
rename to meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
index ecbdc265e..9e65cf688 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "9f82c7e77de0a417716d68d33367973b"
-SRC_URI[sha256sum] = "12be0a44d16bd1e1618513ee64f946814925872db7d1c1188ab1454b00d040a3"
+SRC_URI[sha256sum] = "107df2a837156c010e1eab5430bab90c77f0a3dc699b5937678c8a9c5e64c222"
-- 
2.26.2

