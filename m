Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.408.1613771750413080512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 13:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=JYoW4NXV;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id v6so29169092ljh.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 13:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=StHLYTWn8BTdoIBKCsXBZavhedkkvCck+kV3ggYpzgs=;
        b=JYoW4NXVajTijxw5AORuwXLk7HmTOC3nJj5kS4OKALbMw01REDmoBJkN2RO5qIUOPU
         rL66aihL9DzUBcJ4lveypUkkHRb/6LXvnAqCH5T9vK2ICyMO3r9YmQ65HsHur2Lkj8t+
         OlDf2LpJ2T4FgmTh3fpvEGKg6lUdgR4oILKQ4e7qwsC0aSLaTOXKbzsALRHqBYc+uTMV
         3BW3bzpg4PzRapqWIRz1F3CwHtk8YiqyT1A8EFrVlezhNLLYfaBim0HLy+uZgOFqnnm2
         l/k7w7JKZAU29tdP8EmQRU3SwzHDf1DKYRPZg1z0j8BogNBbByAqlNTV3QJ1ct6AThbV
         fPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=StHLYTWn8BTdoIBKCsXBZavhedkkvCck+kV3ggYpzgs=;
        b=kciAoh3bPfGqxqux60OKxQW3t9TyId9DFpa0pSL2WfLB9mZosJxHAtBij/IaVOmG1b
         MjOSAoiwio+HuvS+SVIrpVOETQIrThsM/BFi2XW/xVGiQuGqLOeUV4IPCM5W2YyQwR4I
         2+x2XJbVPzETdyzmGkhK394VMxcfUFeHl3CL2AyVUxQ9By8aLNSC0xrQ6/JZvQTyFNwT
         lr/rM6BSyiMlJkxO3PvYXIhdDu6/3ZLc3N1QJ9Sx11PAgapeQ1NYoViGBI7v2warH5Qy
         Lw+z+OypbaBNVh39eusELJuk9ALwS6pIDVC0ffif8csKMhZqyLe4Jqbh3x9H+U8VjHXa
         3XnA==
X-Gm-Message-State: AOAM530psYgpE30pGrfJLtUu/PdZtA+zRUkG/LqCeuuGcA95IdjKdey6
	uV8TKXPYSID1JbbcJi93954T7XA/6CNB/bQ+
X-Google-Smtp-Source: ABdhPJwuwH8n8gr9ctIDz85FoefGWy6NARKli3U1O1PcpcPYcjqmuc/vHBBnd5MbBOVS98XBIgsMHQ==
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr6782182ljl.483.1613771748439;
        Fri, 19 Feb 2021 13:55:48 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id u23sm1046087lfo.22.2021.02.19.13.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 13:55:39 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-cryptography-vectors: update to 3.4.6
Date: Fri, 19 Feb 2021 22:55:22 +0100
Message-Id: <20210219215522.2368477-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...y-vectors_3.3.1.bb => python3-cryptography-vectors_3.4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.3.1.bb => python3-cryptography-vectors_3.4.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.6.bb
index bcdbc6adb..b5f34daef 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.6.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 
-SRC_URI[sha256sum] = "03789c305dda8dccb4b8c9c019963a742469d88365abbc82e8e898ac478f5ca4"
+SRC_URI[sha256sum] = "e5f88a5fb03d60b4f20eed4920638b6a3ed32a363523a77086528d557a2c2da8"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.25.1

