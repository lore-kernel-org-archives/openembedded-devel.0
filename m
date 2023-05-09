Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFDCC7EE31
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.25846.1683616023092922881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BCoYtysI;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f42b984405so2414475e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616021; x=1686208021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHPKUUBfZRSfVlFuo303CvK5y3hdtqYFnnu1EN8xjes=;
        b=BCoYtysIszHpbtGQn8JRo8qpv3Q0ZKYaRn0W+iQFIZIhADlJ8BWrrSgnCdZpIq9SLa
         2GF1tVLXmTSzjwukNrxUms6zLR05LbSypIxM0P+g7hmL2Sby0pex4rralstZT93mj6cf
         NEdCoSyG7VQmdv4ZVHpG4/cXMmkbiA94YlL2izW7Or/ZPy6wT/CcMWnTcnohxSukJSkF
         jUra5LMOlc2P/CkKCLQ+7gpE5ERUO4cE0y7v8A1bcJV2jjLh1P51KSDAjSngGOJLDITB
         q0+e31rXKM6v60521CJqv9n2UiBwnyNBiM8lf84gPWhtFrT5wRK0JOTyb5ZvvdrulzsK
         kzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616021; x=1686208021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHPKUUBfZRSfVlFuo303CvK5y3hdtqYFnnu1EN8xjes=;
        b=ZgqddcGEyVLmMrgcZhcidF3gizEtlcRa2rxZf3NUVv8JgO0IPbseg2zTAD3eoHS1dX
         mGJelWUranWIZXQ8FDK/DVSwCPhlZhibPO7NuiskETKHbl1B7KGibIjvk/L8mERE4zsp
         0n4xyAbe4H5aUOs2pDClCS6I0YqeuhR7KdyT7at62DZ9Azu+ZWJJrxkinPoJN3zBfgnM
         1asISBBjjml0Y6W5qKm8fqMJgcUfndCcbdTiSos3KaUANEuFYzYiqKxGRUPl5POsuNt+
         ZsYDsVfv98hcRAOh8myC8McL7Noaef7FyxJVuk4+PDIClVnGNepy8f4WtA/BWg3D46Rm
         0xKw==
X-Gm-Message-State: AC+VfDw6iNQ5XGNrIHd/utbBQJdgIy6FFFjN+ATfPi7ZlTNiVgRoKYeK
	NoNFqMfFsyFvJIJ16dRgqJ56mTdiZ6I=
X-Google-Smtp-Source: ACHHUZ78TDw50jmQwagfuSCiE6bW5jNKIGG9XywzuZ0Q9va5uNFEeJT07fBkJ1HY7Z0K9WESA34beg==
X-Received: by 2002:a05:600c:22c8:b0:3f4:2328:b5c2 with SMTP id 8-20020a05600c22c800b003f42328b5c2mr4923744wmg.35.1683616021560;
        Tue, 09 May 2023 00:07:01 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x25-20020a1c7c19000000b003f42a75ac2asm1401578wmc.23.2023.05.09.00.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 03/16] libreport: add dependency on libarchive
Date: Tue,  9 May 2023 09:06:42 +0200
Message-Id: <20230509070655.70784-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102471

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


