Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.19844.1609637181451478632
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ETJaBdyc;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id g185so14488981wmf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6GF/P6QHiG/6F6rV2NWWy2f0f7bOkDrvPLxZqjOyyno=;
        b=ETJaBdyc7A6RzdWDSSfGxqyIIApblZW9AvaccqFZBm3T3K9mAQh6cmf8RCNUwx4QEU
         Ges9t/1LfjRA8ePq23NLi/36qSnVdvlNQpdydSsJ3nPiSBE52nb8t7VuZLJIvAGusr/A
         2B1nvfs6hvNPNlGb2R6JHEbIgXhYj4ahm5eB1jQhg6dZIy42BjyD02ztKUur7CPGOleZ
         nn+CFfmVNkbPTahUCTViS9SOB+JFEhc+pWjFfB1e40hhU/FZ40d6jUGa7o33kOsCOXmJ
         StERVnWuKJq0xLPJjXkUbur74nPdtGzDASmd87OECs6mcKoNAuCaB2wipK7jA9AmCQQa
         F3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6GF/P6QHiG/6F6rV2NWWy2f0f7bOkDrvPLxZqjOyyno=;
        b=DDfEjXY6/bRRoWAAeKXKF+j52zymWcTmPs60EBbxJFRMBu8w0IpvEQtYvY+2IB8hk3
         41R8pCgPwOSM8nRXBOHe8QuH9ZP2cP9cXLwTzijIT87dcpoKJqmp8EjmySERRObE3ZyU
         5jWfIs4ZHX16yYVTH4M6o2tn3XnlLQsxFigt4B8D1eCg6EyCz2kYQlcWOnrNehGbsSGl
         7NRLFbQbUfFpDl+CrsCb1t4j+5x36IqcVqGnsqtNGxiFkEeC2xFN/6B9w+j96dqowWlW
         SXOYWgP9MDv0XLlFg7NszrCwSQXet1fQn7DlMViUq+yltS5VWaJS3GcjibVJX88DfqrD
         HoIw==
X-Gm-Message-State: AOAM5300JnZpv05GA6c2aAzelUCGAVcTf1VhuDqmbWhKj/o7wEMQGcOn
	OXkBjM5ex6jQA8x+BK31ViGrSTVBmALrlw==
X-Google-Smtp-Source: ABdhPJwpvz6IUKck8iAoFJmUps4R7TPpeAAqyGiDsesccu5pe5OBo/5iq8g103GrFa5SSU3rFPQgOA==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr21645916wmc.17.1609637180128;
        Sat, 02 Jan 2021 17:26:20 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:19 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/16] xfce4-whiskermenu-plugin: upgrade 2.4.6 -> 2.5.1
Date: Sun,  3 Jan 2021 02:25:55 +0100
Message-Id: <20210103012556.557336-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.5.1
=======================
- Fix not always using new action icons. (Issue #33)

Release notes for 2.5.0
=======================
- Add option to show all applications by default. (Issue #4)
- Rearrange sidebar buttons to match default category. (Issue #9)
- Show panel button title as tooltip in icon-only mode. (Issue #12)
- Always sort top-level categories.
- Vertically center contents of header.
- Use new Xfce action icons.
- Use new desktop ids for default programs.
- Rewrite to hide menu on focus out.
- Refactor code to use new Xfce functions.
- Refactor building translations.
- Translation updates: Bulgarian, Chinese (China), Chinese (Taiwan),
  Croatian, Czech, Danish, Dutch, Esperanto, French, Galician,
  German, Italian, Korean, Lithuanian, Malay, Polish, Portuguese,
  Portuguese (Brazil), Slovak, Spanish, Swedish, Turkish.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...menu-plugin_2.4.6.bb => xfce4-whiskermenu-plugin_2.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.4.6.bb => xfce4-whiskermenu-plugin_2.5.1.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.6.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.1.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.6.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.1.bb
index bbb274ed9..070596848 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.4.6.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "81a4a4c7635273485fac5c2d98e48d02"
-SRC_URI[sha256sum] = "8974d38cc87df528693efe4b6e14bcd233cdb49d2018a23ddddf745110b25744"
+SRC_URI[md5sum] = "9ef8b444038161e7e184b038ea603fa4"
+SRC_URI[sha256sum] = "b2074f8a9caa766e2d97f0b960ef2f4d1e20dd804497229bc1f0157791896925"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.26.2

