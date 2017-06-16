Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id E89EC78506
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:37:43 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id w1so12515276qtg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j01sJu5Uxn3ARroXeSYugnHk/OgzqgeMl/ogTlOleYA=;
	b=YiORjGoAw0N1fU1LUfjcLKAcEAzB47GL33xxtDZ1JI4Uu5YnYf8/Q6zdXtRJ7KBu6S
	wkRDllJbvU/joEksufT/53vRHOWXfbjHUGghYfZvoVOUbeKX3Dq3MVewNeY5zNlDr/DO
	n6K6RPHezkZ/3gWlGZtlALOwEcZm5u5RYxYCav77QT52gRJL6Q+6htWX0WpBgZZWl9jN
	pXDejxZGpY1mSi0+lfr41l/yL55b24l4gIWZBdrU1JgaHRr1iBsnYxNEAQblBwnZ83t0
	d/xhXy1wv7bKLqzFYQBmN4gtpdNaHtR13GZ9pnfKUJI2dfaUsE8InzCKgjGC8LoORpRf
	tRpw==
X-Gm-Message-State: AKS2vOyCgrBbvlkZSMfHNaw7erkmlYC6iGWHrCUZTuRRGvNwGnVWtgM6
	x6Iw2XqoUTTnu5BCKcw=
X-Received: by 10.200.51.15 with SMTP id t15mr14420956qta.38.1497641864497;
	Fri, 16 Jun 2017 12:37:44 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id f85sm2469536qkh.6.2017.06.16.12.37.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 12:37:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:37:36 -0400
Message-Id: <1497641856-7908-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lazy-object-proxy: update to version 1.3.1
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
X-List-Received-Date: Fri, 16 Jun 2017 19:37:44 -0000

Verify license terms and update the checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-lazy-object-proxy_1.2.2.bb  | 10 ----------
 .../recipes-devtools/python/python-lazy-object-proxy_1.3.1.bb  | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-lazy-object-proxy_1.2.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-lazy-object-proxy_1.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.2.2.bb b/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.2.2.bb
deleted file mode 100644
index ded9cfa..0000000
--- a/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.2.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "A fast and thorough lazy object proxy"
-HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
-LICENSE = "BSD"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=96b1673d10167cb31b78e64f561c3286"
-
-SRC_URI[md5sum] = "841b5592bc12c6ef7e48ed1d7a5f9066"
-SRC_URI[sha256sum] = "ddd4cf1c74279c349cb7b9c54a2efa5105854f57de5f2d35829ee93631564268"
-
-inherit setuptools pypi
diff --git a/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.3.1.bb b/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.3.1.bb
new file mode 100644
index 0000000..0db5e6e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.3.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A fast and thorough lazy object proxy"
+HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
+LICENSE = "BSD"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ec680df42d8ad56427a83308817658cc"
+
+SRC_URI[md5sum] = "e128152b76eb5b9ba759504936139fd0"
+SRC_URI[sha256sum] = "eb91be369f945f10d3a49f5f9be8b3d0b93a4c2be8f8a5b83b0571b8123e0a7a"
+
+inherit setuptools pypi
-- 
2.7.4


