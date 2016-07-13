Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id B80A06067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 02:36:16 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id c13so2269588ywh.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 19:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wOvIRy1KjooxOD/yeOvvPzU/enUT+Z3+0n5GKRDuqIw=;
	b=T34OZkDChngQZi1AyCBOhm2ZJv2B/BNi2PoFILRILAH5BLkLRi+rNTXk30a0UGtWre
	UT+9jrL9szvVNrbVQkSZMpChrVEK7K5HgQHztl7PC7wQCdByU3CJkwSdyDPT7sbJPaEg
	GexDEEhvP8L0ZSFHgAGb9h/7d+sue/SIFTuwykaisAD4CYmu29jXx/wDJp3nq2DssutN
	ayLLDvFXM4PcKMXD9bWlH1Wbg5lqHStI7dQBXQkXE0w1vZn6MblPX7yjGc2yjdhwo5JF
	/CNw2+NXAVxqgdWbTseOAMZpf4fZguw9iTMcpnw6gWNRTAcm+3cEGlSYev/mNRuUM72l
	a+MQ==
X-Gm-Message-State: ALyK8tI377NEseUokGQbZIEbGS1tXDX3tWImss7IS0lGHHdOPoCtI7MzeNJpd5r1TTop7w==
X-Received: by 10.129.75.6 with SMTP id y6mr193879ywa.156.1468377376862;
	Tue, 12 Jul 2016 19:36:16 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(ip-64-134-183-30.public.wayport.net. [64.134.183.30])
	by smtp.gmail.com with ESMTPSA id s78sm920415ywg.26.2016.07.12.19.36.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jul 2016 19:36:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jul 2016 22:36:07 -0400
Message-Id: <1468377367-5826-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-decorator: add package RDEPENDS
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
X-List-Received-Date: Wed, 13 Jul 2016 02:36:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-decorator.inc       | 4 ++++
 meta-python/recipes-devtools/python/python-decorator_4.0.10.bb | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
index c1fdfac..9264cef 100644
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -13,3 +13,7 @@ SRC_URI[md5sum] = "434b57fdc3230c500716c5aff8896100"
 SRC_URI[sha256sum] = "9c6e98edcb33499881b86ede07d9968c81ab7c769e28e9af24075f0a5379f070"
 
 inherit pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-stringold \
+    "
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.0.10.bb b/meta-python/recipes-devtools/python/python-decorator_4.0.10.bb
index f262168..2a2b455 100644
--- a/meta-python/recipes-devtools/python/python-decorator_4.0.10.bb
+++ b/meta-python/recipes-devtools/python/python-decorator_4.0.10.bb
@@ -1,2 +1,4 @@
 inherit setuptools
 require python-decorator.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-contextlib"
-- 
1.9.1


