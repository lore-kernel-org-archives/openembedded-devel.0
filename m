Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 70EE2771DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 19:47:57 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id s140so16420255qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2017 11:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=qcBQZhEsralMPXcMWiTZwWVK8qnojcjTee4P6JxQK7A=;
	b=h+Pf6xpz5PektZP1Uf4phNOVIEq6R5waqptiw3A3sZTxsCphOYygO/OC3hEfnT05ct
	Cgly8RIrhlCYeqFYDVFesGECNZXOWLbRLBmbbV9c23wPNLQDsXxe7pXG0KmvFSVDyt/4
	sbEb7NM9G0yD4gT+VRBPIdDZdgzR7jfT9RxXScOPio0cGuP2nDbbzJATZ+lT2ZHkiI+3
	kcgLCmo9pCY/U76wo/pEaGJpBl1BiiUk3HKeBd2HytkqtJ22XawT1OOdCaXW2tM0S5V9
	j+Extkgc7N+BsHwRL5W3ySe2Keu6JRf/OESnV4wQiMTlvqOZMGQpxCdB/kjILq/Ho6gi
	TU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=qcBQZhEsralMPXcMWiTZwWVK8qnojcjTee4P6JxQK7A=;
	b=gS7QN19IeSI1AOb9sepc9YhT2QWg5Ujp0UVob/jWZF86hSHut+U+Ef1z40ko8R6HDr
	F03DZghHEpfRRTwKqAxA4XW9ARRx12WYOOVbChU66wGeUjbcJHuvFCjux50qlRvCKN3T
	U+z2QCxl0S3yJzpFQo/pGPzpuehtAkPzxdWmSJojugDKAk7SIx4TMdMh8HiA3z4SkoZ4
	zszM77kNeT8eOfQtJ7I1wbcoY47mp9ec2DCRNYMAzw47A/a6lvHppAIH4/AhINmXcA8j
	LABDQZ07WHNv/FXUa1vlzqQGMtNOAQgv3Kw64hllEtC5lHi0hdGJ+7RAqJ8VEs4vvl38
	jEew==
X-Gm-Message-State: AMke39nymtbS7Dw5Dnoj4lXLUGVWEM7j73nsgia9p1Vp5XgT/Bqh7x7/EwKoseE5nFJImg==
X-Received: by 10.55.100.130 with SMTP id y124mr4474136qkb.108.1486669677181; 
	Thu, 09 Feb 2017 11:47:57 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	h40sm10055850qtb.6.2017.02.09.11.47.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Feb 2017 11:47:56 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Feb 2017 17:48:20 -0200
Message-Id: <20170209194821.30766-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170209194821.30766-1-fabio.berton@ossystems.com.br>
References: <20170209194821.30766-1-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH v3 2/3] libuv: Add recipe for version 1.10.2
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
X-List-Received-Date: Thu, 09 Feb 2017 19:47:57 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb
new file mode 100644
index 000000000..fbdbeaa89
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A multi-platform support library with a focus on asynchronous I/O"
+HOMEPAGE = "https://github.com/libuv/libuv"
+BUGTRACKER = "https://github.com/libuv/libuv/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bb5ea0d651f4c3519327171906045775"
+
+SRC_URI = "https://github.com/libuv/${PN}/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "6e16d1d1ca464add0730d637effb1c1c"
+SRC_URI[sha256sum] = "2d740a2adea0f1a19058626f55a076ac41a4ac1f95d4e57cae0c8a634a6cd63b"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
+
+do_configure() {
+    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
+    oe_runconf
+}
-- 
2.11.0


