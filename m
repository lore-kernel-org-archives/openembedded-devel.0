Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.933.1602637593562269221
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 18:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nZUpZKKE;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id o18so1399943edq.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 18:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=amox6e4BAsNLdKs3V30M6wtxOsBLYxaehz0iat5RFOk=;
        b=nZUpZKKEVBSvDzOjcqeCr9ktJAoLbS7qPFVbu8eLRsTszEoOjINfjFjO8Nitj2DZey
         rlnH1IWynClmsABoefbDI/3av3+M8jFMGMpMeNe1bB3nnLWCVEZlNQTiR/ad+HgUSFBf
         t3MDHzChokeNJGXR3tjeG+DPouq2Rl1ezwPJin7yXF2H6s9bQCLClDV2YzmkvanA6QC+
         0dcntDQmNBwQGg/N91X+ubuRNVaaUSi3290wjyTtG9zdif1344TWsImLZDp7K9dMFrkf
         gD7unFsZkh/uIuydMvAvR+/TKz6OeK5YVRtNcto9o9scQYxMtjV2H0YgK6cRVHTQwIlX
         NcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=amox6e4BAsNLdKs3V30M6wtxOsBLYxaehz0iat5RFOk=;
        b=duQXrN7v5alSWlP4ZFYzFtKvQ14Er9jAwcj6BLrjCVw2/G/ZMWSXHtVa9AdJMQzPEO
         ngnrQ/6VG7nYemgrAx4WP5Ozur0zuXMIXwImJOhqjBZCnaFirENKKS1JxI4ignRO1FXw
         3YWH2HRU1v/drbNfafRWYB45jNCAKQJOr7Gq1s87RkUcXK9PnsHB3xOdgj8RHk72C9Xm
         oJw7dNO4ywHRj6D2AiXus2wuyR1mU6S2QDX6pcTkgT0S7jonKzbp/0zy3JLuz6VVWKo8
         0jetpD8UxjC4irFg4NWvHKjHTt/vFfQwNxHxVRoi7yf/NXhD8LYY70r4aCVvIsk9qOxs
         JzgA==
X-Gm-Message-State: AOAM533o8AzHD15TZT1PGMJdNXGKCuXHW9YNlxb9Fqu+nkth/CFPqn8W
	qqVUFQlC3cZfpEcKantzjIE7Vl2wid8=
X-Google-Smtp-Source: ABdhPJzmyJqhomysXr2JaOp0AatnK13nLClbqqk/dQTiIIOYKKUev6gJd5rgcKPBpg6PGbGY/livOA==
X-Received: by 2002:a05:6402:2cf:: with SMTP id b15mr2518234edx.332.1602637591775;
        Tue, 13 Oct 2020 18:06:31 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f375957a175fbdd89b9baae.dip0.t-ipconnect.de. [2003:f0:7f37:5957:a175:fbdd:89b9:baae])
        by smtp.gmail.com with ESMTPSA id i20sm592594edv.96.2020.10.13.18.06.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:06:30 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/8] wxwidgets: add opengl PACKAGECONFIG / enable it if opengl is in DISTRO_FEATURES
Date: Wed, 14 Oct 2020 03:06:12 +0200
Message-Id: <20201014010617.1086948-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014010617.1086948-1-schnitzeltony@gmail.com>
References: <20201014010617.1086948-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
index 1d3c972da..95a6e8527 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
@@ -39,10 +39,10 @@ EXTRA_OECMAKE_append_libc-musl = " \
     -DHAVE_LOCALE_T=OFF \
 "
 
-PACKAGECONFIG ?= "gtk"
+PACKAGECONFIG ?= "gtk ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
 # Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk' / 'qt'
-PACKAGECONFIG[no_gui] = "-DwxUSE_GUI=OFF,,,,,qt gtk"
+PACKAGECONFIG[no_gui] = "-DwxUSE_GUI=OFF,,,,,qt gtk opengl"
 PACKAGECONFIG[gtk] = "-DwxBUILD_TOOLKIT=gtk3 -DwxUSE_GUI=ON,,gtk+3,,,no_gui qt"
 PACKAGECONFIG[qt] = "-DwxBUILD_TOOLKIT=qt  -DwxUSE_GUI=ON,,qtbase,,,no_gui gtk"
 python () {
@@ -63,6 +63,7 @@ PACKAGECONFIG[gstreamer] = "-DwxUSE_MEDIACTRL=ON,-DwxUSE_MEDIACTRL=OFF,gstreamer
 PACKAGECONFIG[libsecret] = "-DwxUSE_SECRETSTORE=ON,-DwxUSE_SECRETSTORE=OFF,libsecret,,,no_gui"
 PACKAGECONFIG[lzma] = "-DwxUSE_LIBLZMA=ON,-DwxUSE_LIBLZMA=OFF,xz"
 PACKAGECONFIG[mspack] = "-DwxUSE_LIBMSPACK=ON,-DwxUSE_LIBMSPACK=OFF,libmspack"
+PACKAGECONFIG[opengl] = ",,libglu"
 PACKAGECONFIG[sdl_audio] = "-DwxUSE_LIBSDL=ON,-DwxUSE_LIBSDL=OFF,libsdl2"
 PACKAGECONFIG[webkit] = "-DwxUSE_WEBVIEW_WEBKIT=ON,-DwxUSE_WEBVIEW_WEBKIT=OFF,webkitgtk,,,no_gui"
 
-- 
2.26.2

