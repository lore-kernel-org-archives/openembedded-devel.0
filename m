Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73782C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 18:49:33 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.46447.1660848570849858748
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Aug 2022 11:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DyQoJfjU;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 r14-20020a17090a4dce00b001faa76931beso5565687pjl.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Aug 2022 11:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=4o0xE47vD8gUZS4O6AqOARYKD+tyHyUS7COyIgPg4hU=;
        b=DyQoJfjUNnG/0vp/oAp3a8vNNHb2alG5ZFJ9NhFocXDLYKp2OtKyt81i/GIHlrQAeL
         diV22gcuinUkk2ifZUvGZXzivUnwryVS3thRTerObVF6tjZElsuLyZ8OXL78oogSpOfV
         rH6AgB31QxSWAuG/RDMiMDFxPxyoVM0FzsqgFEiCjI1aOXTqcZhm71lCKkzuTtNAtEeW
         9UY7sVQij1b1ZhlsU2Nwt6D8q8CuBXeGJ8lUNak5N87O925700AgitNKChy+7AryT+cf
         MjqMVQ5nQb6unT1Qg623VsxAWnwj6pGaWV+IJSaA1/uLgQwa+/Nk2gSRmr5NNDbaVozA
         TA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=4o0xE47vD8gUZS4O6AqOARYKD+tyHyUS7COyIgPg4hU=;
        b=PcQ34GmxpxVTG6AYsNbPHVZVVLWCIk2uXnwXDlOwtWOxbh16zJ5wczMijL2JaOgqhN
         UO8W0a5r+akEa1zB4/WWfVpm9S9O1av/TL+6p4Tet7ZbLai/ZzXKOnN9DhzX6jz9hiu5
         JyFE6vjMZoRltCEwyKatKDcINkKrjuhe9wesnxdlgfPifNCvQWsrb5CUxY3tZdp9ukfq
         dfTvPCWX+eqQ3SRBnOoScu4ezBDLs+FhT8oAxDxBecrDKsfG4IH6Jsltld4nTDoWhMAi
         0uggRiHCDvIZrJC0LJv6Nf10vgEM5qbWFHSmFc0LBM15P57FdL4+drYIzw1uui0RwDqX
         0ZGw==
X-Gm-Message-State: ACgBeo1XjaXbnLUC5tekWO/oWspanZ+NWRECdGAxfWQSt+ooLgYl8sl4
	8NU0s1d+UxZum3iyWDjNg7ay9nuK2uN/2Q==
X-Google-Smtp-Source: 
 AA6agR5ZMs3q3tiaeK83hXhn678QhS72Rw3bZQP1bCbLaU8G0kCRuPn1sNRy2PgiQEnAFUv1RhEvsg==
X-Received: by 2002:a17:903:2291:b0:172:5983:43c1 with SMTP id
 b17-20020a170903229100b00172598343c1mr3562132plh.31.1660848569753;
        Thu, 18 Aug 2022 11:49:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d53f])
        by smtp.gmail.com with ESMTPSA id
 v1-20020a622f01000000b0052e5bb18a41sm1947314pfv.58.2022.08.18.11.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 11:49:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] mpd: Upgrade to 0.23.9
Date: Thu, 18 Aug 2022 11:49:27 -0700
Message-Id: <20220818184927.324062-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Aug 2022 18:49:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98320

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/musicpd/{mpd_0.23.8.bb => mpd_0.23.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.8.bb => mpd_0.23.9.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.8.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.8.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb
index 22bc159699..e63c1b5e19 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.8.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=v0.23.x;protocol=https \
            file://mpd.conf.in \
            "
-SRCREV = "1f28790476f7bca935edec67eecae909741ff287"
+SRCREV = "12147f6d5822899cc4316799b494c093b4b47f91"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
-- 
2.37.2


