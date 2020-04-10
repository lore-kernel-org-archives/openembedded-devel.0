Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.1910.1586556603157025717
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 15:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BL91QpTV;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id w10so3879846wrm.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 15:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=neem93XOgvEl3L1fOWxCmW1Osd1CBeKAdv/BtOKfMZc=;
        b=BL91QpTV4oHoIQYgIy0bzN5Pg6gApBq+P+Yq2ipLvtmnxKtlnhgOIM3FmOsAn+U9Gs
         U+PPw8ps0aybFhG3f3Kb+iLG8GfN+Oopk3Fw9bcQb5vu9X8VVWHhdhSLk3g+N/kzgBE7
         xL2sz7WPf45ZyNOmkYS2M9rfZe7di1WHlSXs9gXwmp02pzonq0T7YmgzD2IGorW0yWeL
         tp9H05FSVfZYZvrz6tYPHQQy3BdXKYmjBqPHhCJdj4zijswUzTcr2AVX8rSnwcUl6Xrm
         rRXsFsLlu66KbGv4DRfVG8se8VqDZKvViMrEzf+2MznYXEGDbmwzQlDHFDYf/7hRyk+Y
         sF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=neem93XOgvEl3L1fOWxCmW1Osd1CBeKAdv/BtOKfMZc=;
        b=VsR3oY0ShSvBQMA7/e6HX6eOkQZ7zsqRP9H0cuNZDyNCnbVjv9khtAmMltut1ept58
         yceUvzyvAkF6H8M6wk0DsMNV2rs+QEI01yhGnD7ky7+Ibq4fLW9Vd6+iPlz2XU1JU+T5
         0Q4FdGgeJkPSywc1EfmtbMzBOgZ82RH1VPVoVo2GCyfJnNfnh/lzSDsr03lbEQxpx2YM
         47pPl2no4J628bM6CmPCXrHnoN8v7AVhYcPr2mgBoOv/OB8aWphQDiF8A9LWMHCwlwdf
         XLuE+LM6Czj7DK5g0elW5dJLwfZd/EXLdt9788lpanaStuoktpd3eA4RjQG1ZP3BPgNQ
         py+A==
X-Gm-Message-State: AGi0PuZ/fPXh0YgqjauWhtKUUNVqobyp9dJpOA9If8aAxMypg5c2TjCf
	aDwSsKmR54yJFs/NA6DHz1XOoW5pkAk=
X-Google-Smtp-Source: APiQypLR/SA9PKudLWV92hxIh8iPsygVchpfHnYD5CgNlPT0zyg3sQaRWknf0F1B38cBSJQ1ph5Ztg==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr6676794wrw.260.1586556601530;
        Fri, 10 Apr 2020 15:10:01 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F05DA42C8F51B0BBAC2F53F.dip0.t-ipconnect.de. [2003:f0:7f05:da42:c8f5:1b0b:bac2:f53f])
        by smtp.gmail.com with ESMTPSA id i9sm4664773wrn.25.2020.04.10.15.10.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 15:10:01 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] xfce4-closebutton-plugin: upgrade sources
Date: Sat, 11 Apr 2020 00:09:45 +0200
Message-Id: <20200410220945.23712-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200410220945.23712-1-schnitzeltony@gmail.com>
References: <20200410220945.23712-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I ported it to GTK3

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../closebutton/xfce4-closebutton-plugin_git.bb               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
index 3cd4ee65e..8dfb2e626 100644
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
 inherit xfce-panel-plugin xfce-git gtk-icon-cache perlnative
 
-DEPENDS += "exo-native libwnck xfconf"
+DEPENDS += "exo-native libwnck3 xfconf"
 
 PV = "0.1.0+gitr${SRCPV}"
 
 SRC_URI = "git://github.com/schnitzeltony/xfce4-closebutton-plugin.git;branch=master"
-SRCREV = "02b74f13ad6f639234c8db1854963038b2780a2c"
+SRCREV = "6ed5c3ee1ba7103ca854c5e81fb2c1220b913a40"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-maintainer-mode"
-- 
2.21.1

