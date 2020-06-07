Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.1341.1591500295716482419
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cw3+SnUW;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id ga6so4306865pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=L0ZzUM4/Xr5EjUx+uIu+PJMo833cqVMJ1KHUVS+NH3Y=;
        b=Cw3+SnUWYSO1JgW72Y4mrzycF212kUU+mhe1R6QGx6t9CgT70z7rQzVigp32zCtqgX
         E7xkHdwP/ygws5eNGG93MnCxYcXIbOq/mj7d555HB0uzn79SGynp6sC0ksxiUaX0rl89
         AkClGZ4LQdSkaHtiJrJZs/THd3rJl5N3eAp34R5vW7QRr9IoEDk3fKoZyyf1GkusjNRS
         tr8vhPM2AMNk31wyO4MQz24Y9MEV997ftDv1hmAnLddrZKf43Sn0eODqQyqMBXoPimy7
         nyH3UMw+6dfuwXbC6YQjBdBNfAbG0E0smBtQ11kZ++bs4fwyhDyfSs6NDjz3kvDXVy9l
         iH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=L0ZzUM4/Xr5EjUx+uIu+PJMo833cqVMJ1KHUVS+NH3Y=;
        b=MSlq1GRRm8LYOapL6KFalAtfNzFejasneFZ8uYGu7ibFBin927vyyuonQ+0vEot5c8
         ka6UbaFwJGNOMSwn3GCUoyceiQL20cu4iWb+vTBpXV8hqt37tyTgs7AHH+j+4Od/0+yF
         Ae9wZO+DDba1m2u9wu6ItddyyzWEIk4EkGNxULghMc2U0ELMloyaPsRKzIbLe5JcDB5B
         jxfdPyyOq8BTEUoKe36biQNYVagWg3zC/mAA00NV6WyF7oZCcOd5GfkxdQsKha3m+J+E
         +ZT4hFXnt0iKGKUA+YW9ukO/phupGkriCD8b2JUKyqrWDLGbFmkX7opj/81gvwxhUSza
         Mlcg==
X-Gm-Message-State: AOAM531uNR/p66bLUbYfiNyE2CyyJh2NaGlmME/CcbV7ZZ3u1rIt2NhN
	lEhHl6kCYhYVuc7H/hTsQ+81nHRd
X-Google-Smtp-Source: ABdhPJx7zOP12en3dUOnr7JdHzHGqbl2RwGPOC2J099p8eE0qd6AwuHq0IbjzXQ6cvIvjROvQiX53Q==
X-Received: by 2002:a17:90b:4d06:: with SMTP id mw6mr11323832pjb.190.1591500295107;
        Sat, 06 Jun 2020 20:24:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:54 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 13/26] wireshark: upgrade 3.2.2 -> 3.2.4
Date: Sat,  6 Jun 2020 20:24:23 -0700
Message-Id: <d742b405d141ca545b5e65933e5449ceee1f3725.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8a4039c61296801dc7f9d6f1badd9310acadf2b8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.2.2.bb => wireshark_3.2.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.2.bb => wireshark_3.2.4.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
index db545028f2..c3caaefde9 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "e468b78e1176e0212b13ef809f59dcbb"
-SRC_URI[sha256sum] = "5f5923ef4c3fee370ed0ca1bb324f37c246015eba4a7e74ab95d9208feeded79"
+SRC_URI[md5sum] = "4bbee1bdd5b88343733590fabfffddf3"
+SRC_URI[sha256sum] = "d17d461e849e2d0b033431c45f71d8ee8ec3c8faa232a6ad63069a47927db8aa"
 
 PE = "1"
 
-- 
2.17.1

