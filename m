Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web09.255.1617899784783227838
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l7X1GCCP;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id k25so2808626oic.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=uQ6rahix7rbIJhMRUfVmAQ5gH4BwRD488QJLuBsMBRs=;
        b=l7X1GCCP/Z6nQSI6XqhsNuotrbzUbsJV4SX0rk19qMUpHMFys/FG8gn/njjAz3ZiHb
         tODq9T+BV29t9MoxzrcWhaka/IHMbNZsurwg14PgUNW1jm84txVkctW0tS7fNRXkjXkl
         4WLtXvD7KQJqMnRxaf51o3xMxFg98ap2pFtbT2L/Re1U9ydhaApyh+YJWz4nxFE6yKy3
         eIyht8atTZlsFPwyPygivb1dv6Yhh6/xHzqOqjnSyfweNUXd92a1RP/9lnr2ZrVOw7qv
         BthRrczTub+ZR5mZhbGGetXcDJxl1i1YzAqPwht83DQ4ot3M3ifa/zJAhIPSzDCs7djG
         v8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=uQ6rahix7rbIJhMRUfVmAQ5gH4BwRD488QJLuBsMBRs=;
        b=gAudpbr2gHvNStLEz8s1Y6MUmwAcTrFiQs9bmM9Q3pAcZPFAxC9T6fHChs0VHhwthF
         3rZRbeU0tEpMnuQpTSvAgh4SI/Jri/TgbNE4ntS4v03zfYLa9909T71S6/znGh3tPY97
         +rrPXpaB55WGe+lgRYFq84JVunMakzkobC9f1pla6n+SJEIiQhB8lYQFkqjmfD5l9WVe
         IfeyTsjGNUmVtUdVK/b5xEsrQd7msb3n8XbeVI90oGcZGEbYsFvZwfBbizxIgfQzSl8f
         I879+qHDJs6p/J6Su55ruz7QIuG05SCoO33BCB0BpLbaUxhS6cpZigKkbbDmKj39AM3f
         Pq5w==
X-Gm-Message-State: AOAM531of3sbEGhQQ5yN+OGkjKN4XIHbgnJXyk+wS741vks77VomzO8b
	0ei+nvCBmqUW8qngotLCgoMVCQo5Pyo=
X-Google-Smtp-Source: ABdhPJz/mxjrhB18EkJMk5t5nLf/kkh40pI3nlK1157rYXzo5HiuJUiJHywprl/cEZSC6RplZ42quA==
X-Received: by 2002:a05:6808:1405:: with SMTP id w5mr6892466oiv.48.1617899781018;
        Thu, 08 Apr 2021 09:36:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:20 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 06/64] packagegroup-meta-multimedia: include projucer only with x11 in DISTRO_FEATURES
Date: Thu,  8 Apr 2021 09:35:13 -0700
Message-Id: <549c94602b897bb500b33706270b9d94eefdc202.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 61d269362a1d5d05de7cf45fb38cd09e562da00b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 350c14b264d..0a82b8c2f1a 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -54,7 +54,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     tearsofsteel-1080p \
     schroedinger \
     pipewire \
-    projucer \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d)} \
     libcamera \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libde265 openh264", "", d)} \
     vorbis-tools \
-- 
2.17.1

