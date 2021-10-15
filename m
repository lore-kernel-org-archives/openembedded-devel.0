Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAB9C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 13:34:55 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.9243.1634304894166105990
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 06:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=UCzSKojO;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id j21so42301451lfe.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=13Enty5XO98Mm1UeTjOBpx8GfzfWx9QnI9XOsXFEk2M=;
        b=UCzSKojOWjDe+qD6QDOnQuKIjoK7FYD811bi5YrmWC5fr2Fq/j3D7SNeUjxW+4bfsi
         qxsWtyysAz54biJZ05F8S2Ior7vQmtdeu78/E3+RJ0ub+njeVKMOKpCO97Fnx2PrQsWv
         G0dtdKzl3DYmv9b9p+kPzSJVnIPL0Q3xEl7Rl2bAOpmdr272SktgjFHSQ1aF2PCtsYT8
         HT4KOOCAruylyx364A3zfJISMnYwfMV3DucHXyxIKiINDOVRRuNKsc/W866nwG2gWnTr
         RmU2RWNqSv7LxHqJj7CrIh3yAy5htZy77FTJLfxheHzfmgmOK+F2J/xIaClBqXEc5sTN
         UQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=13Enty5XO98Mm1UeTjOBpx8GfzfWx9QnI9XOsXFEk2M=;
        b=yxckBw5LNXf32ciVFAC3paHaIPjSeByrtxP1bquwiP3WqfW/LJ3Hzg3r83yOCnk+K9
         45bxr20LrQuYZ80wZPg5fgKQzfvZiJPpFj231pVU9IcoNAvQqMbxG69ZCmGOWCD3lG/B
         RX5gVN9BSOVe1UftHNuD0WD25bNa9+rGPVDKxK7BleDjpvIqZKZ9eZPpCiBujirRZnrT
         2nVZSCVqCYU4K401vGxQ/msqJadDswz3mU8yfE6lfCFxK7d0wpRoNVUGrqMRj9l/fvQ2
         p5aFPxwXAz+TdeQMRN0ESlWeJ4Q0oFgCmaKVfy5urpKxBdwazIIJwpG+VGvffZuT7k5T
         Cdcg==
X-Gm-Message-State: AOAM530ll3TkDSqnz3bhQ8f0N0Nb+cfbPI9lmx7p7hXctvhAj11IlkFd
	wlGgcDPcAdOW2dofIBbm0sLR0/IUgU56UZSc
X-Google-Smtp-Source: 
 ABdhPJz0s7GYvCZN1+UXo1pZuxXDsqFsMO5FbayYnt6jKBDR/5dQyXbjWYl6cZi8siKzkM5tWsAznw==
X-Received: by 2002:a05:6512:1112:: with SMTP id
 l18mr10716589lfg.649.1634304892042;
        Fri, 15 Oct 2021 06:34:52 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 bf20sm243338ljb.137.2021.10.15.06.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 06:34:51 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] hwdata: update to 0.352
Date: Fri, 15 Oct 2021 15:34:50 +0200
Message-Id: <20211015133450.692505-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 13:34:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93326

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../hwdata/{hwdata_0.347.bb => hwdata_0.352.bb}              | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.347.bb => hwdata_0.352.bb} (81%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.347.bb b/meta-oe/recipes-support/hwdata/hwdata_0.352.bb
similarity index 81%
rename from meta-oe/recipes-support/hwdata/hwdata_0.347.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.352.bb
index 192aa5746..d9dcee7af 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.347.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.352.bb
@@ -1,12 +1,13 @@
 DESCRIPTION = "Hardware identification and configuration data"
 HOMEPAGE = "https://github.com/vcrhonek/hwdata"
+BUGTRACKER = "https://github.com/vcrhonek/hwdata/issues"
 SECTION = "System/Base"
-
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "ae89c73d89bb9f416b25ad9e850e9606e66a573e"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
+SRCREV = "1d4e133fa45205807ab68eff537b47836131b5d5"
+
 S = "${WORKDIR}/git"
 
 do_configure() {
-- 
2.25.1


