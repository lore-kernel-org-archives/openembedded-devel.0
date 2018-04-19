Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2ED4745FC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 12:04:36 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id s18-v6so13331159wrg.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 05:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w3KhPEHTWy4tGOTbDr5v0TKKfVEX67esn9OW4WMi82w=;
	b=WenpRKstLz6PZu3Vu7LJJTK3TYKLc9MUSV5l/mOUP+gTA0tCxTE1mjb/TdIWPtHpbQ
	Bm2xib/xd+hAgQoAd435ejatQB4X8u0SzTATjIX5xhY/v4B091bvXUj/p7gHd8b/wXoe
	EI/sPDUVX7wRQCyWLjMuBh8r/gy6EPzRoJ3U1sS1M7W7ZvhR5Pmmnk8VAPu298ZhslaU
	W6i6LwUFPq8e471up17yEllFocPGfpop4uc7B9dQNok0GHjLv80pe4K7xonc4I0uPIXf
	iqjD29RR75igvTKs5hInK6WVP6OO1lwnNg6D1QcKKOT/9zMdO6V4Dtn8iuyc+kGX5opR
	yTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=w3KhPEHTWy4tGOTbDr5v0TKKfVEX67esn9OW4WMi82w=;
	b=NCViTVou/jK36rNl+l49YV/rEWaEUicOVDhVMd4BazTUK6afnBftyM8HvL1peoWBP+
	swgwDLQ2K/d8XlWeqvuZ0fi7OnrOZWdR1/4lsdjcgsIgiECJ00MsYtbyDlAMtlnpdEFd
	BM/mYCWEt1gvy7V5QAey2feXTLfR4clgTicIOI43BP9Xv5RsRE8eiT5jaJ4Q0K2oIoCF
	ZXdzlRbbr7g5y4Yk7fXaIs/erha99EGZI9AN8Z/MEV8Yra2rSKHcrdobVNJt1o8wJH1M
	m6zfIVMaB0G0dPWcvWLE09FduC0vJm0sHUsXDXjGK+fJCXFmkn2rPzAmDcUjLtJoM/d7
	tIXQ==
X-Gm-Message-State: ALQs6tCUhErHYb0Ri1+QjY3uazz/ISidWLo07IdnG/BcDJYKyCzWwVkn
	dsl5QFIps8S3zia/S6vEganb0uBx
X-Google-Smtp-Source: AIpwx49vQ1axTryz6iEQ66n9kugXlkln9ANnXxTJJdMGRB/VP9643vsJb5nDLu70aOyYWyc1BH2S2g==
X-Received: by 10.28.232.202 with SMTP id f71mr4747304wmi.136.1524139476934;
	Thu, 19 Apr 2018 05:04:36 -0700 (PDT)
Received: from localhost.localdomain ([93.68.254.169])
	by smtp.gmail.com with ESMTPSA id
	d8-v6sm3653033wrb.72.2018.04.19.05.04.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Apr 2018 05:04:36 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Apr 2018 14:04:30 +0200
Message-Id: <20180419120430.1834-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180419120430.1834-1-costamagnagianfranco@yahoo.it>
References: <20180419120430.1834-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] cpprest: add new recipe based on Debian packaging
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
X-List-Received-Date: Thu, 19 Apr 2018 12:04:37 -0000

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
---
 meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
new file mode 100644
index 000000000..2f5cc6ae6
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
+SECTION = "libs/network"
+HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${S}/../license.txt;md5=a2e15b954769218ff912468eecd6a02f"
+DEPENDS = "openssl websocketpp zlib boost"
+
+SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master"
+
+# tag 2.10.2
+SRCREV= "fea848e2a77563cf2a6f28f8eab396fd6e787fbf"
+
+S = "${WORKDIR}/git/Release"
+
+inherit cmake
+
+FILES_${PN}-dev += "/usr/lib/cpprestsdk"
-- 
2.14.1


