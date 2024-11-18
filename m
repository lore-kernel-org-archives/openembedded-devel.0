Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A71D4921C
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 13:05:28 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.39609.1731935123631741652
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 05:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bEC99b7I;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a68480164so625980166b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 05:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731935122; x=1732539922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzhJyNPhwW2Q0vDotIPb/gPJaB8xNbZxPMbmtvrKgMI=;
        b=bEC99b7Ix5nCcXNp/sNRJDpjoScLnz2uv1IcaBE9Aqj5zTNvkKlMX4IPgaOGBjElxk
         sNK86GL8e5Tdm63ijtB2u4kLgXHKmlF1pAstNy+Rip0m5wU0ma2o6tIGzK3Xbe+8lMhY
         cIjf0+0IPgPPMUhd48x18yMSQXICYnt9BtUpElEuqXlyiD5bupb2smgDAsUhGIGrPZ+K
         zAWXQp6cNf70u2a0ktqkjrpYX7qO2f56JhvDM6pR6be4MJkyuB1R54KB2wkFKZrE/MJE
         lyzYNDLpBiPCcu3Xp6my8nUA7A1aKZo0EUunZsznucZ0EYT9g5N/J5NfnGKYFUTnk5sz
         PM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731935122; x=1732539922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzhJyNPhwW2Q0vDotIPb/gPJaB8xNbZxPMbmtvrKgMI=;
        b=ub+atvyc+FG5bk/mXt+vw6lqr2rd9vdEbsiTvRB+9UcE4RThYpaJ27CEWNHHb9QMPs
         HFWavp7QbTJvm3cQ82oVeTfqt4PECK0Mtuu382UCpEQjZwTXQam5AkRK3IWjmzonJNRm
         cWbkRFRzYX/meMpkiLoW9ECno5l6wTaoUTKjKvORQLSFEmPBExTg6+WUzW0CxyA5UPIu
         ODOa9QvM/sK/PRGzzZl9SS3asQxZQp0xAzWlmver8wjaV2M+buVpbRXmJCKOezid1K2t
         y8C596O+McvC6NQEIoR4JIEIGeKndYqzys/CdiuIqpImk0zGBaubGTWpiRPGBhpLSdRn
         f4KA==
X-Gm-Message-State: AOJu0YxilATJqwZH1Kc6UhaHQByEFoUdKCDg/yS03+ACF3WFtjFhP2uR
	t0aL/u7wpuQm3+B4AA+uiB2m/KYL8OkHfdVpi+mQVqZuMhhN1wXIxa88rw==
X-Google-Smtp-Source: AGHT+IEgeUiXCb7ho7Aa3g3e+5uVaJLI29D8nVcET6tNGy7SPZ8v55ys0YSdh8b9feU8hBFQSW+YbQ==
X-Received: by 2002:a17:907:36c5:b0:a99:f67c:2314 with SMTP id a640c23a62f3a-aa4834893f7mr1126330566b.35.1731935119830;
        Mon, 18 Nov 2024 05:05:19 -0800 (PST)
Received: from localhost.localdomain ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df52adasm536700466b.81.2024.11.18.05.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 05:05:19 -0800 (PST)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [meta-oe][scarthgap][master][PATCH 2/2] lcov: Add missing RDEPENDS
Date: Mon, 18 Nov 2024 14:04:58 +0100
Message-ID: <20241118130458.3588473-2-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241118130458.3588473-1-claus.stovgaard@gmail.com>
References: <20241118130458.3588473-1-claus.stovgaard@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 13:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113902

Found by just adding lcov to core-image-minimal, running geninfo and
getting errors like.

Can't locate Module/Load.pm in @INC (you may need to install the Module::Load module)
... at /usr/bin/geninfo line 63.
BEGIN failed--compilation aborted at /usr/bin/geninfo line 63.

Can't locate Module/Metadata.pm in @INC (you may need to install the Module::Metadata module)
... at /usr/lib/perl5/5.38.2/Module/Load/Conditional.pm line 14.
BEGIN failed--compilation aborted at /usr/lib/perl5/5.38.2/Module/Load/Conditional.pm line 14.
Compilation failed in require at /usr/bin/geninfo line 64.

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 meta-oe/recipes-support/lcov/lcov_1.16.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_1.16.bb
index 53e192105..81b80790f 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.16.bb
@@ -9,7 +9,9 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 RDEPENDS:${PN} += " \
+    libjson-perl \
     perl \
+    perl-module-compress-zlib \
     perl-module-constant \
     perl-module-cwd \
     perl-module-digest-md5 \
@@ -27,6 +29,8 @@ RDEPENDS:${PN} += " \
     perl-module-getopt-long \
     perl-module-getopt-std \
     perl-module-list-util \
+    perl-module-load \
+    perl-module-metadata \    
     perl-module-mro \
     perl-module-overload \
     perl-module-overload-numbers \
-- 
2.45.2


