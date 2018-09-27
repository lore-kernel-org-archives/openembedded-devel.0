Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99FAF74599
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 02:05:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8R25CaJ020385
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Sep 2018 19:05:12 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 26 Sep 2018 19:05:03 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Thu, 27 Sep 2018 10:05:02 +0800
Message-ID: <20180927020502.219686-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] eventlog: remove recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2018 02:05:12 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

eventlog is not external lib anymore and it
has been already integrated to syslog-ng
as below commit in syslog-ng repo
https://github.com/balabit/syslog-ng.git
--------------------------------------
Author: kokan <peter.kokai@balabit.com>
Date:   Tue Nov 21 22:16:49 2017 +0100

eventlog: now part of the project, not external lib
--------------------------------------

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../recipes-support/eventlog/eventlog_0.2.13.bb    | 23 ----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb

diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb b/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
deleted file mode 100644
index 85e29b0ac..000000000
--- a/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Replacement syslog API"
-HOMEPAGE = "http://www.balabit.com/network-security/syslog-ng/opensource-logging-system"
-DESCRIPTION = "The EventLog library aims to be a replacement of the \
-              simple syslog() API provided on UNIX systems. The \
-              major difference between EventLog and syslog is that \
-              EventLog tries to add structure to messages. EventLog \
-              provides an interface to build, format and output an \
-              event record. The exact format and output method can \
-              be customized by the administrator via a configuration \
-              file. his package is the runtime part of the library. \
-"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b8ba8e77bcda9a53fac0fe39fe957767"
-
-PV = "0.2.13+git${SRCPV}"
-SRCREV = "a5c19163ba131f79452c6dfe4e31c2b4ce4be741"
-
-SRC_URI = "git://github.com/balabit/eventlog;protocol=https"
-
-S = "${WORKDIR}/git"
-
-inherit autotools
-- 
2.13.3


