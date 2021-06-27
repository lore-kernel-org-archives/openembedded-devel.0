Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.2638.1624825344622718468
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A4Tg+iZC;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id l11so8695552pji.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JaUeJXhbAZohEIMlKdspEctZyXmIqDJEgPCs4SQwJkQ=;
        b=A4Tg+iZCRm0NRMX74njBN8dzlNEg4IdPUMxkx4SjbETyr1gHwT6qWBa5VODdIxpBVo
         5QEP0ePpLEpUTUzKowE3UTWC635GSfaUVCSrYntI2JxYEMPP2t6GD0R9LRtbKiw2Z33K
         d7lPIzR7wztpSuoOGuOAXi7/mEGTBXwDaRUpBZNmmga386MUZvgorBuLFzhj1sxYOgIY
         uM9yvp8VYECA8KZ6nFu7uMwg1aiUwOPLG+8Fug3KBncyK7COVFELLsuPNiqjpMLeWX48
         51QOnkknl8wrb9lGI+J4ckCFRf4BjXojlj5EeSfBxlS2RDf0zNfYsTahN95jRvwNkhYF
         3ezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JaUeJXhbAZohEIMlKdspEctZyXmIqDJEgPCs4SQwJkQ=;
        b=hWj20ccAG+W8sA9Fos7zawm2ukDS+XIrH9kVfPp0yirdMBmOucwCkDC228y2dmjKR+
         xkZdj/LlhTnvpAPhns/7GZFAXqwZD1hboRSByU0cm4HFmpARK3dg3WZXtpKJdybq4wt5
         1WRkKbTib6EYp+cdNCt3tL20Ib+INM13boHaIF5Ewy2unGHAVbHy7lRDopzOJ+zAwdk5
         zrkg1LPyM2XvW/bs8Tju55FaDzehQfyKbmN6fVpa7bQ+Qt3CLWKT/w9ffYvInCWnyt3w
         z2P+shPcJx/N8kJb6TrlijO4EvYyPtWfJOv7LsFGbhJdV+xn+Dmc/CNG6Oe/v+KIQcg/
         anXA==
X-Gm-Message-State: AOAM531sqhpjul1Ijxo3oEe33XNs/3uPLxLS/jF/pH/tya/EV/apoRoF
	pheeuzKGxH89+Q948HY4PDKAjI4Rbt4VRw==
X-Google-Smtp-Source: ABdhPJxHatCs4b2svaI4Y93/Em6RzXi40xPBHTJD8wKz7pS2FVz4OV8jchFFD5hn5pyhfYZdwni+gw==
X-Received: by 2002:a17:90a:9485:: with SMTP id s5mr24023374pjo.102.1624825344064;
        Sun, 27 Jun 2021 13:22:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:23 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 06/20] add CVE-2011-2411 to allowlist
Date: Sun, 27 Jun 2021 13:22:01 -0700
Message-Id: <d614d160a10b3c5ac36702fbd433f98925a9aa8e.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Sekine Shigeki <sekine.shigeki@fujitsu.com>

This affects only on HP NonStop Server, so add it to allowlist.

Signed-off-by: Sekine Shigeki <sekine.shigeki@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bb4a4f0ff8d9926137cb152fd3f2808bd9f961ce)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.10.18.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
index 166bf57279..018c748390 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
@@ -44,6 +44,10 @@ SRC_URI[sha256sum] = "7dcfc2aaaac565b959068788e6a43fc79ce2a03e7d523f5843f7a9fddf
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d
+
+# CVE-2011-2411 is valnerble only on HP NonStop Servers.
+CVE_CHECK_WHITELIST += "CVE-2011-2411" 
+
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-- 
2.17.1

