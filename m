Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.48673.1591047947366703829
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HE41S+uY;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id x6so1268958wrm.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p1bkrNw8CQRDlt9mMXtxvGQwrJTh/2AFaKRpl4jfYJQ=;
        b=HE41S+uYBv4NRlDv6QBtz7210gq7ZENmZHGtWdrnwHxZb0CpVKpr/HB48V2hU8OLNL
         35fqqEE3beWbIw8f0T3EyS1+Fegi97+QV3e3kbkTpsqwYTU2tHW0ivUpqQrB5yqFhEkg
         T81muxUTwyR9c3pGbbUZib9dRVpcOmJZy//X+DNwMTqtZk1ZxFobt2jkQjFuYY2lJ0G5
         0ymP73nLsRI3fsC1FsCW8FiTlGNDH69sVzOM5McTWbYyqVdyOEm7xIR4MsqjoxJQfzXv
         7T+tF0opbr7IrWpGEkrAmhwDxucgm4d8XISfZrs4Z52XFgW09K1JmCCoRcF+TLW9oUj3
         rrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p1bkrNw8CQRDlt9mMXtxvGQwrJTh/2AFaKRpl4jfYJQ=;
        b=Uf8hHavFvQXdmjycF1u6q5v1Fady2TFTsyNZ9oF4ohJ6HyZvP2wCQsoHyOi/MytFDF
         LN4t0l8h4L8yTFTu/Hov5EfMH0EF+cLAOTvFtqb3MLIt1bU28aZ7kHvpwkxVmpjBpvXj
         Foj+wKBQMKUXNbRcjutDO40HsSZRLei50cHhlB3VxI/EGg0BLKCBMuzUxNgL/I9SNQpo
         xu6/3t260d8Kk2pzTQnDCtaDc9MQIU0vdtTrnVuSCrKkxpavv7vdZrRyoH7NL+9me3Jv
         wiqHSM14a0w7Tx7N1d3ayqsRD9QdnYA8JN6aH9N2RsKRx1X5HhxzWzb2ISWYVl3Zkh1L
         vxSQ==
X-Gm-Message-State: AOAM531NAHYuAc4TnHgJr3SQJ3KccX8s6XnB4TZDOP7a7EHvmPoGw5K/
	XYiXgrSgGBzQ4lxPqrpypIu6hHAyJUc=
X-Google-Smtp-Source: ABdhPJwQWmMhhTIlIo9pZcO4Zrn8KCZadLwWzKuvEfWOToEtagyVKuZTqUiDI0Ahs13mwnDsuX9gLQ==
X-Received: by 2002:a5d:5001:: with SMTP id e1mr25419072wrt.56.1591047945728;
        Mon, 01 Jun 2020 14:45:45 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:45 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 18/38] gvfs: upgrade 1.42.2 -> 1.44.1
Date: Mon,  1 Jun 2020 23:44:56 +0200
Message-Id: <20200601214516.26624-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Major changes in 1.44.1
=======================
* udisks2: Fix several memory leaks
* Translation updates

Major changes in 1.44.0
=======================
* Translation updates

Major changes in 1.43.92
========================
* Translation updates

Major changes in 1.43.91
========================
* build: Fix login_tty detection on systems without libutil
* afc: Handle permission denied error
* test: Several smaller fixes
* Translation updates

Major changes in 1.43.90
========================
* google: Add support for move and copy operations
* google: Several smaller bugfixes and enhancements
* goa: Add support for certificate prompts
* sftp: Fix file ownership when replacing
* dnssd: Prevent crashes after releasing resolver
* fuse: Prevent abortions if modified time is not set
* Translation updates

Major changes in 1.43.2
=======================
* gdbus: Add workaround for deadlocks when cancelling jobs
* smb: Improve enumeration performance
* test: Port to python3-twisted

Major changes in 1.43.1
=======================
* Don't set a content-type that isn't certain
* Replace usage of deprecated GTimeVal by GDateTime
* dav: Add support for services with IPv6 link-local addresses

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.42.2.bb => gvfs_1.44.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.42.2.bb => gvfs_1.44.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
index f04246f16..ec0ac2b29 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
@@ -9,8 +9,8 @@ DEPENDS += "libsecret glib-2.0 glib-2.0-native libgudev shadow-native \
             gsettings-desktop-schemas dbus"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.md5sum] = "8dea2f6a3f327a814a347758d4350e4b"
-SRC_URI[archive.sha256sum] = "b57af97573bd295aa50037eed29c6ba7a36188230c515e007c3018855a5cf949"
+SRC_URI[archive.md5sum] = "72383474f52d05c21ef2be96d0b91974"
+SRC_URI[archive.sha256sum] = "50ef3245d1b03666a40455109169a2a1bd51419fd2d51f9fa6cfd4f89f04fb46"
 
 # depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.21.3

