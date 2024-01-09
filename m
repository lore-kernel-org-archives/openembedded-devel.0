Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02295C47079
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 04:13:38 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.9798.1704773610104520685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 20:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DcgWOK75;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d3aa0321b5so23298005ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 20:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704773609; x=1705378409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mgIARnlyuMdiCHvJ3vnLOapQ4OPlqsfDLnWdNYYPquI=;
        b=DcgWOK75TKJsDxRIVGN2JQCmt5O8PZyLEAU14zMZrjlCvhtZGHxF1rapAD9XshuIBy
         DMyOakLQ8KOTgC7YoMzEl9eBvB2EBuiqzW0YsOmJ72kF69TlwrfCOoch8UcQpVYoSR/g
         ll1AU5TLQ2kwNEG+SWznUb7kQ2uSJUpQjpK4QSgs+4BDAL25TBi2YPZ9/ulBLVlJRlkO
         z8eRFQ18OXFEEj1Lol3bVDwAhZ4SKSRYDylxUepQspQG8+BIhP6lIQqAyYJri5MOuIEu
         Tns94SV+uwZq3p9pUG3RRFvKYNKF4DYB24XY0IfVnBlko6UEcckDlOBDVY9pZ4QAMUWN
         Iitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704773609; x=1705378409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgIARnlyuMdiCHvJ3vnLOapQ4OPlqsfDLnWdNYYPquI=;
        b=tXGvo/k3FFo1rIF5EZ8TP5Chr3vED00SD1ZORKlDQRGwpuQsuZiQp65c8t2oJe1AmY
         +hAwg9OMHBAb981XIrznkp2jjIRevGgjB/bQFz+7YuhrhhzwHX27RN56DxOua6hIjLMQ
         6Zds2489RSmEfkEEMVwZ77U9rEFtyBK5nHQxDnuvGT7vOITlb4wyxxjp8Ddme8gG9xwt
         jDDJOKM1c4Dr84/2BStcG3+2/oZt77L06ZONvIZRTP+gauHzoNrwmlNNVKua1f3odZTh
         n7Ex7/1yXeRWAbie/TrE6CToc995t8FzFGeuV7FeRu4go8X/bXACFeipqhuHHCcifair
         Pa5w==
X-Gm-Message-State: AOJu0YzLXbDRkzWf65tNzFhVDWlo9jYpj2HYHqVXswLZDDIO3Uk27/H/
	58d8eXCjwPg2Gp5/c2hUJ/2KL4AWlUo=
X-Google-Smtp-Source: AGHT+IHpGGqFYvYAFd8ZkyVkfjd3i2Zppqii/cnHkO7ryL+uD6QouvPDP+Y8wqdLJmglCuV2dBwWCg==
X-Received: by 2002:a17:903:11c9:b0:1d3:fa43:6a08 with SMTP id q9-20020a17090311c900b001d3fa436a08mr6412277plh.44.1704773609153;
        Mon, 08 Jan 2024 20:13:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::839a])
        by smtp.gmail.com with ESMTPSA id bj2-20020a170902850200b001d55717179asm376302plb.288.2024.01.08.20.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 20:13:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libconfig-general-perl: Enable on musl targets
Date: Mon,  8 Jan 2024 20:13:23 -0800
Message-ID: <20240109041324.4110649-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 04:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108180

its needed by tgt and thankfully builds with musl these days

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/perl/libconfig-general-perl_2.65.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.65.bb b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.65.bb
index ecc89d075e..b2266394d6 100644
--- a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.65.bb
+++ b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.65.bb
@@ -12,8 +12,6 @@ SRC_URI[sha256sum] = "4d6d5754be3a9f30906836f0cc10e554c8832e14e7a1341efb15b05d70
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-COMPATIBLE_HOST:libc-musl = "null"
-
 EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
 
 inherit cpan
-- 
2.43.0


