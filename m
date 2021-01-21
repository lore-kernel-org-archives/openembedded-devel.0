Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.976.1611269709503400534
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 14:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gW/wuAFl;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id c12so3316536wrc.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 14:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D0Ht4NJDb7rqp0MDii4rjjLBOPVb15Do2Qg/xZsRnUo=;
        b=gW/wuAFlLP/U3qxQYtetLkjv0jJq7cqy3toYxfpFovBEePrnz8Vbkj2wBDX1xIr9iV
         W9HJgLxrNs7/bBhgowWl3nx/dFhkCwPemssMr3XjxUKfQyhuCUDYrol+d7M6TcMOgCoM
         Vbu62s/kTALeR9S32/BwLN1j0RyIx2vwZ0bxa+oDVuRMgSyzRsyYq0QY+zostpqn9Moc
         Z4JM1Q0HU4tBMnj+A3OTeJSXewJe+PUvs5ucmPmWjsjvdakOmhScaqNqztqrfnYjFAsD
         HSzcheNojQLBSUN/sZjQBWz1pWlkJ3gVshQnrB/0Oh/47FnK0EWjBwloz5s7RFp1NE/e
         2ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D0Ht4NJDb7rqp0MDii4rjjLBOPVb15Do2Qg/xZsRnUo=;
        b=iUXklkw6oIm9Z1UxgAx4TmH70PrtMBzdnpSTYWrZ0AIDYX+9xrtoqnEb8n+KhGCv7c
         UXyBCAhwReI6pb/WkLvjVj0LU2MP+RtKhPefXj97hauJmZ21R+JUNyf8iLAZYEQ2Kjuq
         TnrsjaEIlsexYxpA9xkvlq7mjubfwS6YHP5ZOhWrI8LJVEHCvia2dlO21W4lk7OYK1pk
         mnog7qqoDy2FN3uCf+xLGHzwdpkUh71Th/eh5uuSwcbgvDaHXmFemKnkN0MwEm3/urXd
         SNpn4tBWCzjKFSNqwINjUkQzrRltaIlwnycuUDGr87S5zsw/VEO32V1nu7f8xcK7gorA
         GzAQ==
X-Gm-Message-State: AOAM5325paXqoIt9B90/zX/eumN4boM2kihT74HundxLxn+mhrYf3e2Y
	LmkS6cRgvLpETahGNQyxOydIMV7n8M0/2A==
X-Google-Smtp-Source: ABdhPJyPEdrsjXk5wcAxHaRcfzjbxZ+xsCrvgDuHiX0co/9MXBkSeLNYBieSTG5OMC4J7H0m34q9Jg==
X-Received: by 2002:adf:9427:: with SMTP id 36mr1544163wrq.271.1611269708129;
        Thu, 21 Jan 2021 14:55:08 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09d446818dfa6dffe17955.dip0.t-ipconnect.de. [2003:f0:7f09:d446:818d:fa6d:ffe1:7955])
        by smtp.gmail.com with ESMTPSA id n9sm10019742wrq.41.2021.01.21.14.55.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 14:55:07 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/7] garcon: upgrade 0.8.0 -> 4.16.1
Date: Thu, 21 Jan 2021 23:54:52 +0100
Message-Id: <20210121225458.278343-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121225458.278343-1-schnitzeltony@gmail.com>
References: <20210121225458.278343-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.1
========================
- Launch applications as children again (Fixes #18)
- Translation Updates:
  Kabyle, Portuguese

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/garcon/{garcon_0.8.0.bb => garcon_4.16.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.8.0.bb => garcon_4.16.1.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.8.0.bb b/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.8.0.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
index bbaa6fd6f..3e596323d 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.8.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
@@ -9,7 +9,7 @@ inherit xfce gtk-doc gobject-introspection features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[sha256sum] = "4811d89ee5bc48dbdeffd69fc3eec6c112bbf01fde98a9e848335b374a4aa1bb"
+SRC_URI[sha256sum] = "84914927a2c1fda167f67af26a6640630a744a22940df508aa6c752cdbd3d21d"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
2.26.2

