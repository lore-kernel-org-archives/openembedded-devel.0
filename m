Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EF5C61DA7
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:36 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.44967.1674653489724429460
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KSiRMPKn;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id j10-20020a4aa64a000000b004f9b746ee29so3156608oom.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AW/8H+l+Nndz61G3jXQXx01s1WSdgvuAKdESOnjfWzM=;
        b=KSiRMPKnstrid1GSnfr+OSi69ei3wTihfDAXeYmt+yRzsR33CVJSKWBew7glNI4wrO
         jq+4HawpRwJLOX+de1hh6SolQY41jCQKNfMxwTf+ml85gXxFgiU0SM971QzvdQfEM5PU
         5+RftWfb7uDtwl+azd9/FRaS1zCaFReFDi/C9vzafYsg0SEnTZ2mZ1l+Ui+Om05GZ2UI
         rM0dWScS+IIaYuP6nC7XNXOpRnt2WU3FZD5F5eLZleBm+nRwiAT3Oc2P0JM/4w9Karkm
         qARfyPHDc1NjnIbVV5Pd9spxHdtcVjfgPE7RPJFnW9hRf4Yhcy8na3Yy0LcMSoAcCYdG
         Vv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AW/8H+l+Nndz61G3jXQXx01s1WSdgvuAKdESOnjfWzM=;
        b=bVujbXY1jPgV7L0EHFxdcUoXIwRAthwPra6RroKT75DrRZ3cxf5XVl3At8Mv0sc55X
         B0A+eQQes2pEFFKQTMPS4R7FP0u4A5/2IAolafB8o/RL8ZTeRQJG6r+ldAkYeCYPy3SX
         OqEQoQjTfEy6Eu+H76Zwe+iI+WIVL2blsvUKAzLYn4nPF9rLAi2C9PMyeq47T1/LhXUK
         z+uWlobvxJX1GUzZ2B1v6l9De2A3w6zy4RX8y2xumjN75EMrHdd1Yv4d10ULkaFzeElx
         E8p6RgDO4ZcH0VNWkL7VC1V78fEs+PBAQUVuEUHpSRWsAaeuOhWWO5CsVKyr8RZ+T68u
         v+sw==
X-Gm-Message-State: AO0yUKUFuUzUcX+klAEIZ+oAsvT0GTmaDwLAN6JfvVkAvEm2WHOuU+uM
	h6vqYebOtqlJ0mP7/Lp6l6sKWG0APm4=
X-Google-Smtp-Source: AK7set/Gn7UAwDEj49+4Sn8IeMQS1Rv3r6J2jjkoKnLyjU6c9VrN2aaICATWgVxbBNorgQH4ovb0bQ==
X-Received: by 2002:a4a:dc49:0:b0:511:db0b:c453 with SMTP id q9-20020a4adc49000000b00511db0bc453mr512059oov.8.1674653488903;
        Wed, 25 Jan 2023 05:31:28 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 02/41] nss: fix SRC_URI
Date: Wed, 25 Jan 2023 08:30:44 -0500
Message-Id: <ac9ad1d512ef49cf7195e08cf61d11e11b1080e9.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100737

From: Martin Jansa <martin.jansa@gmail.com>

* http://ftp.mozilla.org/pub/mozilla.org now returns 404, but the SRC_URI still works without
  "mozilla.org" directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 74f131ffe8d33ac4fe8225d8102eddc31aef3e90)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.74.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index 333bbdfef0..591b12a917 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
 
 VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '_RTM'}"
 
-SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
+SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
            file://nss.pc.in \
            file://0001-nss-fix-support-cross-compiling.patch \
            file://nss-no-rpath-for-cross-compiling.patch \
-- 
2.25.1


