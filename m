Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.18013.1590941788817480025
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hIp9fphk;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id e9so1189642pgo.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OhP5mmF+R4pbXBtnGFV9W54svxQaIqXSunk4MKsEy8k=;
        b=hIp9fphkhwNpw7GXkvrkuTuoBh2pCBmHUy1HQlAeIJ1gtjx+ETr6f4aCpI/9SOl0wF
         SMa1ngzeFzi/bjrXkbN3D6XjO6KrQ0KybdbCI9z1sBmdDm/rz+m5dYPLvFyM9V6fbJ71
         3PTif/49UkxJxaxyLNoz++RsZ2/OFJUE/n5Mx2bGV/j1fHVeg+QGw7KanlaLgdZltz7b
         vd2uRKi1j7i3gS6bRjz5IDq6fCfSGaWgRZbs9jf381AqzZYOrfp+aGkVRxv10ZrXM2bb
         MwEdo0BqVij073+uFWQfnq3zMqr2N9BBnPu32zY9kBj/DgGr8HK5VztaIiYkxInXiQ3H
         0yQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OhP5mmF+R4pbXBtnGFV9W54svxQaIqXSunk4MKsEy8k=;
        b=SjXKvY9sk2Y4m2QC+EoVMzBJraXPdN+0VY6NKy1BW1NZ6GxPr3cP4OxOO5zkoRFx2r
         LgfVC57+QIWCxn0ZiR5fMRxqrm6vERINdtReiUeKITgteB6jHnx/XkRe+QTWgcwe/P8o
         Dp7fsiMY64N69sJTvUAPOv3JmD78ozVlSrhKJziyma0CbQ9z2GZ0oU56yE8BRxOac4PU
         fQhcC/kq8jgfSIIWptaXI1l5HDvVp2Ed8OUS+RBTU4hV1RJXvM27H8yEp7Zr0z7cc/NO
         O+dA8Wjl0cP3I7wzgdhFjHeTS6TzgA677/2b9ZtJohM+H4olFciqYIrIr1+tkuDlCGUE
         4gog==
X-Gm-Message-State: AOAM532hnZSSht/EAyZTC9pNd9PGFRKgYtTp3WV4lETOtqG/fBNRMNE4
	aDxyFeOoDvYxy3bcsaK6WoJeGEVF
X-Google-Smtp-Source: ABdhPJx9G/gpLa1VSNkxjTXDfKpTKW1cQpQpjhrqhBEVFDZ6TRrNJKrZIYLsGwOFz2ZghoLa+EoZ9Q==
X-Received: by 2002:aa7:8c0b:: with SMTP id c11mr15573297pfd.262.1590941788140;
        Sun, 31 May 2020 09:16:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:27 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/35] netplan: Depend on systemd if it is in distro
Date: Sun, 31 May 2020 09:15:48 -0700
Message-Id: <716cd27ec045f82929d0c2c3b976286481a57388.1590941673.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

it needs to link with libsystemd when using systemd as init system
Fixes
Package libsystemd was not found in the pkg-config search path.
Perhaps you should add the directory containing `libsystemd.pc'
to the PKG_CONFIG_PATH environment variable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 60e603f11ae1cca38553d18cf411f1a77207a97c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/netplan/netplan_0.98.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
index db029a4b8a..9f123c70fb 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
@@ -18,7 +18,8 @@ SRC_URI = " \
         git://github.com/CanonicalLtd/netplan.git \
 "
 
-DEPENDS = "glib-2.0 libyaml"
+DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+
 RDEPENDS_${PN} = "python3 python3-core python3-pyyaml python3-netifaces python3-nose python3-coverage python3-pycodestyle python3-pyflakes util-linux-libuuid"
 
 inherit pkgconfig systemd
-- 
2.17.1

