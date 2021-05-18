Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.9115.1621347302424153382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 07:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fXuSDZdd;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so1611203pjb.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VPLEoFz3ETrrJPJyZiK9Ozpz2IETfMkk5i09BE47/OU=;
        b=fXuSDZddZnHg2m5qFLqzQlxX72ZdTdo7hMlR4N565JgI8FLLy+r8Wgq2tpHzRJPt9Z
         YfW82SbjJ9lpHo2YFX+jdNUs+HxZQ681MQmkLFbxymAfth/WuIdbUDg4evKmZCsZ3/rU
         ysTwnSDelIZXey5o+ckFDBexZexoH6/r7/BlL+LZVEN1CjBgKMEunvmi+J3Cc7P0yriu
         fV4oR1ldhcKZGTceIMIdJbzYKkmXMkGZ3gTBnwCYG9igfky3qjKV+XPd3C7HLhFeU/nx
         VLooA7csQY6UsejPp1rkxp38Affr+5T4Kt2EkFkK6xX0z3LKfbBG8j+OYrRuCiYGUajm
         SmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VPLEoFz3ETrrJPJyZiK9Ozpz2IETfMkk5i09BE47/OU=;
        b=GarBm/xZyUf6QQ+sW7sB9KeHPodNatlCO99O6vo8dKdkJPo+wrf8UeU6qfVcS1Akw9
         Ujx8mQ/TsXxJXC9HPMasKgNpvTum7d/SQLZOm/hb3l8gJIT7bv+N8hhOZeCWbVJ+aX2F
         JnSR+1vkOmJAwYV+gJK6p754NI2803DjQJZwagE02KxpaT6smo/lH6+ZKV1jdOJQQXSW
         nHFWRGsaqZoH26GnLb3RcfYbwwEgu3QroRCm/SVac0UkvcjZPsfkkkcEqFd/KSMMi0zA
         AsPuiEfkFp2LYSx3q0HdJ3vgXh9JN8s1/xLMzZsj88R7nwsGl7MeHy+mitJnRBew01fg
         Jtuw==
X-Gm-Message-State: AOAM530vZnE34+nKEJ4d6YMyvToWLVZwqCtQQJJhrzyCtINQxZ6ZceP0
	o9qc78jZpWi/SqRDHImqtyrDPRqTiqk=
X-Google-Smtp-Source: ABdhPJwPAaTGykqrpLWSFEmuhZ3Xbn8iMJDv3q+SuTofq8qqvPkFrOrpvlLDaqzZ30zATH9Rggf4YQ==
X-Received: by 2002:a17:902:d4c3:b029:ee:ae62:9fb7 with SMTP id o3-20020a170902d4c3b02900eeae629fb7mr4982218plg.8.1621347301893;
        Tue, 18 May 2021 07:15:01 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7050:e80a:30c5:274])
        by smtp.gmail.com with ESMTPSA id f5sm2103563pjp.37.2021.05.18.07.15.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 07:15:01 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 2/6] packagegroup-meta-webserver: remove nostromo from pkg grp
Date: Tue, 18 May 2021 07:14:53 -0700
Message-Id: <0026462c0c275ee6c390971f7fe4fbb995ae17cf.1621347202.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621347202.git.akuster808@gmail.com>
References: <cover.1621347202.git.akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
index f5d5debe11..d83a4a20b1 100644
--- a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
@@ -19,7 +19,7 @@ RDEPENDS_packagegroup-meta-webserver = "\
 "
 
 RDEPENDS_packagegroup-meta-webserver-http = "\
-    nginx monkey hiawatha nostromo apache-websocket \
+    nginx monkey hiawatha apache-websocket \
     apache2 sthttpd \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "cherokee", "", d)} \
     "
-- 
2.17.1

