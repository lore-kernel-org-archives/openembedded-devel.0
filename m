Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE9BC433F5
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:40 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.17029.1652622572717491235
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CV0henXW;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id ev18so1407966pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wIlftpwHT8LowsTVhlCg9HGrG1IfAtc/ZpZt/J+bgmA=;
        b=CV0henXWlz8woV4HCgnv0zpLxyXVn/aJdZdTlYs0zAoPNIo7spqvmvQQ+sVqSHUUwk
         /SQExx3YQqmnGCji8eJ9nfyBbDv8oGA+rXhnqzVcEmZbfY1Wg1OO/NQHhMajjUKMmhSh
         nvZ1siB1xq0YWqeP59q7lw5+NUca5QaRwotahQNsSTnIPz94YIWBlRKZ6QPHTmFiBdYl
         qC+jNaPlVegU47OYFw0zC6YqXb+lJJEQi2fcXVlxP/ND9Jwvb9BswzU8CZgB6W1xnsfu
         ME4s5zFqFLT3uUoZWQV6GA07moejTlx/h0RlrMsLjBhvR+zdK70JB9hgUHRylwHswx6P
         F/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wIlftpwHT8LowsTVhlCg9HGrG1IfAtc/ZpZt/J+bgmA=;
        b=Au2V4bllJ+i1yW+u/wulWmolju6mEmhvuJawASzNlzyRmjTWRsBucRxo1JcvDkSt+s
         4rDGmBqyK2fjlygpfAh2RyVk5Xgu7HpoZFZwlXFabNzels9tpkwHxOogbI2+uDKvRCk0
         5AAn2hdmb1/Jr03stVDHhlxlVCd5UNCo8nFmFeIMngv1730JDdhP9JpswRGSX9kTMdET
         ykU5q+eFjupKvvx29+gy2JuRJqKVuh8JiaAP1nyXPD/ppA9CDUyVRzWj36wg6kEXGYW8
         vFy04XcbFy1afTs055Q0EDjR03AjHvQWMIMO0qOUDTHWqeqY8owoBynaQZIFlwofn/2U
         eVZA==
X-Gm-Message-State: AOAM5311oBndIbZb4yFOXes/cmFY5s3L5xCXavghw5wdyGtG//ziol1P
	sqzo2scl2tqYSHxWvfDrvaxE8qlUUfGu3Q==
X-Google-Smtp-Source: 
 ABdhPJygxywfE5O2wqSOhiLyElsUqS29pLkSibmaql8eR5tnk5QLTBbRPeKXD9bY4DDREQqjeSdNdQ==
X-Received: by 2002:a17:902:ea0e:b0:15e:c0e4:cf15 with SMTP id
 s14-20020a170902ea0e00b0015ec0e4cf15mr13593434plg.63.1652622571946;
        Sun, 15 May 2022 06:49:31 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 04/22] ufw: Fix packaging errors found with ppc64
Date: Sun, 15 May 2022 06:49:04 -0700
Message-Id: 
 <1e6f95e7dadd469fa196b5995111a1d798b94140.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97101

From: Khem Raj <raj.khem@gmail.com>

default baselib in ppc64 is lib64 which catches this latent issue

ERROR: ufw-0.36.1-r0 do_package: QA Issue: ufw: Files/directories were installed but not shipped in any package:
  /usr/lib/ufw
  /usr/lib/ufw/ufw-init
  /usr/lib/ufw/ufw-init-functions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 42e6f16583e36857152ccb53b177e74f20b02667)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
index 6dca784bf4..b6a768e08a 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
@@ -63,7 +63,7 @@ INITSCRIPT_PARAMS = "defaults"
 FILES:${PN} += " \
                 ${sbindir}/* \
                 ${datadir}/ufw/* \
-                /lib/ufw/* \
+                ${nonarch_base_libdir}/ufw/* \
                 ${sysconfdir}/ufw/* \
                 ${sysconfdir}/default/ufw \
 "
-- 
2.25.1


