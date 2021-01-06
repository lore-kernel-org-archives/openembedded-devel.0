Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.9420.1609946276506449820
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pCCeXEpB;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id ga15so5530107ejb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IbcEraYr6JpzfSknwQ6qe9lKwfCRC8QopfuAwwusRUY=;
        b=pCCeXEpB3pnSQ9dE2WvCzYRm0/cEDXdFvZP3EgG0ybOBjfzsbIs7/jrE3tVq/rZ8qu
         1AIEEG4W/K5RfjKt9UnACPiWBcbznewcZtq8nXzJIhUApPEz7b06BMFZoBhDnPljOxXL
         4nfp9Oe0NF206SgJR9ND6Cwr0zGfqAXxOHBxLS+LxrvtDHgZqbtbjfnH2msbnZ+Ibz3r
         pbeonyM8Hr+hENGqDEH0B38UcSFyM3aw2u7cE9T4R68P1+jCt77rh1R3u/Kzv6D4ZMHy
         mZtuKH1jRO1bdhyQ7iALYa0PoqObMx+l+cUxbdqiAweXCNVu/MHxa60sgtXDAjhY6xL6
         35Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IbcEraYr6JpzfSknwQ6qe9lKwfCRC8QopfuAwwusRUY=;
        b=Mtovp7FHXEyUBRJsxUFutGue91PVXqkeuVb4pVN5VuROkSrpCHuspBE2CSxGDTKvvk
         fmcu1OUktZtqxJQwptouUfpirNLqrDpvy3cwr4/o6gzkNl2lmC4Pe4ChNqSXxts1cCnY
         ZyEgNFBNlZ+peaOBetv1+40PVTvtK4IqVYsgz0bEyzIQARMLV5gZgn/fuunRubK0ZppQ
         0/BJXMN6xXNEqLxNUVk+K1F36pQ1MxAkd7ppGhZkr5VvJqHzn0f9dWrIBfdxUzSZowtU
         Oh95SE/3dfg4bao+cXUQAocbr8dHlzshMUdO3Hhi8onmrFDKMlZo52QSvMvHrgrhyk70
         eVKw==
X-Gm-Message-State: AOAM533fSK2wLhXMJ96fgINdnQCVH7aUHml0A3j9ItOVH/BAN3Nn+UKK
	ZondlQkUkl/F+QKeICndSx1/ayTShArZ+w==
X-Google-Smtp-Source: ABdhPJytXT50y5x0ymjRZ+uEjCjt1dyOkPNBGcaFoJFJ5JbI6BdNXvaDrXVg5xxeU/lJ1a/HyX2/Zg==
X-Received: by 2002:a17:907:1009:: with SMTP id ox9mr3183183ejb.37.1609946275182;
        Wed, 06 Jan 2021 07:17:55 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:54 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 20/28] xfce4-closebutton-plugin: upgrade 0.1.0+ -> 4.16.0
Date: Wed,  6 Jan 2021 16:17:09 +0100
Message-Id: <20210106151717.1779543-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minor adjustments for xfce 4.16 / follow release scheme

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../closebutton/xfce4-closebutton-plugin_git.bb           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
index 8dfb2e626..1cb489f7e 100644
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
 inherit xfce-panel-plugin xfce-git gtk-icon-cache perlnative
 
-DEPENDS += "exo-native libwnck3 xfconf"
+DEPENDS += "xfce4-dev-tools-native libwnck3 xfconf"
 
-PV = "0.1.0+gitr${SRCPV}"
+PV = "4.16.0"
 
-SRC_URI = "git://github.com/schnitzeltony/xfce4-closebutton-plugin.git;branch=master"
-SRCREV = "6ed5c3ee1ba7103ca854c5e81fb2c1220b913a40"
+SRC_URI = "git://github.com/schnitzeltony/xfce4-closebutton-plugin.git"
+SRCREV = "538f9acfc5d5019f5cde734d056bcc0c95da9b4c"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-maintainer-mode"
-- 
2.26.2

