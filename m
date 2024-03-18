Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5525CC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:11:56 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.52454.1710785508190356149
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 11:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZCLMPONW;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4140a259a54so13812665e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 11:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710785506; x=1711390306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jqy/CSKCIx+iY5qTXgbzbDdExjuKZ/lB3L3seOW8SCs=;
        b=ZCLMPONWuZO18BZtR+UFndGSmSKWu2a9JMAGkyoAY/7DZfijWTDNoigkvIYd+zKc90
         LVVVJZ7qJ4q0z+NpAcRzLdRP8HsKvWuIkQQDUBlYHqKDeJG+xS63I+Z21Bjefnp0yERQ
         513QVzVtOWHmaoyLiMHEfJtrBXkB++oJHccev7PtkEqlfJgeJn/6DURR45SexkyostK+
         C6yz9SsQBssHB17v0UsiIlzTb4pB6HRG1PjiLa0L1atjSAs7Ve8ayVUzWpaIkSPq1+ea
         TAxsSG27DnbxfjDI90b5zuH8pb8d6XwFfelfZxtDcFHTuzx9vTshQNT0g7Em04amewI2
         pFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710785506; x=1711390306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqy/CSKCIx+iY5qTXgbzbDdExjuKZ/lB3L3seOW8SCs=;
        b=PR8APf6ncmrqD1BDzSJSfRgQFZZu19k/ycvAFBAUokQQmxU1vr2w9xq6r2THc+o2kp
         hkZ1cqT6fweHR1Y5OKJW/ItN7LkdIymxlI2gY1O+K5L6vYAVV81vIq1UGWip4iMYwGm4
         MlN94isKV0QhoU5Vqb1PZKEPwBfw508w120eyizujWX8qF8UbVFe8dVvL9U4rSULQ24B
         xJ6t1h2L8IM4ex6tsvlC15CTfZo/dH2XpxGV9fyzQhoK3wjQtPNHfSvGVoCLUc6BcwWC
         I3j8TVOEL5LFOvBgMS0hUiUNR+6HFr5UbW82HCjF1dWou3iSrcv6qOxx596w5QBqSWxQ
         huwQ==
X-Gm-Message-State: AOJu0Ywz+W5xwtcSA4F/8AJylW7Y5g4A7cPXce2oxLvPzmSdZHO9hQQB
	rjqbcXh4hfS8IoTdYnDOz6nl3797wT7zq1n7HKoyrHAIKHJXror0bD5MGX8U
X-Google-Smtp-Source: AGHT+IHvH+D5EdYWjCQlhJbacnQXa9BSL0ZWB9qFyKlUFn+9gg8OeufqpmbmAoubRaXTmF3ZVAee/w==
X-Received: by 2002:a05:600c:4f8a:b0:414:239:40cc with SMTP id n10-20020a05600c4f8a00b00414023940ccmr7707096wmq.12.1710785505941;
        Mon, 18 Mar 2024 11:11:45 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id u19-20020a05600c19d300b004101f27737asm18636855wmq.29.2024.03.18.11.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:11:45 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH v1] ostree: Upgrade 2024.4 -> 2024.5
Date: Mon, 18 Mar 2024 18:11:19 +0000
Message-ID: <20240318181118.764056-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 18:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109409

$ git --no-pager log --oneline v2023.8...v2024.1
f3b66e8c (tag: v2024.5) Release 2024.5
756e2dad Merge pull request #3214 from cgwalters/checkout-overwrite-force
bb6dfd3a checkout: Always replace existing content in overlay mode
c314eaa9 Merge pull request #3213 from rborn-tx/fix-early-prune
4efb44f3 deploy: Ensure boot directory is open before accessing it
223a1af4 Merge pull request #3208 from HuijingHei/split-whitespace
abc7d5b9 kargs: parse spaces in kargs input and keep quotes
d95c2f8d Merge pull request #3206 from cgwalters/enable-new-naming
2fb7a048 sysroot: Turn on bootloader-naming-2 by default
f1e663bd Merge pull request #3205 from cgwalters/fix-grub-probing
e47b3709 bootloader/grub2: Don't do anything if we have static configs
b4a1e383 Merge pull request #3204 from cgwalters/quiet-config-load
1a54d94f Merge pull request #3203 from dbnicholson/version-sigpipe
bf811629 otcore: Drop config load print
422a2887 main: Ignore SIGPIPE when printing version
1b3ffe54 Merge pull request #3196 from cgwalters/fix-sepolicy-public
3ae7118e Merge pull request #3199 from travier/docs-fix
a63f9516 docs: Cleanup title for historical OSTree README
4ae50658 docs: Move SPDX identifiers under first title
cdb4cad4 Merge pull request #3197 from cgwalters/release
084e027d sepolicy: Fix publicity mismatch for ostree_sepolicy_host_enabled
14a5746d Post-release version bump

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v1: change sha256sum which was only local

 .../ostree/{ostree_2024.4.bb => ostree_2024.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2024.4.bb => ostree_2024.5.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.4.bb b/meta-oe/recipes-extended/ostree/ostree_2024.5.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2024.4.bb
rename to meta-oe/recipes-extended/ostree/ostree_2024.5.bb
index b01337c94..0e098109c 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.4.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.5.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "63c9190821333ac7373e0d923e4c2766b25ebdcfdf4efb44cb5928c6589d9fcb"
+SRC_URI[sha256sum] = "bc12d8493db64152093ee5be77cf62a29cc67a4a9e430dc987103e78aada4a6f"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.44.0


