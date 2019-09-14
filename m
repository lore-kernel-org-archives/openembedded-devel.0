Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF106BAAB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2019 13:46:47 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id a4so29647168ljk.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2019 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v6Sw3jyFwO7kh2sHRGKo0I3PS1C+LnG7NRs1GZSInCw=;
	b=JiyepicyMj7tC+pe5ntM3figFEKC+9dKPHHqxdx5/yHarVa0c9m93wDGKPidTxmFQf
	wpszl6hc62CiEURazxf6bvMmQE6uOosumShDMe+vkAQhnZgiOmlC7lQ6ONyMn3EDxe3+
	j49q5EEZ57H1Cf6E+PIq6YiUzPBFlg6K9fTt+Rw4Mwl1o36Wlc/aomxOGzzh2tV5gerG
	naQ1dZnAkjlril6tXvJSBjNW2Gqec1rxdOaB9or4pbO2HFWBBZS1Ivn1p9ck9oe/q2oh
	7ydCCCZWQN/iazDg1sdq+gN2xyjmVUmrVU6lQEASFyReZKbqaQ0eW8jNtSqTbVJxF/wQ
	iiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v6Sw3jyFwO7kh2sHRGKo0I3PS1C+LnG7NRs1GZSInCw=;
	b=B4ZZbGTXlQs5N4dKyZ14MKoJzcqpKa4JrYKWz50birtn8N+tCzUPcnbRRIj5OnLCKJ
	WcrV5pNNGy/msy1fKe3Men9oMb27OHjLhJtnxrtFCfrKmjh9VP+U+ASebhkXf8TPIxlW
	vYWWAzRRME7azymRcT96GwhGhrOJ/EhlcJwOUvJCkssNvhhTKxaWZZ0EI1h2WPHlfDML
	5oCWl+tfwN/lvVc1KKArLfrXrDdxjB6LKpCDcAExjn/w6eVoJQP7ommf8+nWkVWn4/Lx
	o5kBTHK2PiI+/91lMMIPKgEAuUvE5o8FLkXtos5rGigL95lVnMDoBZqKPh6eHNKeF+oT
	OLzg==
X-Gm-Message-State: APjAAAXYZjJBsdqM6NFO7lMP78dvTequGSO6vV3tlqGxJnS6WCGKZ1tQ
	SXxDGvyccNWkMDMluqek1vcxk6BGJAg=
X-Google-Smtp-Source: APXvYqyZsiamnHv7t/BU3hwjw5ieMD+Nf46F2dTL9QrBmDp/67XV2nvB+K1NXEeebW17elfeId+vRw==
X-Received: by 2002:a2e:3a01:: with SMTP id h1mr15419255lja.171.1568468807685; 
	Sat, 14 Sep 2019 06:46:47 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	n13sm6350784ljj.30.2019.09.14.06.46.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 06:46:46 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Sep 2019 15:46:41 +0200
Message-Id: <20190914134641.1881-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v3][meta-oe] evtest: update to 1.34
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
X-List-Received-Date: Sat, 14 Sep 2019 13:46:47 -0000
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../evtest/add_missing_limits_h_include.patch | 37 +++++++++++++++++++
 .../evtest/{evtest_git.bb => evtest_1.34.bb}  |  7 ++--
 2 files changed, 40 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-test/evtest/evtest/add_missing_limits_h_include.patch
 rename meta-oe/recipes-test/evtest/{evtest_git.bb => evtest_1.34.bb} (66%)

diff --git a/meta-oe/recipes-test/evtest/evtest/add_missing_limits_h_include.patch b/meta-oe/recipes-test/evtest/evtest/add_missing_limits_h_include.patch
new file mode 100644
index 000000000..b2bf94fd5
--- /dev/null
+++ b/meta-oe/recipes-test/evtest/evtest/add_missing_limits_h_include.patch
@@ -0,0 +1,37 @@
+From 5eb4ab1c139ea38ebe6bb4acba08b09ee7d77d3c Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 18 Aug 2019 10:01:06 +0300
+Subject: Add missing limits.h include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build with musl libc that does not include limits.h indirectly via
+other headers.
+
+evtest.c: In function ‘scan_devices’:
+evtest.c:886:14: error: ‘PATH_MAX’ undeclared (first use in this function); did you mean  INT8_MAX’?
+   char fname[PATH_MAX];
+              ^~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+---
+ evtest.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/evtest.c b/evtest.c
+index 37d4f85..548c203 100644
+--- a/evtest.c
++++ b/evtest.c
+@@ -56,6 +56,7 @@
+ #include <getopt.h>
+ #include <ctype.h>
+ #include <signal.h>
++#include <limits.h>
+ #include <sys/time.h>
+ #include <sys/types.h>
+ #include <unistd.h>
+-- 
+cgit v1.1
+
diff --git a/meta-oe/recipes-test/evtest/evtest_git.bb b/meta-oe/recipes-test/evtest/evtest_1.34.bb
similarity index 66%
rename from meta-oe/recipes-test/evtest/evtest_git.bb
rename to meta-oe/recipes-test/evtest/evtest_1.34.bb
index fa0d6e2fe..3b6dc6140 100644
--- a/meta-oe/recipes-test/evtest/evtest_git.bb
+++ b/meta-oe/recipes-test/evtest/evtest_1.34.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "libxml2"
 
-SRCREV = "ab140a2dab1547f7deb5233be6d94a388cf08b26"
-SRC_URI = "git://anongit.freedesktop.org/evtest;protocol=git"
-
-PV = "1.33+${SRCPV}"
+SRCREV = "16e5104127a620686bdddc4a9ad62881134d6c69"
+SRC_URI = "git://anongit.freedesktop.org/evtest;protocol=git \
+           file://add_missing_limits_h_include.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


