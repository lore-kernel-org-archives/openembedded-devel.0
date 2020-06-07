Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.1272.1591500299496805732
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aW4WUX5m;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id ne5so1837013pjb.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wvLQA9d9bNPBihANWcIYuwD0Eizct9GnPLXa3XvG5+8=;
        b=aW4WUX5m2r7boWCb+s7Tc/SWGsB2isnwS/fZWymqNbyePOpGzm/Cz5StjI254x+3O/
         WCaiIdLmHyAAeqCxLzykl39xCPndf2GBm8K17r08StckpWThWqh8SIZ4X5CRCdoPyesM
         gt02QOEVp/WOm/gIkFu2F3sU12l1leOd3ers//l3iecNg7hXUgf+e4RZ1Dp4M21LtFaB
         4tgNChvwmkp19uI3kuWS+Ur1bux1W/NTQiZh4TPPfWFsnQM82m9csWirkEKot2OZ3hCM
         CJ62yv1fCBW6UtKbGIsFnepgbBAh0TlmW8YiCj/9hyR8L9FNlSiwK7u7OnFXKguPd2Ft
         PaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wvLQA9d9bNPBihANWcIYuwD0Eizct9GnPLXa3XvG5+8=;
        b=TfxEJo2nx4j78TaVb0ze0TbV/WV7SQgqF7KezVGneVdan5sMwupOIQukrAf15lRTAD
         zuztVv/4CTBO/yVyeghBp4mebcNdap5BLiOzYF6MOseQdeZ2UkpwoQhpNMBlNKBZFo14
         2ZadcKaejDpSvXI7zeHPYgJOt0oGxx7XWOxzBj9xGjRzFlAT97SKt3xC8VajsALnlYmT
         6WRXzLWjdgGUxpdUZlORYQIdxkO/Br7bhqvEQLtf/tLGOtlV4prZBIfsoyjkTlelsocX
         QefSR4YHabCWsL2WXUhQhwvrvCvziuJRReNNeH+5wo7B0q1YpxG8qpsBbBPVqTT8p0OV
         8WKA==
X-Gm-Message-State: AOAM532uDVvRTr7a8zpjloBZKp55CwAs4CwiKP5qyEqKJRgZ9YZoTazL
	RmXjo6TEBfe3qohrYGoo/9xwyVHd
X-Google-Smtp-Source: ABdhPJwV5baRnkyvXPjOIevwnu4prTcN4PnyIf23NbO0wx9zsWSxVJFwKa0p+j4Bx0SNcAz78pD4rg==
X-Received: by 2002:a17:90a:31c8:: with SMTP id j8mr11458600pjf.178.1591500298927;
        Sat, 06 Jun 2020 20:24:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:58 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 16/26] python3-colorama: Upgrade 0.4.1 -> 0.4.3
Date: Sat,  6 Jun 2020 20:24:26 -0700
Message-Id: <2c16ae7394f0ade025417f7622554212bcf3850a.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.4.3.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 52e608478f695269ce707626378e6be74e1fa77f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-colorama_0.4.1.bb => python3-colorama_0.4.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorama_0.4.1.bb => python3-colorama_0.4.3.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb
rename to meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
index 9cfca094e0..7a3f533f26 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "f927529cd1735f6f50ee2c61628e9c1f"
-SRC_URI[sha256sum] = "05eed71e2e327246ad6b38c540c4a3117230b19679b875190486ddd2d721422d"
+SRC_URI[md5sum] = "02daee502863d24112a8c05a5d69a612"
+SRC_URI[sha256sum] = "e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1"
 
-- 
2.17.1

