Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.48779.1591047953238974409
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BD38m4uJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id j10so1298527wrw.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rkE7iyArxxgGLShgu6I9VdN9xniBAgvXKlgFgy+B93g=;
        b=BD38m4uJYkotGi602d72d/pqhykrcDj/pxIaQetUdRDgzbDB70Qm0BdJoF7mpwoe4i
         QMAY/lTcETBQE3VoQSI7v2c+qHisS2t2fwRzBFwZM26PHpvF4xJoJj56H/edV+qVCqUm
         CCM0S+AE9fuorD2cMRGLhhHMfqBUF7CYO4QfIPzW8zq2lT+NnZd3+ZDZcKaYLPrDjuMG
         e8pl4FXHGbO9yNlcyhOb0paeVAA5ccYPPIgnyCQm9bpw6x8gJHB8Kpyn1hjTkUEXugmg
         QNS5OeQyuUMW8FDMfLIiH4czYdX174uCW41RhputH3mfi9bb3qfyskZ6sllGD9GNceNv
         fWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rkE7iyArxxgGLShgu6I9VdN9xniBAgvXKlgFgy+B93g=;
        b=JJXYPCg22iGDxOnYWOeqd/+4GaxlQcfGN59W7QxaXV5azS/JEtCbz1PkLo7NuF3pUy
         51LsyC9scxnilG4BETEumfNO1OKkf75Oa5CJt/dKlYU5SNNwd9GEuRvf2eKB+f9GZ2Tf
         j5wgj4F6MTsk18AMxvJ7nxetiDjQE1ah7oP6LMPreuPlWnI+yY69pv4BQGg8OsdLf5zI
         hKQnpKx7UZ9+wyownEVTsWkVFM6EpJt+XXyekGnf9Vo5PcqtYiA0AxJjX/K65j8SiGxa
         o6jQv/luHBHNd9ig3WSisZusjbbhUgF6b/PZf0f61HScZBoLo9ecRbYAf8L/5wv+qW30
         UxFg==
X-Gm-Message-State: AOAM531TPKtllrCEzcVw9k4bwp9r2TPQ6yD0/E+qIYYaRpkQH0Rjsrad
	7/46H1/15ER17Jb6tJEE5/P8p7G34Bc=
X-Google-Smtp-Source: ABdhPJzMvfRQ8UDzerXk5luSTR193LNvz+ORjDFs7F+z7xpIOgE5n/M07xkcnuc+wR6fyhBHPoXfVg==
X-Received: by 2002:adf:e387:: with SMTP id e7mr18811156wrm.70.1591047951628;
        Mon, 01 Jun 2020 14:45:51 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:50 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 24/38] gnome-menus3: upgrade 3.32.0 -> 3.36.0
Date: Mon,  1 Jun 2020 23:45:02 +0200
Message-Id: <20200601214516.26624-25-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

==============
Version 3.36.0
==============

* Translation updates

==============
Version 3.35.3
==============

* Fix Seahorse not appearing under Utilities category
* Add Simple Scan and Usage to Utilities category
* Translation updates

Contributors:
 Michael Catanzaro

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-menus3_3.32.0.bb => gnome-menus3_3.36.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-menus/{gnome-menus3_3.32.0.bb => gnome-menus3_3.36.0.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.36.0.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
rename to meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.36.0.bb
index 24d645196..845b31478 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.36.0.bb
@@ -12,7 +12,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 BPN = "gnome-menus"
 
-SRC_URI[archive.md5sum] = "4262208c13f266d9ada7d356aada9e1b"
-SRC_URI[archive.sha256sum] = "c850c64b2074265fe59e099a340b8689cf3dd4658dc9feddd2ab5e95f1a74b74"
+SRC_URI[archive.md5sum] = "a8fd71fcf31a87fc799d80396a526829"
+SRC_URI[archive.sha256sum] = "d9348f38bde956fc32753b28c1cde19c175bfdbf1f4d5b06003b3aa09153bb1f"
 
 FILES_${PN} += "${datadir}/desktop-directories/"
-- 
2.21.3

