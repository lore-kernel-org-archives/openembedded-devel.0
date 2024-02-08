Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441D0C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 05:58:24 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.11979.1707371899032154924
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Feb 2024 21:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EREA4kNX;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a36126ee41eso192259966b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 21:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707371897; x=1707976697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2oiNi9N00YAfZeGc2hXxUdua6/9UMOqQSV0Iznw8mo=;
        b=EREA4kNX29pAV62k/EnEiT48wW+m7OslwlXow7iKER18uS/c0CjZR9HNTIiqexLWi9
         DaC6JgrqO5S6tzwFB1suxhtY+ClmsRGTweRiNruC/SZeI2bB7MPp+t3U0qe80OqPWjpt
         Mse6p1sXIU2LO922Ge8ihPoi+QYWiRLxmCn4J6yGKqLYeOdOPEbz/pN2m44glHx6UqoL
         lhLwM1yK+mm8ZkXNY6xs4QSzqhzdhCotk+Qw9hyvquaFkrp2KnlnqlFltqfQKbBAybuX
         2/S1wK0XgrcNMItLTYzfUwbeEsXrkhhpXzm0nMnkexsgsK5UHLs9uBqANcAZWp4wfSuJ
         thLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707371897; x=1707976697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2oiNi9N00YAfZeGc2hXxUdua6/9UMOqQSV0Iznw8mo=;
        b=ezPAmO+l9Cps7n0d1ZjGfXselkvLkyxyx6VKoBsjiwPVGng/Y3/wZfyOBng1x375AH
         FM1KVB0XVtPnWu1qV0RO9WfKBkvKXL2a/LmH59YkoIklWySs9KMHWiXQVTMxQydhJ2SI
         BUaRrxGHuEmWgG90fIwjIU57cB2sRN7ewumlSbgdtIO1q7jymAK7lMFeVsRKcIU2B91Y
         h5X67r13NuPtyVr7b3O2QT9TY9e7eLETWmBpco12n+iOXPdszwP0O5UGdwqwr/CtE9wT
         l/58dfNJpPfSmzgfyUHfsHsOz/7HUMjc/iG7qxQfvYcylwXI1/3c9ALUhqx7EwTzky1J
         JKqA==
X-Gm-Message-State: AOJu0YxtGX/obr1ITqBrr1OoxfTATrBR17vyyrz/dy96ga8aF/nYHUcZ
	R9IDm0Pp60R3mRqYCJo56JfjbBK6TLO+5glvKaFCXYB84xhoWuhsJHNEWGBL27c=
X-Google-Smtp-Source: AGHT+IHLsZbD5J8cUz6D1cK9tdIRx5w7as4iBevuHvlKIMmxYBo2L9iH39tJZJJlCg6xChVsebqOPg==
X-Received: by 2002:a17:906:1ecc:b0:a37:6aa8:6885 with SMTP id m12-20020a1709061ecc00b00a376aa86885mr5676346ejj.19.1707371896356;
        Wed, 07 Feb 2024 21:58:16 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id vu6-20020a170907a64600b00a389d9101c6sm830208ejc.224.2024.02.07.21.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 21:58:15 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-gspread: upgrade 6.0.0 -> 6.0.1
Date: Thu,  8 Feb 2024 08:58:12 +0300
Message-Id: <20240208055812.44945-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 05:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108656

Upstream provides a pyproject.toml which declares a flit_core.buildapi build backend for PEP-517 packaging

Changelog:

Allow client to use external Session object
Remove-py-3.7-support
bugfix/client export
Fix oauth flow typo
check oauth creds type using isinstance
Fix type hints at find method in worksheet.py
Fixup get empty cell value is None
Fix missing attribute spreadsheet in Worksheet
update migration guide

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python3-gspread/python3-gspread_6.0.0.bb       | 12 ------------
 .../python3-gspread/python3-gspread_6.0.1.bb       | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb

diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.0.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.0.bb
deleted file mode 100644
index c04b1568b..000000000
--- a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Google Spreadsheets Python API"
-HOMEPAGE = "https://github.com/burnash/gspread"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
-
-SRC_URI[sha256sum] = "3b5efe315aeaa290d21befc8ee7bb0239db78c7b495d8831ae29fd1a182292a1"
-
-S = "${WORKDIR}/gspread-${PV}"
-
-RDEPENDS:${PN} = "python3-requests"
-
-inherit pypi python_poetry_core
diff --git a/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb
new file mode 100644
index 000000000..7854b7562
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_6.0.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Google Spreadsheets Python API"
+HOMEPAGE = "https://github.com/burnash/gspread"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
+
+SRC_URI[sha256sum] = "8c8bf83be676a019d3a483455d8b17b442f2acfc620172f245422ca4fc960dd0"
+
+RDEPENDS:${PN} = " \
+	${PYTHON_PN}-google-auth \
+	${PYTHON_PN}-google-auth-oauthlib \
+	${PYTHON_PN}-strenum \
+	"
+
+inherit pypi python_flit_core
-- 
2.25.1


