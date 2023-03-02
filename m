Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730C7C7EE33
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 08:31:28 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.10285.1677745880488950054
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 00:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oFtYQbaO;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id n6so15396322plf.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 00:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=crBQyNXHapN9E9qEeBM2NqSHrGuyKRm09JwVxfZ+q7A=;
        b=oFtYQbaOQT2lB0SyXzpqZgHf2LIhx9sst8/VH3W3fkOAvpxFBbBqvaZAlfStmc2rVP
         likdX4buYAwqC8JXkJGdjVC1nVi7o8rq4dQ1UuwMf2rhk0vYD6FpXB84kHv18LYZTeYl
         wV1hF7B1r5ha/RXeVpav9J9B7CH7TC5jih6DZaQRAyD+WabFZ9nDQcok2pHgWLJdfAc7
         N1Qds42vo4gBUGZndXmyOECjMPLTyA1aOHMMn10d8gUTY8CZTFHEdm1mViceTlblkvbO
         /sZlBGKBqXHPyrhVQXuXTKEp0HIjC69ILeqG238TTdQT4mKzffrCtteFb+lmqhbKQYm+
         5/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crBQyNXHapN9E9qEeBM2NqSHrGuyKRm09JwVxfZ+q7A=;
        b=PoKcwuGD3IG1mZuQJmyDRolnRjbUnzcDQbRMZXXBI6gpLqoJvZYFiJErsZggszVwqm
         0bSI6LVRb59ehzbb9jWsRHqvAkqznurpzB/B+72v4lPgxl4T/c0dfNcaDeiYb2aGmFC1
         oQzQOT4VcXUKvVv5OX2hRiAss7dOLnNnio9B6TZfXanrO2q7ShtBAsF6/Faaev5qkMBc
         pZXjqgX1X2SPO4rBqqETUzqYOcf0jKUl7LtzA9TFbMQ3FyTQ6OPdvIJu9A80JmEVBjJ+
         ahGngdxsTsU/pHkzuI7sP3mHCQD+beTlkXcw3PRsClGSlVLQC3jzHDEokLk3XQYHTMYE
         rgEQ==
X-Gm-Message-State: AO0yUKXAqhQRBhZBVQ2ZCucdpli9abzSxx9v+MT8iGMUsJEiHAFJ6qr+
	hoZfYyMf8+tpgeQj7drB/Lk2mI0Scrg=
X-Google-Smtp-Source: AK7set/cu7BlgMjGP48VK42jI2cbaKFWeUbKu31wwDxsirnXFJk1AB8wOSZJv5HDg29vIBZsetKtOA==
X-Received: by 2002:a17:903:283:b0:19c:d309:4612 with SMTP id j3-20020a170903028300b0019cd3094612mr10553405plr.6.1677745879279;
        Thu, 02 Mar 2023 00:31:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d70d00b0019aeddce6casm9670994ply.205.2023.03.02.00.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 00:31:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/5] pkcs11-helper: Update to latest tip of trunk
Date: Thu,  2 Mar 2023 00:31:12 -0800
Message-Id: <20230302083116.1332448-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 08:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101327

This helps fixing build with clang16

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.29.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.29.0.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.29.0.bb
index a34a4b9140..d17ac1e7e1 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.29.0.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.29.0.bb
@@ -18,8 +18,9 @@ LIC_FILES_CHKSUM = " \
 SRC_URI = "git://github.com/OpenSC/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-# v1.27
-SRCREV = "2306f896c2f3c147792300155316fd65825aabad"
+# master
+SRCREV = "f23911037d9790a3f3a3447a78d31a6362358e21"
+PV .= "+1.30.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "pkcs11-helper-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.2


