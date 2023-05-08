Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704AAC77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 13:51:59 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.107961.1683553911206130388
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 06:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Jxgbk5hf;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-55a10577911so65387777b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683553910; x=1686145910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=62ROhyjcgCWFOkKv41c2m1VMFyPoLtydhn/cJn9xgeE=;
        b=Jxgbk5hf3XQxNmBbQ8wnT+hlFjedVzWr7ZfEiADYIOauwqLP1rFB1LRzgkATGF+HBL
         0ug3689BxWFF1Cq6krP3A4LmJQR8qzs8QdmoS+Z3ELoXib4advrYkuWRXkUOJkkbx5EP
         OsuuluU+oISqLD1b62kE1585z3+HmpS8Qw9wdoY4Pc+gCdhXeKUJXEinmnrLITn4XqQZ
         8IdZLRBbk3jGJgomg2ZreqN3I9MTW+ydh4a7dHbR7WHU4hNH5GtQ5QQoQtRYYYLBbKuE
         +whuW3pYFMilL0I1Qy3vFlZyH+kP7S4sjM9sZCycjZRBloC72cSwizdQQKbeLJ8Ry+yt
         pX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683553910; x=1686145910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62ROhyjcgCWFOkKv41c2m1VMFyPoLtydhn/cJn9xgeE=;
        b=IrvnFKirJPr1CegP9e3w9nTUXhEFSu0SuYcUAljM9CYksToVK6vrbczzluzpg5cZE5
         aqHIU+hfmFJsl217WnY5gtgiv9KLasiBJ6DjUdS4EtSKzOD6rycdbuAP9kJqthVrIbrQ
         YKKwJkJVM45JQborT6/GYQW2EI2PcKCcU6jybyPjA1XV6RacsWI4tqA8ahi7GMEOYjlA
         gFK8pjP8ldqENWRGIdkh7l1/vqyKnEAuEYuNyWkH0q1G4OEJuyh7TehRO3d7x2IxKvMK
         PzHCdWLr6OxBVbD17bE5xRl9jIBhTuPgRqBJnyqO1ndYkxo0/bgkq8dk4XdbWeC714k9
         r0lg==
X-Gm-Message-State: AC+VfDx8F66U7gapVYb+Me7/0kHwJ6ktxvlJbHhQLgE087jjzvI3qnPJ
	G0hosBmtjMW3tGUzl5HsukwTH6EdxRg=
X-Google-Smtp-Source: ACHHUZ6Lg1OM0L8XsbcACm+QdUhXIRUkjjsZj07yOaBazPdJj2WZjYnAvx9LvmavPDxwdaLWvJwP7w==
X-Received: by 2002:a81:6cce:0:b0:55a:52e3:8dbf with SMTP id h197-20020a816cce000000b0055a52e38dbfmr13437102ywc.40.1683553910123;
        Mon, 08 May 2023 06:51:50 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id z2-20020a81a242000000b00545a08184b1sm2456968ywg.65.2023.05.08.06.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 06:51:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH] python3-gcovr: Add missing runtime dependency
Date: Mon,  8 May 2023 09:51:49 -0400
Message-Id: <20230508135149.3273487-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 13:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102440

From: Jasper Orschulko <jasper@fancydomain.eu>

python3-gcovr requires standard python module multiprocessing as runtime
dependency.

Upstream-Status: Inappropriate [configuration]

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5564dbb8ff22d9ca4296a68f92f3c9d05fbdf99f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 2c543c3698ef54eece61d6fb6e5f3e5483ab7a97)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gcovr_5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_5.2.bb b/meta-python/recipes-devtools/python/python3-gcovr_5.2.bb
index 03231f926a..8d66545fe2 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_5.2.bb
@@ -12,6 +12,6 @@ S = "${WORKDIR}/git"
 inherit setuptools3
 PIP_INSTALL_PACKAGE = "gcovr"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-jinja2 ${PYTHON_PN}-lxml ${PYTHON_PN}-setuptools ${PYTHON_PN}-pygments"
+RDEPENDS:${PN} += "${PYTHON_PN}-jinja2 ${PYTHON_PN}-lxml ${PYTHON_PN}-setuptools ${PYTHON_PN}-pygments ${PYTHON_PN}-multiprocessing"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


