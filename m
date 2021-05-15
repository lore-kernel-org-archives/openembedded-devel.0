Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.604.1621121950913526100
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L0f4LD4O;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id df21so2634865edb.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QPJyslw0esC/4DAX+wznEZvyRm8snVfjxGE9xbg21fM=;
        b=L0f4LD4OPAfaQnuVqIChB5Sp7BCH9TB56eb1v3blIXKGTs4Oeu9zpZRw4nxL+M41QA
         mi1ZpVtezxQgAA4UO9cXGloHzhD7n2zFqChwzJr+i67AOyVNbSxfBy6cO530wnu4qL/R
         QlTtAJ5Lu4ICayEkhX/RGJ2+PzLUgJybsop2AayIobKP9EDYZp7ItPUzUkLTZSUXNbD0
         kKuXNKyefE7uSdc7Nr3i/o1BbTIdqr44j+dc2chu9+rhdJP15qy93WaDjENuap/XBguR
         ZXJKLMRZFZkKiRza3cs/KsXZ/N06T/6FONKI0WVebukE2Oi7kYWDVrx/bjv/YP9kCzD5
         WwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QPJyslw0esC/4DAX+wznEZvyRm8snVfjxGE9xbg21fM=;
        b=kFHBoKp/750y1eplIMHOqCmycK3Gvhs5OE2rGQbHxEQTpESgx19l9QZ1dmnJ+5DkaY
         yEPRM7kgn8x+tbPeiZRLcizn5K38wyqIwCy7Ct/aobo3YIJhfNpDctPsG+yfi+3vOywV
         kVogrCVdmtpuWpt+HmdRqzuHKs3QZ5LR7Zry1v3FtmrmQnsNrSoBEVRI5dwyYnv6lZ4H
         lwPUzSwK9vDZHBEhfav+O7vpiyKziGxIrYUjC9kOz+t0A4CuywikzNGUX9gietum623c
         AlHJ9oMzAx5zSjhc/tADqUsrS/2L4oJmQntgI/TZHetGt2Gai5XbYbf+rv0awutv/KEF
         s84A==
X-Gm-Message-State: AOAM5318mS+c3j0RnLhkzlWzutivYbeYA5M/P1hNsKScp5fRdHCjg09J
	gNQsV5rag4IgCyl5UwHgfojns8cxpO4=
X-Google-Smtp-Source: ABdhPJxEMfNBvF7+G1C7TqClU06w23QGzrLXvlTTnzrNTpICeM/NlsTIHAObH10IjqHCoej71EWbhQ==
X-Received: by 2002:aa7:cf86:: with SMTP id z6mr63007852edx.120.1621121949384;
        Sat, 15 May 2021 16:39:09 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:08 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/20] file-roller: upgrade 3.36.3 -> 3.38.1
Date: Sun, 16 May 2021 01:38:38 +0200
Message-Id: <20210515233853.583490-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{file-roller_3.36.3.bb => file-roller_3.38.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_3.36.3.bb => file-roller_3.38.1.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.36.3.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.38.1.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_3.36.3.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_3.38.1.bb
index 9af88f2a9..379857c94 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.36.3.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.38.1.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings itstool gnome-help gettext upstream-version-is-even mime-xdg
 
-SRC_URI[archive.sha256sum] = "0959e10a5d7a7442809624be9879d95db462ca76e8c66ad6299310e6acdb81b7"
+SRC_URI[archive.sha256sum] = "94a0130e12d321aa119793a14d09716523e2e4a61f29570cee53fd88dd6abc57"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'packagekit', '', d)}"
 
-- 
2.31.1

