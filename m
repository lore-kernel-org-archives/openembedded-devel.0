Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544F9C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 05:14:26 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.35867.1681276459136950566
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Apr 2023 22:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AZCgmvfo;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id q23so16328938ejz.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 22:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681276457; x=1683868457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RlLwTxKo+Xgu/pIc1B8jguLMmuPehyQO3J/lI1zEOs4=;
        b=AZCgmvfodBHjwVW1ga331FWeKqjRwOrUAZCVJgMzN2dmkLFwBYyHBCHeNBja0dhNO8
         px10Rfdy2Xk6NDw1KTMyNvDzR0cUiWpD3T5DOuU3vgM+mdqEehR8tUpXRzLmrQwaewTK
         3gaST2ub7NZrD18qyijo6DNY2Vu6/kNWDeUI+d4l5p0tQ3fv5s4tbEJujvoiHf8zDbyo
         AtW6twV2NGXQuHIcuvqf7B1TV1OHXsCwSHXsykQqA6zR+rDRinAV3trmSBLnYV/AUGHg
         0nHTCMavf1tqZeoaNrUJ2QWDeZe817uqut313N1QwxCukyEDjDvKmoOAfJvnxW3lx3Nl
         ZCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681276457; x=1683868457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlLwTxKo+Xgu/pIc1B8jguLMmuPehyQO3J/lI1zEOs4=;
        b=6J8mbybaoyP3rZfhApjNopabjyflCAZ0FOroQOmzbOaA090kM0mNSuAPDg9KOYJN9d
         PCnYWiR10aHmpmx9QEF6auQpDxjz4rbWjbzBK1yJF55rpmidGlHM3t+XDqpHVcKjaA2A
         7gOVqAyHveUS7DdXPX81J+4+OumQ6YbB7TOL0SUPsMZ0F2nTYTQrltCRMCixMvEYYAGt
         78HdCu7ueL3RHcyLziKN+Qa+9Ht6FOJwOtVlLiHVYEnE+BE+skI41QvDzWzGElNg4xx7
         BDznG07Yn9CZ4ogMCr9qFCEqOeyG5gRP0NmgRNP6ODMR95xE54qL4uxANdgYvnR8+Uc7
         3x6g==
X-Gm-Message-State: AAQBX9f56fjSPxd/mOb9dCsWbUWEMOzxOfqyd5ZoKesbIYWdjvJRV/KH
	VSLyJY2BF8vQO27hyKPtwd7Mi27W6XI=
X-Google-Smtp-Source: AKy350bEjRbDbK3M3zkjtydhhxtftg196JUHVYzkXg5wClOQjBB/fVrefUkUcCfEf7MkBOk1TuTd7g==
X-Received: by 2002:a17:906:3da2:b0:8b1:820a:7b60 with SMTP id y2-20020a1709063da200b008b1820a7b60mr12129057ejh.6.1681276457336;
        Tue, 11 Apr 2023 22:14:17 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709061b1500b0094a7e4dfed8sm2956731ejg.47.2023.04.11.22.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 22:14:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH] zsh: fix installed-vs-shipped with multilib
Date: Wed, 12 Apr 2023 07:14:08 +0200
Message-Id: <20230412051408.10469-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 05:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102059

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
lib32-zsh-5.8: lib32-zsh: Files/directories were installed but not shipped in any package:
  /usr/share/lib32-zsh
  /usr/share/lib32-zsh/5.8
  /usr/share/lib32-zsh/site-functions
  /usr/share/lib32-zsh/5.8/functions
  /usr/share/lib32-zsh/5.8/functions/_selinux_users
... 1000+ lines ...
  /usr/share/lib32-zsh/5.8/functions/VCS_INFO_bydir_detect
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-zsh: 1116 installed and not shipped files. [installed-vs-shipped]

* they will clash if someone is trying to install both zsh
  and lib32-zsh, but it's not very likely as nobody sane
  was building lib32-zsh with 1000+ line warning regularly

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.8.bb b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
index b023e8d297..7602ff9f64 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.8.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
@@ -22,8 +22,8 @@ inherit autotools-brokensep gettext update-alternatives manpages
 EXTRA_OECONF = " \
     --bindir=${base_bindir} \
     --enable-etcdir=${sysconfdir} \
-    --enable-fndir=${datadir}/${PN}/${PV}/functions \
-    --enable-site-fndir=${datadir}/${PN}/site-functions \
+    --enable-fndir=${datadir}/${BPN}/${PV}/functions \
+    --enable-site-fndir=${datadir}/${BPN}/site-functions \
     --with-term-lib='ncursesw ncurses' \
     --with-tcsetpgrp \
     --enable-cap \
-- 
2.40.0


