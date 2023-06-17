Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F055DEB64DC
	for <webhook@archiver.kernel.org>; Sat, 17 Jun 2023 17:15:05 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.9420.1687022103289836027
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jun 2023 10:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gwYts5Cq;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-57028539aadso23067777b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 10:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687022102; x=1689614102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46CbGwcKR9m7MCS5L1aiik8NL0ntmHU80eakLrFUgaI=;
        b=gwYts5CqBFdTdIs4oOFOvNTdUvjr1nSrYIDLWUALGsr3xdqWv66Yuc1k9zAB7eV7OL
         d2ES9RAwIAXH2zIYUXZgFu9YrhlldIZbTuCdvxKK7jnTWRrSR/cU2O3/v/MO8I1Ax5qe
         KtfpWt8SX63RjN/T5TwuNp+rbPtcnMip6xYWGIzngv6S5V36uqocptsRlkdViFIo8nPS
         KbV8gdFnnAhY2/JBZdqUvOaBRYWGCFlsYZ9sv0HRriPGkYR85DbucAF5rIpWJmk2Q4/c
         KgLRiOqveJ5nD1BnLnUR6nK6rXvOsY5x7BgGjXBtGUEvsif8QbHbfm0xovV8tN9k6WKK
         i0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022102; x=1689614102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46CbGwcKR9m7MCS5L1aiik8NL0ntmHU80eakLrFUgaI=;
        b=k/paLiaFmYM7iYea5lDTuhn1ejpNIMwx06ZrREpLAD4s0Nmm9vKY+SaIMhspqCPZQN
         xmEA4LuQqMBL+5FK4oDW0G3UMWARYWTqmNjA+ppRb3ETlkruKbKCCdIt2LY6nYOp1TzR
         cmzRJuPWZDpXH/nFwTPYe9jRTToyelwlXJZDk0YGkjP8/wtLVm9pdXcei1pFI4kA80qs
         Is5qyjgNxZjPHinM/BpWVJEehi2D/DQ71gxH45LNGDTmTCeYInmr5567r2Wu0+za1Zgx
         ORjzYIBnrpnA9aEJcMYR9GxsFeaL0xMOkvJqcfs+B+VWas2d0k8L/zTGULuqptun9upG
         OsDQ==
X-Gm-Message-State: AC+VfDxd0o1joVd5rLCHQsMiI9f04WhDmaEqEeAAzKIuWIF1cF5D3RjI
	gAp8Y7HE2FwB1W+cyOxe6v6O45DM30w=
X-Google-Smtp-Source: ACHHUZ47WBezDm8/hl7ZRGKimw5Jx7aNUYe9Wt78bDeMSjE98q3p4jzDZpUNq5SQQYw/xuz2kcFU2A==
X-Received: by 2002:a81:920b:0:b0:56c:f916:905 with SMTP id j11-20020a81920b000000b0056cf9160905mr5374307ywg.32.1687022102248;
        Sat, 17 Jun 2023 10:15:02 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:89fd:7ebd:1d10:5272])
        by smtp.gmail.com with ESMTPSA id o125-20020a815a83000000b00545a08184cesm5737043ywb.94.2023.06.17.10.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 10:15:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 2/6] libgxim: add autoconf-archive-native DEPENDS
Date: Sat, 17 Jun 2023 13:14:56 -0400
Message-Id: <20230617171500.70558-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230617171500.70558-1-akuster808@gmail.com>
References: <20230617171500.70558-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jun 2023 17:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103347

From: Ross Burton <ross.burton@arm.com>

This can be satisfied via transitive dependencies, but make it an
explicit DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5fca30d672c291b1af8284d6d5cbfc520c95d4fc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
index 2d93936f37..3912e0a8d7 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "\
 file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 EXTRA_OECONF = "--enable-debug --disable-static --disable-rebuilds --enable-compile-warnings=minimum"
-DEPENDS += "gtk+ glib-2.0 glib-2.0-native ruby-native intltool-native gnome-common-native"
+DEPENDS += "gtk+ glib-2.0 glib-2.0-native ruby-native intltool-native gnome-common-native autoconf-archive-native"
 
 inherit features_check autotools pkgconfig gettext
 
-- 
2.34.1


