Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F305C7EE26
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 17:24:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.26074.1683134642174715332
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 10:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Gyy65Z13;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-2f6401ce8f8so3488124f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 10:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683134640; x=1685726640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wHPKUUBfZRSfVlFuo303CvK5y3hdtqYFnnu1EN8xjes=;
        b=Gyy65Z13HVm+tVFBSWu7zSs4GM5jXGo3HEAnc5rEIcuvyQamq2Q37yvhv4HDZ2zIxm
         eBHIAYWdQh/1y6rxWG7kT8rUg+6Bs7N4tcQUAmpGaZ1rr+DRtuvzH7wgpaoCTLkzYUUL
         g80vXbqx5t1K8lJBg7Go/O+KWzMvh3yMnj0KXfCBF719elwrZzvSQBeEcgBcxMQClrGo
         6bVFN2BFBGy9KHPeFLEBToZQmAVE362h+IGEu0VWHKZy2owZeyeor4J4nOcrbB1hBK/E
         LF/Rjd8EyJFX21h9U1WRT5o0+JiwE8NMskzNDGGsTiTRz9g+w9/B95s1k65GqFRyQgWE
         CNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134640; x=1685726640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHPKUUBfZRSfVlFuo303CvK5y3hdtqYFnnu1EN8xjes=;
        b=jUgBEFoEtpb4d78rrx6KQ7qIDC+svZpHKGwr7PgMAArRO8+vD8Gwa53qrwk9Lgv6o8
         z4pV7qYwm96YlLMiysXTwTJWK9QIHoZjL8xBc1VoLOUbBMRynZB0n9F9eU/7zPxMS+Kf
         vvqxcHr8mGcwcomVwgyFvBqXvygsV19cNiNdlsFZYbm8QllQ3oZzP8yiKKODY23WM9Rl
         Ozl1OZguoAGlRk500cxMp384B4oet4FhYx8KnsoBhuj4V96er8A9EUHwDhuGAZZ7ekd5
         UioYYmYxRXz6y7d/96f2JSdeEVNX/YtiSnwe2iHWcMKKOo6TpYhpsIPzWQcFJqTvjc16
         y5FA==
X-Gm-Message-State: AC+VfDzYRUiaSgJcOVrfSZyn/VNJup2t2whiaAJuuZWhcDHyDogGQIat
	VP+Jmy2HZq0Uf2tOkV5Uzo3HKT1Pp3Q=
X-Google-Smtp-Source: ACHHUZ4dWCKtpdJN5ftYcjeoWLOH8XAjuiAkvZMJwYTCvq77ETVRhgY8fRHVKs7r/dFnMIPcydkYqw==
X-Received: by 2002:adf:f205:0:b0:306:36ef:2e3b with SMTP id p5-20020adff205000000b0030636ef2e3bmr615215wro.70.1683134640419;
        Wed, 03 May 2023 10:24:00 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b9-20020adfee89000000b002f777345d21sm34256252wro.95.2023.05.03.10.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:24:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/7] libreport: add dependency on libarchive
Date: Wed,  3 May 2023 19:23:48 +0200
Message-Id: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102291

* it's often pulled by elfutils when debuginfod is in DISTRO_FEATURES, but
  when it isn't, it fails with:
  http://errors.yoctoproject.org/Errors/Details/702773/

  checking for libarchive... no
  configure: error: Package requirements (libarchive) were not met:
  No package 'libarchive' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libreport/libreport_2.17.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb b/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
index a8d1db65bf..1f2c55c699 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
@@ -4,7 +4,7 @@ SUMMARY = "Generic library for reporting various problems"
 HOMEPAGE = "https://abrt.readthedocs.org/"
 LICENSE = "GPL-2.0-or-later"
 DEPENDS = "xmlrpc-c xmlrpc-c-native intltool-native \
-        json-c libtar libnewt libproxy rpm \
+        json-c libarchive libtar libnewt libproxy rpm \
         augeas satyr systemd \
 "
 
-- 
2.40.1


