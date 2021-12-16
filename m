Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152F7C4332F
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:34 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.11750.1639668212839364973
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FDvlceiD;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 oa5-20020a17090b1bc500b001b0f8a5e6b7so7455351pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qEnuUfKiio7NKg8T89yW4OuIjO1jH9sf3fZbZErqWxI=;
        b=FDvlceiDcx5H1agO2sCJMM/X9vCh2TO7ZRaGASB8uegQez8xtHhaz+d3IYad8hgEUe
         HMotwME5dYDKw7Bmg81OorN3cceWnsynW+D87kb7PeeFnx123I7Lp4k323Gm4tXtbDtm
         fgq8PvOIs05ucB1zobQ7ZxK7aKaohqOwPyoYKuBh6d68FMIQyx/V9rqSXwmgTQ+9oqm0
         uShts/QaDLRQp4q/eUI4weYLYG+ijNonqIwY3uUIl+AwhgtmgoSUxhu5RD4HTz4m0FFc
         sGdd+UYqdVERnakcialC6rk4LDFpc9C6pAOe6Be6aRl7kJ+Oau8uZZyihB2L8cbBhm4z
         ZZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qEnuUfKiio7NKg8T89yW4OuIjO1jH9sf3fZbZErqWxI=;
        b=BrVii29wfJhbdxE76h9KzkhMcZ1NG1IuYqSBWvcdEzPC+hoa5Rrc+McKHYAttQFWU/
         wXyMz1ZnPHsVwjU5lEFELKpawjn0B8VeKc/l0CIagSgCzP4Quo4jLifEbpRx6makUVBW
         eJ6cpK+GFe/uIxc5meoAVHIen9pv8tW2FS9lCy8nRztU+42sDy+lV9ZkXpEpNyL4eXhA
         pNCtunu+iR3iWlx+kAega+BmMqfn7dEEdP7s4S6m+tvTWC1ZMNJhEXNRLDoyrMa6VRQX
         rJtujyJF9+uhAlsjLqfU+8SyYyOB8LmYal3ixBTD6f3tx9nqcTZ9SxS4YIEXT1PZXFhi
         iQVQ==
X-Gm-Message-State: AOAM533QZ8omkt4i5fL4YLI8UgHYytOoLAwi1LD1JC9bLIgg0U3MAu7q
	uOjV5gVTEO+oxDRQi+zeZSOvdqh4C9E=
X-Google-Smtp-Source: 
 ABdhPJx5vYAqXJ0f0RfdsGmaoK6+If6syF9awVmvIalXEMrsSkrweTVE5b7vsvDb2Quz/rjJTRT8wQ==
X-Received: by 2002:a17:90b:1b07:: with SMTP id
 nu7mr6699626pjb.140.1639668212136;
        Thu, 16 Dec 2021 07:23:32 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 06/18] sg3-utils: set precise BSD license
Date: Thu, 16 Dec 2021 07:23:11 -0800
Message-Id: 
 <163d3489c5fc585a04787c25e3688d50a07f5615.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94391

From: Ross Burton <ross@burtonini.com>

"BSD" is ambiguous, use the precise license BSD-2-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3e5651b6b4027ffa768492ed4083c4220b4e59e6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
index 43ee19afb8..3d07c01f07 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "This package contains low level utilities for devices that use th
 HOMEPAGE = "http://sg.danny.cz/sg/sg3_utils.html"
 SECTION = "console/admin"
 
-LICENSE = "GPLv2+ & BSD"
+LICENSE = "GPLv2+ & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
-- 
2.25.1


