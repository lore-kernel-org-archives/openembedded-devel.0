Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AD0CD4F3C
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 18:54:47 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18911.1778784884751057137
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 11:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Eo78owiP;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c8f9846c8so12487442c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778784884; x=1779389684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cep7ilD2naHeNWVKg7S4IARyCGFGQBrPpFqgd1m76TU=;
        b=Eo78owiPSfgkGoLvCex4e57A1vBLN0j8Fjt41ce/Yi23IBGT4EwzYyYksBlo3PSgaB
         BrtNmsiS8EsUEQPh7iHIMF51OdmDFQHG5d3J3KRX6mKkkusNe8h5sIJlPO8+SCKlXw5S
         wfDoVI9rcaUC90h1ZNvObJHRZHni844HtJvzh7Khj06mqWWFdlChSTLosCMohGjtau2j
         Fh7xBhQxMkXfU2l8zI+FkHyVT3cTjUzTT7uHhUO3jtVa0XS/GIUj3qX9xuud6S3bx6TF
         Ff5JWLvhX4nz4lx3YnHQdG5tXMGHCmL2hHHRNloJr0F9LONRewALhd+qOvUSrnAkIDLW
         vOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778784884; x=1779389684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cep7ilD2naHeNWVKg7S4IARyCGFGQBrPpFqgd1m76TU=;
        b=JUetUUbFDUwzlcTtsEbiZBgW8TWvcsTv0lftGT+g3pTnwVOwRl1VCILK0puG8XmO2c
         LKsE4evQgLshuPiCT+md90oTqtuPnT19gbaQSlY3W0V/Gy4fNwEl51eFno0yy5kdeJA5
         WmopSg/BtWIg3+qzLVm7OQ9mD3G9hoprr6+gYycx5ycltcLGc5Hp37p0CExdpfvaD/qR
         4Kyu10BWRlorajaw+ozAuBTyC2c393+AR9qX6qEwnWaWF0ErVg3i4wYkeG/oBJvDB9+E
         1w29hsQ4lw9l97KcVCV5MosAM96BFmtaNkjDY/f3du6R8e8x++61hK78GZA2iJVRaicK
         UeWg==
X-Gm-Message-State: AOJu0YxO2YHIsmdipuDEx/UbwE4qBjePR4/7xddhJ+kbjLfFQm2HPY3G
	PPfruro9hdVfB+IYk01Q7f6o+8h1O2ojiFxHCOEe+BScZ7/eANnux/BTHOPqpR/uL+0=
X-Gm-Gg: Acq92OFH61hUBAP6ufVI+QqR4nsXSImYgt9qXc0FvQYQqOXOPmFDQrUy5tiZqx8Dlc5
	WTpBoykahfMazZkTG7WPLckBqYWHxK5eGieVWenpAVWlhIpcz5ImZUUHbGnnffqDMh/Du5tbUv3
	jplE5rZtTsxY746jT7qLbaM+oazb1FYpULpZSojmMgXmhTBCy6kwX9lriP2l7iZ/shrjNbuLI+v
	ScUscn+j60hHvCvej8r3tG5Cs6iF2cpzbU4h9aFLrV4LQYyikUN+fC0B/KupA0mc3C4j+nlGy7l
	Ra6bc6HpIcUdepfl94c5+sCOWGZb+tNxwiF6dSD36L4SKbDIkbRWmj0SXi79OWqtJ2FWLiDJ9hc
	5vIODH1XYxoOH3exSRqHxHgCVXDQEGvtOHjVodMUVLjgc7+a6wwjlavIlHytkXR3O+r5wyqVKsq
	izylmskSibI678SAv640bE7sCnbSLJnapdv+C77pCE0P94JwJUkhMBgzFseL5ZZf1mdbgJEbEjH
	LfiUQuJ5ZtI9xC0Hfe81H3CyaIMF5TOHDKm26bWOlWRz6GoDdqM2L3eCkUKc1yELKGVzy0+/fKC
	is1ZWyLfHqvKT6lu7VjAQIOQD/zE1VVde2d/jVmW
X-Received: by 2002:a05:7022:660e:b0:130:6c8f:5aa3 with SMTP id a92af1059eb24-13504418706mr204395c88.12.1778784883847;
        Thu, 14 May 2026 11:54:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm5422930c88.2.2026.05.14.11.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 11:54:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/3] python3-croniter: Fix build with newer trove and pathspec modules
Date: Thu, 14 May 2026 11:54:39 -0700
Message-ID: <20260514185441.1330509-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 18:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126991

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...r-versions-of-trove-classifiers-and-.patch | 28 +++++++++++++++++++
 .../python/python3-croniter_6.2.2.bb          |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch

diff --git a/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch b/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch
new file mode 100644
index 0000000000..a20075a76f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch
@@ -0,0 +1,28 @@
+From 297d149636d063a82b33d95ab59928a88db51e4e Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 14 May 2026 11:44:44 -0700
+Subject: [PATCH] Allow using newer versions of trove-classifiers and pathspec
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 657cc21..d1b9ce3 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -2,9 +2,9 @@
+ requires = [
+     "hatchling==1.29.0",
+     "packaging==26.0",
+-    "pathspec==1.0.4",
++    "pathspec>=1.0.4",
+     "pluggy==1.6.0",
+-    "trove-classifiers==2026.1.14.14",
++    "trove-classifiers>=2026.1.14.14",
+ ]
+ build-backend = "hatchling.build"
+
diff --git a/meta-python/recipes-devtools/python/python3-croniter_6.2.2.bb b/meta-python/recipes-devtools/python/python3-croniter_6.2.2.bb
index d217161d7d..a52dc5cbbb 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_6.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_6.2.2.bb
@@ -5,10 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"

 PYPI_PACKAGE = "croniter"

+SRC_URI += "file://0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch"
 SRC_URI[sha256sum] = "ba60832a5ec8e12e51b8691c3309a113d1cf6526bdf1a48150ce8ec7a532d0ab"

 inherit pypi python_hatchling

+DEPENDS += "python3-pathspec python3-trove-classifiers"
 RDEPENDS:${PN} += " \
 	python3-dateutil \
 	python3-natsort \

