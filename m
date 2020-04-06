Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.7282.1586164853549920260
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sb7lV8Fv;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id a25so16556928wrd.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5UnVhTQo1ZJu1KhHCMXb105YtrgNeaTXOktJtlcBLn8=;
        b=sb7lV8FvVq7cZYlbS5uPr3zuizFj+qrJvsNE2JZa1M3ndgg0To6X8AIk6ImO54NplG
         B4lY34ISbwpslwgWHLoANuOM6NJS+4b2dwcVq/ChKytblH4UXfl/FV4NobpCy/BloP4W
         ESnHgrtPtq61f9mQ+y/JWv7I8jPnMUZClwTN9iaQX4FAjuzQCnHTKzI9yN9Q/pmi63+m
         s8vcJ2eOMjAGDStNWUZgeu2QB6Sa0x4fzec68OTTdD44XvWH+cB21IactS0lf0vWJWIk
         Ykjnzm/GkM/aqmISrhMTmJp366hnSM9M1VwPAJrCQ6VUR3b29wnIAvoDu5rXZAwXY4fN
         Udgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5UnVhTQo1ZJu1KhHCMXb105YtrgNeaTXOktJtlcBLn8=;
        b=Wca0KZmWz29AM9D/Y/ZUF8QgyCIEjjHhLnT1urdK9NCK8GOHrMUlzGhrXHcHeZ/7cA
         Z8YaeaccEMbC3lEbGdzZ25Hns9MNjhXmymcMXWB7rXclfH4NApa5RglDle6n/IICyp0X
         VWLhUY9M8oxh3c6rDL4l5wTcd69SLnf2z3H2TQPabcVdSoO8bx6UaYPY0J79OYoTQGSK
         dMUc76QMSu6JyrPI6wukMVNxdrzxIwOB9rb5fiDCydFq5N4PwByB7c9nwQ3RIHlE7LLT
         bNbnQKD2JknXF13s4LpfmB/uTet2hnhw0CCDDIbFfh4pEvNdp4ZdWzcRJvON4cyeKikB
         wcjg==
X-Gm-Message-State: AGi0PuYxUbcFmUjcfsJTWomr00dY8bTAh+iOthgjXUHDphJ79l95H6pL
	3iI1nDbuOYHHmZnohJj1U15JQlEm3/0=
X-Google-Smtp-Source: APiQypLuCJMZp6fM8fvGt69APhrupPN80vY8sSBvxK0cVjhtEnHJTAQ5Ae2/Kda/k530t45fSO3ivA==
X-Received: by 2002:a5d:4e09:: with SMTP id p9mr691178wrt.376.1586164851932;
        Mon, 06 Apr 2020 02:20:51 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:51 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/14] tracker: upgrade 2.3.1 -> 2.3.4
Date: Mon,  6 Apr 2020 11:20:28 +0200
Message-Id: <20200406092032.3574-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NEW in 2.3.4 - 2020-03-10
=========================
  * Brown paper bag release, fix NULL check.

NEW in 2.3.3 - 2020-03-09
=========================
  * Fix race condition during tracker-store shutdown maybe leading to
    warnings and missed writeback events.
  * Made fts:offsets stronger against corrupt FTS tables

Translations: ja

NEW in 2.3.2 - 2020-02-18
=========================

  * Location info for photos is now inserted into the DB. It didn't
    work before as we failed to process SPARQL "blank nodes" correctly.
  * Fix for oversensitive FTS5 index corruption detection

Translations: ms

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../tracker/{tracker_2.3.1.bb => tracker_2.3.4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_2.3.1.bb => tracker_2.3.4.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb b/meta-gnome/recipes-gnome/tracker/tracker_2.3.4.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_2.3.4.bb
index 590d7bdaf..ae9077147 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_2.3.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_2.3.4.bb
@@ -22,8 +22,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check
 
-SRC_URI[archive.md5sum] = "5e75b611b190c4cebf53e3de15266429"
-SRC_URI[archive.sha256sum] = "b6748726e465ad2f4d991560634b1fd0df8841f3d981b3b837c4162abedf08a1"
+SRC_URI[archive.md5sum] = "9937cf4812ca85078907324c7cdf7dd8"
+SRC_URI[archive.sha256sum] = "577952244ab977c78b0b88e2f63c4197eaba16e4d66bff692b7f58993e06516d"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.21.1

