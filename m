Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B8ED767C4
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:41:37 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.12748.1730382088548487260
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a+7C2Ibc;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso125474766b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 06:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730382087; x=1730986887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J8yvz1jYqqXQHI/QC3smYS7U0kWgyatas4dl5+WaEE=;
        b=a+7C2IbcfcnrFTuAGk7q2lqdwE4hA0LOjSJqkquI1TereUcDjxD2Olu2uhpNFlFeni
         XB04m5b+559O+fBUpHaBwFLhChiJAIMb51Ugyap4JyxeqqouL/RhMXb9piWdVCCsvlHy
         epcylKewzAk79LjHytr8x9Seghov5RuDrjya1qJtaPx/ulKBUWQ978MLsBzdTULJWzTz
         4hGC18QVwjhj24xdeMiu6yVY1CXgK7i6Kszwx6sBTTSZy9Qf7q6n7XQ3E8l0JtBBAhwv
         hkgNBCo9odZ5HTla5lyLoYF+fEGMcAYyuTwk2pcYM75fqOPyvmImtgSWt/S3r3kSut2g
         Tdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382087; x=1730986887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+J8yvz1jYqqXQHI/QC3smYS7U0kWgyatas4dl5+WaEE=;
        b=gejlYLIOQZ/3xYse5ub+3V2HZY6B9x8CLntDxyMZo9UO0J+W0UDIVPPLu8Sl7cBmgD
         pFrlcjoXXDpUH3ChFZSd4RqKZNcP9cW16n8BR37WGnBvzzfCkZHeDO0ugVWAa0gCdfbD
         d7cvF3wN3Z7uNVuw1DFxRsrHd0xvCJZX0+2yZ9SQlP8QfuWHrQVMwq2uJqV575X4yEEN
         3JoVpINn4Y/kAJ4Rh2NWySh+RNydib38hqJFpRzkb01Rs0UT6msT6qr30zYMoPAICgrz
         /uYg5p+JfQ2EOR8hMQADI/Du2w11vX/DFIzM2wSP8jGj2k6P70h+k3p+oaEYnAqtuGd2
         DqwQ==
X-Gm-Message-State: AOJu0Yytc5pCMuD1aWy5KMDBjcnUuyNSCERp6JguIVcIs3TZ0qGWAUU8
	p99DVW+V8ikvXSwR0VLUqpAYFMZzQVo8CuFd4yJsTM5+InrzJ6oGqW5HqA==
X-Google-Smtp-Source: AGHT+IExJV4y0I8GR166rWQp4myJarBWjb/IIqe5Q9r8bRuSNpkzwpxuokvu1DYLqhcwXZTcIChMpA==
X-Received: by 2002:a17:907:720b:b0:a9a:8674:1739 with SMTP id a640c23a62f3a-a9de632c02dmr1866010266b.53.1730382086753;
        Thu, 31 Oct 2024 06:41:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e5649410esm70377766b.41.2024.10.31.06.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:41:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][meta-oe][PATCH 03/11] colord-native: rename directory and drop unnecessary FILESEXTRAPATHS
Date: Thu, 31 Oct 2024 14:41:06 +0100
Message-ID: <20241031134114.2791747-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031134114.2791747-1-martin.jansa@gmail.com>
References: <20241031134114.2791747-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 13:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113360

* ${BPN}-native is weird work around for ${P} and ${PN} being dropped
  from default FILESPATH in 2012 with:
  https://git.openembedded.org/openembedded-core/commit/?h=dylan&id=fb359583b659cda643973fa285002aaffb729a51

  better to just rename directory to something which is included
  in the default value (like BPN) the filename are different in
  target and native colord build so they don't need to be in
  separate directories.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/colord/colord-native.bb                 | 2 --
 ...1-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch | 0
 .../recipes-support/colord/{colord-native => colord}/Makefile   | 0
 3 files changed, 2 deletions(-)
 rename meta-oe/recipes-support/colord/{colord-native => colord}/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch (100%)
 rename meta-oe/recipes-support/colord/{colord-native => colord}/Makefile (100%)

diff --git a/meta-oe/recipes-support/colord/colord-native.bb b/meta-oe/recipes-support/colord/colord-native.bb
index 64dd94a9ed..2c79be4957 100644
--- a/meta-oe/recipes-support/colord/colord-native.bb
+++ b/meta-oe/recipes-support/colord/colord-native.bb
@@ -1,7 +1,5 @@
 require ${BPN}.inc
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-native:"
-
 inherit meson pkgconfig native
 
 DEPENDS += " \
diff --git a/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch b/meta-oe/recipes-support/colord/colord/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
similarity index 100%
rename from meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
rename to meta-oe/recipes-support/colord/colord/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
diff --git a/meta-oe/recipes-support/colord/colord-native/Makefile b/meta-oe/recipes-support/colord/colord/Makefile
similarity index 100%
rename from meta-oe/recipes-support/colord/colord-native/Makefile
rename to meta-oe/recipes-support/colord/colord/Makefile
-- 
2.47.0


