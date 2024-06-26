Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58AAC30658
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:50:21 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.28804.1719413417895971596
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=v4ayZO26;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.167.177, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c9d70d93dbso4574133b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719413417; x=1720018217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D9qKHqWpXVZDmIG6fip8SA4QremAUWov3oMo9/W4P2w=;
        b=v4ayZO26si+XcBSohtBDUt17KlkE0LX7Eso1KIPaEqjV5764g7DJR5W7YUF0Afl2c4
         aP2H11tcKXV/femUDlO9QfcjQqxJ/XJeKMAiitFvEqKkZHbmI6vBRq6ckXg//j2NRO40
         LF6N0TYafmaWaxLryVTUUtNPDW1TtRQkyv/s8q3iyoruryQL90GhPmFVfydAyD8/Tqvh
         aMs/UbCVTe2yECe4ThCVzUyxnKDbXBaxcIKUVbQ1aQ7U+OCw9hv4iyeSCAS+P85rSJe/
         oKAdbuP4I+jUMvghODPME/CFvBgB2IhBYaD/4KwiN1a4EpNu/kRfKkaKsyiRA4dClWZj
         uR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719413417; x=1720018217;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9qKHqWpXVZDmIG6fip8SA4QremAUWov3oMo9/W4P2w=;
        b=nh7VBLj/irlLSGexPbylWPFTT8aqkVsTfgMX7+4U2hKMFmzkq3OreDg03Qbh0FIacM
         b47hcbYjK58YOmabJCsuqN/arTBdonQYQtoGDx87IEAI9jKI+y506CCzjYHed/lz7BsG
         0zZ+Y13dBF1vuKYMCNdQyvNXpzl/j+WkcJpzVF4yveduLqwVZx1dfdC3DKU1oKWuIPS9
         ikg0K473YxA75VfjjPnpH7/2tDpwawOO/YdeEjNP+KaLKc4XnQK5NWdCkUyp2T/2yDbM
         w6xNkV13ItwXNjY9duZC8hpMm65cggcwI8+8R6+xQKbPzsUoT7wudjzEk0mrqjFiUVzV
         uUmQ==
X-Gm-Message-State: AOJu0YzapxTgfpV0Wcdyx+Zr09/f96EoIepaT+LIFggSs6IT8IRcHub6
	Muwm5fIVkFoH1j0mQ65b0vBaPYpnkuVplu6hyNfn195IYLHawnq1nEruA1TbgSgx3ow74LCUUc9
	9
X-Google-Smtp-Source: AGHT+IF+ko946KSVzKGd1tKYQphgejOe5boQ0F87Uaq5Ck0r8pc7cBYuGnAfq2pHQdvaEuZV1jFL/g==
X-Received: by 2002:a05:6871:70b:b0:24c:b4da:725d with SMTP id 586e51a60fabf-25d06c7d9e2mr11183196fac.33.1719413417175;
        Wed, 26 Jun 2024 07:50:17 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70682d98ce7sm5826308b3a.39.2024.06.26.07.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:50:16 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] libraw: CVE status update for CVE-2020-22628 and CVE-2023-1729
Date: Wed, 26 Jun 2024 07:50:05 -0700
Message-ID: <20240626145006.5537-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111103

The current version (0.21.2) is not affected by the CVE which affects versions earlier than 0.21.2.

Ninette Adhikari (1):
  libraw: CVE status update for CVE-2020-22628 and CVE-2023-1729

 meta-oe/recipes-support/libraw/libraw_0.21.2.bb | 3 +++
 1 file changed, 3 insertions(+)

--
2.44.0


