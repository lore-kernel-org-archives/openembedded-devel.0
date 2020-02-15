Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 642EE6118C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 01:18:45 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id gv17so4619046pjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 17:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=e4vl3vTpBMZI/KWeUqTPZZaOtcLPo6YzTfRdOW90am8=;
	b=AHSxfFfHQC8zEOqq2SeP928wX4rIp0ztgRH5bS2PQ4jYPmZIwnYROQfiG1vat59IXO
	rlHQ6RWaYY/L+s6gcOHYDBYowqYBl3LIe+0yWXrSp/u8RY6keIuh2pbQrGJu87La0IHY
	vu1Scx+bdrR7VV8fgI95f7nJsSj5f1l//FglI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e4vl3vTpBMZI/KWeUqTPZZaOtcLPo6YzTfRdOW90am8=;
	b=lbxhPVQekDCz9upRYD3O9mCmUHDTRGKsuud4Ym36FQNYhdkujVDPbsU+4fCnKPfzna
	mI4SZNxvONnsAhZOIOIgzX/GSpMvXZxA1lx9BM/ZwQMZOlE7gBVlC4LEhl8ba7KEa7Ov
	Lb9OyhRLYhrr4UKfbY7bX79pqusk0FVkzcQbIvQEZRVUjofcvZNPDACqIOLq2jybFh+E
	14tdBKUHHTtMKUl0nNQrKJZzRe3xn10OTDjcgUZQWf9O2LzHJkA7Gsdi00ksoZEjITZt
	SXDbAmjhVYb2BdMB/VJ45vYA8PIrqymn0W5u3YwC3tnIHdBN4CDs4ii5q+9SR6/0Q/2X
	dMVQ==
X-Gm-Message-State: APjAAAWQDBZDE/UaI/p1F2gk/KawbULj9lJv2/UIjTu7LomoE+RxEHP2
	wdi33cuKr4OjIdTU1X9hL/pvNDpEF7HetJ94qG7sTlN1tCkgfqp5qEBiKQYiCzeClpR1yCTStFb
	PHXk4oWxSCWqw9GBkDmXf+pCFMSwbWn+20jwhE5WV39b002e3Fat1Ih3gagdZpKDkFLnvJv19PA
	zuNuEU4Y6Oi6buEnBCkfO/VvLR6TU/GPc=
X-Google-Smtp-Source: APXvYqwW5VRCYZ6vjIqnqY0YHDY34+oKxIzkCWurarqSV9Tq1ZvxsqRHKJl8YIPQHyvY3ciYASK2YQ==
X-Received: by 2002:a17:90a:c20d:: with SMTP id
	e13mr6862643pjt.95.1581729525185; 
	Fri, 14 Feb 2020 17:18:45 -0800 (PST)
Received: from lbrmn-lnxub108.ric.broadcom.com ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id h3sm8535902pfr.15.2020.02.14.17.18.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 17:18:44 -0800 (PST)
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 17:18:35 -0800
Message-Id: <20200215011835.112992-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe] [PATCH] python3-jdcal: add initial recipe version 1.4.1
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
X-List-Received-Date: Sat, 15 Feb 2020 01:18:45 -0000

---
 .../python/python3-jdcal_1.4.1.bb                 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb b/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
new file mode 100644
index 000000000..c8b5c953b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "This module contains functions for converting between Julian dates and calendar dates"
+DESCRIPTION = "A function for converting Gregorian calendar dates to Julian dates, \
+and another function for converting Julian calendar dates to Julian dates are defined. \
+Two functions for the reverse calculations are also defined."
+
+HOMEPAGE = "https://github.com/phn/jdcal"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=bd236e1f590973467a427bb354be0f46"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "e05bdb60fa80f25bc60e73e0c6b7c5dc"
+SRC_URI[sha256sum] = "472872e096eb8df219c23f2689fc336668bdb43d194094b5cc1707e1640acfc8"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
-- 
2.17.1


