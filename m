Return-Path: <prvs=145ea1953=alistair.francis@wdc.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Sep 2019 21:02:18 UTC
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 16F8E7F377
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567803741; x=1599339741;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=ftJBsauYmoQYuoC8hZioCwbYR1Xz+XLKty3WWoHhsys=;
	b=qbwH3htRSUQYPLBjcEAiYifBEGPYxwKkw+hWM0yizBDhypt8TqdGsa0Z
	mG6YrO8AwgsxXzedg4lMp/eOC/P5OTQuNngpdGw6G36/hLRFOisueoRI/
	rvZevXLspsxmyzgyjpHt+MhFaR4kDpU7wP2QKYHIGqXPMqiCixkGTnE05
	WmjI25V1cxWv5USnVshqWV/GiHT2o3pWavoyLeKrAX/5bUZxIaS4qAQIh
	C2VZ38P4Z/uoFXbteJ0sR5J7DkRVAf/K0ql66E+QrY6O6cDd+rU20wSoK
	B+p02NCKl7ymfhUVwM9jjNH4KbkX6GbDIbcW3miX1lFliUxhLt+HbCho6 w==;
IronPort-SDR: 6P7hM51pw5m5GJjyRf8/wSYxk9Rt4IF4WLYOwUbiCpgtN8Iqjy/MYdsOdolL0VOPP/de/Ma6VK
	1H1i98zVXY5+h4fUnAfiuAcZyyquRzjnGmi2AzfC2dSkzUPIr6SkJuji9dik5UILeSgHjmVQzc
	Cv56OGf8qtV9JwgryrgTGQloBjf3Hf0eQ5GSaPpUR7Ywxh0I186d0k7piPyADEYOYGofdiEHoH
	qf4tHVn6UJTlmieU/1pNYUdsfyv41hAR0Yol67Z0i+APPq+yrso2qmvIXLN80QGdqvYSmQFDFb
	BJ4=
X-IronPort-AV: E=Sophos;i="5.64,474,1559491200"; d="scan'208";a="117692389"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2019 04:55:13 +0800
IronPort-SDR: GfOS8dwb4iP3uzi9/UkL0yukuxP0z7uQ/ZW6e6s3iVLncIotWFq0+gyq2lmVvEY5djhQXr3Vsq
	zwuItUSjt+r2fMSsAmbjlp1nVe2ryZO+J/euzP1RnOCxC8QATT1BRtHlJmk4qrg2+ZHHWBtdhg
	etSOGts7yBtq/T8NM9STmN7YXpkAyIRZuqrxxhGgRQsJxCKlqhlrRuO3l1OwswbcgmeRT/SaKs
	xg/lTEHZqIWMPtUAv6h/rvgzDMElrYvnf8WfEEopPud+F85R2BenDXmq8B63o4w1nW8IHbshhZ
	+3bZCYvvRBsL/yFFzwIul7Kn
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	06 Sep 2019 13:52:07 -0700
IronPort-SDR: KpopL5ad5tdqK7itA3DqybGdnpw/dmVS6jIM1XQA/q7mY8bfp8cBLR1GZcI79alqfDeroHqRbu
	TecrsYLUQeJQ3k6dvPJUUAJUXeyPBU9FY+3eVIyxp9lrdmxzaXcnyUc7TwpA3dGjGPbDpvQfyN
	ysTHVK+vBZLy7rW1aRMnxitB3eRJLka0zG8gbjU6jQUqhfQ0I61i/eAEc/rAJ/6Tmcv6LM94uC
	cLacniivuHqhc0xcRgxf4fUABfKRb/u/CuRv7VFOAT1Ag99cFbGAHH+KWBgZ0OxIW8hkMoRIlZ
	FJk=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 06 Sep 2019 13:55:14 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 13:51:19 -0700
Message-Id: <20190906205120.19040-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906205120.19040-1-alistair.francis@wdc.com>
References: <20190906205120.19040-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/3] python3-six: Initial commit of 1.12.0
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
X-List-Received-Date: Fri, 06 Sep 2019 21:02:19 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-python/recipes-devtools/python/python-six.inc       | 9 +++++++++
 .../recipes-devtools/python/python3-six_1.12.0.bb        | 2 ++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-six.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-six_1.12.0.bb

diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-python/recipes-devtools/python/python-six.inc
new file mode 100644
index 000000000..92df2b486
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-six.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "Six is a Python 2 and 3 compatibility library"
+HOMEPAGE = "https://github.com/benjaminp/six"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.rst;md5=f9a0f1a5bcc65f1b7de7339906282610"
+
+SRC_URI[md5sum] = "9ae5d1feed8c0215f4ae4adcd9207fcb"
+SRC_URI[sha256sum] = "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-six_1.12.0.bb b/meta-python/recipes-devtools/python/python3-six_1.12.0.bb
new file mode 100644
index 000000000..8795313be
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-six_1.12.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-six.inc
-- 
2.23.0


