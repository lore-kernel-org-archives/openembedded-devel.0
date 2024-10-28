Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D27D5B16F
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.1059.1730142298241393003
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k0NPkwKy;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e290d48d3f7so4746713276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142297; x=1730747097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P16ZSDjVkmErfgdjkfkhGwchwJUp97zA08Eyy4nEI/U=;
        b=k0NPkwKyIWCdG/8juZEKLt+vhIOyD5BPHNK5QhqE6quKhmIKQv28OPHZLSKg1BTzl1
         prbPxtqXoVFfLIIZ8U0DVl0H48kpCmTCEfB6aVo94cLq/UsIP9r/pW1y+G0UY4i/64Ne
         vySx9AoMxX0S765A2+K5wwHi8efiG3b9vy2vjtIWg32xcRmjN6Rpafiquv43APfwctha
         YQIiulq/Iy7z51XRhzf1ijxNX6emaN51HyZ6RsSTPjMj55L3XAyxT95AtDV3rOtQqKZZ
         eNHq/uvrT3F56CVe+Co4NBo8b3BP/QwCrAmDbTEuazPwZXaNmG+e+JPoztzMcHXZB8BM
         +6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142297; x=1730747097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P16ZSDjVkmErfgdjkfkhGwchwJUp97zA08Eyy4nEI/U=;
        b=bG50M2arKgHwZF054ux+W78knsN/qzXVVpS5WnpzovgjrFXtT+KimYw4o8xJ3evMPt
         G/RJOfLOUIUE0I8dMUTK+D1KzFUXfqrbazZK+KrNDL+79IgfXBl5ASNfSsL6+kwIoDcD
         2i4pYQGhBj9plltOp7wHvCRDLIe89fj/Av0+BAPfGi5tJ3IbG3MoB4klfprLVyj/S474
         vHd5fpKoGp48D9Bj2UFrkrwmH+8YA2pKAWCTUCCxtcZlJY/h34qzyZOAn3cIwyID1Rmo
         rteghBsp/pvHSZozAU3lOvXPLFZv43RvJXG1LsqOq8hVHyhhaLfBzTrpiiKhc3vTxZjZ
         2oag==
X-Gm-Message-State: AOJu0YxdCGD8LV2kucqDuVjiDe/qFZZX7qcbHUiJfO2jwcSMCq50+V2+
	3t1VUEaZFcAqa1o3ybx2szALW10BgyffA6YGkcsHJA3aRJi0lT9uOlwI6w==
X-Google-Smtp-Source: AGHT+IEv+/kO5upT+yVehu/ggUyLs+TNYWfB/dQqRjZ29hQEajuVBbX9KbB9r4nzOkON2wFQVQi3rg==
X-Received: by 2002:a05:690c:7208:b0:6e3:323f:d8fb with SMTP id 00721157ae682-6e9d8928abamr94962667b3.14.1730142297044;
        Mon, 28 Oct 2024 12:04:57 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:04:56 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 06/22] libdigest-sha1-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:42 -0400
Message-ID: <20241028190444.10522-7-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113297

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
index 22c6d3d33..dbfe8d3d2 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=10;endline=14;md5=ff5867ebb4bc1103a7a416aef2fce00a"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ededf5b90296fb943cc"
-- 
2.43.0


