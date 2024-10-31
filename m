Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAE1D767F1
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 17:13:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.17896.1730394812922980638
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 10:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tTGB3OhC;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d447de11dso998698f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 10:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1730394811; x=1730999611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5dvOErdL3DaEONgJC3YedglVuDzk3B26HLeS1MTnL8=;
        b=tTGB3OhC26gKpH7fR9nDtUFaDGVkxDBoHhuXT7JN2AAZqeKfQFf1o30dWG0Ch5VlHu
         YdoH6z+9JhmZ70VqHWPmsuLDL5JD8ZBJzNfkQVLS6qZQkDjkask1ESdSVDtUz+z0u/gG
         RIGqlXPmw+YdOtVC0zNCljZmHyzavlds760zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730394811; x=1730999611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5dvOErdL3DaEONgJC3YedglVuDzk3B26HLeS1MTnL8=;
        b=sMR/u9445Yr3kx8dCnwLFqn/xRIXlr5eee7FglLhJKcXHNpj8tXJEDYDaoGkW+br1A
         ueWcw9yRuFBnfkf6ceVUaZzUBNabU/OGB+AELjKtuT31GgPbgoqAdOwKA5TZfdEp8TS1
         +K2n/Sn+f8BFz6CdKp6uZBqOZJJftcLe+shV2ULkvTRFL83scQ69hNGauT7uxvGzBqzI
         oDGVWNqczaSFazetQ/hAzQtXEmAgaq8KR+KtE1SZ3RiwFGJMyxjN/vj2ptMDJenJIOAE
         9+LkmBhVQEOnaCm74acifvwf2VJjBFE1tZm+rfA8FgNFWz9waxXS0EkiHlMhcsVAok/6
         yf2g==
X-Gm-Message-State: AOJu0YzGL6GOlkTi7QyYBH79OzsQl1KMSCdMk47xC4nZnq5UY7bEnMgB
	dHphkqjNRKhZXBQH+dfL7tWDg5CV4VZL5WoYw6iyAQ+tSkBl9BhkMQDDz/eT4aF5zwIbw5CpevZ
	2
X-Google-Smtp-Source: AGHT+IHa18BuIeTZ1JtPKeaX6baR3XHVzWZrIffmVENGsmOKSw1vxt3aT/p0fxuzyGy4yL4PJndydA==
X-Received: by 2002:a05:6000:2805:b0:37d:4657:ea7d with SMTP id ffacd0b85a97d-381bea26687mr2259322f8f.49.1730394811015;
        Thu, 31 Oct 2024 10:13:31 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a02-8440-3241-0577-1e00-34e7-c1cc-8379.rev.sfr.net. [2a02:8440:3241:577:1e00:34e7:c1cc:8379])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7b80sm2749135f8f.10.2024.10.31.10.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 10:13:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-filesystems][PATCH] zfs: fix host-related reproducibility
Date: Thu, 31 Oct 2024 18:13:16 +0100
Message-Id: <20241031171316.1996877-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 17:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113373

From: Yoann Congal <yoann.congal@smile.fr>

The zfs package content varies depending the host distro.
To fix this, force target distribution ("vendor") to Debian to match
default values for things like: NFS server service name, bash completion
path, configuration files, ...
The Debian values do match the OpenEmbedded ones.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
That should fix https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-filesystems/oe-reproducible-20241027-tsrqdzze/packages/diff-html
---
 meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
index 504fe28923..1b41deb099 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
@@ -38,6 +38,12 @@ EXTRA_OECONF:append = " \
     --without-dracutdir --enable-linux-builtin \
 "
 
+# Reproducibility: Force target distribution ("vendor") to Debian to match
+# default values for things like: NFS server service name, bash completion
+# path, configuration files, ...
+# The Debian values do match the OpenEmbedded ones.
+EXTRA_OECONF:append = " --with-vendor=debian"
+
 EXTRA_OEMAKE:append = " \
     INSTALL_MOD_PATH=${D}${root_prefix} \
 "

