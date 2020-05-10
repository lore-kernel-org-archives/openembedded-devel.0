Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.13127.1589110145259808759
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 May 2020 04:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HBAzOUNn;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id y16so41672wrs.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 May 2020 04:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ay6UDvoQoiGOwtguP5UbrUFw3PvSaBRpZsJ6imkzIkQ=;
        b=HBAzOUNnw+8rtF7yOKe90UNwLH6PA+KdIF4dl2rJBFJNJRo5jNCiF3q6s+TiIbilcC
         AUGqak5wPV/MijApFr97uc22oBAwqRkn05Jl3SnjwbXfcPr/ndVKTJEjWp5qNw0E5KtW
         SMoXV/mpq+ue9tclC1g0FB4LQCTbfei+57Ajqvdo/9bxMcINQF9VXnup4Owum9hvxKha
         +M5CpbTOJQwbRJO7rSEuhQKQOy+jNqmu14jc85q+WfG4+aqenqWNimykdCgSnI7CdspA
         JJQpogKNeyKE7sEsIvHVd6MeuRkawkhkiQXauylPT/PU8aJ3FJxan7DpcXJGx7WREUdh
         qFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ay6UDvoQoiGOwtguP5UbrUFw3PvSaBRpZsJ6imkzIkQ=;
        b=Irikf5tkNEPSAp9+1cReiECGXYhIhDTiq1PtmGEk/4uLooMJf4/Wz18xKJd6yyKBkW
         xAaSYTkOBmDmSGz7MI5elit24T5LSpde4HuoJi3GSJ4qWbJy5nUYvZQCYukaIW/XphU3
         3nLjQAhwtrKY+wwrXbDABTuY1ZU0Cyf0RGw5/WAzkPc9Y7jAp3MW0v1x2xjd4l0vCBWY
         z50hXXQ8WfsBAmtUpAp3k2SJp48XJDlC5faB6SfEgvBx7etPoSginGFxzUMZ2fozzH8V
         Zx8uRiVmncSxmOlw0o1KCu/UwGEY09/Ox745SFQrtdU29rU423SUv955rPyBJHQIzl2y
         qBew==
X-Gm-Message-State: AGi0PuYEpRstRmwhzR+v6UBqd3uZNuYFHHgl9SmN5xRCPYMA+NRm8i9u
	aessdhsiqfitu/uPGo6saxeo2dKv
X-Google-Smtp-Source: APiQypLf1x4E+2o0lXy3pTlucQhwhUCqS+qaeNjxr/KXTR/qJ98XD0jz2I+ZrtjyePNSfBCGJ9+CnA==
X-Received: by 2002:adf:d091:: with SMTP id y17mr12780211wrh.418.1589110143399;
        Sun, 10 May 2020 04:29:03 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F085F042F904D54ECAC10E7.dip0.t-ipconnect.de. [2003:f0:7f08:5f04:2f90:4d54:ecac:10e7])
        by smtp.gmail.com with ESMTPSA id k5sm11733319wrx.16.2020.05.10.04.29.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 04:29:02 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/5] xfce4-notifyd: upgrade 0.6.0 -> 0.6.1
Date: Sun, 10 May 2020 13:28:47 +0200
Message-Id: <20200510112851.31218-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.6.1
=======================
- Fix hover effect without compositing (Bug #16586)
- Move from exo-csource to xdt-csource (Bug #16717)
- Translation Updates:
  Arabic, Armenian (Armenia), Bulgarian, Catalan, Chinese (China),
  Chinese (Taiwan), Czech, Danish, Dutch, English (Australia), Finnish,
  French, German, Greek, Hebrew, Hungarian, Icelandic, Indonesian,
  Interlingue, Japanese, Kazakh, Korean, Lithuanian, Malay, Norwegian
  Bokmål, Polish, Portuguese, Russian, Serbian, Spanish, Swedish, Thai,
  Turkish, Ukrainian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-notifyd_0.6.0.bb => xfce4-notifyd_0.6.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.6.0.bb => xfce4-notifyd_0.6.1.bb} (84%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.0.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.1.bb
similarity index 84%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.0.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.1.bb
index 5e0f44e29..aed5ce4dc 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.1.bb
@@ -14,8 +14,8 @@ DEPENDS = " \
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "1724fcb635bbab44c9f62c69734e446d"
-SRC_URI[sha256sum] = "c1d126a81604ff967e4655f06427763bf559c338ba629c95cb9aa7f5d6dc8ba6"
+SRC_URI[md5sum] = "58e70621d6b9e0e66399ed41ab402a47"
+SRC_URI[sha256sum] = "9b5274999c89bf296a7de03b375e8233eef37940b7444502130b92dfb6a089b4"
 
 # Avoid trouble with other desktops e.g KDE which also ships dbus service named
 # org.freedesktop.Notifications
-- 
2.21.1

