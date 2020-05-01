Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.8207.1588332959617273400
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 04:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jMcKqrOV;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id k1so11230855wrx.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 04:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vwDhdCmSoUEZgCuchmRMWZroqxTstCWa+SkpsZpdtRs=;
        b=jMcKqrOVjJ5fg2de/D+P8vDlj9xat2BsTJXQBceO+x5GMaCN9gdsdjj2GEsRoUMzTc
         7CbJBMMItwNPPqFUz6wqcS3378dssL4UowwFiAh0HNiX5A2/26dvfktniT2x/2lXPQMc
         Ycww8Iz7NokZnN9ph7s0ciWiRVH+uBDZWa/yG4Mq/+0hh3uenu1pdRff1zbZyKSnZdS+
         nGCN6Rfem/VCkeagv5QakZlJI0+l2z+2QS/O9jqSXU6tYKuBWwufVt4iW4OVvPalb6/F
         uQeebSx8kRl/ra0DfgYAt08E16AhLTTWPpcBaGGRuYjlMcRRvH2r9aqz14WEimtUgJ8L
         79mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vwDhdCmSoUEZgCuchmRMWZroqxTstCWa+SkpsZpdtRs=;
        b=Dn1Vqbu/573XS2xWQT3YUNGLSpGmh4wxSeFss5ReDaKsTfwQ1zO4Aa/+CpAqvXVNXe
         5WmYbadjpb1zAo8BIQVfd2Ofh6Op0H3auhwB2ugUAoLvP2kGncCMfeKF+Zk4xTDLeSJh
         SxeJoMWiZERpY9lDUxWhX6lI90cEAZpm7SczuFoxh18hvzi6MCQRSKnORoCr+8JxJQok
         jbNLFMrvP+hAefy9eBbjjSGTnjSLk0tJ9ZfhyV9do/8nEpqqwRiFXxXNPHsFT8k8jfCv
         VWUPSZmpmnyLkD+d5syOf9R4rvEadS9/afXrrMYQT/Kqtq0ZptWaTj1dlne7TCeNPiW+
         QC9Q==
X-Gm-Message-State: AGi0Pubi14ZDK04cYFrKCsbRn/Jc+l0PfXS4zzuXbXba0nvCSwDKxn3x
	3acQnoaGAFMzXPLPYDO2JXLl/Zpr
X-Google-Smtp-Source: APiQypL9NTbgkcOKSwr7mF3Bet34z6MtxP4Q7p72DBSVyionIotQu3ABEsPOJQXfhjlDapVLVt6HWA==
X-Received: by 2002:adf:c7c3:: with SMTP id y3mr2664734wrg.196.1588332957943;
        Fri, 01 May 2020 04:35:57 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED437E74431DA4B53FAAD.dip0.t-ipconnect.de. [2003:f0:7f0e:d437:e744:31da:4b53:faad])
        by smtp.gmail.com with ESMTPSA id q10sm3960004wrv.95.2020.05.01.04.35.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 04:35:57 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/10] openvpn: upgrade 2.4.8 -> 2.4.9
Date: Fri,  1 May 2020 13:35:32 +0200
Message-Id: <20200501113534.16030-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200501113534.16030-1-schnitzeltony@gmail.com>
References: <20200501113534.16030-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../openvpn/{openvpn_2.4.8.bb => openvpn_2.4.9.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.4.8.bb => openvpn_2.4.9.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.8.bb b/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.4.8.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb
index 09efa5700..529e3912b 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.8.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[md5sum] = "e9cb40542e17ce295d80860690710aab"
-SRC_URI[sha256sum] = "65e1da3f3a08e7e900c175e7fc30d834881fd2dea0eb39b25325a861a9da0bc5"
+SRC_URI[md5sum] = "52863fa9b98e5a3d7f8bec1d5785a2ba"
+SRC_URI[sha256sum] = "46b268ef88e67ca6de2e9f19943eb9e5ac8544e55f5c1f3af677298d03e64b6e"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.21.1

