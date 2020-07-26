Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.27141.1595762515929962852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 04:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=buJMp9x8;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.175, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f175.google.com with SMTP id d17so14243058ljl.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dSladI1VM6rCV+kiEinJQ1E1QfDNHbkA8wxCPbaOwHA=;
        b=buJMp9x8Y502F0h4b14lna/YGhAjRzIX5Dg5+bK+0XpWsXwfaUrd+LQzR/L7fOpf95
         aG7FR3SRENN9Gw2cI+YbYqk/kriTsQlvrWrckviLTul65E+ZDgcUBIc4NHpNPuk/WFUN
         Ks60xMLiE6YjoQqN+TeBldD11fIdLwYgh5GZHM01e4DrNrHZOybcy1oVPONFgkb4tYfc
         Qs4GyREGUiRkQvx8S+Rn5qAkGv25beRcvLbJx+Uc9bd1nivKkl5mQniYvTxsBbNdGVEY
         uUBJoVPLLChBp3xMHSvSG2AlmyKcPJsiTu7vdW8OJ7SZjCr0XGOYp3MMCr24zE2BmLug
         iCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dSladI1VM6rCV+kiEinJQ1E1QfDNHbkA8wxCPbaOwHA=;
        b=WMfBPyEBTcILpOU/5ZKfrG9mT1+ANjXwoggCfSZ8cbwCED2NyJwAwVv0pFbJiHqivH
         fJSxTCXJsEu/u1qNDKolbahaYmeuHZin3AtG+atlZMcSyDxlwBTjxHz4vqMfO5W097IJ
         GPtbJBhSrgDunVvh2s99P22EZS2cjxQXDqCha0MJzrhqy/TVveyvnE1FUd3zOmXpHv+f
         AleTo4sQXh/4MfrolzjvYEEDUlXFRqodsNwoV9T8DDdse1H/g7bV2sH/cNeIHWNc9qp2
         23hHxZzxWhz9hbSW7J5QTlsYgykfgdKas98CVUapNwfnOhb91zJZFIecrb9V3u5B96sv
         ZgSw==
X-Gm-Message-State: AOAM531r6etRCfiYpQTfGNcM1s3jj3bypIsvzNoyQSrDWc7OzJii+jQ5
	K5I5KSYzAXRaxAe3gXZJ64AdMKZQVuo=
X-Google-Smtp-Source: ABdhPJxes+g6ZwuvcBbxZY4hdi7gp7ojnQ6jBNd7VIjkbwlm/716FmH5By/pbxnk5zJVprD2DkXvoQ==
X-Received: by 2002:a2e:964d:: with SMTP id z13mr7733142ljh.98.1595762513962;
        Sun, 26 Jul 2020 04:21:53 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id s14sm1751584ljs.52.2020.07.26.04.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 04:21:53 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-multimedia] libmpdclient: update to 2.19
Date: Sun, 26 Jul 2020 13:21:51 +0200
Message-Id: <20200726112151.4020584-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../musicpd/{libmpdclient_2.16.bb => libmpdclient_2.19.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{libmpdclient_2.16.bb => libmpdclient_2.19.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.19.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb
rename to meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.19.bb
index 235e63e481..32f9688eaa 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.16.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.19.bb
@@ -8,7 +8,7 @@ inherit meson
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/libmpdclient \
 "
-SRCREV = "4e8d990eb5239566ee948f1cd79b7248e008620a"
+SRCREV = "27767959442ef390aabb16790494ba93fed962ef"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "tcp"
-- 
2.25.1

