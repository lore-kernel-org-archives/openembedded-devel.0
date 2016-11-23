Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2654B71A8B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:18 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p66so667763pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UNirNs3YF0rCWjIEcMPPRvOtlzRGnemoWUGCj0ye30w=;
	b=NBmu0dxFdS4nTUnUth2YKGH8N55cCPSKulFxowGlENNH2WuvR/P3/0rN2bKmL2FwhG
	ehIejpR8SsM7oMEPpELfJ/pfFfSzMdnJkTyUD//lWro10IDB/PudWwonaCYX24pO1ate
	bGa90dAiyLtkFdVl2hquwAb1oNndD6Q465zWe9Paq2JoYC6IYE6L1F1FcdYaFGh7rS3T
	iSUy3Bg5OrIxOaYNrBDgCmNZACxvkYbYrZ97SkkUgqJ2qqCp6i3+pEEVsy5xNC9qnDx9
	m78QjyRQIg/FqFp7dVMVopWxEnI7DzTvikrHF08446KiArE4GqAb9HFv2Szjj5UX1BmT
	vLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UNirNs3YF0rCWjIEcMPPRvOtlzRGnemoWUGCj0ye30w=;
	b=TKd6NQY2RJjxGwwNRqUyHT8vsY4kqC053djz1bQgVUQfuZmtf87HXfOMfIYa+jasjE
	se1sod6ObA41IWUL2s76+IC4jYxDBXu+TevkGIfCIainJmWIiJQbkwDZ+ILD5IuKl3W9
	SpGtwv5L+HqIUw/wodP3W1FbNcRMuJSW4qc8Ioa5h9YrvQR/5ywh4KA9Xgk023fuKKUZ
	4Bw9S9ew6XM0Xr+LKLAfc6Uvc7anbgk7XY6xp8cc7+L8HPNjHEq7V/324vGWvccpdQWP
	pruTtEP+G8zyE4JBfSKP3AXwy2J+AT0Ihmc90vySkYkFT4Z7Dc01jK0WuN3yHjYNWUR7
	CHQg==
X-Gm-Message-State: AKaTC03l8KSY9qKKo3e496toZoGufa0K/rCdZA09kO6DUkR6VnULfIgLcG5uwYxpl72Gtw==
X-Received: by 10.98.100.66 with SMTP id y63mr1936168pfb.49.1479892939700;
	Wed, 23 Nov 2016 01:22:19 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:24 -0800
Message-Id: <20161123092209.23699-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/49] libplist: Remove rpaths surgically
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:18 -0000

Check for files first before operating on it

Fixes QA errors like below

  /usr/lib/python2.7/site-packages/plist/__init__.py
  /usr/lib/python2.7/site-packages/plist/_plist.so
  /usr/lib/python2.7/site-packages/plist/plist.py
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libplist: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
index 10d40fb..f789796 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
@@ -16,8 +16,16 @@ SRC_URI = "http://www.libimobiledevice.org/downloads/libplist-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "2a9e0258847d50f9760dc3ece25f4dc6"
 SRC_URI[sha256sum] = "a418da3880308199b74766deef2a760a9b169b81a868a6a9032f7614e20500ec"
 
-PACKAGES =+ "${PN}-utils ${PN}++"
+do_install_append () {
+    if [ -e ${D}${libdir}/python*/site-packages/plist/_plist.so ]; then
+        chrpath -d ${D}${libdir}/python*/site-packages/plist/_plist.so
+    fi
+}
+
+PACKAGES =+ "${PN}-utils ${PN}++ ${PN}-python"
 FILES_${PN} = "${libdir}/libplist${SOLIBS}"
 FILES_${PN}++ = "${libdir}/libplist++${SOLIBS}"
 FILES_${PN}-utils = "${bindir}/*"
+FILES_${PN}-python = "${libdir}/python*/site-packages/*"
+
 
-- 
2.10.2


