Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECE7C369C2
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 00:12:53 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.2593.1744935171717602288
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 17:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cHqJntNe;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70575d66612so11912857b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 17:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744935170; x=1745539970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HRWFUgAVQCAZdPaDTgB4G3fY/7EFXMIU0x3lThj/cPk=;
        b=cHqJntNeFkC4eEBxM3wBts4QvswL++msJfSZcDfuQwKIyE6PU2d2ZZkKYf2gJg9O0L
         AGIH4+d6xBmKUOaxBQJA9brYIw0HrQeOeGCQ0qARUNfRINr+S1GW81uDapWdn+7G/djx
         KWwrHuqNr4OtBv1mB+ZBUH9Y/fg+3FoIBE3gLBB4LnpgrUnmpVJbIeEMjAGatYuYZ8WU
         wtx9oO0KYs0nuT9eOb/DDlyo6HAr6TXUTB1ISOvc5HHdGh3qyUnMJ3DWTsMXx/w00xa9
         9SJJdY/2OeygJ7fEQehfUZ25M4umqfdS+iMcDtGC307pvY3tH28EPmj6Q8utekW5BFb2
         NSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744935170; x=1745539970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRWFUgAVQCAZdPaDTgB4G3fY/7EFXMIU0x3lThj/cPk=;
        b=iSF+9q64HiqNRPTPADc8G+qWFBQla/WjFVYnPpTF9i9IoBtGBiNkICGMzpcf+ggV2S
         XAwc27VJ2wzSAPHP0GdeWaC6w7blH05AVpeLigfInJM3SPUEK+wfiVLIGkiaoPXIxxjk
         JI9YGOiSKWik342BvqPZBjG0Iktf0zIedA7Hn1bwhSkmNSeRz3V6oh65YHUoB1ShGmV3
         4Odz8EFIXZyJ9A2jqCAuqaY9sHIewb+EJSkpmdN7DLncyqIPx8WHN7dXGIsr8w7N+H+D
         2SC4dlPo5UzcpbeD98Fzjx5ri5YFP4t1xxLHaKnUNnIOSEL2sj7s8DNuJQUuuTl2/4Gr
         wlqg==
X-Gm-Message-State: AOJu0YwuKU1XZEX+GlKdXVpM2KAUXPpI5cFFqyTcO2/NnLFBfX0CzcvX
	ErvIOse195Mu1PJKrpQ7/mf36nyVy1CtgkpxV84EOAzI1AbhemY2Qx5Z8p3e
X-Gm-Gg: ASbGncsxL96MAoHX7cuNETICygpP0bweEfYwMUKgjnEqNz8H0JMTkWMVEuTi+3DJBPb
	eLpJvizCA5CnF1xA0SfWQU7C3HGjcvPcsWnuAMf480yuJdG284YxUn2DmWhp0by+gHInoOuAM/t
	BCaItS5rpmShOQOuBQXgGFsx7oAw2PTedIqeSYLW0gpMEd39n1AqmcxRToAx3BuMvB8QfnnuEEW
	K0oM775rIMExMezo14GCjAHMKVwmjdwp8T4YYTjHck+Jw9Upewto9KnMH4AZ2TqnD2mxXm5JriK
	Vcv436ar8cihORs0s7Y6byEY4J3yxe3H61raO0EARjKvkA==
X-Google-Smtp-Source: AGHT+IGAIgqjsXpgmsrUCAmvSwljU0QwlQd/DTMWkmfgprThSgJK43WbRG5dKfYnQnDhu1V08bZOjw==
X-Received: by 2002:a05:690c:640f:b0:702:537b:dca8 with SMTP id 00721157ae682-706cccbe15fmr11942097b3.4.1744935170107;
        Thu, 17 Apr 2025 17:12:50 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca450fd6sm2437657b3.19.2025.04.17.17.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 17:12:49 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.34.3 -> 1.34.4
Date: Thu, 17 Apr 2025 20:11:43 -0400
Message-ID: <20250418001143.1658965-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 00:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116942

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.4

Changes:

    QNX Port: Port to QNX 8, add primary config reading support, add CI build. PR #934, PR #937, PR #938

Bugfixes:

    Empty TXT records were not being preserved. PR #922
    docs: update deprecation notices for ares_create_query() and ares_mkquery(). PR #910
    license: some files weren't properly updated. PR #920
    Fix bind local device regression from 1.34.0. PR #929, PR #931, PR #935
    CMake: set policy version to prevent deprecation warnings. PR #932
    CMake: shared and static library names should be the same on unix platforms like autotools uses. PR #933
    Update to latest autoconf archive macros for enhanced system compatibility. PR #936

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.34.3.bb => c-ares_1.34.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.3.bb => c-ares_1.34.4.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.3.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.4.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.3.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.4.bb
index c02bdbcc5c..1fee769f25 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.3.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "26e1f7771da23e42a18fdf1e58912a396629e53a2ac71b130af93bbcfb90adbe"
+SRC_URI[sha256sum] = "fa38dbed659ee4cc5a32df5e27deda575fa6852c79a72ba1af85de35a6ae222f"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


