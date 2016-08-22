Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id D57E3738AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:24 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v123so8957318qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=E11m39kA82/UupXsAfn1oeH6wdX2fDHt3jmNC8/fFeY=;
	b=hu+CQBcaMkHdO0MJMLIcgqC7l/jB7RKdtM/N7YUYrgMubewKJ03WXlojXyjRCR46xv
	+jrne8ypuxYgSHoTQ/eG6mMsJTQ9qe10+rKdI0gX3H8GqjPlR96y1rg1zRogUTFixbnK
	2mgAygLUgFqTeBeQUazFOCux+A69vH7fkKjH+9NzTwM0lQlGe81QyD5agISpfC3URbt5
	jD2XYkxMjJogjCUQvxSmCxzOdgzyQ3jJe2aNV5OXaHZX+nZKFm2vS8Fy7iroAQyLLHZz
	wDtaPXgkcOWaaCa4zhbx/GHNNMd7RzRgp8xHKcWNMc7DjKs6Q3asb4coO0CFXiW+dxc6
	tJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=E11m39kA82/UupXsAfn1oeH6wdX2fDHt3jmNC8/fFeY=;
	b=YKLkv0gfsp08S7g+vs+Bvol5p6y7ogcT0PBIXS7I7Co6wjLTj4oL0Bx8IIR2iAO9u5
	1cG6JYEQMb7mG4xjgdvQXWPhrSPLN6+FoHib+IpdWuR6yPx10SFz8u+AXMm2gkrAHCpw
	UGTqXTds4CZ4XCio6k3LjfeTbaWnObPHZ/Wn5qbPCWSoZczQb8KZfsdS94HW17G/eV92
	XxO+YFuHMDK8I3rHn1f0UdBThPK0p6ZERwuweCE/LfdBJAsIvChqqmD0/YwhjivPlKIO
	pdQXNVhCHYVKyyu390J3TSuzk6EN2i1VlWhGR3GhS0hUtqR3sGiQoSXlXVhX6lyfaXNy
	7tig==
X-Gm-Message-State: AEkoouvCISWnnQ0i8q4Fmpjzfv3UDOw2LmSbgiyCIKGTz4ddMpu3xXou48tDcrcR8w4Z0g==
X-Received: by 10.233.237.75 with SMTP id c72mr24771541qkg.162.1471892605255; 
	Mon, 22 Aug 2016 12:03:25 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.03.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:03:24 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:26 -0300
Message-Id: <1471892491-6177-12-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 12/17] python-py: Extend recipe to support Python 3
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:25 -0000

  - Add Python 3 recipe
  - Add native and nativesdk to BBCLASSEXTEND

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-py.inc        | 8 ++++++++
 meta-python/recipes-devtools/python/python-py_1.4.31.bb  | 8 +-------
 meta-python/recipes-devtools/python/python3-py_1.4.31.bb | 2 ++
 3 files changed, 11 insertions(+), 7 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-py.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-py_1.4.31.bb

diff --git a/meta-python/recipes-devtools/python/python-py.inc b/meta-python/recipes-devtools/python/python-py.inc
new file mode 100644
index 0000000..9e33b16
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-py.inc
@@ -0,0 +1,8 @@
+SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
+
+SRC_URI[md5sum] = "5d2c63c56dc3f2115ec35c066ecd582b"
+SRC_URI[sha256sum] = "a6501963c725fc2554dabfece8ae9a8fb5e149c0ac0a42fd2b02c5c1c57fc114"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-py_1.4.31.bb b/meta-python/recipes-devtools/python/python-py_1.4.31.bb
index 592bc04..5ad2c19 100644
--- a/meta-python/recipes-devtools/python/python-py_1.4.31.bb
+++ b/meta-python/recipes-devtools/python/python-py_1.4.31.bb
@@ -1,8 +1,2 @@
-SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
-
-SRC_URI[md5sum] = "5d2c63c56dc3f2115ec35c066ecd582b"
-SRC_URI[sha256sum] = "a6501963c725fc2554dabfece8ae9a8fb5e149c0ac0a42fd2b02c5c1c57fc114"
-
 inherit pypi setuptools
+require python-py.inc
diff --git a/meta-python/recipes-devtools/python/python3-py_1.4.31.bb b/meta-python/recipes-devtools/python/python3-py_1.4.31.bb
new file mode 100644
index 0000000..0ee373d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-py_1.4.31.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-py.inc
-- 
2.1.4


