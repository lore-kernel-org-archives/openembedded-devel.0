Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.4433.1623220736567012796
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WEmk1jkg;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id k25so31171503eja.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uiEzdLt7qkY6qtyGcMoblNRLn7xo0b6T/CeRr7wzQyQ=;
        b=WEmk1jkguv9Ps2pcr5mV6BjSMLxlSVMi8+SkwY+xWLYoGQkF3a57BSjXCKL6TfMbCg
         bxFE0Z/2hBcpDY8R6o/rxTHHJU0NrdaAwlFjlkUKOvNUkwukpnNqFkIU7gnJL07epnUE
         ozVRkL2zmodNyjSr//HbrBQ8ujJISEHG6UtUn7YwfyXOfgB5o8nNpi+9aHtjbmqdvjp5
         XdKr+LicIsCD7MO5vsFm4IGvGYcfKyQRyMA/T1k5a0aVwJ6HC1mk/2ssYLkenBGBHAOY
         ypFVvBsJvQNNqw9AV9g35rWNxgYbXWKh0xNO4Hy5AU1qPT75hA5bzYnMiCu59itnb9FZ
         rwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uiEzdLt7qkY6qtyGcMoblNRLn7xo0b6T/CeRr7wzQyQ=;
        b=rpB9Dxg9GJvyOonEiPSvKgoDm9znOeCPxHyOrVokRjbQuswcrWg+wMUABhFAcT6IUo
         GnhflWzv3GrUq1yR1hAYrbxv8V0VeAJGQFaCCk29oQDVfzFwJ33+6oXcRvx4Ca5BkGd5
         m5jkeF0cvHVPUAZqt2nF1eqvFteZrKErb6GROOoL7CA0tc9Xjzhm/CKsWwg6o1CWqmnt
         +1WV2cI8JWCVC9SecQsEh8wtmQa/p3KrS4Ndnv/v+PEYQBzJwgJLluiieuR6odRWeHnO
         ZeVxlSg55FslEUyKNWDS4F2IfeYWwiR1HHyvH5gnnhpSZ5FM2nskUx8bqnPN4HLVei7f
         dRtw==
X-Gm-Message-State: AOAM533vyYnxTHXmKEEVY1Ecu801h4h9yrhhKYGNOeQCYs1iCtl8TiNx
	25jRDSrsm8XW6umIaSrJSfYIC2a+dlHZjQ==
X-Google-Smtp-Source: ABdhPJy7TlMhUYoUEL+cLPkmoWFoUAvstC3muXNya4WuC73al617LegmfFDUNAXT/38rszCPIdrKvw==
X-Received: by 2002:a17:906:a058:: with SMTP id bg24mr26823071ejb.33.1623220735108;
        Tue, 08 Jun 2021 23:38:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:54 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 17/28] libgdata: upgrade 0.17.13 -> 0.18.1
Date: Wed,  9 Jun 2021 08:38:20 +0200
Message-Id: <20210609063831.3400611-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Overview of changes from libgdata 0.18.0 to libgdata 0.18.1
===========================================================
* Translation updates

Overview of changes from libgdata 0.17.13 to libgdata 0.18.0
============================================================
* Add support for Team Drives (work by Ondrej Holy) (#25)
* Bugs fixed:
 - #25 Team drives API support needed
* Translation updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgdata/{libgdata_0.17.13.bb => libgdata_0.18.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libgdata/{libgdata_0.17.13.bb => libgdata_0.18.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.13.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/libgdata/libgdata_0.17.13.bb
rename to meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
index de33fd829..a65ed051c 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.13.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
@@ -30,4 +30,4 @@ PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
 
 EXTRA_OEMESON = "-Dalways_build_tests=false"
 
-SRC_URI[archive.sha256sum] = "eab9ef792c3c2b9ece19d45aea15225aba8df2521bc12785b1b2d3318d8c472e"
+SRC_URI[archive.sha256sum] = "dd8592eeb6512ad0a8cf5c8be8c72e76f74bfe6b23e4dd93f0756ee0716804c7"
-- 
2.31.1

