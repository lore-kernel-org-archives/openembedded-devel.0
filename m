Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED256CF2577
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:12:42 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7542.1763525559671349243
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RRywY3rS;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-343806688c5so6678405a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 20:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763525559; x=1764130359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTk2/uYYBZdebEeiDObinDeSke4pYkO/VmpsKfrKFVM=;
        b=RRywY3rSYIxyF/KZFzY1Ewvc59ggb5fwi+FmF0vSbceRelKWaV0gizn/zzXQknVqki
         Aed4F60EiB/t6QeefTM3bkKCp812NoDvem1P+qoBZL8lbSQUE0vGuYtrWmr/M004UHRN
         Kcu46J4m3/LqDdRiUD/i4YvUw4rQ3bHc1/aqy4y5udYuvYxrf5iLX027igS2RNDbtvhS
         62YEDW5w/gdb1YjPfqkZycBnZHwVAijg6/WWHrRaOzR7LujW+zWUk/TC18R1jFlv01O2
         /Qfur6osuLXOe1I7u1wKc3IEo4EoLchiWECQq0vgqy4ah7ppgK4rbXv+yUBsvWpZ+5BN
         I+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525559; x=1764130359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTk2/uYYBZdebEeiDObinDeSke4pYkO/VmpsKfrKFVM=;
        b=m6puDH5ecxIrYFRN5fxdIhqqlm5caxV7X0NYzlRBPxhWwS7B/0zaPX0d+yyDk/tp+b
         nkkjgVzjqwcCtMwdaWGKJTKnHV8EG+TsnwSIhYo2HQSVJq77NV1wKzSqkJ9E2yw2Sk0M
         XwDgKDyvrhRcd0EutdLW3e5+9wTFWtRUetwkztSeT0E0oiynVtfiaFVMwWUxxzEveSQm
         utJBW9P/35tT9Imx2PrFnhuZZih0Li6h6VLv2BMfmgbZTJvWnR1Bbg8zyi4cU7c9G/Od
         aMVgLirizHzMBjntsvfnSm04r47k4tU0VEZUo61i3NMjaSs7FkVjXGvBXe+WZnw8ZFEp
         9oUg==
X-Gm-Message-State: AOJu0Yxwla4SA5VTCLkWcoO6uuX3OqTxcNqSD7igH2zDEJw+vli01oRA
	H2Jk5b6X3X9zC2qg7r2uD0P8G9wjaJsmgevNDmnata8KNSsLNH7DQZtV/VFs+kyg3Jk=
X-Gm-Gg: ASbGncsewP3NSJ9j2zB/EJjpO8EohsnsIUt9Cms3qwkCrglX/bCdF03rjEj1oVbVAfk
	KNoM9HC/mJTquX5PB5h7dph9z/mikkIb3iXgjBTul/3lF7MTKn7ZOZ4KA0qJJtVnLqnvVvpV04r
	h9r08LPLCML/F7RMgxJZ+fBOKfshbAZKKHXgwvW50RGLK44+2kdILcHYyWCruYceDgaZqfgvJeU
	XRw7VXDFk7GQj83jDRfo8D7Iy0Op+zx5KXX8Gm7G6Ye9ceMX10uRbjcsyy80qTHwIh5ICaVXq7v
	RxwNMiiM1C/vBFVnx54itsx8jc1p4qCkLnEZff7iRkbadxUVtWhJ04y5+hOyE/FUTzIAZdS3X/8
	tYwdu55WLBIrmgLx8U+2TimkCbQmal1bgmQjmuKFoIclxBrxUiRlQAk1YQBmkpgjTILQ+Azv0E8
	SCLId49PALYKwKJndfkLNFokfD9lC2gwXrvIL9WJKkD/IAJGhQRzQ/vHn/qht5v3MJgS1qMMz8K
	uE+RDW2b3kXs2bB1TDWxuuxwNqTo2pFmMKqHzAEiDA=
X-Google-Smtp-Source: AGHT+IGQRc3mKCj49VAbW6zpw1P9msT4qlor8UQcjkpVK5tWcVyXFcKFBpXkyHe6ld/NBnsS2pVO8Q==
X-Received: by 2002:a05:7022:2398:b0:119:e55a:9c06 with SMTP id a92af1059eb24-11b4120e9d9mr11145692c88.34.1763525558370;
        Tue, 18 Nov 2025 20:12:38 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm66819088c88.0.2025.11.18.20.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:12:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 1/9] python3-pytest-asyncio: Upgrade to 1.3.0
Date: Tue, 18 Nov 2025 20:12:27 -0800
Message-ID: <20251119041235.2448193-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121875

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-pytest-asyncio_1.1.0.bb => python3-pytest-asyncio_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_1.1.0.bb => python3-pytest-asyncio_1.3.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.3.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_1.3.0.bb
index 424a68debc..50fb5e6ef0 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "796aa822981e01b68c12e4827b8697108f7205020f24b5793b3c41555dab68ea"
+SRC_URI[sha256sum] = "d7f52f36d231b80ee124cd216ffb19369aa168fc10095013c6b014a34d3ee9e5"
 
 inherit pypi python_setuptools_build_meta
 

