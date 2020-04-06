Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.7336.1586164857773646744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XpvtL/3O;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id o17so2247243wrv.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sWWqExzTDZ/jLOrqh/1VYCXXwoWXMZs90PZUrH0Y9c8=;
        b=XpvtL/3O0XXS56w/UeLvXoBlOrWWypKkvFSEDZcq2hQ3fllHfbLm3BX9PhbuB2p6cd
         tTi9G645lc/vyPxCFW8EbbhClEgXP4W4i6hP66aOva7dbPyk4hGwIkCsn+C2xCEv9Occ
         cE0IDl2HrjvkcsMNEfNahJs2esPmBu4hOezonCFFJ3FWRiqAZyoZfQQENsesoEKW9vKg
         QpzpY3Tx6/1ZXJxWZEaiesI8S5hY59etwZPx0xV1GMqxXQzUZRcakuqacIMK6SfrVKkc
         IJKYVQPJbh8ZeSb4oiwIuT5P1rZov35w026nSrCMabzvpZkQ+SOuV3WCZNjstzbL9RiA
         uYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sWWqExzTDZ/jLOrqh/1VYCXXwoWXMZs90PZUrH0Y9c8=;
        b=cINuYznjgEEg6nJQZRdbK9V0Wa+/sJYhS8NsElxMg2V97C6UnXq07ny0KetbKYFkU9
         hFPuIB7Dav3v8w78pX9wmeeC/r18E1MupYEaJJX4fg+YsA0v0HHVQgUorIZx5//NRV6P
         lcaenInUUi1SxN4IogusFASuRqiyWaGyOIgqPBfDnmz/Q3Nov/zWxUY9eRMoCTV+PAnT
         geliuuNZMe+eaPjSAdZQ1NEhaI39y8UxoFVO657WVwDw2Dj/g4+rcdYJFJ+vZo+HGHqF
         d4w3hf4kBWW/WO9aJDtI4mXK4MN8+uw5Rh+6d2pSbVgqomBDJu0Ygd0JgsIumyjZDSl6
         Us4A==
X-Gm-Message-State: AGi0PubJawLM9JAjJuJ6UaTEEUV55/FmJ8IDtmQRrza++ttXZR5PwtO9
	NkziRfIeqILZjCMP2x51LpTogWDw8mc=
X-Google-Smtp-Source: APiQypL/JuznEbxHM3TVRrAQKS15Xca32h4PRWgrwdvQMs9fXhbL8/kNYdd63YnPDaj8aw/76zQFPw==
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr9206868wrw.425.1586164856119;
        Mon, 06 Apr 2020 02:20:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:55 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/14] libgdata: upgrade 0.17.11 -> 0.17.12
Date: Mon,  6 Apr 2020 11:20:32 +0200
Message-Id: <20200406092032.3574-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Overview of changes from libgdata 0.17.11 to libgdata 0.17.12
=============================================================

* Make OAuth 1 support optional and disabled by default; this makes the `oauth`
  dependency optional on `-Doauth1=enabled` (#1)

* Bugs fixed:
 - #1 Consider loosening the liboauth dependency
 - #23 Authentication errors with Google Drive
 - #36 Clarify license in meson.build

* Translation updates:
 - Basque
 - Catalan
 - Chinese (Taiwan)
 - Croatian
 - Czech
 - Danish
 - Dutch
 - Finnish
 - French
 - Friulian
 - Galician
 - German
 - Hungarian
 - Indonesian
 - Italian
 - Japanese
 - Korean
 - Latvian
 - Lithuanian
 - Malay
 - Polish
 - Portuguese (Brazil)
 - Romanian
 - Serbian
 - Slovenian
 - Spanish
 - Swedish
 - Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgdata/{libgdata_0.17.11.bb => libgdata_0.17.12.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgdata/{libgdata_0.17.11.bb => libgdata_0.17.12.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.11.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.12.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/libgdata/libgdata_0.17.11.bb
rename to meta-gnome/recipes-gnome/libgdata/libgdata_0.17.12.bb
index 197a05d37..25bc202ae 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.11.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.12.bb
@@ -29,5 +29,5 @@ PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
 
 EXTRA_OEMESON = "-Dalways_build_tests=false"
 
-SRC_URI[archive.md5sum] = "7b98e9059255d8a2fb147c4e727230a8"
-SRC_URI[archive.sha256sum] = "6b9917122e4def6e6f78bcb660e49e146540832e296abcb5cde99829a04ea986"
+SRC_URI[archive.md5sum] = "9d5692a2308bb949af801be66989e164"
+SRC_URI[archive.sha256sum] = "a0fd6f8820e8bae019c1f6ffab5af7fcd6d7f147915bb968b56df3ad61b42318"
-- 
2.21.1

