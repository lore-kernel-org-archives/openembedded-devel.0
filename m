Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3950AC7EE23
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 07:33:25 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.44024.1683185596985263826
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 May 2023 00:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TSvxiIRs;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-50bdd7b229cso202893a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683185595; x=1685777595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCSZn9YL97TGwLp3r//6n7mV32k7Zdu2knh/u3i5To4=;
        b=TSvxiIRs8T7lKv/iH4F/tLKv8K8JePMiTPESC/Sa3n4iuw8yZzmMlsnq/qhDvfcNZS
         9Aq7fdlfjthdWs0qP12SFhMGE8bPwbMdUTLKEeQzIOe3+kR0DL8/4StlGTJvtlS9bgo2
         kb87qWb4ZBx0sQ713593wZMoSxdQxSnQmeN/sTiN+/U5PShdRpRA5BUVEq5S+KNWyhjc
         /rittpwHMb3KV6Hkg30ywfjGjC3atv+Mxsm+ZwrFNzUZVU1JeBSKRy9w87M4F6vfHPrr
         s0rWlKzCTbH/bLwBHW4jzTORHvezN2f2FoQM/UZ0MJjJH7ymziQruEQ9QJe0QvPkkqVq
         bLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683185595; x=1685777595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCSZn9YL97TGwLp3r//6n7mV32k7Zdu2knh/u3i5To4=;
        b=ijVfL80dHQDQ8NOWR6LaWomXH6xLo90Gw0JPfKZR9ZVPRjQ1swBIkIVxIAYBDlCyea
         hNiqxYyUGYKF09A/jrRVy5MEuuvsUnl/imyyRyaaq65OBys6JTSC9eRC6oTwvsE32rUJ
         LhVQEGM5mLCiTUdCXT+RmRuRZtGLM6FX8dx8dcwXE9qGqeng8mXw4QW3uTtkbmhbhJec
         VmBwvVTek21s0ilasEou8n5jwTqqR985oSz1WTHDukaQ0bRXF83m9y80aU28+glawB7t
         3nouDOmHkeb7VzLV2RWfWXU7I642qS/wSDIYq1mgNnBF3Xy7e0B/jm5W5eHVNt/mkked
         nUdg==
X-Gm-Message-State: AC+VfDwQX6TLf0Utoiy5EZM0ZHGRCrk8chOZ9zOAnY9XcijTIW37gecR
	uENcAM2XZgH8vKCsyXknmPWFAk4T7BQ=
X-Google-Smtp-Source: ACHHUZ7GHfMM3Gd4tzvbOug8L7AO5h3EUHx6vKH1ctEyYPpG7nr1XFCtwgy3CBWF0dQN1a6JBsv0uA==
X-Received: by 2002:a17:907:3e8a:b0:965:626a:26cc with SMTP id hs10-20020a1709073e8a00b00965626a26ccmr4007111ejc.65.1683185595306;
        Thu, 04 May 2023 00:33:15 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o9-20020a1709064f8900b0094f3b18044bsm18272234eju.218.2023.05.04.00.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 00:33:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] nv-codec-headers: fix installed-vs-shipped with multilib
Date: Thu,  4 May 2023 09:33:08 +0200
Message-Id: <20230504073308.1251185-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504073308.1251185-1-Martin.Jansa@gmail.com>
References: <20230504073308.1251185-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 07:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102305

* pass LIBDIR to install ffnvcodec.pc in right directory

* fixes:
  ERROR: QA Issue: nv-codec-headers: Files/directories were installed but not shipped in any package:
    /usr/lib
    /usr/lib/pkgconfig
    /usr/lib/pkgconfig/ffnvcodec.pc
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  nv-codec-headers: 3 installed and not shipped files. [installed-vs-shipped]

  when libdir is /usr/lib64 with multilib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../nv-codec-headers/nv-codec-headers_12.0.16.0.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.0.16.0.bb b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.0.16.0.bb
index 5ef7ead810..4bff4f24b7 100644
--- a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.0.16.0.bb
+++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.0.16.0.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
 SRCREV = "c5e4af74850a616c42d39ed45b9b8568b71bf8bf"
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D}"
+EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} LIBDIR=${baselib}"
 
 do_install() {
     oe_runmake install
-- 
2.40.1


