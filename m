Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.256.1617899802787333005
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gsq1QcuP;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso2901730otq.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8uZpR6/zOlr3X0BgOcCZTADgiLOmJlrZRSNdZ23UAys=;
        b=gsq1QcuPM3sVtgMBNn5+JcokYjEkTHrgBw6S4o4+lC8y/XN2UbM7EKGa9khHkEhqvp
         BkdC+cyWOdsEGQ12xterJY0de4ihmzMxM7+R2ey97MdRN7SChnq63Atca1WcaBWfHBOW
         vx27d8vIrUvvduB2jDuczuvPPp9yNXElWKo3iYFvo9FYduEYmm6Dl6VLglkMAZ8lSSEy
         G+zy9SRt0gjHHgqvr2vUfE7WS+bupuEGoGxI3cpdWbee5VzMSdM5UjSseWK78uulAi22
         vBvtmJU6y0pxiH6XLFOlhnYG0R9DkGUyNI2E9+gz54Uv+fRLyibc9o9leyygX79i+WIc
         52Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8uZpR6/zOlr3X0BgOcCZTADgiLOmJlrZRSNdZ23UAys=;
        b=tGSRq4V5ohGIEVWNpc5HRZaz/PiDB0VEyuRhQtmHeb8BEQ9O0xEvoIPXDtqJHRKSth
         kkHeN3Se3SM5vUuw7mfbXN9K8xq/75tocj5fh65vOQb2m//yIHbyKu9VbYQA9S9rvfLe
         qzbrNaOMjSBjBwN9Oj/GY3pFYp0JyOJcpzghL8GE3Fzl9vwUUCSGlT/1TrzQZYkdnug8
         /wGYOynrGkGj/Atl+tiwTf/BRD1olEyTJUqsbbRbGzbZQL2UcQnu9U6QK8IQQ8uQS1Ss
         N7SXw/piowI+s3WyaZe7VBj+H/MdKpg2MkremPNkjaFz418JcEFJMEKifKuvjz5t07Zc
         fMFQ==
X-Gm-Message-State: AOAM530HE+w403gSEVTgIm1AJiCIK+/sl/ylacWwPfxGlLzbwVQMGzzk
	LGwiWayopNzwBEKfeekw4HZjKJY1+hc=
X-Google-Smtp-Source: ABdhPJxNzn76Vlczwx0AuLOGCiOqmfSwaLspdEX4Qe4sTVn5vQzVEb5jOnphMhBa76kL8r7x3AeFvg==
X-Received: by 2002:a05:6830:40b3:: with SMTP id x51mr8336924ott.106.1617899802001;
        Thu, 08 Apr 2021 09:36:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:41 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 31/64] fbgrab: upgrade 1.4 -> 1.5
Date: Thu,  8 Apr 2021 09:35:38 -0700
Message-Id: <ee8a89228a7ae022a14db44a23f9053af84ca0b7.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1358f588e312a987b02b0673f799110ad518739f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-graphics/fbgrab/{fbgrab_1.4.bb => fbgrab_1.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/fbgrab/{fbgrab_1.4.bb => fbgrab_1.5.bb} (89%)

diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.4.bb b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
similarity index 89%
rename from meta-oe/recipes-graphics/fbgrab/fbgrab_1.4.bb
rename to meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
index a1294b98a8b..419881d5ca6 100644
--- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.4.bb
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 DEPENDS = "libpng zlib"
 SRC_URI = "git://github.com/GunnarMonell/fbgrab.git;protocol=https"
 
-SRCREV = "74373aafc0b496e67642562d86eac6b858a31f24"
+SRCREV = "f43ce6d5ce48fb01360eaa7c4a92c2573a1d02f8"
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
-- 
2.17.1

