Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051BDC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 04:08:34 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.22752.1646626113613940427
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 20:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hfGj0vWn;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id p17so12645445plo.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 20:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G67VVRFwDexTO0xFQEoEzsvp8pMeRFp4Yu+Yw/0vkG0=;
        b=hfGj0vWn94YXi+KXoU5dHq15RPxxdV3DaKWNhqs7QkMYgS+Ntm2sBrnXBQj0a+B3IG
         4BA0+ZPWMwcJQYiXSlBFoHxRj3jOCGpcseNdfXI69lKmUoGGbZ3yK8tX9CBEWbK2giwP
         IOqXnUJTDY1YYsdBV0Z7x+D5sSYE0Ckmcn8V40Y6NIsY+cb9ZEQIj19IbI16NRMtPBtr
         8rvCn1pdGerpyBw2GG+zo5tPtUdlzbTXHlMarPOc78EWaTNVqgSNyfG7NMoMSTUUJ0PY
         U7MrE9MoWlJ4b2+ETupD9XhTfOtEf7piQrxKMePJ93CytCONxlH2SWD69D1abjnHhitr
         9gLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G67VVRFwDexTO0xFQEoEzsvp8pMeRFp4Yu+Yw/0vkG0=;
        b=b8ReuJ3IrCwfxcy9lR1nJlJuFdiM91ZS040mtn9DuPjeF6wHWRXwsUEdGpcX2yYEEr
         O4kDeLDLtFd0CuJubeccVE+DD48a2tq4q6W+Ljz+eSg5UwqLkNis2i0S6cqfWGlNSU5N
         2rBlmzTsfHAlLxb4jRhcbVH3wj5soUF09OEDC6xfcv+wMoK/H0KiEH82EQycNFmvnhRY
         okv+rO9dIWgJiS7gIWaoHSt+4FsTNqF0mD2jBFmZpzYbqEmm+9RFpNI0kHZiaXXe0j8D
         mMSMT/eSdDgwDeo5KrNX2eiKnR13lVZUoVyKdxY9gF8K1GCAFC15gXZOKUkjnr5qXdoI
         qfVQ==
X-Gm-Message-State: AOAM5338+9YFZkLjsPvXdgQYSSUJ+x32YJjnEZ334kDcZxcbbc2BGDBI
	H6BqV8c0v7I3hymUJj0NO1wjdpdXFuXq3w==
X-Google-Smtp-Source: 
 ABdhPJycl8lTpXiPWyKQ3iAJuL3r5ZUI+lR5hdsk7UVE3U3m0B0K3KRKzrIwgib+3ywZ1ehxVzcvdQ==
X-Received: by 2002:a17:90b:344d:b0:1be:f346:e22b with SMTP id
 lj13-20020a17090b344d00b001bef346e22bmr10815698pjb.14.1646626112897;
        Sun, 06 Mar 2022 20:08:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 u15-20020a056a00124f00b004f67314db4dsm13430625pfi.104.2022.03.06.20.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 20:08:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fbida: Fix build when x11 is not enabled in distro
 features
Date: Sun,  6 Mar 2022 20:08:30 -0800
Message-Id: <20220307040830.3567054-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 04:08:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95831

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/fbida/fbida_2.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb b/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
index c1ef3430c2..bc6f021e6b 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
@@ -39,6 +39,8 @@ PACKAGECONFIG[egl] = ",,"
 
 EXTRA_OEMAKE += ""${@bb.utils.contains('PACKAGECONFIG', 'egl', 'HAVE_CAIRO_GL=yes', 'HAVE_CAIRO_GL=no', d)}""
 
+CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
+
 do_compile() {
     sed -i -e 's# fbgs# \$(srcdir)/fbgs#; s#-Ijpeg#-I\$(srcdir)/jpeg#; s# jpeg/# \$(srcdir)/jpeg/#' ${S}/GNUmakefile
     sed -i -e 's:/sbin/ldconfig:echo x:' ${S}/mk/Autoconf.mk
-- 
2.35.1


