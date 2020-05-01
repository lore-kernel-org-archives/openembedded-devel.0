Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.8204.1588332955075605985
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 04:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HHQZZQ0M;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id o27so5902615wra.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 04:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Nq0ppLIeclsfXxs+iM6kBGo+ltzQF8qnArCyoZu7c7I=;
        b=HHQZZQ0MTVP/d2PsVmvVH0hxCwYfnVsVaiYpAkA9ygg7zROSu4cySuUmcePLblnxDD
         fq5IpTa5p8oEscQCSKjIbgwpvsb6hs4xpWQgNeywIkpBuB9KoF+GR3hDl5hMgwa8oiEl
         3jhp4XyFJVqAw8D5HUXwfkj0P8IgQuhJlIgZS8XaGrXqFXF3Eax9e5/aCYa91VWEboCM
         MpXe7kW5tocDKusQyxvaQrQLobA+Kw57dhtPlelxNb5iYkjjU7olwD4iPEvRWenqOsWj
         tTSL2agzX2sY7vYmlXruJv6yXIkfmHnqeInNDRwXmA26jG6SSRFfti7HAA74nf6LneUu
         KfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nq0ppLIeclsfXxs+iM6kBGo+ltzQF8qnArCyoZu7c7I=;
        b=bwHkpiGMIt2Tl6E+0OW4HUINkViP5wWc4T2SPY6yntAnd+qsU7eZrxqM9811GQO9eC
         tSEs4pqap1Nt4JEyRnrLNQKvw+Ve8uPuwSzc+pegZSYQWz/XKwvS82R51QlhbQOFg/tr
         FSHOBtB8cBsJLcjuWfKcvWAx+2vdHunnbHshlPm6r9ur9SVPfu0/WxoKigeQX0X0GW/Q
         nNELGvSW5iiA5FRkXIuynGuh+q6zG0sUtwUXzZiId8UY30Ra83uzpz5bfAcoSSzFscj0
         scttfhqYeP/PAEmG6Lc0iqFbBUyXAiNrnXn3sZBVqLovpJZUS/zpJ53TbEUBuY0u6Gb1
         uSmg==
X-Gm-Message-State: AGi0PualxvKifet+YgLRXkcRTmbpH/smp0R3wYiClAK19DALaATAbc1O
	kwNttqo92JVl9P9Hd6ceVWocNkFh
X-Google-Smtp-Source: APiQypJhVofSpMrJyJTUGU/3rRzgXeKiPaHWTFEQGRnNO5sUl+Fn/5ZN4qHn8QyXL4+2Mvjbe+VEGQ==
X-Received: by 2002:a5d:6607:: with SMTP id n7mr4060591wru.150.1588332953481;
        Fri, 01 May 2020 04:35:53 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED437E74431DA4B53FAAD.dip0.t-ipconnect.de. [2003:f0:7f0e:d437:e744:31da:4b53:faad])
        by smtp.gmail.com with ESMTPSA id q10sm3960004wrv.95.2020.05.01.04.35.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 04:35:52 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/10] xfce4-whiskermenu-plugin: upgrade 2.4.3 -> 2.4.4
Date: Fri,  1 May 2020 13:35:28 +0200
Message-Id: <20200501113534.16030-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200501113534.16030-1-schnitzeltony@gmail.com>
References: <20200501113534.16030-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.4.4
=======================
- Fixed search delay. (bug #16731)
- Translation updates: Catalan, Finnish, Hungarian, Malay, Portuguese.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...menu-plugin_2.4.3.bb => xfce4-whiskermenu-plugin_2.4.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.4.3.bb => xfce4-whiskermenu-plugin_2.4.4.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.3.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.4.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.3.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.4.bb
index 3da631bb2..958ee644c 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.3.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "7b66438996127b759ad634f6579e003c"
-SRC_URI[sha256sum] = "39faeee91ceb3cb727f9de09dbf20a8c73e524851a2c3b76a4b19a0732de5ff0"
+SRC_URI[md5sum] = "7f6faf5ae5ca276d073798a3ff8b0e5b"
+SRC_URI[sha256sum] = "624acf6d46484bb35608a76424579571423e2aefa6579f6e444f5cfb5342ff9a"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.21.1

