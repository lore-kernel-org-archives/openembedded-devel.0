Return-Path: <ticotimo@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id CCFAF73D59
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 15:18:22 +0000 (UTC)
Received: by yhcb70 with SMTP id b70so4517550yhc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 08:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wwDNpI/C5+23Drtrx7W9vYnGUYaPimtLFtNuW3g/Ze0=;
	b=HZxruFPe/5y8epi9Sn1G3YIqk2R80FHifIU3qPdCn13Er90qDeSpvslHCFt/EPGehQ
	M+p06jFx+R7/DmtCDY/6CLBRMh+4rwrt67VGhZn1JFpdhWZD8nPodAUAses9v45BYYVY
	l88QR7N7tejPKltCDjKlaFYucyyW5oYktX90Ta3bqKPs+X97YegCLhFJ+Neorv/ZU0I+
	3NgAuamAIcafcW+CTinlsTrDb/8UH2bCRScOFEU5Uci1xX10hrG7o/Bqp54wKeXxkCdi
	QyyuFT+FQDkmXYu9uoK1ze8hYXuxjeY6/9mMPEW+iBsUYCW8rol40nBST604BsgHkO8w
	mtEg==
X-Received: by 10.236.19.170 with SMTP id n30mr25009172yhn.2.1429197503894;
	Thu, 16 Apr 2015 08:18:23 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by mx.google.com with ESMTPSA id f47sm5838584yho.52.2015.04.16.08.18.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Apr 2015 08:18:23 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2015 08:17:44 -0700
Message-Id: <607e66c2d1063af1dd9dc7e5090c180a77266d6b.1429196681.git.TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
References: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
In-Reply-To: <cover.1429196681.git.TicoTimo@gmail.com>
References: <cover.1429196681.git.TicoTimo@gmail.com>
Subject: [meta-python][PATCH 6/7] python-pyasn1: add 0.1.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Apr 2015 15:18:23 -0000

python-pyasn1 is required by python-cryptography

Copied directly from:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/tree/meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.bb

Original author: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../recipes-devtools/python/python-pyasn1_0.1.7.bb       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyasn1_0.1.7.bb

diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.1.7.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.1.7.bb
new file mode 100644
index 0000000..0fe6909
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyasn1_0.1.7.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Python library implementing ASN.1 types."
+HOMEPAGE = "http://pyasn1.sourceforge.net/"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ae098273b2cf8b4af164ac20e32bddf7"
+DEPENDS = "python"
+
+SRC_URI = "https://pypi.python.org/packages/source/p/pyasn1/pyasn1-${PV}.tar.gz"
+SRC_URI[md5sum] = "2cbd80fcd4c7b1c82180d3d76fee18c8"
+SRC_URI[sha256sum] = "e4f81d53c533f6bd9526b047f047f7b101c24ab17339c1a7ad8f98b25c101eab"
+
+S = "${WORKDIR}/pyasn1-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-lang python-shell"
-- 
2.1.0


