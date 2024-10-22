Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BFDCDD0E3
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.21795.1729612098077909548
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FEF4qu+C;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e35fb3792eso57849847b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612097; x=1730216897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CZzaQ8zW4NaBm4fFgChd/mPIxdbcwD2zjqE++apC5k=;
        b=FEF4qu+C8fps32FRpfe0nBOiimu36UQUBdWMtqYssK35AsKVBbcHMCaMSDx5HWSgl0
         XPHf1pjTDCrLSU8Ejt8R8WadWtx8dfbmkArTWg4vlnDxLwdL16Iksb3CVMQivevqkii+
         ZqjcvivtDVAlOTFMHJ/d7pqBcEO69d+1AVRpMHkLdpdkHORrEfILSzKtKX4KBSFC0pCS
         yVBPx8faIeYZTxv471gtRZJHanUZozuUGokDArN1HqDdL/xp/BjHB7zTjYAwfcjlfRL+
         wt52ci/x6NrxmTW248Wio323/9dRT+qvybqtRRG+1vHZfWSFWQLf5jJeEmxHrRC9b1SB
         9+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612097; x=1730216897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CZzaQ8zW4NaBm4fFgChd/mPIxdbcwD2zjqE++apC5k=;
        b=f1IuuefxZRlzxvmZlyFEcpqjhvIzJnihhL/q+UGgxGGs8xz93WwU0ax4XRxYT4wQ5/
         UMjqkC0m7xirv5Se0AqUu7KBYP1+v2x+kMahKvbnEP93QPxNaGiT02xeD1u77hxs1cV3
         so7jDxBv6E7QpfUdZp6j3WG0EwObtA0RFvKHqN+xvzJr2QRYs85EeADL+PM+eWuMyUFn
         s7fMEcwtVOWfFtTgbQr2jGxGiAhyp8ILTHQHHab/SK3SrzoeJmY7f3szMCGdipFNnUQQ
         er4h1CTvUENSOwSrQiSDEoGbR/RXfhLHDPcwbMMnz3UF8o+/+aGBxAw/S/noMMFd+qn5
         dW3A==
X-Gm-Message-State: AOJu0YwSBD9ptpJI+udisQEl4Owy567WrsPheyvMdsahQdiBUFFMCvo6
	mDd3DIATjaCOHmPn18stTPTl1EUIZHkeq+E7+OJ3BKALfAElvjIOC/matg==
X-Google-Smtp-Source: AGHT+IF298Z2oRAAlN4V3V9f1Kyli3dNWSSBCCaBu1nc6UpI1bLS4BxS/e0rnVaX74K9uXGP+CNNxA==
X-Received: by 2002:a05:690c:6f85:b0:6e3:d6ff:2db5 with SMTP id 00721157ae682-6e7d3c0edd9mr42240677b3.40.1729612096737;
        Tue, 22 Oct 2024 08:48:16 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:16 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 34/46] libunix-statgrab: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:52 -0400
Message-ID: <20241022154729.20331-35-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113125

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index cf290d990..6b1c4e8c0 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -28,7 +28,6 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c195
     file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=2a4f4fd2128ea2f65047ee63fbca9f68 \
 "
 
-SRC_URI[md5sum] = "a6bc06b3f7749f7d77a2b1bd13402821"
 SRC_URI[sha256sum] = "16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b837745f3ea61d6afa"
 
 S = "${WORKDIR}/Unix-Statgrab-${PV}"
-- 
2.43.0


