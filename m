Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A7DC433FE
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 07:58:55 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.7225.1645948734695997636
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 23:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eRXEFXss;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id z15so8358881pfe.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 23:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yqIydSTnIiZye1hFeZkJEr9br187xQwt4IIuYKh9iTk=;
        b=eRXEFXssskdUo9zgXNRklganELl1yXg2iB8xQY1EydTPpigNrgSMzuXEi8FNyNAdRT
         wOw4efxsOT6l/6jkEI65+aDjzdGkrgTWzW6gOzZpWgnByOLrSGOMmxlioBOgXp/Htf34
         KJ6ak3VPx8LDdINHtsEIvcEdPTKxQubB7nirYJxNSJecFAKQOrgpa9/l1cM9b7Tq/Iyw
         O+UMTL/UOuFS4CS9qKsb6jJxhrsRyAnR/4C+p6rOxZeLlESUgQMxCZuBa34Qjb6jjbAG
         nfr7x62hj/MO3wwZ1sU2cujwfxoRweIRwF10r5OjeMg28Pl0U0ApcnvF0bRZH0qHJkis
         9RQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yqIydSTnIiZye1hFeZkJEr9br187xQwt4IIuYKh9iTk=;
        b=Q8XmI2mL6Xdizg0PMvV1evcH34G8aD6TLN4T9jBHcJNg6CMImznlsCCqTLG5YlcNYV
         aS9N1Fk/lkkuGil3dYxnzai8MSIIUMgSqikGXN6ea1n/5SdHiNCUBixG4KAmFAhgMWAA
         ik2SeSArPYVBBylhrXdGDnEHEM1VrOTesXkB4T4P08YRFY9o1/CKgnELJvdKjJFyZ8Lx
         WTcyWCUJdE89MMUIpUrj6Y8lFhqdUF19+WoQN5BGMcvamJKsyA9h1R8kjODKSupAferU
         64vAsPuMwcGiba/UfUE0AFptGJ6fmsbr8SGBIOviheMiK9GGkeiNiYOVrY5o3HhQnXkv
         cTQA==
X-Gm-Message-State: AOAM533NUfmCWrHJ4vu7uMJLblAbOa/1rOvX8v4cEI0+pvi1cHo5XNtl
	XAZTd7WetH0HGvV+iDcTp18Ks03wG1lwcA==
X-Google-Smtp-Source: 
 ABdhPJwKiKGI+VH7Gp/guV5Xho0/xa8dI8yo5th7EBb+XVEQruIACWzbxqlANJMpUkiB9YZD0SGndw==
X-Received: by 2002:a63:e4e:0:b0:372:f055:5e12 with SMTP id
 14-20020a630e4e000000b00372f0555e12mr12931881pgo.485.1645948734071;
        Sat, 26 Feb 2022 23:58:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 a22-20020a056a000c9600b004f10137a096sm9012845pfv.50.2022.02.26.23.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 23:58:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] guider: Set PYPA_WHEEL
Date: Sat, 26 Feb 2022 23:58:47 -0800
Message-Id: <20220227075848.610467-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227075848.610467-1-raj.khem@gmail.com>
References: <20220227075848.610467-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Feb 2022 07:58:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95558

Fixes build with wheels

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/guider/guider_3.9.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
index 47d872a400..3c3f069df2 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
@@ -14,6 +14,7 @@ SRCREV = "a502cd93b13235b7539557a91328de00b7c51bc3"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
+PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-3.9.8-*.whl"
 
 RDEPENDS:${PN} = "python3 python3-core \
         python3-ctypes python3-shell python3-json"
-- 
2.35.1


