Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A31CD98D8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:19:15 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87543.1781338745544726069
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qt2cBR5Q;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so14250895ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338745; x=1781943545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEarUeyI7QJ6xip3ls6I7t/i/f5yHptBuV57pPIvW34=;
        b=Qt2cBR5QpQpHjoR4KunkRI2vyRaMNZATMpENIG4zDUd7EHn7iXbm8R8UO1u5sJ9XMQ
         EToOHr7F3U7gyzaNvE6Xdg0+ZcPWLBdY46jtIdlw2k2QT6yPSHDqAytymtp2kCtr+8cA
         paownqOUa8EjdnFeNM0mxSnF0YW4p6uCmTk0eHmBpLgAjwv0BadQ7PmMJrQQd2Cs0q1d
         7Nk0L0kJBecyIgYzZJJFtKwYX0sGUJavaXd0VabbDh2FQJ4QfzwMgr/xR2DC1MsOthPO
         U2fqoeHDUAU6CxSCoUXMHPcxQi1GSL3WUeLcnzcA8hdw7cLaalBQSM1Y41+lwTbHEa/f
         pVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338745; x=1781943545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pEarUeyI7QJ6xip3ls6I7t/i/f5yHptBuV57pPIvW34=;
        b=DzthTVq1XoaC3tBXdI7vyX4n+CyRm9hsPmWVO8UXvmHaR9RTvUQvfaA1U88fKCYgUB
         wvPd0BbIGCmWFFz5UswXxRD4KKISilg9AfKVpQz3hF0zS65EQl0yiChPuEbqGBLw0Ngn
         1js/dHwJ9CMw4WbmNTh+QlLIp1tD1lhinAQDEuD6mE8Kwu+BudjR4k7rjfd10VXaEvND
         dA4OEuAHfd3DsirXLGoCMQYdqYphtxQLcl96IubCP+Y8/RRE3mTMLd59ruhx+2gAIzvS
         Bstgv8NozHh7VGZjSNaivdhHDf7+I+zrQBboORtBGVjpSSkZbnXJtO6D7PxCe2lGE68E
         9AJA==
X-Gm-Message-State: AOJu0YzQ6j3qV7WeH4PvVxftEu7xqSxXrr2bJPQ6YKfisyPtTDEwD/Bx
	xnCTO9reF/eUphxzJthSrLQAlZKPW45VqvZBVwTQaxtr0m1flsWzcl64VRYYQjeY
X-Gm-Gg: Acq92OG74fGnqU2LlUBEpl6qZB7MhReOzYgrM/TQDi0O+LftZCz8xlg30ofiN3LZKfB
	TRCAgFxjExHUrEbT7Zk4BVIJIVqjkmalhqK/upDaNjpFvu3766nyhPj0/l3sHdK9xnxXFhkd5pE
	Bbxn6itdl2YkLkGDNKP/9UTOPE+T3n/pYKrQCACtmY2+oKkVi8QUUVAe1yjFQuieFAijTBwi0nM
	1Z8KptFGG9j/RAGjQZ2VA342bWtMTp4gvzd02Oryce3ZN+/ZbcWEx1Pi5HYoTt+qjCyzNADWkEy
	cYG5NbV0x1+RQ+dhcc4zYB15HtV42TlzmqF4NcpcfFmNKQ/EOHyz2uRWAjrQCjsXf2uuxHp4Huc
	44p4PotaH24dDwvwjFmN16Y84bSlw37KY4x0dJXhuex6/oRVQSuePj/st4WrNvdr9360bEjSjxI
	+ybh9eTjjKgEdFC1e1ajb2zR0oZl3hHJwATLX9
X-Received: by 2002:a17:903:120e:b0:2c0:bd0f:1529 with SMTP id d9443c01a7336-2c41255ac72mr66411725ad.23.1781338744876;
        Sat, 13 Jun 2026 01:19:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:19:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][wrynose][PATCH 11/16] gdm: upgrade 50.0 -> 50.1
Date: Sat, 13 Jun 2026 20:18:19 +1200
Message-ID: <20260613081824.1223609-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127563

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fixed issue where GDM failed to properly terminate conflicting graphical sessions
  started outside of GDM (e.g. ThinLinc, TigerVNC). GDM now queries logind directly
  to find and terminate all conflicting sessions
* Fixed plymouth hanging indefinitely on headless systems or systems without monitors,
  which prevented the system from reaching graphical.target
* Fixed XDG_DATA_DIRS construction to prevent gnome-shell from failing to find its
  files when /usr/share had higher precedence than /usr/local/share
* Fixed bug where GDM would set XDG_SESSION_TYPE=wayland on X11 sessions
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 78e5d3c646b12b2342b341fa10c650b8142cd372)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/{gdm_50.0.bb => gdm_50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_50.0.bb => gdm_50.1.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_50.0.bb b/meta-gnome/recipes-gnome/gdm/gdm_50.1.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gdm/gdm_50.0.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_50.1.bb
index 858933a4b3..9332c7836c 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_50.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_50.1.bb
@@ -21,7 +21,7 @@ GIR_MESON_OPTION = ""
 
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext systemd useradd itstool gnome-help features_check
 
-SRC_URI[archive.sha256sum] = "646f53d68f2d2d147146ffaeb85047ded8b813dcb1c104d8f0ec36ca609eb5bf"
+SRC_URI[archive.sha256sum] = "770159373512192410f412b5d0c4678ec1573f1ae4b39c81fe75861fe8890174"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[plymouth] = "-Dplymouth=enabled,-Dplymouth=disabled,plymouth"

