Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.13354.1630869675020623705
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 12:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BFkweZxS;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id d5so2967200pjx.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Sep 2021 12:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TsiWIMWRsKOrpFFmCYs7tQtPuXniJO8qDwlO8D2IHIM=;
        b=BFkweZxSTHpj1B1YIJxS88E5dtkXwNkVDpN+AEyxwA0XTwb3qdL+yjZi9hr5tVHa7z
         UgIRtYA/jRXCgMmV91Jkmx+37pKxwV5j+mRqQndMW+Age3XyLdCoTYCv19w3luOgdb9k
         F9cDXcy5WsNlMv19KC3sekk90eJmH48t+3N0jc9KrfxT89Kr6eWA4diEVMs/t9DaUBHo
         cGn6+VPM+kZ79rNTZmDvFwdmTuCDS4dxYvHJRBtwI/cJHXIRIFCpFE+LR92psF/hIpd5
         YPbCtHL2s9Asjn0kQhXl3ZwKb3PLuwLeMuM7f0LH/AIqkl1Ld2afSb1bX1OyHnVnqZNl
         NF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TsiWIMWRsKOrpFFmCYs7tQtPuXniJO8qDwlO8D2IHIM=;
        b=nwESz3Rwi1FxF5BU/wWsp9qx7iAYeVPgqIcGVs3eoINI/mjMJ6FZ73sg8gmoqdhyHY
         kBAXqIdKDlNpDXtwqAvpSLV51wewzoNRC1mTglnFYBgoxNWdYdLuFLDXm84r/P3tNSWH
         qht1CTGoF79VzvCvNyyF/rln3NZRdsZ/7mcBAh7fvU/vlZOVqW6n/QPmiAlAlct+Zx6U
         EllS/Ql9Mu6yW+nYt7opfRCqIYvrgp2YRBEOTLLjNCCUv/JAZP2nRB+HFJxN3e3yT64d
         vQR3rSG2jSnKY2nerev3O2e8gFmHRSaoQsRfi5uN3bYragoCcJACq0xtS2Gcqwu+M0BK
         hG6A==
X-Gm-Message-State: AOAM532YZJEbYdXm6+whNC4P6r717ilhqDkjwayXYDllE5XG4SoudI99
	OyvB1lFjXYNEwb+k5uxpGFmxwzIQLzU=
X-Google-Smtp-Source: ABdhPJzSPH65vuvb0Xpzbtube0T22IJLpv0mNoZVwv35DbXdZ4L0UVU6N+5adFmaQNold6s8pdEYdQ==
X-Received: by 2002:a17:90a:d18f:: with SMTP id fu15mr10062658pjb.71.1630869674437;
        Sun, 05 Sep 2021 12:21:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:741f:21b:dc9f:801])
        by smtp.gmail.com with ESMTPSA id b17sm6207128pgl.61.2021.09.05.12.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 12:21:14 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>,
	Khem Raj <raj.khem@gmail.com>,
	Scott Murray <scott.murray@konsulko.com>
Subject: [PATCH 2/8] dlt-daemon: fix build failure when dlt-dbus is enabled, due to missing service file.
Date: Sun,  5 Sep 2021 12:21:05 -0700
Message-Id: <20210905192112.2081037-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210905192112.2081037-1-akuster808@gmail.com>
References: <20210905192112.2081037-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianfranco <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b2fe766703e94cee2e3d1e21f3274789d6cd0c57)
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index 33d5c696f3..8673c59fea 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -47,7 +47,8 @@ EXTRA_OECMAKE += "-DSYSTEMD_UNITDIR=${systemd_system_unitdir}"
 PACKAGES += "${PN}-systemd"
 SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = " ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'dlt.service', '', d)} \
-                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-system', 'dlt-system.service', '', d)}"
+                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-system', 'dlt-system.service', '', d)} \
+                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-dbus', 'dlt-dbus.service', '', d)}"
 SYSTEMD_AUTO_ENABLE_${PN} = "enable"
 SYSTEMD_SERVICE_${PN}-systemd = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'dlt-adaptor', 'dlt-adaptor-udp.service', '', d)} \
-- 
2.25.1

