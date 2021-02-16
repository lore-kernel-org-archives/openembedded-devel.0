Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.2366.1613440711890293464
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 17:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uiTS/DuN;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id z7so4673905plk.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 17:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=9N82Tz4toSi9H3b03pSn3brxyzUmx6uuRx+LYrHoZ1I=;
        b=uiTS/DuNvO0h6LJVA92jTwrv9bUQLt0aHkw4VAjK7hA+YWni9oblEYkRTQfD+BqKYi
         boamR0dG1P1togIHQnaFBdxv5sSeicK8C3zYdNkUDCHu5BF4PjblL/ho52GloYDHZqQr
         a2rkqLTTkD6Sc4qLDA9RC+1Wqx8CC4RQyP4rpSklqAAY7ZTQjbG0jhlVWKnzdRrPXX6H
         oGTyfNGGNN2EysyEihIL+wGvudaM+6N7msSfftDYuOvFBFzUhAgxHrN/q5MSjD7UyfeF
         lkA7jKggbyuJbRW9fJMrzu8+u7lWxSnA6Eyz2VsjlYH6LCDdxuDNcLzLK4+UhE8TgenD
         RpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=9N82Tz4toSi9H3b03pSn3brxyzUmx6uuRx+LYrHoZ1I=;
        b=Z+eqv/76R5+ewxUakxeM3hzJhkVhqciWX1uAGmiyy7WR4cAO/QaakJ/WL+jxXw1ibc
         z/epCFucCmYG99FTRJIloZRYBl7H2XeYTFBq/KtWCO5Dg2pgvYlDEt8Tj5o5uBkOo/Fp
         JiHwV7x4BiVGP4F6L3PHRjBfHnKHvlr0tBJG/zYfPkPA/ghIvl23LJ9/n8P1U62DUQbD
         svdzmj1x5oKZHdarc5JBiVFJaaV5PUOrIUwA4IHV0fvi+qfcXhOmIzg9Qdnwkm5aWdFY
         KOlxPRfgHKpsZa93/NySRetdEfrHMKuDu3KvGUICfaSQ6BlTr+C7GXXkcbvNPB/JkTbC
         aS/w==
X-Gm-Message-State: AOAM533oobZ2rVGm73Qkal2Jcx4dNbYfhwhsSnZlPG6cEhjz1xqVsaqG
	0sn+JcAPnnsc7VyrXdtadb2w5zdQ/lNiGQ==
X-Google-Smtp-Source: ABdhPJzvuOwN1kt3oRZkZ626DLV53ALq66WeTEYX+sdqk2zYimXeaIAMYVuR/bCunQ7cjBPpYX1f+A==
X-Received: by 2002:a17:90a:420c:: with SMTP id o12mr1723803pjg.193.1613440711321;
        Mon, 15 Feb 2021 17:58:31 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id c24sm19756159pfo.209.2021.02.15.17.58.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 17:58:31 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 09/11] celt051: update SRC_URI
Date: Mon, 15 Feb 2021 17:58:17 -0800
Message-Id: <e43045dd0529ba275890994981f3bca88382a9a0.1613440394.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613440394.git.akuster808@gmail.com>
References: <cover.1613440394.git.akuster808@gmail.com>

From: "changqing.li@windriver.com" <changqing.li@windriver.com>

original SRC_URI is not valid now, offical CELT repository
moved to gitlab

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5450c958bf66afd560fd8dff5b432ea71f10165c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 1de0f4c33b92b9bbd885044df505154c177db59e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/celt051/celt051_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/meta-networking/recipes-support/celt051/celt051_git.bb
index 12b9124f74..c3e4cbbe6d 100644
--- a/meta-networking/recipes-support/celt051/celt051_git.bb
+++ b/meta-networking/recipes-support/celt051/celt051_git.bb
@@ -16,7 +16,7 @@ PV = "0.5.1.3+git${SRCPV}"
 
 SRCREV = "5555aae843f57241d005e330b9cb65602d56db0f"
 
-SRC_URI = "git://git.xiph.org/celt.git;branch=compat-v0.5.1;protocol=https \
+SRC_URI = "git://gitlab.xiph.org/xiph/celt.git;branch=compat-v0.5.1;protocol=https \
            file://0001-configure.ac-make-tools-support-optional.patch \
            file://0001-tests-Include-entcode.c-into-test-sources-to-provide.patch \
            "
-- 
2.17.1

