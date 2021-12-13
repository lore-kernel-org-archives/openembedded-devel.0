Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B41C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 23:34:34 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.18938.1639438473170099903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 15:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dLEYkNW7;
 spf=pass (domain: mvista.com, ip: 209.85.216.48,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so15784337pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 15:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1r7MASyBvhxIQlpdeaEhPhl959UnsDPQuznQ1ZgVqNs=;
        b=dLEYkNW7DGxDSWLNb50qLy4YNP2Zhv/Ryn1I7WjUG/snKrNg8FEUbBl5zMjEBxQVEx
         GTkayMrGbb0S/l6ndWOvYBgPyr/4acuLEay1FfMu1ojFIL8dKi8LVb7QYP/nAOBlLa0k
         1wo6M9nLKueQ08ID1diEJgWUoMb5IPtR0aAkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1r7MASyBvhxIQlpdeaEhPhl959UnsDPQuznQ1ZgVqNs=;
        b=vmP0lKeCEtN+sxoeJLbP6YP36iGuTVuJzltnADmQTFBHIZsD+Q1Y/riRbeUG+4Per8
         Gs3MvJ7EW9k0M8T62xld3X/N3lvucNkrZPmeGzApT2mbI19LzgDHF4Hu8KAoHMOYU+mH
         z+vYNYMZbeGtMOUIt7HpQVjRdus2Pym5e1U+Ii5EoofufN27TrTALKxdIgT6ZEcmFekN
         QeYLLmGENKxjz5j4GGFOWtnKeoRa5FPcGGu4OsE74gjmzhAfns0+vAy72yUuR/zgaMAa
         Gd9AHl/cLTgY6qMkoxRkYR9Mx7sb4yHP7Maza3qn6VfpPsG9/Y/1FqHsRK7RhhqT2JwK
         hqDQ==
X-Gm-Message-State: AOAM5319JR9P9sbqpp4SEv4DCVjfISnQapP2rRJtq3RI8PzggHw2biJS
	Rz2g2eLXGKFAQhqYIOSxWPwgWfFYKS0RrQ==
X-Google-Smtp-Source: 
 ABdhPJweH8xW3g+mQ9Eab6JLG3ljVfw8AHP6WSr3+I3yWgdOocAbVtAdh+56b8Fg8JTETJoH2VvXgA==
X-Received: by 2002:a17:90b:1c07:: with SMTP id
 oc7mr1425643pjb.127.1639438472481;
        Mon, 13 Dec 2021 15:34:32 -0800 (PST)
Received: from black.maotig.mine.nu
 (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 b18sm13777211pfl.121.2021.12.13.15.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 15:34:31 -0800 (PST)
Received: by black.maotig.mine.nu (sSMTP sendmail emulation);
 Mon, 13 Dec 2021 18:34:29 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-oe][dunfell][PATCH] c-ares: switch from master to main
Date: Mon, 13 Dec 2021 18:34:28 -0500
Message-Id: <20211213233428.3448-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 23:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94346

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
index 2388047e5..b77604797 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 PV = "1.16.0+gitr${SRCPV}"
 
 SRC_URI = "\
-    git://github.com/c-ares/c-ares.git;branch=master;protocol=https \
+    git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
     file://cmake-install-libcares.pc.patch \
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
     file://ares_expand_name-should-escape-more-characters.patch \
-- 
2.20.1


