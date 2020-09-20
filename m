Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.20579.1600613457333527631
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2020 07:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qBp8l57R;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id k14so10474072edo.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2020 07:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZMioEE2V9W9n380OrBGw/xUDF5ltBHrEu/yeC0qWcek=;
        b=qBp8l57RGrkWwBcGjc5MBTZh8tiVF+6HsxuU/yRpjjY/V1YYAb2qrCpn/6/zz7zALw
         C7i1Rd1Lj7NLQtJ8kh+ISouTCGckj+aiEnt9ydJUyyVDiJwhI81KBO/tKyfiLg9k323s
         J0dy2DEF5KfJsZ+Y/ObfB728QN2TBREkESozF6jSpV6JU08ynmh8ZxeqOU2VNOD5WuUy
         lUUzQaEW6aH8IEmB9CL18B/WZoK+FqGvskgH1552PshfYGkovq4vgi7X7/6VHwnWcxIS
         9f4YNIWuv2ke1/cc5UetyB/Cxy4DgW8bgSeqMyrvQC90+XJlEksIII2tCweprqo0NvNC
         kPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZMioEE2V9W9n380OrBGw/xUDF5ltBHrEu/yeC0qWcek=;
        b=aWl4uD8TI09M/4XGcriJMckaFTXW/ePNVrZJ4PjJ/wY4Zw3z9USfnqE47CzwmFpluB
         +Xb1ldFJRTaMx6QFI0Vt2+VONDYlCbImbwHd+Cqsmd+qfA8yVfSx2y6KmrV7N31wZ6dD
         71ybM49q4xBBqBF2mzCyEfpZtDmY0F0QuMhBckbC930e5QZUdCsOkG5ntDi+XHWujnXj
         Yj/+SIav2b+R9IkfV1XkMiPVQsYSVeuRhUgmMxVTt9iwfpW6GtTUzGIRdCqG4WdFrjAk
         O0hATBl9rVWtPz8po8Nb9+Ef5YgKxYdW8WPcJ8ModJ3Ywl0TxnI5S80eGDsWPOQ0Kwc9
         ZxhQ==
X-Gm-Message-State: AOAM531UJARHxbAwtvj4NzgILZNrnjxfgo9zERrzJlX8GyjumpF+1zsx
	AcgL4yQqyW8vbZWw/h3U2aLGrSm34KE=
X-Google-Smtp-Source: ABdhPJwouufcq/1Dn7Qnin+yp3InG6MQcGN2meDF9Qt5DQ8hF0Ihth6O6JsgBa8UJ1TlQX5GZdP3Fg==
X-Received: by 2002:a50:fe98:: with SMTP id d24mr47461429edt.223.1600613455467;
        Sun, 20 Sep 2020 07:50:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f33b24861ef8a9f58bb5121.dip0.t-ipconnect.de. [2003:f0:7f33:b248:61ef:8a9f:58bb:5121])
        by smtp.gmail.com with ESMTPSA id m10sm6785777edf.11.2020.09.20.07.50.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:50:54 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/11] tracker-miners: upgrade 2.3.3 -> 2.3.5
Date: Sun, 20 Sep 2020 16:50:35 +0200
Message-Id: <20200920145039.2240-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920145039.2240-1-schnitzeltony@gmail.com>
References: <20200920145039.2240-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NEW in 2.3.5 - 2020-09-07
=========================
  * Disable miners autostart by default. This is a measure to make Tracker 2.x
    get as much out of the way as possible with Tracker 3.x available. This
    default can be undone with -Dautostart=true.
  * Whitelist statx syscall, used in recent glib.

Translations: lt

NEW in 2.3.4 - 2020-08-24
=========================
   * Block image/ktx files in 90-gstreamer-image-generic.rule
   * Set a deadline of 30 seconds for extraction tasks
   * Remove generic gstreamer-based image extraction codepath
   * Several fixes to libav-based extractor
   * Replace sensitive words
   * get the systemd user unit dir from pkg-config

Translations: es, hr, id, it, lt, pl, pt_BR, ro, sv, tr, uk

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{tracker-miners_2.3.3.bb => tracker-miners_2.3.5.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_2.3.3.bb => tracker-miners_2.3.5.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.5.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.5.bb
index e2ced395c..097bcdb6f 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.5.bb
@@ -15,8 +15,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check
 
-SRC_URI[archive.md5sum] = "a317bc50c5e63dd0746a48af478fb92b"
-SRC_URI[archive.sha256sum] = "7472aa28d7862620d3ca2bbec3b103df547d7319c12e95a7f7aa9f9f6dee4b19"
+SRC_URI[archive.sha256sum] = "9509d37fb29acd233058f4df5bd1234b692ac6f946bc2e5f7b8dbf51dfe5b9fa"
 SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.26.2

