Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id A84607E12E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:38 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id z28so8335485pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/Pv7E31gbcEO5j9odxgnjHayanxf+SmJQbMRTEyd0do=;
	b=CcPOuxZ2egMHqOP1xAiBG2E+DzCRjgsdN0+qAZgMO/wm9n9yt9P6ZbEY6ERnvdgcpn
	IU/WG/atcCArZKE7eIKwCE9T/JE32albNH2yBzVUJ1v0vfqQtHKvCFjlJP40KFSD8TLk
	W0N5koQUGAzyteLBxOkdXsXwYh9ffK56hr/k80jWq5AQy6RlL95n3aCqJFDYH6uhaevP
	PiwfHHwhaRiS57Yy+yNU6K2vey9ca85UVgf22iVF0+GZByoZdWQPVcPL/1PIh0E7h77u
	CZD1qUNs+N0F1X9Y2v2xej8xlup14p5bg61IWUwiY+w8xYKE8HjVEoizAL7EBlXE6BMp
	nGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/Pv7E31gbcEO5j9odxgnjHayanxf+SmJQbMRTEyd0do=;
	b=pvZxHVIbFfZ2hAMrx/Ti7ohJ40O/2zKhlOsfbuzImgGFl2c2H+tg9XUYkzqFHSqnQo
	9bYtAj1SmaH9Q6Yf+suJSBHD6NCYlv08QZ3gbx8sOowK2M8kihSQII/kQdAcdr6f5H/m
	Ernb1dK1YAxUae3hFX5USC1nI5KBNc3kmHmiDjGosXAUeSYAwid72XTVWfswaMtCC+Lp
	sbnUOP7zHB9RONlEqP9RNexShPTq15QMli0Gc213JpI5XvwQASH2Riot7yDgEgcm/jj5
	wIk9483Lz6B2X72hcIbO5T8LdR/ZiII12Sd9voW6d4ae4B4Q9zZphxgfAgk1kKBr/+uA
	qpkg==
X-Gm-Message-State: APjAAAXssL0TfohzF7KJxo0hUVfqBfy2RcaPi1sjwcs8dHSQUv/vTQJn
	sOmJCuMT1uU8cgWkYMzgb8uUOnFz
X-Google-Smtp-Source: APXvYqyxhdakxgKtIRvCyynt1xNaM3oMAvMItUq1Vh/CvLnqfBKcJBmF9hn97ZnYP1K1LyXagvCACA==
X-Received: by 2002:a63:8342:: with SMTP id h63mr81009242pge.251.1558410999648;
	Mon, 20 May 2019 20:56:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:02 -0700
Message-Id: <fd48edcd7415f4a1ca043e256585f2705b66545f.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 02/34] python-pyasn1: upgrade 0.4.4 -> 0.4.5
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
X-List-Received-Date: Tue, 21 May 2019 03:56:38 -0000

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

-Upgrade from python-pyasn1_0.4.4.bb to python-pyasn1_0.4.5.bb.

-Upgrade from python3-pyasn1_0.4.4.bb to python3-pyasn1_0.4.5.bb

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc               | 6 +++---
 .../python/{python-pyasn1_0.4.4.bb => python-pyasn1_0.4.5.bb}       | 0
 .../python/{python3-pyasn1_0.4.4.bb => python3-pyasn1_0.4.5.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.4.4.bb => python-pyasn1_0.4.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.4.4.bb => python3-pyasn1_0.4.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index ab34d25..3827fea 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Python library implementing ASN.1 types."
 HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=815ac3f9ca693006349094b358ab3155"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a14482d15c2249de3b6f0e8a47e021fd"
 
-SRC_URI[md5sum] = "0d182b71e1f72fe147d7957bc90be7f2"
-SRC_URI[sha256sum] = "f58f2a3d12fd754aa123e9fa74fb7345333000a035f3921dbdaa08597aa53137"
+SRC_URI[md5sum] = "f3c0cfbf882a20811be5ad5a41f74b82"
+SRC_URI[sha256sum] = "da2420fe13a9452d8ae97a0e478adde1dee153b11ba832a95b223a2ba01c10f7"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.4.4.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.4.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.4.4.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.4.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.4.4.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.4.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.4.4.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.4.5.bb
-- 
2.7.4


