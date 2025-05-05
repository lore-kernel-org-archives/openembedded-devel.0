Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06187C3ABBB
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.47894.1746443942706147826
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 04:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j0UV41Ek;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227b828de00so45583345ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746443942; x=1747048742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0LQlIIiCkTPvNKi7E0MZJzMM+WrNh/PTucFy92claY=;
        b=j0UV41EkcbD4gVmvhf5SUWZu2vQtZB0OqQYVxwptUQE64ic8wXD2oGyiRXtv3K4m5S
         QWhZV4UjpjDww3Ion551N5ECrl7CwdC1pMX67ZvDGzARNviaBosP6ftO590LhSXN6jT1
         EuJb6zkjWkBnzULGUDgQ/jIWq9fRLKNta2+h0bVQyoj5v2NwEEjLszPJ+VlkmCod4A9V
         BEk4BpUKV/jtzVz27egYoBD7yMtr9xmQfFT7TNkZxxCtZsuenSdaXsU3AhlBqCKYZp0I
         h+YDImT8wS9WvEag4pffL+EOarW8nZD0l0Adq1Sv2H9UgCpeTCdH8yOTclNCOPkFxRuD
         h49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746443942; x=1747048742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0LQlIIiCkTPvNKi7E0MZJzMM+WrNh/PTucFy92claY=;
        b=UCjoMNGNWOMsiB+5ZvLaFYFpEQj1Vfpl5BS8fuEAOyCQ5S9g1bomq3sGGeIODGo32C
         H021IzzP9KsgZ4gWTrjt/sb6kCNIGT7J4wgNKfOpvakpl2raZerLrMC8ys7QVn7RAFyk
         xkbYD4aI2OVyRQKh5t/MUFH5EvrjkfWZGOlnIVnLdGeacLNgQ7D1f3TP/aPh4oEYkqD/
         NQkmAeZoURh70RjxMLEyDLKfkdo/LAYX2zDdR5X5yFjEj4iKpcgcawIJ58WHucTwG1PF
         nIvD7QSe6TqSs50nAtE/lPCPjtiYeY8doMT21UbExrUg+bzlF92JoTy/KgskADTtUMNI
         eKMg==
X-Gm-Message-State: AOJu0Ywf+tWY8ZsjV4GfuF0gwpwIFcwy5h5iXYA5Lc0/VpHYQMZv2DQ2
	FpZJCFCnqmaxNTvKZXxuVJoEgrNPT3DPzFlGTUEVIknPSJTIz+4ilGFc3g==
X-Gm-Gg: ASbGncv46cmIvRVkI3/NAHgHr4SWD79QCz3yfB9vlIXDLwTpQIuHRV7/4Zvn1A02StT
	EZk2B82iv6CEuftQgXf9W6xBEmfsVTM7zGLl/5XX2HTPwqvliDcySRZ9qrPyV6fsnPHTLyIfr6I
	zEU5DwRXNd2/QmMFhKuQ58vJ7ZjamfxSWqOzB5muA/6txLIPz/+4ZEFMrSxqvunYU/koYI966Cc
	PLw+vfEn2Ktyo1Lnh6X+c4JvtotCuS18CvJgyJ2YTGMd6sNfJj0K05Kd99SdraCcx338Fj+tlaK
	GmeUt6jTn/bZlPlPV8gSJzTs5aLgLdrxsIm53bRIIbI1MeMkfr2ioAwoGbboxV+iqgu61w==
X-Google-Smtp-Source: AGHT+IGD2lAHuiV+BTnZVlMEfA6odku+mEKU9LJwZgn03GHEOuXnYUCwIAchXd4EUlREQ3rHyFQHfA==
X-Received: by 2002:a17:903:2acc:b0:220:c813:dfd1 with SMTP id d9443c01a7336-22e18c3776bmr167214675ad.36.1746443941314;
        Mon, 05 May 2025 04:19:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90fa:f3a0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150ead69sm52069895ad.24.2025.05.05.04.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:19:00 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libserialmodule: Async C/C++ Serial/COM + cross-OS
Date: Mon,  5 May 2025 18:18:49 +0700
Message-ID: <20250505111849.13909-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 12:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117314

- Depend on: "simplelog-topic".
- The first version v1.0.3 is sent to OpenEmbedded.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libserialmodule/libserialmodule_1.0.3.bb  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb

diff --git a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb
new file mode 100644
index 0000000000..b7cce88a3e
--- /dev/null
+++ b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A library for Serial/COM"
+DESCRIPTION = "Async C/C++ I/O with COM/Serial Port Library."
+HOMEPAGE = "https://github.com/thuanalg/libserialmodule"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
+
+SRC_URI = "git://git@github.com/thuanalg/libserialmodule.git;branch=main;protocol=https;tag=v${PV}"
+
+SRCREV = "9cf920aa1d3ef1d4a4de9a19e695717a6f097894"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+DEPENDS = "libsimplelog"
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE = "-DUNIX_LINUX=1 -DMETA_OPENEMBEDDED=1"
+
-- 
2.47.1


