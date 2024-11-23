Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E75FE6ADD0
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 00:03:49 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.38413.1732320222650715032
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 16:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MB34M+Yr;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e3882273bdfso3109895276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 16:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732320221; x=1732925021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INIn5B/VrZWINdM9dq+ZkgxXMGBqe3FlwC9bYnRsTT4=;
        b=MB34M+Yrfa+vEQQqsVutuXfdkD8fowWDxSKE9ECenj7ldVRjbckd+ppJnUCI5IzqpX
         2pIf6ws6EpRhGI4xa3l51VVg7VY/5HXpjYvKz4KKq2WhxGIU9Ag1wMXknvmPFgMvT31+
         E/QMATyXw1VbzG/zxdHHC+cFGZuKCku1i27gCobL4ECaNAXTfhMPMMEqqvd6cwcrIky/
         sCLF1XaZnuFVrzU82+mjc9Xuyuvej+huzNbXwHf6K2jsK16V+TDGoSfXxDaNkPgjGxhM
         8+dcGUEt4mmoLU2VjbYZVASvzFs6PRQZfhj5VNP9Vuqda+pb5Kd6sBsO21umP/+wJpCt
         nHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732320221; x=1732925021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INIn5B/VrZWINdM9dq+ZkgxXMGBqe3FlwC9bYnRsTT4=;
        b=LNxC3cbJy7AjqQaTP40wc2arRveuZPuLJ/AutT9nzlxqJ3tdDRU4RlVpmjvc1y8Ppj
         fHLKJkzbrBT09JlCrfzu1qCsEggtwd3qpi1zaThafiXT6t2htX46v6rpeIHwO0ord/Vc
         qgljp7xsOCjLo7cOnO+wzdSKdds+096fESzh4nXdGM4/KjyPVHvxPE8oox2d2lqSsau4
         ebZaLB5OViguX7wLOPfkvQupAceIVEZAwrz/waXGVwFsnsaY32bUjZKZ2ioVEKP5xqLW
         avrQrym6M2xhITY588XStEmnOzUapPPWE12TWQU0nmuM0aQeAoTv5rshY1Ls13xSHBZ7
         MBew==
X-Gm-Message-State: AOJu0YyTFw8d1StOqhrGu0UEHpC6Pq4HYfECALooS4gQWpYyXzTFyfqv
	5Pp/8uSLmeMKZAB3iVfS2brAQ5rtScWYTHmyfLLSEUpUVS2NXDCkaXPpEkrP
X-Gm-Gg: ASbGncu73Qc/Ys4ZI9CT9pFMqrB1vJ9cq3zk7uWyBwLxYL0Ep40j7HwvpqbR65PKSQD
	wtmoL3XmEUAnHJ+qgOPh0Vdvj5JQRlRux7DKquXA1va1daUHqHXZdPqrAyd/WR3N+xKQx4An8+M
	14jwivI2FkigTAsLULkptqKDdv0ib55Jmf85agW2rcp0mtstAZc43jmyAgJZffgT5+NjLmzL2Ev
	ZdbCFRBUqy42kisxlXsWu9UJe9miE8fjyj+ameppwwMfbVG/cgbXCt9
X-Google-Smtp-Source: AGHT+IH8RB/CduGA6cZg6+yFcYCoWcjwrd42HpAWyePJmy3IUEcpF4nepiWoazd00AHv1M2Et7iokA==
X-Received: by 2002:a05:6902:1026:b0:e38:bec9:527e with SMTP id 3f1490d57ef6-e38f8ad7076mr3996572276.10.1732320221080;
        Fri, 22 Nov 2024 16:03:41 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f6319e12sm888256276.38.2024.11.22.16.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 16:03:40 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 3/6] xfce4-power-manager: Upgrade 4.18.1 -> 4.18.2
Date: Fri, 22 Nov 2024 19:02:27 -0500
Message-ID: <20241123000230.1479075-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241123000230.1479075-1-schonm@gmail.com>
References: <20241123000230.1479075-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 00:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114012

Changelog: https://gitlab.xfce.org/xfce/xfce4-power-manager/-/tags/xfce4-power-manager-4.18.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e4-power-manager_4.18.1.bb => xfce4-power-manager_4.18.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.18.1.bb => xfce4-power-manager_4.18.2.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.2.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.2.bb
index f7f72356d..bb69f11e9 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.2.bb
@@ -11,7 +11,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libnotify libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[sha256sum] = "6b08b10c4cb7516377dbd32c6cc2296a9faf47022c555f11e75b38fde14aff03"
+SRC_URI[sha256sum] = "e1608fd534b6b07529c0840ffc731cb93347ee6deb547a9933215b1816dcdf4d"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
-- 
2.43.0


