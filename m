Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EC7C25B0F
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 04:38:11 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.1962.1660365487093132315
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MzTL4okf;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id h28so2539515pfq.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=omgCUF1XyOgG8t3DuzQEWoTQ4k3fYODpvjWjRImL4Yc=;
        b=MzTL4okfeYa//2DJrYk1qKVp89uUGZLdNOuXl3KUuaSTWf/xof4RQ58wjj7ZeWenOi
         N1tu1R/QTF4RFKIIwSwnJynLxXsWmvQk29oHx66AMp3VfNIdFtfF58z3H6bl0poKZjCS
         HejjLSVCeC5l588sL0EmY/EUv692BO1Vx33qxaZfstqE2fBeGdadYYmyq5GTmRorJgZp
         O17dnlLHglKU/v9QbOWcHD4etVvgkhIZH33wF6MK9KfPaoyfmRr2AJfMmdmgtleSv0U6
         rwG8TvxEmFHX5UY2n40Q/reCqsAGqW/HUqsNktnmPTWlFfP/HPsj9eCHkpwOeyqyTJ3W
         8LMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=omgCUF1XyOgG8t3DuzQEWoTQ4k3fYODpvjWjRImL4Yc=;
        b=5PfNwMqTpDcjymEsaOzrHvOJUEDtylsUvqjLcxtiX6Emo/EcYaF6ax0p0WqYMruDfB
         BCnbEZ39YWxTyIDr/suZSS5rXiSpPM+mQ726m7CWOJJxRejCCKdKQEr93nVBb1Jlj6UB
         jKsv0d8GxIy6RInZLwOisQBWmszCw49Da1qcHmEUlAHiZ4pW8pT5BSWY52lRZYxwMfZJ
         OYj5j9SVhmIuCIbO9+nKk1Pqw12p/UTsBgYSuhXihro8PJKi8dsl/sn/xenPAahx/Y1A
         UW/8QiWDLMkL0hMGvGUQ6K9ivep51vNAYK6oE2AYNwYCUejgJhfdy/7gyUiJ7/8x8yYV
         +T7A==
X-Gm-Message-State: ACgBeo3bkJ+GilquxF7VRuRKl1UTl6f6lXV5Kk05XrS6RK+8/0ni86Wa
	FLxI7y5s1snkuBDDWrR7BChWpaANBus=
X-Google-Smtp-Source: 
 AA6agR7Wm4JqlZcoo/9B1SZ2h2iDSkHiZnp7luQzQERc6TOG8meABIoqrOTqwqN2imNXNGGNS/pxcg==
X-Received: by 2002:aa7:88d3:0:b0:52e:ade6:6192 with SMTP id
 k19-20020aa788d3000000b0052eade66192mr6905476pff.41.1660365486054;
        Fri, 12 Aug 2022 21:38:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 j4-20020a170902758400b0016d62ba5665sm2601694pll.254.2022.08.12.21.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 21:38:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/6] proftpd: Always enable largefile support
Date: Fri, 12 Aug 2022 21:37:58 -0700
Message-Id: <20220813043803.3548501-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Aug 2022 04:38:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98219

largefile DISTRO_FEATURE is deprecated

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
index 686f1e5cdf..ecd2777247 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
@@ -21,6 +21,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
+EXTRA_OECONF += "--enable-largefile"
+
 PACKAGECONFIG ??= "shadow \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
                    static \
@@ -58,7 +60,6 @@ PACKAGECONFIG[nls] = "--enable-nls, --disable-nls"
 
 #add mod_dso to core modules
 PACKAGECONFIG[dso] = "--enable-dso, --disable-dso"
-PACKAGECONFIG[largefile] = "--enable-largefile, --disable-largefile"
 
 #omit mod_auth_file from core modules
 PACKAGECONFIG[auth] = "--enable-auth-file, --disable-auth-file"
-- 
2.37.1


