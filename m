Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.2454.1604430913960708861
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2020 11:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pz0nl6rQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id y14so15085130pfp.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2020 11:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sqY9ugVouwDHZY7xfOJEGV14974fuJsMc/Zd+qi6SHY=;
        b=pz0nl6rQY/oBA5K6qabwX+IqbHJYw9yg/4vzX/EXnP2cYN0AqnBBc+6+FwdbbZQe6r
         5ytVNHFggLlil7dWE4Vx/6UbVpr0ZrVyNFVGxy0qvtQv8fA8b3DOujeNRC1mlgIxaLuo
         pT04hNN9mx7BGhGqn9ekEBg1w1xrPE7JlkwLxZrZo+8d7fryI6frgMHXo7sUtMlwsQDe
         64roaDBZom4sJGm1ND+sHUPuW//z2QCeOd5PgneUzH4U3o+6BabFoBatj03/MM2sTYFY
         LakoEcl6vph/mgrPxaMlmBFnFyg/K7fVXHj0ufeZNkYIR3+2Ub0yi3TibogjWtMJ229j
         ixTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sqY9ugVouwDHZY7xfOJEGV14974fuJsMc/Zd+qi6SHY=;
        b=G8vhvZ8NgIUhMI5fPwIkkmfScQ4mLlv77nnCXn1gySlgLlCk7pb0tYoiknJEyOmezZ
         ny2DrRsQMsP0HW7MEJfHx1+ROrkzAqjafktKxuNKAJr+DOWD5frT3uI4z79SRG8NhBC6
         lUyYRUfTWcgie4prK9CUjaDlFR9Qx+HACKdHWzj1FaPtb8TuyYQ1yMuW9e5CC5O9Ectj
         VQ2AHlfff3fPlkH6eCFkGBccbv4P5tN0+5VMLFRMkkGs7yE9V8DUiosj0nOVtakp7n5g
         HvL0HV2m+8ZpXIq1RbUDhJEQObBzO8iO5qfUG6bPZFb3U0xSALYyoHKUBsjGSIyIwVQR
         +PpQ==
X-Gm-Message-State: AOAM5309Ex5UgJO8jvozT1knnMb7AhPq4wxJRba0y+Mm/uJLBhRhzrU+
	3ftiWpuf8ypjbBef9R/+lX43mv7fDFrNwA==
X-Google-Smtp-Source: ABdhPJxayP0AZRcevYu0TwWsyq/PPQgThBOyzf0PJ66wxtOq38hCfk88PSAiEuO5IgQxQR3jbxh4Zw==
X-Received: by 2002:a17:90a:3d0f:: with SMTP id h15mr682451pjc.234.1604430913042;
        Tue, 03 Nov 2020 11:15:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id g16sm16147325pgm.38.2020.11.03.11.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 11:15:12 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] networkd-dispatcher: Upgrade to 2.1
Date: Tue,  3 Nov 2020 11:15:10 -0800
Message-Id: <20201103191510.1544811-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop gitlab archives and use git fetcher directly instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...orkd-dispatcher_2.0.1.bb => networkd-dispatcher_2.1.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/networkd-dispatcher/{networkd-dispatcher_2.0.1.bb => networkd-dispatcher_2.1.bb} (80%)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
similarity index 80%
rename from meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
rename to meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
index 6b73506c2a..a53251db28 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.1.bb
@@ -12,9 +12,10 @@ inherit features_check systemd
 RDEPENDS_${PN} = "python3-pygobject python3-dbus"
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI = "https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/${PV}/networkd-dispatcher-${PV}.tar.bz2"
-SRC_URI[md5sum] = "304d7dcc21331ea295e207f8493cb8d8"
-SRC_URI[sha256sum] = "21f84c3646a043329dc64787e4e58dfce592b2559b0e3069af82c469805660c2"
+SRCREV = "30e278e50749a60a930ceaa0971207c6436b8a0c"
+SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher;protocol=https"
+
+S = "${WORKDIR}/git"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "networkd-dispatcher.service"
-- 
2.29.2

