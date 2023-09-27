Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E77E810CA
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 10:49:30 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.14327.1695811768901789023
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 03:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N9g/cNI0;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9b0168a9e05so1109366566b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 03:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695811767; x=1696416567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoqnTNVhxsZdnqyt2QoopHP5P46He74CVPfdV4Yesug=;
        b=N9g/cNI0wJhiHukybZASC7OyirHUL06QdClY3/4sDC3Cb/H9a2c/YFpek+FBby3nEI
         i0N4/UeiQDP0pvisAOGzZTgcFiBpPEHCfpxEwj8f4VnVldhhaCi4Dg7OCQh5DduHTYwo
         2xP+5XkBVOspTsVr99vSsNHa+/1Z1yFAKm7laDOflNn6tFkayXNZxSkpRNeWK+w0F1Q4
         wA2j5nONCbca7dfiDTKd6o+s/OLAFzQ+uOaFSG1TtsS+hrKgnwNFUHB7fVbagfVbCMrQ
         zqKc6bjSGM+XN4hr5B1pXEXolHN1cNwoJaIfLqHOpaG7mdHe+51XTf0R3LAL0jKTwiYj
         j1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695811767; x=1696416567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoqnTNVhxsZdnqyt2QoopHP5P46He74CVPfdV4Yesug=;
        b=pLu/PmSfyAP01bQP1v2zwkXnqgtjFyLYSdo8NMtIEd7ygzqdtX2U7m/N7reS/P+AXj
         PPgVdZB6o4S3EKObANx4lZrWcncWlrxxVayHIlgcUr+We+iq1qENVL+rWy5XE9gBOuI9
         88EWIbxKaGTuxXEV4hTtpdwas0wKbNTGnL6wBxVrcXDS5mhLTj01fzqAEVEBV1hATXHH
         Sqt+2USJ0uUN1BWmZ7QYY6OhBv446Lr1hDtuq88H3+r0X4g92c8q/bgGSpRYowA4K/HN
         uOxIPCxAaDEaDa2dWJtr5jqjyvOCRosbNNfJyL3aq3THP6rENBZ6BZPYadVzn478hfVV
         06IA==
X-Gm-Message-State: AOJu0Yz+b68mM+vkeowsGwqnjDp7QmrKwl3cSzlr+h4cG5zhghIipJUz
	7xKuPPYQfIEK8cEHcOk3IEN74D6Rs/c=
X-Google-Smtp-Source: AGHT+IGX21oRYSckYyDciUWroSUkzTb/0tIcBPU4rxwLWZgPrzRjE839d4cOJsLV1WsbEWzxOzxvDA==
X-Received: by 2002:a17:906:53:b0:9a1:c991:a521 with SMTP id 19-20020a170906005300b009a1c991a521mr1364236ejg.4.1695811767249;
        Wed, 27 Sep 2023 03:49:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cb25-20020a170906a45900b009ad778a68c5sm9174290ejb.60.2023.09.27.03.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 03:49:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] mozjs: fix filename in MULTILIB_SCRIPTS
Date: Wed, 27 Sep 2023 12:49:17 +0200
Message-ID: <20230927104920.2052173-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927104920.2052173-1-martin.jansa@gmail.com>
References: <20230927104920.2052173-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 10:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105188

* fixes:
  DEBUG: Executing shell function multilibscript_rename
  mv: cannot stat 'lib32-mozjs-115/115.2.0/package/usr/bin/js102-config': No such file or directory
  WARNING: exit code 1 from a shell command.
* cannot use PV here just yet, see the next commit

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
index babe39822a..b029c5f4ec 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
@@ -66,7 +66,7 @@ do_install() {
 
 inherit multilib_script multilib_header
 
-MULTILIB_SCRIPTS += " ${PN}-dev:${bindir}/js102-config"
+MULTILIB_SCRIPTS += " ${PN}-dev:${bindir}/js115-config"
 
 do_install:append() {
     oe_multilib_header mozjs-115/js-config.h
-- 
2.42.0


