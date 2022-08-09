Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E3FC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 14:23:48 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.12532.1660055019059782821
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZXCUbg+5;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id b4so11826095pji.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=pOUn2oe5D2Jr6+Xp6sPSTe/KwfJvBvOHQ+dpHnEpdow=;
        b=ZXCUbg+5l400FOvNuLA2OYhG09kMmDgGxBdLvdCKwFgbrDiGeDRwnmlJIbWDyJH/h9
         RtfT/sWBQwRbB8e0CBel1RvEUfh7MRJ8XBJ7EnHxWNmTCZb0kTnHq6waZopzaD1d6GMB
         0Z4vX4O+cxbgvQOnfP/fyv4R18joOtERCzvVTgrR1UhyEyIB0I2+4efjF7ieApbeZbd6
         diL0CKYYRdy7WfQUQ+35131CZbG3o4ApynCo39jFsxlJVJlZosSRnZq1B54/9mvpG4b4
         meiOf3UK4xhUP5o7V8/q+yITWv56HR0ev1CzyJeE/hvdJEHapfB6XLWagGA6JAPH/+Gv
         zN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=pOUn2oe5D2Jr6+Xp6sPSTe/KwfJvBvOHQ+dpHnEpdow=;
        b=m8/pxGrni2yGQhnFtNmnCghnTnVIJ1HwKjI3tWvuGMCMpVxHQXmAStBIigM7cKWQzL
         4gEKuLvfkG3iqkPiBa+PSBbFij/Kaf048AANVGchNZGTfi6VKoPyZY8WdZn7bBCpNs8P
         y7oQRMiwwyzxfiNgmJX90O814EfepjEIpzmyzIkMfE1/giTzNwo+9oRdLMatXPP3n4lX
         1LBF8RCQ6vnq8q8M3xN4SDyuP5Q9Y2SEsWmxzDax7oecFz8fOd3DfTYSoOTnIoLu3wC3
         aYkUjE+cEhIdKc57JDsqf+0rKggaXdb0bNq2e5InZIXBD/SRQ3tTsL4aP+h33g/X4HVB
         pRig==
X-Gm-Message-State: ACgBeo01iQmzF/jWOz0KTkuUkePjg0g5MhfCRd2xAv3zVzugXQIe9Tp7
	tbuWNE6M/8p/r0b9dn5RubFE8RXYulA=
X-Google-Smtp-Source: 
 AA6agR4MU9cquQaGWkv+GS4ZHaZ/Xg71GGvG3TMJEPPw1vxKwnhI1r4cNppSC5Y/M0iQ2+p9hLhkzw==
X-Received: by 2002:a17:90b:4d84:b0:1f5:3aee:7999 with SMTP id
 oj4-20020a17090b4d8400b001f53aee7999mr35317922pjb.75.1660055017884;
        Tue, 09 Aug 2022 07:23:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 h190-20020a6253c7000000b0052d327f67b9sm10712518pfb.152.2022.08.09.07.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 07:23:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pcp: Add to USERADD_PACKAGES instead of override
Date: Tue,  9 Aug 2022 07:23:35 -0700
Message-Id: <20220809142335.1667725-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Aug 2022 14:23:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98182

Fixes https://github.com/openembedded/meta-openembedded/issues/590

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/pcp/pcp_5.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcp/pcp_5.3.6.bb b/meta-oe/recipes-support/pcp/pcp_5.3.6.bb
index 48d536e1d6..0543d77a78 100644
--- a/meta-oe/recipes-support/pcp/pcp_5.3.6.bb
+++ b/meta-oe/recipes-support/pcp/pcp_5.3.6.bb
@@ -34,7 +34,7 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --home ${localstatedir}/lib/pcp --no-create-home \
                        --user-group pcp"
 
-USERADD_PACKAGES = "${PN}-testsuite"
+USERADD_PACKAGES += "${PN}-testsuite"
 USERADD_PARAM:${PN}-testsuite = "--system --home ${localstatedir}/lib/pcp/testsuite --no-create-home \
                        --user-group pcpqa"
 
-- 
2.37.1


