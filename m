Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.1049.1611269710568046434
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 14:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SGz5561q;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id c12so3316571wrc.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 14:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/J88r+iFHmQ4cP+bZARM8ia++nLwETjd8oVTN7vE2fw=;
        b=SGz5561q4+GhVsirpWy9/9OxYTqeCFN5FSndjjpnTTjS547QvN6tlJvxixcjOtbYcZ
         Xl1SoItS6761fEcayn58mrVL75kYI963JBF94lcJUyRnoKtf3g71Vg8wqlZ9F2wG/yom
         mM3Djv8RSD7AHrT6TsJfBBo98zZCMqhL64GvtThDV87BABnFqFqiRt3JmHG71EvM3Ovm
         1kdIQqtexn6a7eD9ngkTRHEyMpk5tQ/x/x1CAfhWG0g2TmtzVUp26oI+UaSjsKjObp97
         D79wnfFieHuI+E2ozmIhAlpEO/ja4CdddaMRo355jxxnrIskN2iBzp4rA8yB/QpB83A1
         fxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/J88r+iFHmQ4cP+bZARM8ia++nLwETjd8oVTN7vE2fw=;
        b=OfJ0WebSEJkpkI8OXK5Chm1MpM94AfmxckJEpAQohUIJ+yOy8siHUH7WBOg9z7XUnS
         Gl1tqCs5o7iWmwfWZssLOOMuCZCLyLuA2lfQtJhKuglaKxHUW4sJJexX7nDb8ahFLD4X
         b4p3b7WHu/H/kBnHqJ0/h8ijCkMY+ocWWJjZsQBGbRR07A11iBpImRx6qfUOnbDHKAC2
         dqCRxaM/Xj1NnH4kzbSXmc11H2nkXgrC9g7mNBoxxcTStgMEaAlTCbUl2mGImjwCiJPj
         XiP/CDkmcdcNbB5/ppUMC1EkEUSQ1Gvj5cU1tTOlV2HKCZQgT5EIa9NeVlT9ZpvNxybN
         S47w==
X-Gm-Message-State: AOAM5330oDKhYV1EF6kqnSEgMrQCoq61JQ7XN9TYL1mvEMdO1qLRUoFp
	QefRAQccfNmFaDWQrFOypdy7+899CjdrWw==
X-Google-Smtp-Source: ABdhPJzLXmeb7LZz8Z/8GT4aQwXytGPzh64kOpvfD75SWE8Dlrj/Wr6O5Yg657fou48g+kosMjBfYA==
X-Received: by 2002:a05:6000:1142:: with SMTP id d2mr1575690wrx.307.1611269709168;
        Thu, 21 Jan 2021 14:55:09 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09d446818dfa6dffe17955.dip0.t-ipconnect.de. [2003:f0:7f09:d446:818d:fa6d:ffe1:7955])
        by smtp.gmail.com with ESMTPSA id n9sm10019742wrq.41.2021.01.21.14.55.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 14:55:08 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/7] xfce4-whiskermenu-plugin: upgrade 2.5.1 -> 2.5.2
Date: Thu, 21 Jan 2021 23:54:53 +0100
Message-Id: <20210121225458.278343-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121225458.278343-1-schnitzeltony@gmail.com>
References: <20210121225458.278343-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.5.2
=======================
- Do not reparent launched programs. (Issue #32)
- Translation updates: Basque, Danish, Greek.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ermenu-plugin_2.5.1.bb => xfce4-whiskermenu-plugin_2.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.5.1.bb => xfce4-whiskermenu-plugin_2.5.2.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.1.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.2.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.1.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.2.bb
index 6077fdfc6..366597731 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.1.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.2.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[sha256sum] = "b2074f8a9caa766e2d97f0b960ef2f4d1e20dd804497229bc1f0157791896925"
+SRC_URI[sha256sum] = "a6f7070afd1c9020257d8ed7483872643a6cddd76d5d73de107c7fbd981fc515"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.26.2

