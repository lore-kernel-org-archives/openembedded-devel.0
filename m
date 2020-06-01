Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.48687.1591047961004400598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UB6MMFfa;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id e1so1320869wrt.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fDHzqfjYN0MzfCYLzDH5pxTVci9j2rvGixlcER6YnCI=;
        b=UB6MMFfaR6AKmMVZRke9KhLBuHBbllx7dmNRP9MCc9yQ6d34DuHM3F3QINdIAxxOKM
         uL0bGxCp6ANQZZzlqihRIybSlRgq3stxJlml9tWAziX81q1OLGS1m9053zCSZHNee6HD
         mCGjJWUjx2eXS888MW/ZzvuR6SMpQSyHivj54YsBkpG80+1LSoh11s9r7VqybVzxVbVd
         ecCMdQKWtg67wLzncFJYCiZZJgOJu4IlV8VKca3w86akpppqjxfeNQBsbQQK3gqTDgR0
         AxooxJJoM/itcgYOrxcZ6tw+6V79IyZCAndObbLwB3SL6Li2R6ZL0jRXf/vxh4KMzL4f
         2ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fDHzqfjYN0MzfCYLzDH5pxTVci9j2rvGixlcER6YnCI=;
        b=IZXCPfwAXUQPG+uickOb5d84jj5Z7CJu4/X0sJAsjEybJPLosqZA5ixyLUECXtQ8uJ
         z56v4Clm3AXFEL+tX6Ro9WqqKIV56hACdpbqfwrWRfzENU94uAhNT6qp6qiSMStxKpBh
         A6QSshMRP3KAEWJOjP4PB3482+LKYFmzpuSacBoi1CqruxYDf+JBzH93uxwkc/P9mxnr
         oaaxoUy7UWpLTyGXt3OuVympQwHgL3QWmFSgJYvyN+dmMbxuAiK82n1xOKI/q/8rNXQq
         fd99SNwYuOxOYceL5bXEB7wIDIDuxyzDoYF9iVOzWCJkBYVHuTGlLCFKzUWFxawpOoTR
         yGMg==
X-Gm-Message-State: AOAM532IdBii6gLZSb3rQoqHx2JJmE/aE6e38uq65T3rmUnx0i0qk3n7
	aWHG4gRkeMgybeJ6tYwLyzfBTd9C2bc=
X-Google-Smtp-Source: ABdhPJy4JwC3U+ztVJSqWv+tpcriPuTkx0478wzGZhVQNaoQsqiiRxjtVWw4AWErYlWkPFoL8iMmtA==
X-Received: by 2002:a5d:4b85:: with SMTP id b5mr23120813wrt.8.1591047959366;
        Mon, 01 Jun 2020 14:45:59 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:58 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 32/38] libwnck3: upgrade 3.32.0 -> 3.36.0
Date: Mon,  1 Jun 2020 23:45:10 +0200
Message-Id: <20200601214516.26624-33-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

==============
Version 3.36.0
==============

  Fixes

  * Add a weak reference callback to window to disconnect obsolete signal
    handlers (Alberts MuktupÄvels) [GNOME/libwnck#141]
  * pager: Add scroll modes [GNOME/libwnck#134]
  * meson build fixes (Jan Alexander Steffens, Jan Tojnar, Victor Kareh)
    [GNOME/libwnck#139]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libwnck/{libwnck3_3.32.0.bb => libwnck3_3.36.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_3.32.0.bb => libwnck3_3.36.0.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.32.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.36.0.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/libwnck/libwnck3_3.32.0.bb
rename to meta-gnome/recipes-gnome/libwnck/libwnck3_3.36.0.bb
index d88161a3d..8bca93f6d 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.36.0.bb
@@ -17,8 +17,8 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
 
 inherit gnomebase gobject-introspection gtk-doc gettext features_check
 
-SRC_URI[archive.md5sum] = "89dbe5a1843fd3745b8b64b34a2ef55d"
-SRC_URI[archive.sha256sum] = "9595835cf28d0fc6af5526a18f77f2fcf3ca8c09e36741bb33915b6e69b8e3ca"
+SRC_URI[archive.md5sum] = "00bb40dc6fab76af0da33e88a34b6378"
+SRC_URI[archive.sha256sum] = "bc508150b3ed5d22354b0e6774ad4eee465381ebc0ace45eb0e2d3a4186c925f"
 
 # libxres means x11 only
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.21.3

