Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.8194.1595677217437168702
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 04:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Yfh1l/31;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.169, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f169.google.com with SMTP id h22so12530138lji.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hnYBr6K6P/L96VFxdYuOMmXVCei0V/1q2w7ylt0BzWc=;
        b=Yfh1l/31mN3xqf89ILNfjn7jSnh1xivTsMPPYkkMAQvHKRZ7ICCDSVCGB846tCPZiq
         NJh85om0lT9Z8/SS1BzVyD5uWE7uxKtHuJmx+eGv3F4rQMJhYEup8bvX99FSedt7mYZ0
         3CH9eieh+ToDEX7zmWkMw/gLtHt74BbHytFKQnKDvendZqOyirkV9dbj4Bwi6jn57n9B
         FgnW8gCFShriMM01sgXWpa41yANvg2p4d+/UnA8v45H8oxsOqpU1ANSp2sKIB312YS2/
         EJP3CTN33haT06QBJSKJF78NBWyAeFMnu0ErN3TUVrOK/YkWY2Xt8RrP8ztAQO/VBZDN
         cJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hnYBr6K6P/L96VFxdYuOMmXVCei0V/1q2w7ylt0BzWc=;
        b=B7Gyz4PiNNKyar9aLpKV6wRGnqP78QeasH+7jeSB2gtsWA9S0rjEavWmeFOHt5R2Jt
         qvZK9DNTxFf9IvJ8B0dL++jQ/BAx2rJwGBQ538XA/57tIjeFqK5fdQNcYjzHjabIO7V8
         eivFAKEodn2wq9Q1EkI7uLYJLrRhfXM3Pvfubt6l93GhMvteqE/niKo6ofaAfC/LQGBe
         j7hJoeQ4ViY2HjZxrzLSPzVM31FJFAMjO6VujlEyAZF09EWI9GGRdkYBaj9eEpjCzuzd
         jAyXp28FCoIpphvNbskNE14v7GZcUAdU0HBBu5Yl7gKwThUNjhOLusU/Gu/OQQ+lWd9G
         reTQ==
X-Gm-Message-State: AOAM531zuAYPmsUfsNnft4cekbWh3qT9MlVJMwyyhELFzTLqPBfJVcl8
	SY7Sg/xWQ12MjMllov7mr5WZPXir9Oo=
X-Google-Smtp-Source: ABdhPJykYJYdEs+kzSeHY/nGVp/UCoVTxqEBOjF2M3tFiHo9JjL4312DSAupOkedXoWGZx5N37rfPw==
X-Received: by 2002:a2e:850c:: with SMTP id j12mr34085lji.56.1595677215086;
        Sat, 25 Jul 2020 04:40:15 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id e12sm960119ljl.94.2020.07.25.04.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 04:40:14 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libvdpau: update to 1.4
Date: Sat, 25 Jul 2020 13:40:12 +0200
Message-Id: <20200725114012.2284879-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-graphics/vdpau/{libvdpau_1.3.bb => libvdpau_1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/vdpau/{libvdpau_1.3.bb => libvdpau_1.4.bb} (91%)

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_1.3.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_1.4.bb
similarity index 91%
rename from meta-oe/recipes-graphics/vdpau/libvdpau_1.3.bb
rename to meta-oe/recipes-graphics/vdpau/libvdpau_1.4.bb
index 240949f55c..b6790a0855 100644
--- a/meta-oe/recipes-graphics/vdpau/libvdpau_1.3.bb
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
 
 DEPENDS = "virtual/libx11 libxext xorgproto"
 
-SRCREV = "f57a9904c43ef5d726320c77baa91d0c38361ed4"
+SRCREV = "c3d1a9dbafdfe6144ff474d0d523dc01b068750f"
 SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

