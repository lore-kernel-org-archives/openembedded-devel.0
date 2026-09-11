Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB0FC88E45
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 23:43:52 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52206.1789170224838208318
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 16:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HmYQn4tx;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: raj.khem@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so371494a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 16:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789170224; x=1789775024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AFwBJk527hDtxMMRZBP8f8L1Sgyky5BlvEQu8aNyt5Y=;
        b=HmYQn4txirpaY4P9CkDwgxygKvvNyH8/i1Wigp81+t4Y8Ohj3/Ha1hyKaMUgUeZ6Vj
         fYspmOz4EKDC2DnoD40NPgUBlhWPnR2sUKZLrjqSrJvhwaYMD9JaG1qUHf41BQWxRLz3
         220UsVIK7vdUOSgfMzLUs7q+V+fQLWzjf7JNgTfVbmjpwnUakn/UJdMdLCnHxT8ybOlC
         tVxzx8ZRjXUdtDoJ0W6ecPD8pElzCoTgg1lXLIsUrjn7cfOTsuExuyLjestwljeYx1jf
         VHWwK2+Z561dOGIQQitSyd9fMgmw1Ogk5I2+ML1LplMPgU2GQjd31KNIV2Gce678kk46
         oCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789170224; x=1789775024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFwBJk527hDtxMMRZBP8f8L1Sgyky5BlvEQu8aNyt5Y=;
        b=aJ7Tr41q2Y9i2AfFx24kSjWh7fqwatJPybsuR8FJ9nUoeh2NqE2TlvNkOcSv8BLeff
         /Ln7jOE7u1QaMmLGP989vtVg2pFt/Vq7RG3T6mXfah8LxuvK13VXGtdDYKbV4knr/987
         E6dtWm1o7CrpbBfNZcwtNX1eDDVgv3IM+NPCO0ed0PnSXbEb9u/7GPjqvWhm6dXpXidm
         MCWJNWeAkb9aTCzcv9VXIZOZl+nl9isuvPel2PYlpU34Rv51ziT9s5qn06PwaBQsB7Vd
         3YzU2GRHaf9yZ8b26Gl5NnC5QvrMNsel7IzTSz1oIUbIaxNMEfWFa/enMV0KVNGaJTgp
         uZRw==
X-Gm-Message-State: AFuF++mg0X1PK6Yuzp1xnsIskf2rkk7fUw+ga0onpRB+bpKjBGomgTbl
	GCA5esF5pOzZeMZqkTsvNoxtYiMnvsI3WZkQ6Nw7VFKEbk6pHntYxDXgu96aJw==
X-Gm-Gg: AYBFou0xQK1qyXHKKlIpNSl0Daodc+y9pr6O3u20CiaW0RAdfT00PeSx9Bl8Vz5EwdP
	AVX6ptT7NbNA2vunviMjrxZAM4OLveZgzh0VcL35l9M1L0nps69OlIqvjkqjNmeFbeBvb8w/3Sn
	4FaUjmzYALLyffaMBnex65zxbmdX3xuTERoOHlLAxgvkdTovmbNjFOXIjrjFE/ljXtWX5HjdduY
	7kkacFHa/2wMJ2xtACXmC1fveqKcmMP47E+cLpiUQJoIQDbdvdVjLMJUwh/Vum0EwzvGLJU4FRD
	DfcsdCGKDSXk/iK1llMRY6UGD8ooNyEHpyXSHFHkn7+mlODrWEYs8PsFEO64DO0CMvhJuA+cSmx
	Q7zF9RBV3iqNp7gljQ5gck9+JZsVZez0yRzbtA2vYsq2QQTwtQGNkU+6GwJltyQybGIiAGe6FWu
	HYSdeN49hqrr3hLr8ujxLOFZVLdR6ZCkCu58qwOfFYTYvGH6dU8I9t/QPoIADOrBd+Ch/KiSmsJ
	4xoRZhzbeh0I9+UL6o5ic4JAUBXqdyMdMh9qQDs9bzb6RnW52Lp0yZ0bR9PLEyRfZtAusnYmIqv
	rM9TfBRyTodCz3PQQpgKkZp+SJ/6XhA2d1Z0Gob1nPk5bhkDubJftVqO/tJcimNuJ81pw5mXyVD
	kOJUny+mDPVJNp8HkQVCyg/Y4Ci1C78bsB5Ryu5I9rOoyYg0JuciSEexJ
X-Received: by 2002:a17:90b:270e:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39d9c1fe880mr11975436a91.17.1789170224093;
        Fri, 11 Sep 2026 16:43:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f06423sm10278654eec.20.2026.09.11.16.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:43:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] polkit-group-rule: Set S to UNPACKDIR
Date: Fri, 11 Sep 2026 16:43:39 -0700
Message-ID: <20260911234340.1192939-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 23:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129976

It only install local files from SRC_URI, so nothing is ever
unpacked into ${UNPACKDIR}/${BP} and the default S never exists, making
do_unpack warn for each of them:

  WARNING: polkit-group-rule-datetime-1.0-r0 do_unpack:
  polkit-group-rule-datetime: the directory ${UNPACKDIR}/${BP} pointed
  to by the S variable doesn't exist - please set S within the recipe to
  point to where the source has been unpacked to

Point S at ${UNPACKDIR} in the shared include, which is what oe-core
does for file-only recipes such as init-ifupdown and keymaps. This
covers polkit-group-rule-{datetime,network,udisks2} in one place; the
do_install tasks already reference ${UNPACKDIR} directly, so packaging
is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/polkit/polkit-group-rule.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
index e8bbf48c43..0c2531b3e6 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
@@ -1,5 +1,7 @@
 HOMEPAGE = "https://www.yoctoproject.org/"

+S = "${UNPACKDIR}"
+
 # polkit must prepare polkitd group
 DEPENDS += "polkit"


