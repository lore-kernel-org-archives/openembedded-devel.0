Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.20564.1600613455674198677
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2020 07:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jaE8WKSn;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id b12so10368873edz.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2020 07:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uADumxPQl+eJscjzD5bHv+xMeMeOELo0Qo5SS1mweIs=;
        b=jaE8WKSnp3tGGyfdYgXzQ/UsrE5N1Z9j26FaverwP+RER/bWAATYDcuLIkJIqEzID4
         S9+2NY6cbjwlnehDlLr2/6HfTT4zkef2Tw50h635ZYK4WnvHTR100hiovHko4qHIneOB
         wpao//NF+xTLltdrQ1cc2wPT5T8oib+dlYrN+i85X79oDDG4PVrNXZKpwGZB8dMjg8Q8
         oklbkoLr198N1xy4k/Nh4Q7jTgKUj9rDx1/SfAoC22VurP9gtMJsOytgoWTj9zl9QuzM
         9Fc8KEoT94eQxfVr1un14HOZ7N0TuG/7mj3l0yBsSCUWuLveB6lR4++wr+ZyUPNqLwOz
         Do+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uADumxPQl+eJscjzD5bHv+xMeMeOELo0Qo5SS1mweIs=;
        b=E85DOFYRK20k6E/I5UUpQuH2UOCL2YIpqtH1dgeQrEJQZfNNaTeOJ/+x6FXBPFF4yW
         2ZzjfuWsBvu0qRaDDNNrpdioXk0AcD+DbqefObX3+3axQkeTV3AmXk0YP0ccxtf+Fgvk
         3whKmpmjArNphfgvOB4jX8U039Az8XmTcu1bWea7Rw8u771MCMSBNoMdeX1Tn5yjCfjP
         XY8E+pw+tFRHVX8UQQFnkcYzDZ6+sDyYolQVNT9BpxgEIqn0jEhDCqOWav6D5M7GcZZ4
         EyDR6kOZLJBEg2VdFFKTjFMRj3C8IcthcutGtLj4ypBjZgVdE2VFpObRzXZgJs1BzGqz
         Aztg==
X-Gm-Message-State: AOAM532RhEXpMY+viPli1HfRt4D6jOVarU9Y63c3h9VIdv9Q6vS14foK
	raDAAIrG9F1V27VUDRtPqzJDpYhXwsw=
X-Google-Smtp-Source: ABdhPJwGT6bfU0vMeoluiC7ZUDk9riqMvoyXmIfd76l8tTwwMqH363prgJAWInJgFR2MEdvYFmix7Q==
X-Received: by 2002:a50:8e17:: with SMTP id 23mr47683584edw.31.1600613453797;
        Sun, 20 Sep 2020 07:50:53 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f33b24861ef8a9f58bb5121.dip0.t-ipconnect.de. [2003:f0:7f33:b248:61ef:8a9f:58bb:5121])
        by smtp.gmail.com with ESMTPSA id m10sm6785777edf.11.2020.09.20.07.50.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:50:53 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/11] tracker: upgrade 2.3.4 -> 2.3.6
Date: Sun, 20 Sep 2020 16:50:34 +0200
Message-Id: <20200920145039.2240-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920145039.2240-1-schnitzeltony@gmail.com>
References: <20200920145039.2240-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NEW in 2.3.6 - 2020-09-07
=========================
  * Do not autostart tracker-store

Translations: de, es, hu, id, lt, pl, pt_BR, ro, sl, sv

NEW in 2.3.5 - 2020-08-24
=========================
  * Add 'tracker export' subcommand to ease migration to 3.x
  * Use correct signature for DBusSignalCallback
  * get the systemd user unit dir from pkg-config
  * Replace sensitive terms

Translations: lt, uk

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../tracker/{tracker_2.3.4.bb => tracker_2.3.6.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_2.3.4.bb => tracker_2.3.6.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_2.3.4.bb b/meta-gnome/recipes-gnome/tracker/tracker_2.3.6.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/tracker/tracker_2.3.4.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_2.3.6.bb
index b36e66b45..2c11976ca 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_2.3.4.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_2.3.6.bb
@@ -22,8 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check
 
-SRC_URI[archive.md5sum] = "9937cf4812ca85078907324c7cdf7dd8"
-SRC_URI[archive.sha256sum] = "577952244ab977c78b0b88e2f63c4197eaba16e4d66bff692b7f58993e06516d"
+SRC_URI[archive.sha256sum] = "bd1eb4122135296fa7b57b1c3fa0ed602cf7d06c0b8e534d0bd17ff5f97feef2"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.26.2

