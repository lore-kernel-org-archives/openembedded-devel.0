Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E6CC433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 11:01:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.6598.1666177255280763793
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Oct 2022 04:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=obUurzdI;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id iv17so12681301wmb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Oct 2022 04:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ngXWYIIBEU7gawnZgPqT5pYfboAW1Rkoy2uCySmoFOc=;
        b=obUurzdI2Ju2nIocuZy8NahL1UN3/5eDMawK7CAPePI3d0YqG/TC9nmV5i2hmSz0jq
         zz4yFAZymhsTk9KQ0PUkwNUOp4ct4ChjvCjx11dtYz9DXOawVdouzY76w3yxzasm8aHp
         Or/jVwGgLCEhaVlTV8DuvxdN2qtqAcDR0WYofCKyEgVSsMrjNjJqPB3CxCG11hQx/tso
         bmqYTRMM/r8kjGL619cAVYsxd8Xu2J7tyfj7dn8OIqkOkLCgchiXzz/6HCV6X+5JWH+W
         N24no7qWoKdCL53s171hd3wPcojrKTKtdb+IlcIPeZIC8XNCguN6AhAYaqT3v74xbE7G
         mh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngXWYIIBEU7gawnZgPqT5pYfboAW1Rkoy2uCySmoFOc=;
        b=1QWXbmUMPixA+IH8XgPk6ou14pJ20EXQoWnPy4w/rHZl4mXi1H2aH+uoymDK4anOz+
         nfqAD+q+90kWPnNrzKBhhdqdp8AZrAEFveSYJGtz7YZICzIE/I514FfphBYyFwNr8ezG
         5yXmvCNVfDojJBojEqzT62rWyLIaFyDNAuCZIVm+U2x3s4mkb0WXOqVfAid1LeJ9nwEV
         AgRfnBnghvjUlvjbH18NT0V/gouoXl82OIq4e58T/hnTLlUbYToRjPgGYVZmAaB7+bUq
         BtUlTpM0GF0g9JKFufvRHY22xwOc/8+lVfeD4Yct5JPmSK5AXKE6hrnLVY6fsqMxv+Jl
         3Bpw==
X-Gm-Message-State: ACrzQf1m7aR5sivf3XOM/uVbJspCL6UbGsBbTr8WDpXDnjiO/+Ao6HrH
	9G7gQOpqFOkAgGcbX94pXkiGQi6H8KU=
X-Google-Smtp-Source: AMsMyM5+homz+HU4RF/4n12nVHBGn79m6Jp4koBAC8LrQD+7baaHm/sYYHnrhX+5pFgikDmvBXHtsA==
X-Received: by 2002:a05:600c:1e28:b0:3c6:e046:9da7 with SMTP id ay40-20020a05600c1e2800b003c6e0469da7mr22123307wmb.43.1666177253226;
        Wed, 19 Oct 2022 04:00:53 -0700 (PDT)
Received: from Unimatrix08-Jammy.. (mob-31-159-26-103.net.vodafone.it. [31.159.26.103])
        by smtp.gmail.com with ESMTPSA id p14-20020a05600c468e00b003c6f3e5ba42sm11624491wmo.46.2022.10.19.04.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 04:00:52 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.38 -> 7.0.0
Date: Wed, 19 Oct 2022 13:00:50 +0200
Message-Id: <20221019110050.1444551-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Oct 2022 11:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99246

Move license from GPL-2 to GPL-3

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...vboxguestdrivers_6.1.38.bb => vboxguestdrivers_7.0.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.38.bb => vboxguestdrivers_7.0.0.bb} (94%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.38.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.0.bb
similarity index 94%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.38.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.0.bb
index 235bc3061..46484475e 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.38.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "VirtualBox Linux Guest Drivers"
 SECTION = "core"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/${VBOX_NAME}/COPYING;md5=e197d5641bb35b29d46ca8c4bf7f2660"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/${VBOX_NAME}/COPYING;md5=fff5fe1c81dd6dc3d522e7862e44881e"
 
 DEPENDS = "virtual/kernel"
 
@@ -15,7 +15,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-SRC_URI[sha256sum] = "56d997b58154df3974ce040a64970fa774add41e84b23dfb84b279b24545d7e4"
+SRC_URI[sha256sum] = "1e5b321bf20eec03154e2b3e16331f827a472d6e8e5b1e04c27041978975a97a"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


