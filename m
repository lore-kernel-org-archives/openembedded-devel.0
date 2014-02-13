Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED446E898
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 05:49:43 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so10240125pad.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 21:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=q/n6AYjtaFjzB6iuCzNEWom5OWqUxff740vQ6XaJjNg=;
	b=KrDsK+a2OC4N5lNZ47B5OWfGBPJzQljZPlF9KoRmUygrEfFcDiQ7dt2TQceRYMzbjW
	7Vcyq6czhDJtKBiDm8+dCG07pqFRK/hFQxilFa+fgbplG0fYIuNTI46p69cLEk/xZe0T
	EtbQAlO4NaHrYUmCWuunR7Khuvzudt3Q6xBf4AdQiUQPWArECfwY9g1ZwkmDMWEkBDfT
	uaaYfiDGJAUS0UhyIU4uVopXOe3GTQKRdFW+sitNF75Ghx/R7TKHvya9qb5l77L77+Hj
	KP97AU7gXidnlbvvYXrlGbE0cNwSoZiyxZhrFZgoG0BvTgnHaqOCGBaZek3K7IjBGt1s
	gxow==
X-Received: by 10.68.203.135 with SMTP id kq7mr55931893pbc.85.1392270584452;
	Wed, 12 Feb 2014 21:49:44 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id zc6sm5924755pab.18.2014.02.12.21.49.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Feb 2014 21:49:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Feb 2014 21:50:11 -0800
Message-Id: <1392270611-7344-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] libmicrohttpd: add recipe
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
X-List-Received-Date: Thu, 13 Feb 2014 05:49:43 -0000

libmicrohttpd is needed by systemd-journald-gatewayd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libmicrohttpd/libmicrohttpd_0.9.33.bb            |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
new file mode 100644
index 0000000..d56af76
--- /dev/null
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
@@ -0,0 +1,18 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
+HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
+SECTION = "net"
+DEPENDS = "gnutls libgcrypt"
+
+SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "013b10f9de1cda5448b29c81305354a3"
+SRC_URI[sha256sum] = "d9587e8497548f820650cd607daf3615ea3272435779378983032c570f1cd559"
+
+inherit autotools
+EXTRA_OECONF += "--disable-dependency-tracking --enable-largefile \
+                 --enable-curl --enable-messages --with-pic"
+
-- 
1.7.10.4


