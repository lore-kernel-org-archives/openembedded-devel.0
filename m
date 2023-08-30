Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D54C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 15:15:13 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.16837.1693408506078226833
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 08:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dYCPQcFX;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50098cc8967so8912441e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 08:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693408504; x=1694013304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0FZ6KOpxlqUmOtOviNAARN7R68FWFrkRu534ujOX30=;
        b=dYCPQcFXWr/HtPCnio+h2IM5vdDqxC1TzkHJgevJd4V2l+zKGEX0ZxAa2xXtjSac+x
         X67ChCNnfrPMIGNjB2eAGVazg+sSkFfhg0JbNQJbJbxaakEdwC0To6eJEW84hrvWbXAO
         ABkb5zDVEQSQ0x0leuSpDls01BT8vVmVTUlTNR9JePvvMRkLnaW+ZcANT5oHxbgqD+Sj
         arwloJTVC+4ljQtrS042YHxy7mx2WTRJeijCxJwna2R/QEm4/B/wNxRxid/bIo12QFQY
         nSA7DmW9pvwApzvMf49L9QNenqMbM/08aawIxYxmdYAMpFf7I1fYA75o72Yr/UIb7KJE
         QVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693408504; x=1694013304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0FZ6KOpxlqUmOtOviNAARN7R68FWFrkRu534ujOX30=;
        b=mIMW/XBqEHi4sXw9yqk+SRN2ui0nOuztduLWA3AcQhpkn5BoZut91+HnFiPZWL1H1l
         gv+SlOUmiLdI9dHXBJ3MSxOq2zkR2q1P5uZA9pJmJaBdAjtXYbwjTFnVYEYks8RlNDRF
         T+oSabCXNc3fpNwVaBhm+BvRR/eXWdkyF3tTIDsyT1Pb+X5/a15C8X0ldMZulxX5oTmJ
         K0hiwAzI7Y64g8YtChRFsbRGC2+HWjIIprGStCbYCIHUNN5C0CYJl/hAWkSXCU6vjdRt
         oc7g91ObI+v09E94+Az3dnWadwlbHVKcrnoH1TZWchhx5/zooMGNGJQTNdXvfwkUwVUV
         bo7w==
X-Gm-Message-State: AOJu0YyrKKl9RbpUr8v/+V/z+ORQNc+FTvwfsC42/NrD+tqBqp2cH+q4
	YwzJU5X2JaVaQbgptICGdsO4pzdstIU=
X-Google-Smtp-Source: AGHT+IE8XMQ02l4kWfIZk0PtJLzGia1URZUm6aX+POKVeM47KXYkKj91IKAtqRozSUO+CAdSmjUYIg==
X-Received: by 2002:a05:6512:31c7:b0:500:98ff:4162 with SMTP id j7-20020a05651231c700b0050098ff4162mr2118045lfe.40.1693408503987;
        Wed, 30 Aug 2023 08:15:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l7-20020a170906938700b009a2235ed496sm7413971ejx.141.2023.08.30.08.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:15:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH] libfaketime: simplify packaging
Date: Wed, 30 Aug 2023 17:14:46 +0200
Message-ID: <20230830151446.3375230-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 15:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104670

* avoid dev-so QA issue

* avoid separate package for the library, because the current "lib${PN}"
  has a bit ridiculous name in mulilib builds:
  lib32-liblib32-libfaketime

* fixes:
  ERROR: lib32-libfaketime-0.9.10-r0 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package lib32-liblib32-libfaketime contains symlink .so '/usr/lib32/faketime/libfaketime.so' [dev-so]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
index 6a0a8f32af..f13925ee18 100644
--- a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
+++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
@@ -24,10 +24,5 @@ do_install () {
     install -m 0755 src/faketime ${D}${bindir}
 }
 
-PACKAGES =+ "lib${PN}"
-
-FILES:${PN} = "${bindir}/faketime"
-FILES:lib${PN} = "${libdir}/faketime/*"
-
-INSANE_SKIP:${PN} += "dev-so"
-INSANE_SKIP:lib${PN} += "dev-so"
+FILES:${PN} = "${bindir}/faketime ${libdir}/faketime/lib*${SOLIBS}"
+FILES:${PN}-dev += "${libdir}/faketime/lib*${SOLIBSDEV}"
-- 
2.42.0


