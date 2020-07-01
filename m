Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.10726.1593562049400871131
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lKi1fpPr;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id e18so10753594pgn.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ssINKPu0TBGsTVLIB62SeIEU9omUxp9e0iIrG7OB5Hk=;
        b=lKi1fpPrwD9vnSX7zfDB9cjvVIZvfbx8/ambZM6JOSpbt+GniTEsJhuisA473b3+SB
         H7gqoZqsz60xRSdo8431ML20AyrGv+gLlsmoffnWRqvBTMGmOW9zswHgu9nHksQhEL1s
         i0ruzJ6F31AHSeECayKSyMYz3N9k+ax4m3CUHNLFWVELbo42AfmwLxzMFWQgieXKmzXW
         +OBzu8ahKnXfQeXBZtGvX8iZruc832+YamjZsyfzBltxQdphQRMObzUtIqDl9JHBWff3
         +oLi+EkReT7ig3YrppLb6U4WdmpsZwo27WdknQxnHpuhEVWE9WlNtSp50yxexX0SDgUZ
         ObbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ssINKPu0TBGsTVLIB62SeIEU9omUxp9e0iIrG7OB5Hk=;
        b=sO5vvyRh8Xislvc7MzHVuT2vSzNzzzSlcvTZwML+0j7Elov7cB6qzqqmWXyO6C1APc
         ENTOoWCKYy7mtIADc9cmr8rEBKETOwqc8QeuYMvCVNN1sl9JS5XWetcpVbj6bG4NzcYV
         IOf2Uhf5i2aBO2VHGEHmLSr+du/tes/2FywaUA5NeI75EDm5QxFeimT54kTsUb3PnpJb
         pz4pAqrTFbouf9mMuZqCPHibAtmkDckGMfnhoBdVsGI/EBZfi0c+/oCFzT7Ahir4rzj8
         GaS5A47S5G/3+yITnAZdLbPKEpgLJTVFZXpsDV4Q4Xp8csksP2cBqjabYiV9+w1EN7Xg
         G6+g==
X-Gm-Message-State: AOAM531TorzfkhcSIZ2l/S8gJjfezRcSxaOfySUPn7dp6NY1lMEbYQUh
	IiGzwoawTb+S+C3eeAGvAC+qTqNv4+4=
X-Google-Smtp-Source: ABdhPJzy4VYzXO9mIaP8I81066gIT0WkZIyUDmasMTOpuTHsVnXCalhjyWkaLnqlvJVH4xxyaWNo/w==
X-Received: by 2002:a62:fc15:: with SMTP id e21mr21093697pfh.167.1593562048760;
        Tue, 30 Jun 2020 17:07:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:28 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 06/32] zile: properly append PACKAGECONFIG
Date: Tue, 30 Jun 2020 17:06:51 -0700
Message-Id: <d923858270ff725122f3025043f357671e6cf363.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Konrad Weihmann <kweihmann@outlook.com>

As ??= assignment will be overwritten by += in any case,
one can't define a default of PACKAGECONFIG in this recipe.
Using _append instead mitigates chances of accidental overwriting
the default

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1a1194a92bca9276676679588a4cda9ff31713ee)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/zile/zile_2.4.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/zile/zile_2.4.14.bb b/meta-oe/recipes-support/zile/zile_2.4.14.bb
index 3b846c1511..acd491498e 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.14.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.14.bb
@@ -20,6 +20,6 @@ do_install_append() {
 }
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
+PACKAGECONFIG_append = " ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
 
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
-- 
2.17.1

