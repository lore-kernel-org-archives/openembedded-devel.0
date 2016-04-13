Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id B39E460116
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 01:37:45 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id c20so24263168pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 18:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=oQjFQATpNyx3wgyNKofbmH+DykO5rDPZ5I2PRKtcDuU=;
	b=XP5yItFxklQSmLq6aVmZK9l05wqpWBRvzAAmsVVa3yUxl8etkcG7XQ/9m2Ezfzl2B1
	VpJsgYH1naC3/k//XOx7N3iQ60DMtQkQ8CNI7vCG9ResbfctY2NcWKzznHIYaWXyT8xB
	3dkkhj/eNSB6kJxTyaL7qbNPj3PqTj9PjzL0058nWVgU/5g4PORGlUgGPuM7X2BKmj7O
	TIsqA9df8O0Z/gbY0uNQMmWsFG4WlAcC6CrbzrE/rSkiwPH/cNhHxg7Nt3fLVjC9aX8r
	FKOLyqhhd2oW2LwBn6QNqWq4OiwBk7bN6RAfLJo1tLlRGwINsnNgtpPyCaxuFIP1BjId
	Dt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=oQjFQATpNyx3wgyNKofbmH+DykO5rDPZ5I2PRKtcDuU=;
	b=O/PlIa7Hm8+mT48dLlbqWTFtXpu9hsfSg1lkBxAFnPkrHinRnj97KgOInSTQK9HV3K
	2txFGxWuSQLUpNvLhkur+uTyQ9drBW11gmXExsAHV6WULWhpaUUES4OVabnwvdXnwWvq
	GjHyLyz6eDLRT8jjTPPpgx50h9KdXitWFYSxaag9URVSbcIexJPub0as2f2fA4fIE3No
	+uPFB26TtiZH8GIOpC7Xe9hVX8k1IPaTEfhfVitJaQGdEfsEdeVky5uJw77THuyXH3pQ
	wA9ecXSN3ZIop/oG+VsKUG5gPVwa0psXrqL8VvovPCGdLXDTur1hyHoMmfZwAyaXZtIT
	+j1w==
X-Gm-Message-State: AOPr4FWB/fZtuAdfkhbCOUvsJvuusomTARJjZY1ePXXoJnugks6SblS7TIT6876dHIOy4g==
X-Received: by 10.98.71.86 with SMTP id u83mr9122562pfa.156.1460511466283;
	Tue, 12 Apr 2016 18:37:46 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	y7sm46438214pfa.82.2016.04.12.18.37.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Apr 2016 18:37:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Tue, 12 Apr 2016 18:37:40 -0700
Message-Id: <1460511460-26976-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] c-ares: Add package to networking
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
X-List-Received-Date: Wed, 13 Apr 2016 01:37:46 -0000

this package is in 5 other layers.

Move to a more common location and update version.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb

diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
new file mode 100644
index 0000000..2f72ab4
--- /dev/null
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
@@ -0,0 +1,13 @@
+# Copyright (c) 2012-2014 LG Electronics, Inc.
+
+DESCRIPTION = "c-ares is a C library that resolves names asynchronously."
+HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://ares_init.c;beginline=1;endline=3;md5=53f5ecf4c22c37cf1ddd1ef8f8eccce0"
+
+SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz"
+SRC_URI[md5sum] = "d5c6d522cfc54bb6f215a0b7912d46be"
+SRC_URI[sha256sum] = "b3612e6617d9682928a1d50c1040de4db6519f977f0b25d40cf1b632900b3efd"
+
+inherit autotools pkgconfig
-- 
2.3.5


