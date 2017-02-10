Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 70D6B7731A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 11:03:34 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id x49so30916514qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=qcBQZhEsralMPXcMWiTZwWVK8qnojcjTee4P6JxQK7A=;
	b=kMVrt0TWfMp0DLh1l3kp9ZObp5tAT6+iwl0gGa1HJxoal8M0irJLYSy76LKJjVGTYZ
	TnB4ci+QHTc9k7taBYqX6Sff1TjDjUYex0/FPitvFP3gqLxu2rQ1XqGL9gNXQ7ZTIiNj
	cOEMnIpvtavekokaoyiowy49U1+RaikEkJRiFurbLaO8c2/EMFGmd+OPCvKk8EKV7nsL
	Coz9oZGWbM/dmQ0XL2sJc3uMDzse7WkHNI10k/QZA15J/G77TbhVrxW5RTBvjneeVVAu
	guy+xorgiE2slmmVURDg6wKOFcXXrbjDgrLBionHWu8fCXtYWujjvt26fL7A+knO13Oz
	ZXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=qcBQZhEsralMPXcMWiTZwWVK8qnojcjTee4P6JxQK7A=;
	b=tJrEGo/0Tf1VHU+Y8cxPCwm32G2PxF8KBoGERVzg6ccIjFfzqm4ghIgx2ugw5EFYXa
	EdY0/tQ0/1EW9A8m1wWygMlNtjuQcCuZxgOpUGCBIEr3wE5bipvDQB9Q29Bw2Tzgt6wD
	8aqjaypa0Sn2yKge7glsd1vOZy61b0J+X7ZOVM/boltAyxYJeWhjNGSPSP7mmT5VjWUH
	TlmNs4qymEoJ4tNa0vrDInFBfze9/ZJpgYVMcYI1KODcNC09DJfoKx84r7Z88BaiU9U4
	rXsSZ9kyPGJnKmKVQcSNIMxy04xkrlMkzFcQj3tvKGqXFyYdFEBQUpgJNBDUSU0esXRU
	IzaA==
X-Gm-Message-State: AMke39nHaBPzhq2+vbvjWq19AMw8F8VVJdV4bVjjd6siQWRtYs5PguTGkkSohdveFOuk7A==
X-Received: by 10.200.46.36 with SMTP id r33mr8068798qta.92.1486724614005;
	Fri, 10 Feb 2017 03:03:34 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id 11sm1167331qke.38.2017.02.10.03.03.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Feb 2017 03:03:32 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Feb 2017 09:04:08 -0200
Message-Id: <20170210110409.23890-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170210110409.23890-1-fabio.berton@ossystems.com.br>
References: <20170210110409.23890-1-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH v4 2/3] libuv: Add recipe for version 1.10.2
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
X-List-Received-Date: Fri, 10 Feb 2017 11:03:34 -0000

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


