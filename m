Return-Path: <andrej.rode@ettus.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 199AC71A3E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 01:12:39 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id g2so20034374pge.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 18:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=3HiTQo6H9vtIbFMxgoKipMplKaZW2PU6IB0/D+Ea03o=;
	b=XR5iRnN8XxHlvhiKKrOPuYZXym8oeRsWsddOZuwNOimTF7PCXFp+FSLxBRJPkqFILt
	453ZSaDtqsO4DKqpnYR6Cm99zXLK7rLxZUbbtbbOC8tUPPar2TGyRrBuDTPatLeZlVmO
	jU93Sqs5tbpxwrvTt2NbslTdFs4bc8kDyhmsKGFfng0/bvW9QXKBZwUhzQzAcyzx1wBS
	QrPr6KMXL+stVDcUL8Zgf74VUzByjYRHFjki7fBhsCZKNMf35vHSrdyUAAVR8lRo3tl5
	sLQTXyC/ZjpYzufQdtdbtfZC+W2+vngd+qAqrh5h3W8cE6Pd16Zhii3b4iTf6Aox6lO+
	eW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3HiTQo6H9vtIbFMxgoKipMplKaZW2PU6IB0/D+Ea03o=;
	b=K0kC60Dt3mDaiKyGvfWqk3cY1MEi5+/Ml/D/aEqpS9QefAPKbbdtopoNoeOqkMDHbG
	jiy7BVt02F7OdU97hxq3LDSIQ14ofb5fCKx/XvG34D5sck/xnCXn0q5R5bfV8xz/nG7G
	/ztFtOn7eSFDQGdzdg8H+eTV2fM5dXr4wGlhFpq+y73tD9vpDu0oHG848zH8WpouJDNZ
	uYiTdgcpq8O12Xuy0y6Z6dhwMvssPOfK5yB1IO331GP7YgStZ0YY0zLr4EKdtj53o8FP
	2aa2Qn25NBBaHG45Bnx6YfpIOjHzWyPfWNIpWebR3TyclRBBe2AkSvigwSUy70dwVg/q
	I1bA==
X-Gm-Message-State: AFeK/H1Uhpvl+aM0gU/L82bZM25/gYwaowLbfcrG4R2vWYny3SjrWCaFwCtoEYDZxUYQ8/ad
X-Received: by 10.99.127.29 with SMTP id a29mr33238341pgd.11.1491441160882;
	Wed, 05 Apr 2017 18:12:40 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	b195sm33588pfb.106.2017.04.05.18.12.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 18:12:40 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Apr 2017 18:12:25 -0700
Message-Id: <20170406011225.25591-1-andrej.rode@ettus.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-python][PATCH] systemd-python: add a new recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 01:12:40 -0000

Adds new recipe for systemd-python, python bindings for libsystemd

Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
---
 meta-python/recipes-devtools/python/systemd-python_234.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/systemd-python_234.bb

diff --git a/meta-python/recipes-devtools/python/systemd-python_234.bb b/meta-python/recipes-devtools/python/systemd-python_234.bb
new file mode 100644
index 0000000..4cfa629
--- /dev/null
+++ b/meta-python/recipes-devtools/python/systemd-python_234.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Python interface for libsystemd"
+HOMEPAGE = "https://github.com/systemd/systemd-python"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
+DEPENDS += "systemd"
+RDEPENDS_${PN} += "systemd"
+
+SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
+SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
+
+inherit pypi setuptools
-- 
2.10.2


