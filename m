Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.43726.1589813432414135902
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sdQwA4Pi;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id nu7so2788471pjb.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Q9x1ffOACyDANuJuCgUwRX1ueaTzqrzwdV6w+ndTmkg=;
        b=sdQwA4Pi48NQLCORmGqUx8zFKWRuqCfAZxEmrl2sfjVqUE6OQxMjHZLTPDWdev86on
         dRucY4b8IRJ5mFx151AFuhECIBZ8DqWFXAFHfiQNuHLjJN9n2u58XiZMCDblFRLw4ug4
         8+xMYQ6SH7ENdQSNNoKt2KHv8pixlsx6D7li5yNUimwkHeUprkaVbHlXaPvUzEpM2veh
         T3KAO7FYf5xapuuCwK42JVRs9dT6DOC9yDSg+4U4+UAUDbcveI/OgyT210lIoJjhXEDn
         XO9PEQJoiw9VqUXqhvTOn/Cst/0LK4P4va4P7SFdEDpntkdHH2n0TaHGigWvyM0IhzzZ
         btCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q9x1ffOACyDANuJuCgUwRX1ueaTzqrzwdV6w+ndTmkg=;
        b=GwW1eCQc9cWomKehzjP/qkIMBvlgqq12i2kwzymH/9Eb3ofXNvZQFS6sUeCO2cBZNb
         7YymgR6zTRrXQ7y1QlfRH0Yz6HmPaAGfN84VQjlE+TDDDgVHdg2WEdiQlgsRDdc1jBZc
         qqB6vRjvzUDPEqfsMag228eoGL88SK30bMQSQvttaZ98XVLGDAh0t+b/xB8OKNF3ti75
         wR2cuWbbJcEF1p0VpqmpDEawvbBOnC4XdLFOO9JJQJ0UaN/Z7ftboJEI1y3MlWp0lbcw
         RzehB4b6KFZMLEpVVcYyiNDWzi6833iZFzObSMxEXqb3H3riwwyj5C4FglQPc0+YrkB3
         rexg==
X-Gm-Message-State: AOAM530QKk/+9sCZKzxwMpsVhRzWX03cw9bZeNcJDwbkH09xogFwj6te
	zkfBM6XLsZ0q2R2/M9GGfXlh6ibr
X-Google-Smtp-Source: ABdhPJzKWukdwnCaAWCZh70nrggxlNrPxk5vnNQUSmTw0g/b141/xD3cGFHIWRnDpFXxudLOGF8tqg==
X-Received: by 2002:a17:90a:d497:: with SMTP id s23mr18850973pju.222.1589813431686;
        Mon, 18 May 2020 07:50:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:31 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 24/57] xfce4-notifyd: upgrade 0.6.0 -> 0.6.1
Date: Mon, 18 May 2020 07:49:29 -0700
Message-Id: <4608f5a2f8555cabbfef6d8acfdd458f157c7a1e.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6626da2826fa24a8f40b0cd17254302aee9333c9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{xfce4-notifyd_0.6.0.bb => xfce4-notifyd_0.6.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.6.0.bb => xfce4-notifyd_0.6.1.bb} (84%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.0.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.1.bb
similarity index 84%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.0.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.1.bb
index 5e0f44e296..aed5ce4dce 100644
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
2.17.1

