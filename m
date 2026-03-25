Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08377106B50C
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21190.1774441262055924036
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DD39+JNt;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so54314235e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441260; x=1775046060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRZcHGe6NhSo0y4ASXbuRxlGacbX2kkhlP+gicGJFcQ=;
        b=DD39+JNtLb0uGXtWDBKVniLQXmBd5JatSEYesgA5+ax8br+/C2eGX3tCQHv7txrpgP
         UWxVwEeuJcrNJiAyEoM7SYMkXkVjP88ArPzipjCPmxpapZOF9w3Pa4gHY6HsgGW2HV7l
         KWICDYQtGzYEqc3LoLywnzXcp0Bdt/YzUT3TdDWVMzdgDpjA4loFPsh1B9XO57ZAv992
         2M7pFFAY7fzSXZlTvrfqbN/kvHCxZ5751nKdqx1k33E/XARUNG+rhkq56feQwwZCy2nj
         ojeoKGaTI0E81G/zYD45KdsGTh41CQEMhBcvHG8NVISbBRSwASBgyAYOuk2jG7PTyRKe
         X4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441260; x=1775046060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NRZcHGe6NhSo0y4ASXbuRxlGacbX2kkhlP+gicGJFcQ=;
        b=bltsjdvGo2z7hofIhb3ZBSe9a1p4uo+FTBXhrnzyJcTmWmz5g5wNKY+Y/+YPl50jqS
         oW0F80CoY2m2Fr7PbcIjSnIsKI5P9OIxtW94SNqqUpybIjU///zn+HTkSCjZiHguoih9
         c0ZaOZ5rds7hHAlHmn0nGqMzA73o9AwhxGd13ZxFvj9CUB2OuTZnLeHYm1GBrC66eMmg
         vpInH+QNxYLJ5I87CBKKbeROaXqs0LszpgFJDYdekPlRgL63r+SRI/n+LJud7MVtjJvL
         m/8lBrnciIefVm8kDfoSWYSvEneqMfnDdIWDBAaLtKi8bHspWQsTU9HTINo2/wTYsOXH
         /tHQ==
X-Gm-Message-State: AOJu0YwTHAtdqktRBgjL3UtTUHmNEIhFffSCbabsHL2rbdhIguEhBFiz
	xusDIa85tEO8rEqqO4H45PWQiIa/u1PbW1js3qtD5LcVA4+E/4ZM7FG4H6Vn5g==
X-Gm-Gg: ATEYQzxwesEhBVrefFTcxp0eYnEDgrIrTRVboePJO/o3u3Vv9Wwkr+IL8CIF/DiA2Ej
	EHEzok0WyyMyA/dUA6plZBSXVCjhnn8P7ca2doTk9LVuCqTO0CMAtzKkhJtFOjbAN2ch+GZykgi
	NsjlAXsh5qAO/d/ekELS0o0dw5uawq+rVkyXvTWmjCvqravAsjYrUnInZakOfXxFIV1ao2xd212
	mc5rRxV4iweTMkmO6sZpwYOBAKuW7xzvT8QH4mxr1LJjU0pU1pYF4/1rZ0qJ9aIrxGrhGrf9f8+
	J4sJBgDkvleUEaZxjzHTRSXUglNnUqR1nixAQ5TM2pZ50A9zkM/gYWotzfVb1kme9yxFWkPk3LP
	kWzVhwFAw3yS4hrq+lL5RTb4XsQrPUdGoxat52pjnNNV4jo3r68MilHtjCT5sfX3R7shDe1a4PE
	d5HUDx959oP3JnWw==
X-Received: by 2002:a05:600c:a413:b0:487:288:119a with SMTP id 5b1f17b1804b1-4871608902bmr39182485e9.28.1774441259927;
        Wed, 25 Mar 2026 05:20:59 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:20:58 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-networking][PATCH 02/15] libiec61850: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:28 +0100
Message-ID: <20260325122046.1211090-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125609

PYTHON_DIR now contains PYTHON_ABI, use this variable to install
the module correctly.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch | 4 ++--
 .../recipes-connectivity/libiec61850/libiec61850_1.6.1.bb     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
index a33a6248a7..3f34ed2960 100644
--- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
 -install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${PYTHON_SITE_DIR})
 -install(TARGETS pyiec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
-+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages)
-+install(TARGETS pyiec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages)
++install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/${PYTHON_DIR}/site-packages)
++install(TARGETS pyiec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/${PYTHON_DIR}/site-packages)
  
  add_test(test_pyiec61850 ${Python_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
index c46ed88d83..d42d9de103 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
@@ -25,7 +25,7 @@ inherit cmake pkgconfig python3-dir python3native siteinfo python3targetconfig
 EXTRA_OECMAKE = " \
     -DBUILD_EXAMPLES=OFF \
     -DBUILD_PYTHON_BINDINGS=ON \
-    -DPYTHON_BASEVERSION=${PYTHON_BASEVERSION} \
+    -DPYTHON_DIR=${PYTHON_DIR} \
 "
 
 RDEPENDS:${PN}-python = " python3-core "
-- 
2.53.0


