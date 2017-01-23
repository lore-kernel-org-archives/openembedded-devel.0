Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 929247721F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 17:47:29 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id k15so136901980qtg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 09:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=unWuLf0Gi+kPFGrOGIErLBUoje0WX5dPLFK0vanPjYk=;
	b=Fd7y2eQuEPb9DUcv9dDkpGZw9JmLKU1GQ8+hSczqYe6bpPjRlSftB8uaKcgSWTxJRs
	Bv7cRHdR943u9+NwASNalaKwjnZuT5Qlse6viywNROTlkSZstRy8NUnn088YlNTUaVC7
	aQ65rx03tfYBkswesVjYmsy9MKH3j7ZED6zEFC/IrcAe3hP2jg3GiYeQyR5lNkbX6oUW
	lUudzWHdLe/ATik0+Sl9/BN0wpAFF22l9tCEVqk4crzbZizTVmu8HPDpSsGzuV8d5Fs3
	URDP/nWyDYlc4zI2NIHSAceEeIA6VwyDee7Z5pWDfN4D8Nrjsav3mvW9DQeVpl94sstK
	gYOg==
X-Gm-Message-State: AIkVDXLMY2CIVHZQvmJwmkGLR0KawFCeXiJb4FSPBEy6ZVfP3Wp+ByJ0/5y3cToL8RO/Vw==
X-Received: by 10.55.150.7 with SMTP id y7mr4352855qkd.232.1485193650355;
	Mon, 23 Jan 2017 09:47:30 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	z8sm12826899qkz.42.2017.01.23.09.47.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 09:47:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2017 12:47:15 -0500
Message-Id: <1485193635-14809-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-netaddr: update to version 0.7.19
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
X-List-Received-Date: Mon, 23 Jan 2017 17:47:31 -0000

 * Update license checksum as the copyright year changed

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-netaddr_0.7.18.bb | 8 --------
 meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-netaddr_0.7.18.bb
 create mode 100644 meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb

diff --git a/meta-python/recipes-devtools/python/python-netaddr_0.7.18.bb b/meta-python/recipes-devtools/python/python-netaddr_0.7.18.bb
deleted file mode 100644
index 6fdbf19..0000000
--- a/meta-python/recipes-devtools/python/python-netaddr_0.7.18.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "A network address manipulation library for Python."
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b277425f87f3b06d25af45d8b96f9682"
-
-SRC_URI[md5sum] = "c65bb34f8bedfbbca0b316c490cd13a0"
-SRC_URI[sha256sum] = "a1f5c9fcf75ac2579b9995c843dade33009543c04f218ff7c007b3c81695bd19"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb
new file mode 100644
index 0000000..5b03735
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-netaddr_0.7.19.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A network address manipulation library for Python."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
+
+SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
+SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
+
+inherit pypi setuptools
-- 
2.7.4


