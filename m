Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EED3C7EE2A
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:33 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.68999.1683477193085198587
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=A+PmlM6I;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-55aa1da9d4aso66145847b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477211; x=1686069211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpHoHK+I9Ney8qcnKXKRLRHxYejIU/atTmLs6TKiQlI=;
        b=A+PmlM6IaiqWRqEZyhCaB1Ecz0Ues12RKUk/CUxNGRGg5h/5qTC5TWn4ces9glFQh2
         x+BetOzaHCx73acciXOgfJ7IYdY6YeJ4GFji7pBe45OQp63K/VGj3cRJTCimF6/AaSJD
         xxvmi/vsif5Uwcotnt8jPbS5uxdXyZ108NRowYyZKdmncupmtZXKQoZYZvtIZ+oHK12q
         yHOlnqDzCLg/k2SUC/6j/OxNSWN2LZ+dCppHuLRRiexUI0RAtpk+kIlE4VO6D3NzacOg
         cyUkbVrMifIH/om7YUpbj6flFqt7oDhjO5Qe9mjHiXV9ACSseMBYOASWHxlgLyh9t8nU
         jgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477211; x=1686069211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpHoHK+I9Ney8qcnKXKRLRHxYejIU/atTmLs6TKiQlI=;
        b=jSBSdGEo8WV885VpTxoleRmPifXlKEBMFTt410lhvgSkmzI4K6ZzaZcLyYdNjKeg2n
         j5XDlRARUOzWPfN53UppScxFMkvy4WGfDShiVU1FZBi8zanE//5hdrjku8IB5L1grE56
         HZVfepCEp0fHuCIp3UImOwsI0XSSpz8n8MFn81BqCcPq8vofhfMiS6BOcPxJcGj0sdxh
         JoEekDKXLhhOKWeErc3fB6xXWHqLL4NEeZG/hCfhpkKnEF+6mQ/6V/bjcm/D+dXMd8qO
         scTGjzS6qYqrR8u3kpXHbzP2q64aMuHukuQkNAKI6r0RjVk2I6oWUq4oX1/cQ9FvUUrR
         ri2g==
X-Gm-Message-State: AC+VfDztu4K++CyXukf3ulJG+o1k3HyYJ65yxT0v42ityocdWp0Yb3h4
	JuwDoX7ox5+EH1fd2r5Lp98DU6n0ZdI=
X-Google-Smtp-Source: ACHHUZ6CjIg4V/LbEtxQPD+P/BA9ANM6byUE0dhu9hh2zmB5ac2t2e35F7x6TQopr2N/kKjskuI4jw==
X-Received: by 2002:a81:5456:0:b0:559:e965:fee7 with SMTP id i83-20020a815456000000b00559e965fee7mr7760750ywb.41.1683477210775;
        Sun, 07 May 2023 09:33:30 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 22/29] httpfs2: Do not use S during compile/install tasks
Date: Sun,  7 May 2023 12:32:58 -0400
Message-Id: <20230507163305.3261044-22-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102352

From: Khem Raj <raj.khem@gmail.com>

Point to SOURCEFORGE_MIRROR instead of hardcoding one

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit edf94a6e8dd8d5c6942790488a501e0e4c628b20)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb    | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
index 0086551f62..5dc3ea6632 100644
--- a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
+++ b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
@@ -8,18 +8,15 @@ inherit pkgconfig
 DEPENDS += "fuse"
 RDEPENDS:${PN} += "fuse"
 
-SRC_URI += "https://astuteinternet.dl.sourceforge.net/project/httpfs/httpfs2/httpfs2-${PV}.tar.gz"
+SRC_URI += "${SOURCEFORGE_MIRROR}/project/httpfs/httpfs2/httpfs2-${PV}.tar.gz"
 SRC_URI[sha256sum] = "01cb4bb38deb344f540da6f1464dc7edbdeb51213ad810b8c9c282c1e17e0fc1"
 
 S = "${WORKDIR}/httpfs2-${PV}"
 
 do_compile() {
-    cd ${S}
-    oe_runmake httpfs2
+    oe_runmake -C ${S} httpfs2
 }
 
 do_install() {
-    cd ${S}
-    install -d ${D}${bindir}
-    install -m 0755 httpfs2 ${D}${bindir}
+    install -Dm 0755 ${S}/httpfs2 ${D}${bindir}/httpfs2
 }
-- 
2.25.1


