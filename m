Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9BD762B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:21 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q11so3080267qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=bfqewZbg+VRw5Lusp3F70QnO/YBIDi7PC6yFi5oQJSY=;
	b=NmnyLbv6LZdgOJ0GXKeH+uoYks0VUZ9aR8LZxD9UVdfg4dDbTIMWA93ws/QMLvQZ5L
	fvQoVoyR3zQVdnrDSKO5pmcJjtNY6/ap8P8XymQAjg/h6XNz1gPISnwLN64MQEezBo+x
	vk6b9NtcbK6dGd5PUMCynZ5tTKfN6voRHdpsC2P51jAnr47+thzTubaUNklc8IsyBuRa
	3qUgiqFge2IdZ5zIwIrpxRtn0huihjxRejgw5ayFL1vTCIjPRfwzLmp71c29s4ms6EnB
	xroV5PlVedCbDZkRL9DCTmcn5R5oQoKQE7IsaYc8c3ybnYWj3U5/LzvZ3lTMhKc1b2jr
	JoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=bfqewZbg+VRw5Lusp3F70QnO/YBIDi7PC6yFi5oQJSY=;
	b=IoZ5Es53XBgarjs2HhD6J53O3429ofrpnAjLDE7ccBipB5/U9L67vAOzGwRL7fslyZ
	G0UGOBa3KBGMCAUtTo7zLidRdW/LDXtL0mQtV0C2ZzwtHF8lDToZ1/yiZUVRTsKI8mrC
	0SXkrL9bYGPGdxsWgj0oBXvvQyXs5ACMpy3zKdSiTdFzgu5KKL5kAg51H0xHCjtv6vtK
	53/GmoX94M29NjrTq4x2m6dOWblZPusBLo4Tc/3HrP5zIY3gjlrPkFA+Dz1EE0jOnUD7
	Oxs100s4gLC8wR3agHFDu8NH+3+4DD7GZo/SiY8hZD6imuP0G4U+SaU5RgvfS2BTDz8j
	i00A==
X-Gm-Message-State: AEkoouvRswqHQNpw47lCdu8GySCiu4HxSkY8L8O6WSfHqYY89IGAEWK+RbSA/nIqM3Qdwg==
X-Received: by 10.200.52.85 with SMTP id v21mr26099246qtb.21.1471892602411;
	Mon, 22 Aug 2016 12:03:22 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.03.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:03:21 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:25 -0300
Message-Id: <1471892491-6177-11-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 11/17] python-pytest: Extend support to python 3
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:22 -0000

- Add Python 3 recipe
- Add native and nativesdk to BBCLASSEXTEND
- Change code style for RDEPENDS

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-pytest.inc    | 16 ++++++++++++++++
 .../recipes-devtools/python/python-pytest_2.9.1.bb       | 10 +---------
 .../recipes-devtools/python/python3-pytest_2.9.1.bb      |  2 ++
 3 files changed, 19 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest_2.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
new file mode 100644
index 0000000..4877358
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -0,0 +1,16 @@
+SUMMARY = "Simple powerful teting with python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a5609608d9a5a180705b0fa298ae01"
+
+SRC_URI[md5sum] = "05165740ea50928e4e971378630163ec"
+SRC_URI[sha256sum] = "0d48d27a127644fbe7c8158157e08b35f8255045d4476df694b91eb3a8147e65"
+
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-argparse \
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-py \
+    ${PYTHON_PN}-setuptools \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pytest_2.9.1.bb b/meta-python/recipes-devtools/python/python-pytest_2.9.1.bb
index e21c4f4..d322f09 100644
--- a/meta-python/recipes-devtools/python/python-pytest_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python-pytest_2.9.1.bb
@@ -1,10 +1,2 @@
-SUMMARY = "Simple powerful teting with Python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a5609608d9a5a180705b0fa298ae01"
-
-SRC_URI[md5sum] = "05165740ea50928e4e971378630163ec"
-SRC_URI[sha256sum] = "0d48d27a127644fbe7c8158157e08b35f8255045d4476df694b91eb3a8147e65"
-
-RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json"
-
 inherit pypi setuptools
+require python-pytest.inc
diff --git a/meta-python/recipes-devtools/python/python3-pytest_2.9.1.bb b/meta-python/recipes-devtools/python/python3-pytest_2.9.1.bb
new file mode 100644
index 0000000..466cfa8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest_2.9.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pytest.inc
-- 
2.1.4


