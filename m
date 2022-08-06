Return-Path: <jbroadus@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295A6C25B06
	for <webhook@archiver.kernel.org>; Sat,  6 Aug 2022 07:41:23 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.1163.1659771682177049171
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 00:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aeBegIcl;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: jbroadus@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id z187so4005995pfb.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 00:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=TmVczL2FjO0QCOPxMsD7EGwp2hEgO3WCN1EizrpGgxk=;
        b=aeBegIcl9EfVo2LCvEBGy2aG4n/xRtyxF+YuVc/PZnbgkiL8ILHHRg0+/0f6yEbE/H
         0t0OFKWQn6udWD8U4KYZV3A8K/wRFbkSSRBPpCM5k1ZWxqq//Ir0WwGBrKK6to6nTS5J
         iREfpWkqgVi1FEUG6pSVtct4hIOZkK/3GYYkKgmygZYwAoTDVV22InCs2LZQhqY+/5v+
         2xm/hy0lA0S5wCaLnIUoG6ZfCdU02DhQCIputjdTg04Uf+TXwg/M1xXySoViGz8EEk9f
         HOG/qF54lt4fJSXhtwVEcZFbft7zo6Gn3wlQyQmwdz6klnXlTLCfdp+EfHr5KHIllMKl
         6dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=TmVczL2FjO0QCOPxMsD7EGwp2hEgO3WCN1EizrpGgxk=;
        b=ixPwPMkc6f70+HX5v3A4RMpX43ygyH1PhW9/QIsvv21rS860juCUVGojMf50gdh9ZL
         oD48mD2VgYXvA80X3Ot5FbXIFKZPfp3jHC0qKPW3CKY9jzRHwveDnJD5gPXQ5DCnyuhV
         Q95mUOLaI91e2vKXqfYH7fABCZPpHXJCPsB2LjolpMMNLRedkzGR74fzrr3zYydB+idJ
         iR//+6+AsBPYHVa4N5s+jBbVbyWO/+747GZvvMAeJXPy18wGFOPSvHBAiqfkJvB5InOI
         xfErXnFWgSxN7IDOycrX1eiH05PEA7jtF3pYgmKW/3V33BnQgk5WYKeLd+6RnMuxCUFF
         1GTA==
X-Gm-Message-State: ACgBeo2NX1NDANRBgW3Aab586gWaPGuwshxz8/Hy2UHJoMOmJEgy2KIe
	4DP9XJ+tweix2+YnqBtWsaEfc1wkERTfRg==
X-Google-Smtp-Source: 
 AA6agR55g/di+03lLT4GBVavjWrDzAamfM2dWNnWXLzDwnqZqdnD39IQ36Ox4jPAwu9J6pvhFgXIKw==
X-Received: by 2002:a63:2021:0:b0:41b:c2e5:f4ab with SMTP id
 g33-20020a632021000000b0041bc2e5f4abmr8466189pgg.496.1659771681314;
        Sat, 06 Aug 2022 00:41:21 -0700 (PDT)
Received: from hayduke.lan ([2601:602:9400:21ed:fb43:92ff:6c2c:f8e5])
        by smtp.gmail.com with ESMTPSA id
 v2-20020a17090a6b0200b001f559e00473sm787684pjj.43.2022.08.06.00.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 00:41:20 -0700 (PDT)
From: Jim Broadus <jbroadus@gmail.com>
X-Google-Original-From: Jim Broadus <jim@thruwave.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jim Broadus <jim@thruwave.com>
Subject: [meta-networking][PATCH] networkmanager: fix iptables and nft paths
Date: Sat,  6 Aug 2022 00:41:15 -0700
Message-Id: <20220806074115.651070-1-jim@thruwave.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Aug 2022 07:41:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98137

The NetworkManager meson.build is searching for iptables and nft by
passing absolute paths to meson's find_program. The result is that it
locates tools on the host machine when they exist at those locations. If
they don't, it uses default locations. This often works out, but in some
cases, such as when the host uses a merged usr scheme and the build
target does not, the paths will be incorrect and the tools won't be
found at runtime.

These could be PACKAGECONFIG options, but since they have fallback
values, completely disabling the use of either iptables or nft would
require patching the meson.build or setting a bogus location.

Note that this meson.build file follows the same pattern elsewhere, but
most cases are already covered by PACKAGECONFIG options.

Signed-off-by: Jim Broadus <jim@thruwave.com>
---
 .../networkmanager/networkmanager_1.38.0.bb                     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb
index c8fea5dbb..ebd25a8f8 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb
@@ -55,6 +55,8 @@ EXTRA_OEMESON = "\
     -Dconfig_dns_rc_manager_default=${NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT} \
     -Dconfig_dhcp_default=${NETWORKMANAGER_DHCP_DEFAULT} \
     -Ddhcpcanon=false \
+    -Diptables=${sbindir}/iptables \
+    -Dnft=${sbindir}/nft \
 "
 
 # stolen from https://github.com/void-linux/void-packages/blob/master/srcpkgs/NetworkManager/template
-- 
2.25.1


