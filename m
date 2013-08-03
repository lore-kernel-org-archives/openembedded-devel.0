Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id CC1CE6B1A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2013 13:08:45 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so779422eak.15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2013 06:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9CQWvBVWbEWYUdIBu00QaJsw9060ukS3SEG5FIVgKgQ=;
	b=GBuNMRRgCqxm6GOCKKA2F5Bv30FLFPHfGlOFuE1WQ3RQYocSDxf7E3FT+odN1w28Zo
	cw6sllcgffBPhi5pm1AdlUIADOBs7PAHibZK0I61gecxC2F5c30eOuQLZ5+SQzGp+51Y
	ueozhN0kTJtYciIIojk5GZLrczvVjGWFCTXN58I/cqe4U+3XEQvlFp1Or4qSV1MYRE1o
	EK9Qhe76RrORNCoPlsDNjTyFtCo8VthNyf7ZHN0YEcGIfrnGgWKp2G9LgHEa/puWnN/v
	8I0qy+yMFYy5RfMtEATS47lvQ5ogZqD1FaOu8FDJ0RhCeVl2IqXrLUtld/wucLo2YCkd
	4vAA==
X-Received: by 10.14.104.130 with SMTP id i2mr9337460eeg.120.1375535326145;
	Sat, 03 Aug 2013 06:08:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm19281625eeh.11.2013.08.03.06.08.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 06:08:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Aug 2013 15:09:12 +0200
Message-Id: <1375535352-23015-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375535352-23015-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375535352-23015-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 4/4] elementary, evas-generic-loaders: Drop svn recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Aug 2013 13:08:46 -0000

* keep .inc to reuse it for git recipe later

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_svn.bb           | 13 -------------
 meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb | 13 -------------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
-- 
1.8.3.2


