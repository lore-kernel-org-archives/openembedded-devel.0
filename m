Return-Path: <shantanu@senic.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id C444E7E773
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 19:52:57 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c73so17867426pfb.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 12:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=senic-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=3n8Oiv3q0CEZ3cMOTxMkXyKhHqq1xL7nAp0XMsDmDkQ=;
	b=zQGLTXYTSHmyE5B90NH0wmbSNFBGUoGrMeWmqGYuYcp3RHFz7zqzSPdfeLcWh8mIJM
	LmWEEIs8hkdtXLP6s7T8Y00GFT4nP6nO0aCbSJFlUxRxnuKgj0EshM6pfr7Q6SrEyKru
	YzbsXZQKg5JjFnoCux5PnjnVJ8154ZOEcLum5oqSrc8hzFP5I9WPXB+X5SV/+TFSYgt9
	i2ejWDqdpqqYK3hn+XTZHHZzluT10Ky91Ik8801AKDEepwo1CWKms9iO4JPgBGZm45Td
	7AVdjKT7q9lS9qnPMDf9rbFA8aYZQw4SgLotpbEetCWHAPTUcEvobPgoQH94VOVvq7P4
	9J/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3n8Oiv3q0CEZ3cMOTxMkXyKhHqq1xL7nAp0XMsDmDkQ=;
	b=mgD7VO1xcis4gQswq84EqSU3uaKA7Fyi39ZAnJ7ZjEJu8kCCkpwRGzt1ekL7i4s4tH
	EkeDSlsfiJZLV7qlxaEMbhSkP4vbOsEyDF+I0fUJXnEX+cBWD3EUVElGbl9kDL2Ut2Mg
	qCYiglS4Sh2XuvAyXrk6sIPYbGEEd2dW22KmROhuYjvzk2CIB4MqyykYDlZcgg0FJyrV
	RFTlkTRoIr+Rx3Renq3/t1jpjs3e2BxqSLZ8pVAVJ2hGV1XeIzKMcFY72iGsv0xYWQFb
	sCTSbN1q5n/w0AXhMRWtEGyQymMFqQ2kgiGCWtZNbcuXQOHBsCdfKQTUMREIDikoK55r
	ApKA==
X-Gm-Message-State: APjAAAWiCkfWrp7xpPZSBDcCTOPgSx9M3OBwHd4EHg4zEjDL85gYP3jm
	CaTlui6uv2imzB2sKOTVUD6AINTgRFs=
X-Google-Smtp-Source: APXvYqxLavG7co88Osb92SR0IRfQrT/ftCfoi8d4nG3pD8Auj2m2FB/v+gKf9O3uah8mc4wiRaWzWA==
X-Received: by 2002:a63:2264:: with SMTP id t36mr67829584pgm.87.1563825178182; 
	Mon, 22 Jul 2019 12:52:58 -0700 (PDT)
Received: from localhost.localdomain ([59.98.235.115])
	by smtp.gmail.com with ESMTPSA id
	p27sm59812895pfq.136.2019.07.22.12.52.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 12:52:57 -0700 (PDT)
From: Shantanu <shantanu@senic.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jul 2019 01:22:41 +0530
Message-Id: <20190722195241.2820-1-shantanu@senic.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] Add recipe for python bindings of Berkeley DB
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
X-List-Received-Date: Mon, 22 Jul 2019 19:52:57 -0000

Included correction suggested from Khem of using STAGING_EXECPREFIXDIR
and including python3 with DEPENDS.

Signed-off-by: Shantanu <shantanu@senic.com>
---
 .../python/python3-bsddb3_6.2.6.bb            | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
new file mode 100644
index 000000000..7a298014b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
@@ -0,0 +1,19 @@
+SUMMARY = "pybsddb is the Python binding for the Oracle Berkeley DB"
+HOMEPAGE = "https://www.jcea.es/programacion/pybsddb.htm"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3c8796b7e1f8eda0aef7e242e18ed43"
+SRC_URI[sha256sum] = "42d621f4037425afcb16b67d5600c4556271a071a9a7f7f2c2b1ba65bc582d05"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "bsddb3"
+
+DEPENDS = "db \
+  python3 \
+"
+
+DISTUTILS_BUILD_ARGS = "--berkeley-db=${STAGING_EXECPREFIXDIR}"
+DISTUTILS_INSTALL_ARGS = "--berkeley-db=${STAGING_EXECPREFIXDIR}"
+
+RDEPENDS_${PN} = "db"
\ No newline at end of file
-- 
2.17.1


