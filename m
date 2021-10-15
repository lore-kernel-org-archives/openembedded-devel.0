Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B187C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 19:07:26 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.1623.1634324845336871717
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=HxDzd/A1;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id x192so10692657lff.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=et37fJdyNULiA5v5UoSLSrsS0EAdqWfAzKviRNaS/Po=;
        b=HxDzd/A1FoNrnEk9yg/UMXuVL56OGHNQn155WTri/db0BiBGU/R3OEeMGkPJsucwF8
         BPUNp9K0wfsn6KaaCw1E/tTNmexC9e6SmlWOiu+Gy09pSOhCCTEfRhqfxHQGMtN5/Vgv
         /OJ0rba8yrx0SRL7bsYgFy/dg653P9niA6bvMb1gxUKHX7DNexbCgD+DtgSUUyfkVqAY
         z8vpjWwdwmDVR3/qxwMW/Hf83anllS98prhFdXCAkRQZDhM5xbXI5Xtox7Je3VrmEZBn
         N3INxRiqKENmkCkQJLdhWOpUZMKX4JMSeTtHvaDAdX6dnL6iG7+O8KLU4ZwhpHrV8GFh
         g8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=et37fJdyNULiA5v5UoSLSrsS0EAdqWfAzKviRNaS/Po=;
        b=IiBmUL6Y0eH43RZE5J8UKbjevwerpoQSTkvK9WD/bcnsw+iFi5RFxW4Qufn9Z5niNU
         CtCEbjhfYjr3fIXCvMUp6f4Q+DrOhVulRIMhLpKOH8yVj0UClU/+rHgCUrpys0E/nu6H
         qRZTK8W66L+c8S23KFCslsYRlu0jT910DUv6itCyIy1GCvQ6bJUzcS92iznBLcUgkvco
         eQuHnZW8zhwiuBhSgkIyyrbzF6k4k7OSOUpdvyxPGNqOulX2t0Q/A0P4TDuEMhcf1O4o
         19fQJ4hLL31VJQdB/5M1Gj/ECm5qYPqlZGCQ0xUGSm0zo3s4574OYBdLFZwY73FkYui0
         6hQg==
X-Gm-Message-State: AOAM5331UDxyVswuBm4rrqI1nEFcR8o/VJ4oTVTLgkvLGb0mNRsu/lIr
	mUfWB8bH2rfRD7oC3CgEDtxinqhnh3N3Ol0u
X-Google-Smtp-Source: 
 ABdhPJzn4lzuWX0P+BV3uxNjzYtx+415Te1SKhm8xSUZy1Pz1e+akkwTj+HL27XmbB9MhE0z1e3Csw==
X-Received: by 2002:a2e:a375:: with SMTP id
 i21mr14109989ljn.468.1634324843193;
        Fri, 15 Oct 2021 12:07:23 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 f8sm598664lfq.168.2021.10.15.12.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 12:07:22 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] ttf-abyssinica: update to 2.100
Date: Fri, 15 Oct 2021 21:07:20 +0200
Message-Id: <20211015190720.879865-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 19:07:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93331

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{ttf-abyssinica_2.000.bb => ttf-abyssinica_2.100.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-abyssinica_2.000.bb => ttf-abyssinica_2.100.bb} (67%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.000.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.100.bb
similarity index 67%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.000.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.100.bb
index 29a1f6ba7..bce37a2e0 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.000.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.100.bb
@@ -3,13 +3,13 @@ require ttf.inc
 SUMMARY = "Ethiopia and Eritrea (Amharic) font - TTF Edition"
 HOMEPAGE = "http://software.sil.org/abyssinica/"
 LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://OFL.txt;md5=80cc8cdcdc3f8ce96957bbac946b70ae"
+LIC_FILES_CHKSUM = "file://OFL.txt;md5=fd664aaab50445c3c1c97544554a6bda"
 
 SRCNAME = "AbyssinicaSIL"
 SRC_URI = "http://software.sil.org/downloads/r/abyssinica/${SRCNAME}-${PV}.zip"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[sha256sum] = "274204a53b30f64cca662d78c7199e3c0325ea95ad4109886b47af734c92d0f9"
+SRC_URI[sha256sum] = "1a1fc8e82f0c0f2e824f42bff05c1f4a0356330a89dc7ba798c1a20bc3e333e0"
 
 FONT_PACKAGES = "${PN}"
 FILES:${PN} = "${datadir}"
-- 
2.25.1


