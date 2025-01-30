Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59EDC02196
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:36 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.6260.1738274310698212553
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3cfc1ff581dso4163385ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274309; x=1738879109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HiEmYREsJAuEU4/ykOLpzatpeYmEsj/zh/Ij/99V5E=;
        b=swWI/QNeH+VOAoEBoGgXlFbHWlJUDQ+jSIzsTcKPQas9oFhdorL8U4lOuULEFq3pXs
         Qn5MxjvBffMG3E/hY+XS0srTYw6vx025ciN/iY/CQ9kNdjLfxY+ueOkC+jwmDpeLtkVf
         Im7Vnx5WQGWPgJtKd1KuWHlr2uCmZLuh5xQS/f/ApMTgnyAxmdRlJPa/kNr5HjLCqyDU
         bCZloLFH/Ux8N6XK94Uk8avWkJTGEildQ17in3XmY8oj3ef8NDEFw6E2nBQpqNhvVcjJ
         uOWG/ugcVfuLN7EjSZyFkCNSNLXI0mReTyTDmwl94cTvf1UtWAmBLgR3tJBdVJtZdVoo
         h9Nw==
X-Gm-Message-State: AOJu0YzxRa3H48UZtAc+uMY99scraWg+RUfyNK0X0KZGiW+3RZZJLPGP
	tZ0rnelUamdl4TgjeYeUPwXKYxqok1CStgQUCjnh135IreI3DBa/kePT/pejeUw=
X-Gm-Gg: ASbGncuLoMJsj9BzjDofi+u61i3gx99RCsFkm2SpaJYHT5W8xvP2xN1OmEg6fZesuCm
	VFSzHXZOC0P+iNTQxvz5s5FMNw0TESFTH66vRS/rnvHGuwRr4KjY7Jg2H4bTLI/tg9Q4BCZHfGC
	fXsyx2ZdOfiFslYb9kaqpZrCOFwYzzs6TDE/fp+y/bn0iiRcjerjd2RUDHzlZRFGJe7ALx32x81
	ovbZpqiMV8xUG4T2P2UsiuOV9ZdiocKPUH/06QkWk3gWQunJalptEB3WQyya4cFnt22t+qm2EMh
	SGKrAY8I0AyKq52KOSez2orJv/+piG5Vm/VG3uRe3NnoGins3Inb6LBEHPo0
X-Google-Smtp-Source: AGHT+IECI+4oLq2bGbbHWMySLXCFdO8GVNgLQtOEbg/1giWWexxhZuJp2yXKlFMhU1z2cj6DY6JHAg==
X-Received: by 2002:a05:6e02:450d:b0:3cf:b5d2:cf29 with SMTP id e9e14a558f8ab-3cffe6b81bfmr59427245ab.20.1738274309463;
        Thu, 30 Jan 2025 13:58:29 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 21/23] python3-execnet: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:36 +0000
Message-Id: <20250130215738.3280576-21-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115175

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-execnet/run-ptest               |  3 ---
 .../python/python3-execnet_2.1.1.bb                | 14 ++------------
 2 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-execnet/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-execnet/run-ptest b/meta-python/recipes-devtools/python/python3-execnet/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-execnet/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-execnet_2.1.1.bb b/meta-python/recipes-devtools/python/python3-execnet_2.1.1.bb
index 94c1a228e3..54c102bec7 100644
--- a/meta-python/recipes-devtools/python/python3-execnet_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-execnet_2.1.1.bb
@@ -11,21 +11,11 @@ DEPENDS += "\
     python3-hatch-vcs-native \
 "
 
-SRC_URI += "file://run-ptest \
-           "
 SRC_URI[sha256sum] = "5189b52c6121c24feae288166ab41b32549c7e2348652736540b9e6e7d4e72e3"
 
-inherit ptest pypi python_hatchling
+inherit ptest-python-pytest pypi python_hatchling
 
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/testing/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS:${PN}-ptest += "\
-    python3-pytest \
-    python3-unittest-automake-output \
-"
+PTEST_PYTEST_DIR = "testing"
 
 RDEPENDS:${PN} += "python3-core python3-crypt python3-ctypes python3-fcntl python3-io python3-shell python3-threading"
 
-- 
2.34.1


