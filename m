Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04501CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 14:14:30 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.774.1712758461780923668
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 07:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=CszjSNF+;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.52, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a5200202c1bso190704766b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712758460; x=1713363260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7rrytSGrpH7y6i9axNSQxIIiEuptZSjribV/YKTBw8=;
        b=CszjSNF+3qx3/EjXSp9etuI1bX4iMdJzU/mh2Jw4wsf+wSV99Bt6fGGutqwERdgrmK
         OxJe8kYgbCftSWOaQLTKLKMxm4H2LZtDtrNlQXR4P0zMJhlmGgX6yPiGdvJXlAtjxFu+
         CIY0EV0xial50Lh+Su2032jZPLEqf1GpbSaCL6oqTxHPvdg8ZiGSI3ohXzlGVU4QnkWa
         dNBs+ytZk2D/KOzhtC1RL5LjfEYlGW+46dFWfeBL9eU7+ehpwfKs0QXQl3rvKitB9n6N
         t/Rn3p2i/DLSJvvTr7Rp+RdhMFkwNMU6zmRYAdpUkk/6DSCGfQYT14Lx7rNH8afOee7j
         iUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712758460; x=1713363260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7rrytSGrpH7y6i9axNSQxIIiEuptZSjribV/YKTBw8=;
        b=CaYpWidE3miXU56obKd6w0+YGi9T4Vk/3RIn9y8t9xVmQ39S5JPsgheiBAq3LhvTsB
         mM45d2QpM4CaPlh77zOGdNYB9DBXtucSuSC+AN9MWPakD/Gjca40OcK+d4duv2IChx8y
         R14DMLa0FxBvlWJuERT6+UPXol1Nfkka7aY1ueyR1zVwhqedd/qxB9rn2sQ8zKB7Q/g8
         vxJG6F9NMjFiSPnAMHoAnpWRyRQtddCe2XAdRYRYcIVc9j/g1ZU0ai+s8OhFxQErUDe0
         WIbYaOh+jpDljxNexnEsvqImk0o+vOMkc2oRKNlqirO//GbtI2jclkLdn82rxvPj78ZT
         UsAg==
X-Gm-Message-State: AOJu0YydB3byd7D2URvCscee1xDEa3aoGVmZpAUowKC1ZBFScJJbNiHM
	Yl7unxhb/tH/BfaHaNR/OyA6OOYFDO4EIEb06k+Yy+igUe/xUOL6zsHUWFUATxEuGSNAK80jQw3
	E
X-Google-Smtp-Source: AGHT+IG+6mGZxOZ5zplJiHulFy1fHS9xKVuLCVYr3gDKK7eJMAVVJtmu1C6OLXzJ7yps7NbLPBnh3Q==
X-Received: by 2002:a17:907:36a:b0:a51:b18a:ec07 with SMTP id rs10-20020a170907036a00b00a51b18aec07mr2108161ejb.9.1712758459724;
        Wed, 10 Apr 2024 07:14:19 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id nb33-20020a1709071ca100b00a4628cacad4sm6965662ejc.195.2024.04.10.07.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 07:14:19 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] civetweb: Update CVE-2019-3821 status
Date: Wed, 10 Apr 2024 16:14:15 +0200
Message-ID: <20240410141416.44152-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 14:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109897

None of the affected versions is used by meta-openembedded.
Affected version: 1.12 and below
meta-openembedded version: 1.16
No action required. Remove this issue from the CVE list.

Ninette Adhikari (1):
  civetweb: Update CVE-2019-3821 status

 meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.0


