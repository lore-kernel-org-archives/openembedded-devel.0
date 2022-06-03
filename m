Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1CDCCA480
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:45 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.2397.1654283971622849270
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oMxWub5r;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id gd1so8047066pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cxsup3dQO3hJ5AQpuleqim5bDu7/fffR9QWGt8CMFcU=;
        b=oMxWub5r/CLSZoBgd5Xth7Z/Y3VdaKn42fHwi77wBd++abaUttb8sH0u+3bGE4hsYq
         huWpk1/pJ21YmummtbYH2sdEywa0wwPUQIk4qIBo8LaxBDK4Efd0K6DxL82BAi/bfvH/
         utXre84liblAIskBsrJyCeV/9GAYNvIBnQfrpC+1+oy8XWeHey/SdrDfrgne2iVMG4r6
         hqA0vWeG69EZAfXnu4THFvA36B/ZniuvKlzBkDZExY5evD+Ndk2KVenCocFG4Ty0vsnG
         sbGeQQ6Xj8VaNNCdPoVVUEC/0fIj6LdujzxBJeKfn/GCF4u0vcKm7af2kZnTNV3BU3W9
         kmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cxsup3dQO3hJ5AQpuleqim5bDu7/fffR9QWGt8CMFcU=;
        b=6d0YMCQ+OWYuzUsVxuD3Z+QIGQDnOTbGGOYLiuDQQezQOIJN2HT4BR4Y4BEUTahNsD
         /vubc8LHJVxRZQ4l3UQFstY8si+e20a3gji2NMam6LH2RC+zeMNfb/xc+HixXxe/ohch
         7E5pBVG7Mo96ns/aecJzQEaG4FZIsYImSoLs30a1jHJJcOKxTWBftqPI4h5BznJFl4zM
         cpEgrRrsVT/bfC00Qmbxl7Hk0St5fYJ9IV0XiULZAHMpRC63VT3XoMIV/kcUgLjIZLKy
         Xqgs3uvTB5nJXLt+NK5tgGTuxHeAyqfORejhotdcGgUh4S0kDMhryXyVABIidIUJAY2P
         O99A==
X-Gm-Message-State: AOAM5335jA4EEzl5HEL1dGXDkxFPFV5TZBCFa2rU6XjreNSGB0J16Zgf
	eg79ytdwtW51SZD0PmYaG7h9w7zEnfg=
X-Google-Smtp-Source: 
 ABdhPJw+slUve1r32L0GWQnv3tjGNhaSaQG/JiURh8AfMF6fEnU6+th9spP7+InOePL1XkNgK36ztQ==
X-Received: by 2002:a17:90b:4c44:b0:1e0:2400:1c8a with SMTP id
 np4-20020a17090b4c4400b001e024001c8amr47276038pjb.232.1654283981013;
        Fri, 03 Jun 2022 12:19:41 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 13/20] graphviz: rrecommends on liberation-fonts
Date: Fri,  3 Jun 2022 12:17:12 -0700
Message-Id: 
 <db3a802f8e869e284c199bf721e85923a109feee.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97402

From: Kai Kang <kai.kang@windriver.com>

There will be tofos in output pictures without any font, so make
graphviz rrecommends on liberation-fonts.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0e036cb1bc0c272b27cbd7e42eacbae48edc685e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
index a9258e979a..aa597cd8e4 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
@@ -114,4 +114,6 @@ INSANE_SKIP:${PN}-python = "dev-so"
 
 FILES_SOLIBSDEV:append = " ${libdir}/graphviz/lib*${SOLIBSDEV}"
 
+RRECOMMENDS:${PN} = "liberation-fonts"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


