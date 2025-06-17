Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57098C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:06:03 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.23290.1750176356353339879
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=caF2Joah;
 spf=pass (domain: baylibre.com, ip: 209.85.219.53, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fb1be9ba89so49329316d6.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 09:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750176355; x=1750781155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0FD4J0YkcYj2iyqzuW8G4uSjVSJdP70EgMx5l6yPZA=;
        b=caF2Joah1gyM97IUbSrfNK4ukbDGbLR7zeyv48fk1oyBdjG1QQVn5z4vIrNAOHN9Op
         FIL8sYzryANtZbP3T/RaPL2OxQKWDn8ALmuknTkqm/182P3o1LBx46MI2GgVv1GGdMFZ
         OOoP8luYGsxIriziHyKOlOAzWY3g7bXeEwen3biZ69I1CQfMOCqSDRYitwJgMjUM7yQr
         2ydyvwuBLPVw0C2ojTYvmYO77I3LMVbkRC4m7/JCe9TxB7Re3Si+LcFoMMcErWDAIMwh
         99F85Up2Yt0lhjfwAJPy6GvROy44fgczBJ8+mryCRadLRAmdpk7Tjko5BQ3E+ihlMBtg
         T1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176355; x=1750781155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0FD4J0YkcYj2iyqzuW8G4uSjVSJdP70EgMx5l6yPZA=;
        b=TaqOLi43NQeeq+bqHxCSCnudsAKUvJnkSL84MdSJjTRbmrchR1WD8ov1jtFmemDLEC
         iHv7Ne+qpAKd8qxwXnzpgdx5n04bYwbeBsC8IlL59Iy0BdzZVTGFNQJJN4ao4o/TCNB7
         4XpyOI+sGxDhfQkvuCCD8ZiyRvqihgxrt3IRJOllg5Yp8XpqGyDCDvHf/UfTq+QR1KEc
         n2JJTfIf5O07AJwUhYJ7iFus0mjZIH3JPN+DnhxmJG5UUc2B0XKtsEn4q9HgyzK+4T5H
         XPBCHglg1716VhMOsZpXd5u3h/L3a8vYxKDlwlHEEyClZ7NWK2rMArMhX1Xwv6TC7sET
         T0VA==
X-Gm-Message-State: AOJu0Yy4NbpJV0R6iD00+kSXFFfTzYO13+ggHSzrH8KMJ/HJydO/Ij4+
	8AXg+ZLphFIx7yjK2LjvA5Zo/wS2R93ITfd5J0IQazctvXprioOud+E9BLfepvHyFfYpVgVSS43
	O9IYPpmc=
X-Gm-Gg: ASbGncvmcl4DHpCFVFjcb254AYLXFAmU0qEB+H8G03n0X0DHv9zf+/FhQMuuwy2nAQg
	pr9isOJHhPkHbyfqbHDm8PlhyhP/IyOCCwk/RBfUPugaC1DjMZD+FX/w2QS4L3yxsQv5HXku67O
	Ir7dgZ5lADkrPwKThZ1rtwOvf+UlNwoybs8z35I2XRao4CxEPw5EhIKiuas5OcOf+W2VNKSbVx5
	YWb0Oe5gBVhe0VAJaBJORBQM2ZMYM7jrSOGj3To+Qw1Dc+FcaADiY995b8/WeeIo/GmYP+eDG0+
	EmpF7QmBcInMEdE2G8ojIqx33JHcSMDeKk1wW64MtWvca5/OMZaTnIHX8vfA07bmHbf3g9p/CMl
	Pz0y9jA5qMxVG/lFb9a3kBQ==
X-Google-Smtp-Source: AGHT+IGcooe1A1d8xlUzlS7y79AUXAg5irA9etRJ4K+MngAZJ5YPIdg069q8jFsBZ/BxdpAg1gNCbg==
X-Received: by 2002:ad4:5744:0:b0:6fa:c23d:37b5 with SMTP id 6a1803df08f44-6fb47794780mr221195986d6.20.1750176354614;
        Tue, 17 Jun 2025 09:05:54 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb561aa7bcsm23668086d6.30.2025.06.17.09.05.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:05:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-colorama: remove recipe
Date: Tue, 17 Jun 2025 12:05:52 -0400
Message-ID: <20250617160552.1316699-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 16:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117928

Moved to oe-core since pytest needs it.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/python3-colorama_0.4.6.bb               | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
deleted file mode 100644
index 3871244031..0000000000
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Cross-platform colored terminal text."
-HOMEPAGE = "https://github.com/tartley/colorama"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
-
-inherit pypi python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
-
-DEPENDS += " \
-	python3-hatchling-native \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


