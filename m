Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web08.893.1613773880798821159
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 14:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=R4hEARwu;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id o16so25233882ljj.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 14:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ormE5zSpOI8NLdYGQ621P6sxaPWW4L1M5G8YwocxjHg=;
        b=R4hEARwuv4GX5dB/yLI/KNtCKNTSfok7bmpjix6JTsrc21p4NXhE5NaiFpq3XnjZa9
         DvN8Bi80sC/QStdUifXm55Xp5ya6H0ZHNmJQzBSrA+N9XG7If2mKP68Hr1rft+SiqJ0o
         3o6KaSInh+RWqMxJPLDUvHHttmtb3ZVHeoM+UWPJk/LvenjqtQmlWLFRwZ021bLPyYVP
         NR66sQATkCdkYpHWzj3ZTDvpV97UAizm5mF0FtwXeD2jxFtoIqokJfG+900248HqXQMi
         pOe72Av5+tbZixxJQwdvnF78zev3O4oUUR9u7ouDgBB1iuGD7ntpD7AySwBrN/PB6hpt
         vEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ormE5zSpOI8NLdYGQ621P6sxaPWW4L1M5G8YwocxjHg=;
        b=g3tkgq13pIfYLrJjTMHpVlj8MCuZQDSDhOKf7v0tzwhY3ak0+6XuzA24A85LAdKAEz
         0SnVGielFV1JN05QVjOalpMXtuIqoWdN+C1NLWdmhvjM4KrIwOCHBDsD6QZhBhFbJEXE
         hTzx0r8fl4V8DrEIN4vT5Mv/04g8AKxtS7rw+Z0Bat51mE40jW5vB+Ofa4xrmcA5wxs2
         Qo8Tl08Rz58EQgP7D4QMZzZnwg+P4SYA5+8QeCZIyUPu56km8lZ9sTujaXO1AKltYY74
         Hfa5FNSueX7Tlz8UgPuJZHV5JlhZpr+ASlh3sbaM9QCKwEKh2oTMuzcDU57LgFviAvZz
         /SAQ==
X-Gm-Message-State: AOAM532TSAhdqrEb30OOl1RYDq/9ecTA+vL4uOW/R3ZjD9MF5KSDmvCI
	WI7cCNSSzpO13Nt1wn4SqsBAQl99rFj/HVqc
X-Google-Smtp-Source: ABdhPJywm/GVWQ/pFwFNynszMMaEnm8ALudZi08jZ84I15az+1QZATmYSkrmFiL0YygN3Cu3oMTduw==
X-Received: by 2002:a2e:9b8b:: with SMTP id z11mr6948317lji.331.1613773878485;
        Fri, 19 Feb 2021 14:31:18 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id c16sm1043848lfb.302.2021.02.19.14.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 14:31:18 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-multimedia][PATCH] ncmpc: update to 0.45
Date: Fri, 19 Feb 2021 23:31:16 +0100
Message-Id: <20210219223116.2499143-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../musicpd/{ncmpc_0.38.bb => ncmpc_0.45.bb}                  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.38.bb => ncmpc_0.45.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.38.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.38.bb
rename to meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb
index ebf5d290b..c089b64ed 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.38.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.45.bb
@@ -11,6 +11,8 @@ DEPENDS += " \
     libmpdclient \
 "
 
+RDEPENDS_${PN} += "python3-core"
+
 PACKAGECONFIG ??= "colors locale mouse nls regex help_screen library_screen search_screen song_screen key_screen lyrics_screen outputs_screen"
 
 PACKAGECONFIG[colors] = "-Dcolors=true,-Dcolors=false"
@@ -33,5 +35,5 @@ PACKAGECONFIG[chat_screen] = "-Dchat_screen=true,-Dchat_screen=false"
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/ncmpc \
 "
-SRCREV = "2c71add42152072c5e0490de2870315dfb3b71e1"
+SRCREV = "6780ec072f1d314f44ed77efdc58d03c6fbcc96b"
 S = "${WORKDIR}/git"
-- 
2.25.1

