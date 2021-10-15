Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F61C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 19:07:15 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.1558.1634324833712197051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=2gZwPFOu;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id t9so44891801lfd.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BFeo6t089IjbkM1B0233UZJNzgSvOVLmw0Bj/eGGf5c=;
        b=2gZwPFOuERigy5vinm765c7w7VtiSALO4yCC/igqmU0bOdZKUdqlTRHsTvf99WLZAN
         S09E4v+qaZ+FPnDHozcsHM3iBBG82eDphiaIIkNJDIDLmqF/H1jPWlOPipasFd4YvZb8
         6qF5tkP7VXyTn825lKuEih3p/Esy011qz0G9z78VWQGFmHRedbKk0hsurgXgpuwiP/s0
         85FrhI2aO9kAZl1c8IWtqmRn7o+VtISjMyPRE6fpXYaP4Bsa2O0pmRL3FLDTnCPLChCh
         QFa6Ybh3UNlJGwc8jldVmvLQzdRacF5ovgKKWs1ptbijVe++QnIl1NqlLxwp3S4HdEnT
         n82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BFeo6t089IjbkM1B0233UZJNzgSvOVLmw0Bj/eGGf5c=;
        b=u5XsKo4fTRrsMsZ1yZI1xNeN5qfqjpXuVCnvI+ilyhsRQdbB4UHD4yXuLGlex1SQo7
         lo8zLCN137UaxhjUb62dZ+GkUp1KrhbskRzluBZ3VbpCXBrzkAxOVCQzEVPqg1+nSHTQ
         ykaSa50IaxmgG+0+OSFk/0rAYkvuLi75HrRMZpSExZOo6fxfzEN1WATS9xNwtFASH/Bf
         jTLU/rBtNiriyhFTlkytq9EnuG83ntzOyXct2c3SUG3JDK+Ewfx7IT2g7PD7wjoOCU/U
         UkWucE98E2yBsACf7/3TNGml67zzDJGb+ZXUAYdVkkfhJxsYOK1QSAlIw+CGQti6qu+i
         Lj7w==
X-Gm-Message-State: AOAM5328z1cXBdskwPyR2Y//s3DtnefVpGv4hCrNo9mzThsDvjo8gQqm
	TEL6xjbWD24WRd8iZfiGH1sl/Hb8n0lSzH2V
X-Google-Smtp-Source: 
 ABdhPJyra0SBQhs2Qgzhdb8IKpuiSQRQ+MiQBSz2wwRgr/iZvNg7DdAp9f1MaHPrqrxdlhPzNzMcDg==
X-Received: by 2002:ac2:455c:: with SMTP id
 j28mr13563813lfm.267.1634324831738;
        Fri, 15 Oct 2021 12:07:11 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id n8sm626435ljj.68.2021.10.15.12.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 12:07:11 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] ttf-vlgothic: update to 20200720
Date: Fri, 15 Oct 2021 21:07:09 +0200
Message-Id: <20211015190709.879642-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 19:07:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93329

License-Update: copyright years and author names updates.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{ttf-vlgothic_20141206.bb => ttf-vlgothic_20200720.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-vlgothic_20141206.bb => ttf-vlgothic_20200720.bb} (77%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
similarity index 77%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
index aa4a37723..a386bb850 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
@@ -5,14 +5,13 @@ AUTHOR = "Contributor: noonov <noonov@gmail.com>"
 HOMEPAGE = "http://vlgothic.dicey.org/"
 
 LICENSE = "ttf-mplus & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.en;md5=66ecd0fd7e4da6246fa30317c7b66755 \
+LIC_FILES_CHKSUM = "file://LICENSE.en;md5=cc06b20e7a20bdf6c989624405378303 \
                     file://LICENSE_E.mplus;md5=1c4767416f20215f1e61b970f2117db9 \
 "
 
 SRC_URI = "https://osdn.jp/dl/vlgothic/VLGothic-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "bb7fadb2dff09a4fb6a11dc9dfdc0c36"
-SRC_URI[sha256sum] = "982040db2f9cb73d7c6ab7d9d163f2ed46d1180f330c9ba2fae303649bf8102d"
+SRC_URI[sha256sum] = "297a3813675fbea12c5813b55a78091c9a5946515ecbf9fde8b8102e01c579f4"
 
 S = "${WORKDIR}/VLGothic"
 
-- 
2.25.1


