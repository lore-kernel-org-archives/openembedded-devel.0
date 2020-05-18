Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.43431.1589813433488373874
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=odrLOPuJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id q9so5232420pjm.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rKSlFEp0p8OWY0JOw0HNoH/FtBFNEcqgcZ2Y1Ay9rtQ=;
        b=odrLOPuJX+L3mnoE1WGo9YSdDUHtcpQZ+RxxVmNc/IuA1/FO8c5fhmESPULoD+ytbS
         PI2o9HoS377OnurE+7eOizNmpDkhGJ2kBnfP61qAzrKhIYhzdkHnZRSqO7K8HI6EUbIi
         WcS5PAG2bkdgH8wEI5hvEuhOySSdcgqYN3Ny+7Eo7bXsIYUnzv2BP8hDAVfPskFHutKs
         7V7Q/R1Dxp539Cx0JP4ZBI4znpcFB+h4u52aLgjvP7keK7n33t6Da622ox1mEWGhtTH4
         FUKnJqWfgI3FMB82hux3WIW0XBUpL1BXnyFJyATXJZ1JjfH2zyr3gjznkIxUSqwf8x1Y
         DD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rKSlFEp0p8OWY0JOw0HNoH/FtBFNEcqgcZ2Y1Ay9rtQ=;
        b=fhFQtMxkpgxy51I70z0ox556q6xJPsXog5UcwUhWPEgfUa5ST7bpS+Oh+7eXiRQwjT
         Wuoj4KxRhndOGaoRiPY2Qw4byJpMikuDvZx5ivjwZaXiJLS9NNt3CszMmmMsU1VekCLS
         XsY5ZyaVmC9+L3JO8rRyP44vjKs0gqAD2yyVfbO6UZ6sIIMaxFZlD8k4xXxZVUdqd8ZN
         AeJEM2NtSJtq5051JIPcOBwG963gjwyOP5ZOC4NTu90BRv5hMoxmAzqyyrbwrX1LL595
         K7M+oPv7AL+9zoaD7DK7ZictoXWTDorug1n6QgrezFzGr+UIBOHqEKwO948UicTuBGUG
         a6cw==
X-Gm-Message-State: AOAM533kjtTzLuSRJyGVsmGYn5fSWkmDYSnTWiCmKKtbfIRgGHMtsbUY
	fryJNRrJVgHkO93vfNMaJsnRrS9y
X-Google-Smtp-Source: ABdhPJwJAZf3pMKKdFySPDUiz3BoWfHN9cslMqpZ48DQUfZO8yjjNurOA6w1jh28Htah4fwbuF7z4Q==
X-Received: by 2002:a17:902:9882:: with SMTP id s2mr16313990plp.184.1589813432788;
        Mon, 18 May 2020 07:50:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:32 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 25/57] xfconf: upgrade 4.14.1 -> 4.14.2
Date: Mon, 18 May 2020 07:49:30 -0700
Message-Id: <8de9f4e6ce3fd9f072b566e0bc26a68207f55f02.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Release notes for 4.14.2

========================
This is a maintenance release of xfconf for Xfce 4.14

Use 'gsettings' as a common channel name for the GSetting backend
Bug #14789 Fix GSettings backend assertion error, when probed but not
used.
Bug #15960: Add some missing xfconf_shutdown() in xfconf-query
Bug #15951: Fix 'xfconf_get_error_quark' introspecting warning
Translation updates: gl, hr, zh_CN, sl, sq, be, da, el, es, hu, zh_TW,
he.

Although the GSetting backend is fixed with this release, it is still
disabled by default on Xfce 4.14 branch, to maintain the same installed
files. It can be enabled with --enable-gsettings-backend compile time
tunable and used by setting GSETTINGS_BACKEND=xfconf.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 58aa7654e1ee86e31a06d18675e95ffda8e592b3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xfconf/{xfconf_4.14.1.bb => xfconf_4.14.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.14.1.bb => xfconf_4.14.2.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.1.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.2.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.14.1.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.14.2.bb
index 8da96a4205..893a32f420 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.1.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.2.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc gobject-introspection
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[md5sum] = "cb51a59e2a89d05232f825ad8c74a7c0"
-SRC_URI[sha256sum] = "b893e0a329aee00902fec2f0509f56916c9dcc7844e1b1f9e3c7399458290d59"
+SRC_URI[md5sum] = "769b74d354aa65e0013edc6823b78e48"
+SRC_URI[sha256sum] = "1e7086cc5a63219e375c95a1dfd10ad7098c2586f55ac209e66aef61b969f255"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-- 
2.17.1

