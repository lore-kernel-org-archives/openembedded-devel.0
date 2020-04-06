Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.7279.1586164851880573836
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zdlpb5UA;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id c15so601238wro.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DCXqP/IVXFz9h3emDic2V+rtnGnW521UnvWpisBip5g=;
        b=Zdlpb5UA3BqpG7mPlJgm9bs66CGUL/Xw7EbR5Tx5Jd8ZWiP6xJLyp92ygH6+l19QOb
         OrIyRMXtlCbohC3v/qqlTtYduY7EKb8oboBGh9SU2gdVzNtrYlFs4LJhUnPvyDuDA2x8
         sLlaghFOC9nqfQIfa4CKSsKe+q4vv0cfRfoXztOjhXxXYSGEWqQ1I0v5Wa4QuC7FfBvY
         iDMdBKKuL4FfInSOGjxxuxM0UzsxenSWlJ4wv/tx0GvD0enHPXUwJsiGeOHoaDCVgSge
         EPLKOQEznpFUzhRimIFpNgRFM+xiaUtglOMmR9UReSmrzPF049qmqu7qJSchZFz5FxW/
         4EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DCXqP/IVXFz9h3emDic2V+rtnGnW521UnvWpisBip5g=;
        b=tjnXS9lVZIA7O9JZhvhoVq75BIJNGfiw8fhY2kUI+Rcd0hJy9+zjgEMdBYb4VCqET1
         Exx4ySW2+/mexLPubXeJv7R3kX6VQ+HF9ybyVdpF+mBw79M6nSjxJtpXJFCA4yx/LxfT
         S7i71K7+yBNsP+cEdcn8sfSm36rmaMX+VAXStpcO/IjkPCQhTSKeMqtF6HKCJTf0mhJo
         MsUfcHK6u5mUXMgSWzUz7OSxp6IqFhsMqI0wozzOCHsFREUvaaj1BC/p/CC2IUvSVqA6
         mw+mI1wX0BxHDBQbrjOGbNhl0S4obOt+eZ11QCU06KNUN2B8Y0l3tCvBi4G0GvXT8u4m
         hQTQ==
X-Gm-Message-State: AGi0PuZQahGZ5LyfnnZSBKpCoIlfG4TmTlYVOHV0UMm6a+III32ETye9
	jf1kQc3g+N1h3qCf9FvHD+eeBINQho0=
X-Google-Smtp-Source: APiQypJWV4Qy6QInlH/dxDdSK+SnMeSrKqHnNUUgVyaeOeUCrCknv3tUedgj1aQwsLBdWDAThp/i4w==
X-Received: by 2002:adf:dc92:: with SMTP id r18mr22529574wrj.76.1586164850175;
        Mon, 06 Apr 2020 02:20:50 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:49 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/14] pangomm; upgrade 2.42.0 -> 2.42.1
Date: Mon,  6 Apr 2020 11:20:27 +0200
Message-Id: <20200406092032.3574-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2.42.1 (stable):

* Coverage: Ignore deprecations of pango functions
  (so it can be used with the latest versions of pango)
  (Kjell Ahlstedt)
* Layout::get_lines(): Fix ownership of the GSList
  (Kjell Ahlstedt)
* pango/src/color.hg: Fix call to _CLASS_BOXEDTYPE_STATIC
  (Chun-wei Fan) Merge request !10

Build:
* tools/gen_scripts: Update for non-source-dir builds
  (Kjell Ahlstedt)
* Add support for building pangomm with Meson
  (Chun-wei Fan, Kjell Ahlstedt) Merge request !7, !10
* meson.build: Check if .git is a directory or file
  (Ting-Wei Lan) Merge request !8
* NMake Makefiles: Allow builds from a GIT checkout
  (Chun-wei Fan)
* The fixed call to _CLASS_BOXEDTYPE_STATIC in color.hg
  is necessary in order to use glibmm 2.64.0 or later,
  combined with maintainer-mode in pangomm.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../pango/{pangomm_2.42.0.bb => pangomm_2.42.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.42.0.bb => pangomm_2.42.1.bb} (82%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.42.0.bb b/meta-oe/recipes-graphics/pango/pangomm_2.42.1.bb
similarity index 82%
rename from meta-oe/recipes-graphics/pango/pangomm_2.42.0.bb
rename to meta-oe/recipes-graphics/pango/pangomm_2.42.1.bb
index 35e71ab42..57d9ff982 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.42.0.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.42.1.bb
@@ -9,8 +9,8 @@ DEPENDS = "mm-common cairomm glibmm pango"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.xz"
-SRC_URI[md5sum] = "6cffedf2225c4e72645a7d757fb5b832"
-SRC_URI[sha256sum] = "ca6da067ff93a6445780c0b4b226eb84f484ab104b8391fb744a45cbc7edbf56"
+SRC_URI[md5sum] = "339c48dd92ebd3a9911b231708f7a819"
+SRC_URI[sha256sum] = "14bf04939930870d5cfa96860ed953ad2ce07c3fd8713add4a1bfe585589f40f"
 
 inherit features_check autotools pkgconfig
 
-- 
2.21.1

