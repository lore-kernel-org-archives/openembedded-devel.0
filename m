Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396B9C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 22:41:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.8175.1707172868462241945
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 14:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E/txiWuJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3392b045e0aso149572f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 14:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707172867; x=1707777667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sYdx2y54TdJj5kWEnFE43ExloMFxAmnkNdIL3SEWf9s=;
        b=E/txiWuJ/GKwDFc15Dki9Znab976gg4bI1OP34Y13Mn2JGuPxx4Y+1LAse4r/v5qbK
         Gqkvqk+E9ldwP7jJKGvlAJM8KSfj7uAsNHwkbmgwOLTbXs6+PGWbdyfWayk958NoTwwu
         FG9DW+Dlo24nGL/iGqPNuSy7jDUA3LBfBKCj0kRwTml/svw3PLaV6R6tDisLbFICZA1F
         JrvwiFA0q5YslsZKHEa8ZRwN6NrJVGCJtB5Q3Zmup+IM4M3H7mOB/IY6lAqQWF2rJoET
         u5MNxYRZCdyvmvZeUnmzM9zzzNY15BlQw6aTMrtjY0umP8KqFVXbpG0WUZ8yAGayGKev
         VZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707172867; x=1707777667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYdx2y54TdJj5kWEnFE43ExloMFxAmnkNdIL3SEWf9s=;
        b=jjfcwUelZmomfrgD2sm6AzUtlsfQBzqNzfVIsz0lYF4gnVJrUl0d7ENs24O2W0zq+W
         UWNE1Kxk9Jna9maE9Pa9z4a2UAVaB3Wa5z5+M6Ri1nvYSA7Mpz4GhKrnk7dKVBdEyv8t
         V7Jf+tG1/1tvsO/81nOCpgAkWdi7hajxmzL0YV7iQMtYpdlc4Osl44QbyfIq9uFeBNXc
         PbO61CMvuvsmV+caJvCnhbodEIqyhHka4+QHmqbP7BEW+Yy9VIX8eJi/9QRdItZGn3OQ
         IhJCgUw6NIOH7QeIC4P9wkuEVmUSuX+QOYKpyJROGxRUigm0wOwtCA6JcjRuhsucC7xb
         MjWQ==
X-Gm-Message-State: AOJu0YxBgGuWMzRZouOuM9s3sYc9zd+k0hNC4AnnLgl64yPcr3VTac/w
	bs9Hl8P2kTBDSmDVZEfjMFontyLd55inw31Ce8r9bWcf5q718PAjD5YNtiex
X-Google-Smtp-Source: AGHT+IFBJk7sz7RcPut+GQ6+p+FqNTlHbU9lhC3nqESQcoaMeMHkxQBUphptopoaI5l+330UbtirNA==
X-Received: by 2002:a05:6000:1112:b0:33b:3d5a:d9f6 with SMTP id z18-20020a056000111200b0033b3d5ad9f6mr632282wrw.50.1707172866532;
        Mon, 05 Feb 2024 14:41:06 -0800 (PST)
Received: from swi-bsandu-l1.corp.ad.wrs.com ([2a01:4b00:8855:a800:7210:f9cd:5418:8874])
        by smtp.gmail.com with ESMTPSA id r22-20020adfa156000000b0033afd49cac7sm589824wrr.43.2024.02.05.14.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 14:41:06 -0800 (PST)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: upgrade 2.28.4 -> 2.28.7
Date: Mon,  5 Feb 2024 22:40:43 +0000
Message-Id: <20240205224043.128370-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 22:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108584

Includes security fixes for:
CVE-2023-43615 - Buffer overread in TLS stream cipher suites
CVE-2024-23170 - Timing side channel in private key RSA operations
CVE-2024-23775 - Buffer overflow in mbedtls_x509_set_extension()

Other changes:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.5

License updated to dual Apache-2.0 OR GPL-2.0-or-later.

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../mbedtls/{mbedtls_2.28.4.bb => mbedtls_2.28.7.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.4.bb => mbedtls_2.28.7.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.4.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.7.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.4.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.7.bb
index 80ec8a5af..9a6487ccd 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.4.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.7.bb
@@ -17,13 +17,13 @@ understand what the code does. It features:                          \
 
 HOMEPAGE = "https://tls.mbed.org/"
 
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LICENSE = "Apache-2.0 | GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "aeb97a18913a86f051afab11b2c92c6be0c2eb83"
+SRCREV = "555f84735aecdbd76a566cf087ec8425dfb0c8ab"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
            file://run-ptest \
           "
-- 
2.34.1


