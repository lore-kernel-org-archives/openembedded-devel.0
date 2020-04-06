Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.7433.1586164854769997649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nZ4Py/uj;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id h2so5915267wmb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=u3PJvkcY3pAhpFJzXiG+5mH0xcTU7NB9q120auC7s3Y=;
        b=nZ4Py/ujsgpR0iJNuxqE+b45S0nnIX1NugkSQOh6TuQUItZYhuSzTG3B0VvAEs0jyl
         GNjf/feV2QcR7shYvEBQgAzuB0t7LBkelQFPBSi9zjDRKdYkPu09E2hPKO1Zzl9J/P6N
         WtM7Lc19O5QR6ZHuLwIaejgLefEyyPqDHHLcCGno/tVmTM/EKN9+b2mUvfCotMpB3Ebc
         MNDcESahjG2vvqofEKRaMSGKKBsv0ebrlpIEIk9aQcGibUpR438kNupeFIIv2HcN6odZ
         kBygAYiIT80gfnIydogSbOgiczuvO3QtFPZp8sGfCbqcAdYA4dxvEDcYW6OFv8W9tyse
         UkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u3PJvkcY3pAhpFJzXiG+5mH0xcTU7NB9q120auC7s3Y=;
        b=aVzrAKldTU6md+v6ETECHQp9cVG3gViA1eP8+8BbvBOz03XiGh7+3ZaxV+IRtO21+l
         OL8B61Xypf+X8vAg69xm7Z6+DF8aPF5Nx4ymtzFAY+Ss/GPEOVsbB5Cys4w/DiL1SRNw
         f+KEdMS2mHXKpv9Btfj0VdzXrM1WNkEkwWyrVzrS0RdHxEemJBazcEyhbm5qlIKHoEts
         NQAZi69mj2019P3ff/7q6XAbS/lcOkZAmDz6v6TZyyTXCApxWsYlrgNDLDwoQJSgBlNo
         Tca8mQ6nnxGqz8/7RVJkk+veIRY6sC8wp07d4oa50S8GfzFv+BVm+BIIV+AASF9lTvxe
         O4sw==
X-Gm-Message-State: AGi0PuaD+GBCl5Kikryw75YZKUqg2LyFrFDix6DxLixyK0uZoJ6z3n5V
	T3yH0AOHpDcwYGRKEQOh0tjep97udew=
X-Google-Smtp-Source: APiQypIQfD5dU6ybYUV7fmw4bGx/YP5Jd7DvecOawF3ivo6XVal95hAjbjph090tGEc2eN8sA8UCLw==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr22472105wme.170.1586164852912;
        Mon, 06 Apr 2020 02:20:52 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:52 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/14] tracker-miners: upgrade 2.3.1 -> 2.3.3
Date: Mon,  6 Apr 2020 11:20:29 +0200
Message-Id: <20200406092032.3574-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NEW in 2.3.3 - 2020-03-09
=========================

  * The secure sandbox for tracker-extract now permits clock_nanosleep() calls,
    fixing crashes on some systems.
  * Miners now set nice/scheduler priorities in a way that placates glib. The
    sched_setscheduler syscall is as a side effect also allowed by the
    tracker-extract sandbox.

Translations: ja

NEW in 2.3.2 - 2020-02-18
=========================

  * Blocked parsing of image/x-dds image files, which were previously
    being passed to GStreamer and triggering system lockups for some people
  * Fixed incorrect MIME type for .raw images, which were previously
    being passed to GStreamer and triggering system lockups for some people
  * Improved how the MP3 extractor calculates durations of variable bitrate
    MP3s, which fixes incorrect durations being shown in GNOME Music.
  * Fixed a bug in the GStreamer writeback module.
  * Fix race condition that might leave tracker-miner-fs paused after a
    writeback operation.

Translations: ms

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{tracker-miners_2.3.1.bb => tracker-miners_2.3.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_2.3.1.bb => tracker-miners_2.3.3.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
index 3dbbcafbd..b40787f3c 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
@@ -15,8 +15,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check
 
-SRC_URI[archive.md5sum] = "0321d8f4ad27e3fccdbc8384e5b3cb83"
-SRC_URI[archive.sha256sum] = "7b1de06a7a79ea1c7813c8a21f8cd1c55f2b95f799cf9f47f0204f3be8a590e0"
+SRC_URI[archive.md5sum] = "a317bc50c5e63dd0746a48af478fb92b"
+SRC_URI[archive.sha256sum] = "7472aa28d7862620d3ca2bbec3b103df547d7319c12e95a7f7aa9f9f6dee4b19"
 SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.21.1

