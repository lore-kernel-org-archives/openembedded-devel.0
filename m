Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.4686.1592566338114175773
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=doeModsx;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id dr13so9829878ejc.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L+9iEhfWJWnR+Vh4J8GEgyHQZN+87keGxVspwFPif+U=;
        b=doeModsxME4TQqhS7ZfCLV45wT1c6OnaWbIC3wu5LkRQffchBiPDLdWMy6yqrQNV1T
         QumVUjk1TKGg5D7xVXZfFL0mHiHCtQVihHpwxYRqmSGQCSfXVUgtiqoea/yzn7YdRqks
         7V8sZ3i5xpgXzhJY0KANR+zJk8DsPlBnALVhOv+kRZY1/rSX67NsR07Zh96ek4npppjr
         5cLOSMtXN0U62m0rt0R/JDQBZx7O4Rd1yrPDr7PiKKT0z/uImZJZFqekuraEzB9UDCkE
         f1MiRNtQTU6Qbck9mbIoYnJ52BfSR0Ie/5owC6vwPYQSfeuHzPbCqVvoedsvLAE5bKaU
         wQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L+9iEhfWJWnR+Vh4J8GEgyHQZN+87keGxVspwFPif+U=;
        b=sblTBpliUWG5bnzSz8mOfazp4Vj6YSG/10MtaZ2KfLaXP2BHh1/ub3Hco3cHiBVW6b
         CYikrpzKilpB/KjUsU+M2hV0gK3Jj0LtIi1JS/pnt9LlUZkYTHm5DrjqmPzlqirZymOF
         muyYzfQ9oeC+sNqrvapzHXCi4sd0eh2J2J7TimLX8Fy8u9au5DbQdsqXNLgg5WGPalkG
         YHl89BOuuPisKsX4jFrAuvlILBmJ1OVuQ1pGA7svEEqbiylDW4q+y2I3f0FyN/BK5bHJ
         5zbPKYvd4FlPAitm9GMqa2datBgj5udr3jd9EZ6H3NMUu9zCCobZWpnZV2xrOqDIKudD
         WcIw==
X-Gm-Message-State: AOAM531cenD6OuHM1RZDiGHGg2Hrl6jOMXzi6sYMRfiXqcFosVub8zB0
	8+J5eHmjdH0ZVfzf3aDvOlksX/WHtEA=
X-Google-Smtp-Source: ABdhPJwi/huHmFEscl5r6jSdr8erFYnG2g0ed9/QBpzO+kwVcADFPfsTdj2KzuJDIISNJB4K3pyrDA==
X-Received: by 2002:a17:906:3da1:: with SMTP id y1mr3078674ejh.109.1592566336449;
        Fri, 19 Jun 2020 04:32:16 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a002d299e9f71202562c.dip0.t-ipconnect.de. [2003:f0:7f07:a002:d299:e9f7:1202:562c])
        by smtp.gmail.com with ESMTPSA id o12sm4472346edq.7.2020.06.19.04.32.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 04:32:15 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/10] gnome-control-center: upgrade 3.36.2 -> 3.36.3
Date: Fri, 19 Jun 2020 13:31:59 +0200
Message-Id: <20200619113201.2811033-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619113201.2811033-1-schnitzeltony@gmail.com>
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

================
Version 3.36.3
================

- Updated translations

Users:
- Show add user button also if no users found
- Show permissions toolbar also if no users found

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ontrol-center_3.36.2.bb => gnome-control-center_3.36.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_3.36.2.bb => gnome-control-center_3.36.3.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.3.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.2.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.3.bb
index d3673a1fd..81f42438e 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.3.bb
@@ -30,8 +30,8 @@ DEPENDS = " \
 
 REQUIRED_DISTRO_FEATURES += "polkit pulseaudio systemd x11"
 
-SRC_URI[archive.md5sum] = "45832b7217c8d5fa5e2dbc214972c12d"
-SRC_URI[archive.sha256sum] = "e0a5eff0c6d6c22db0c54fd070460de874d367ef3f9072e1559b70f28b847817"
+SRC_URI[archive.md5sum] = "fd99a8df0cc656e971415f2a1b310019"
+SRC_URI[archive.sha256sum] = "bc174d970dbeca3ee19c26019de31e9edf78dc9c4abde16e763566ee38c3691c"
 SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
 
 PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
-- 
2.26.2

