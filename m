Return-Path: <prvs=18631316f=alistair.francis@wdc.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Oct 2019 21:14:36 UTC
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 86FD47F69D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 21:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571346878; x=1602882878;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=dUi8IQYpNgSwubVT4QFzpPvXMaQhIGUVPwl1xRRxmRY=;
	b=jGPTNgml5BfN+Yp9tCzaB7kzMa/paE43mE5J9XpXifeG1Ds/RTRLfnSQ
	RyiS1yYuYmP9Qt5nPAIvEtOgmbkp2G5qHBNiJHD2w+AfYYFSBblHo1dpO
	5BxIrraR8omFhgUh9YC9iiT48hjNqLwSOBTyuTZSV6sP/Ip0ELxPeAfxV
	YfMSpcM5oISns4uB90Sd7QIpyvVS6dP3obpk2JN51ShnZruJ2Q6P0rKxl
	oF30rumpSXVHR5MclXs1Sc7xQp6ytvQVJLitUZSTyrGGMgecTQ93/Odjp
	j0PNHTb1JMWK898rYODZTDpFixDRXXypuJ0hXjaC2XVZ5VLbeMd+y6KXV g==;
IronPort-SDR: 2b45zjJdUZjqljNSBFroR0HIzhvElj6p48/f/87e0uSuOZXAQ+5+l9t+EhPmWLr00TEMLDSWyz
	F7CcNugQ6xA8ePRQKSaW//2AoJd4gVp4daAuUTq3P2j8YatVkfGnu5mFB4mFWADmvlJgRgHNGZ
	LQS1gHzNLZKXJGAXad7BVL2XhuBPBqqQxhKdcb6SUQb7wHKGfprECnCG0KOSLneJBxHAi26srH
	1kXN0k1J1sYWOzmZa1/Ywoi93x1KrIowpyXCGE8y0BrBubKf3PNmP5AWfcyU5c3kGYRDjCflx3
	LhU=
X-IronPort-AV: E=Sophos;i="5.67,309,1566835200"; d="scan'208";a="125212825"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 05:07:31 +0800
IronPort-SDR: ILq3fzXKdlHypdpXo9j899yE2Y5zQi68Pl51bdsUv8A+8lypu3NOrfkMUdA/ynI10B4h/26xqy
	QqHo2+vyPoz3vnH2d1iNahbbI6XajWGGPu+B6kEFUz/Ahx/caT2o6qLs0oVhpf78OJggBS4uPp
	Su45kS4c2P9IF0KOdy6y9+v5I/jC0hAB+T673k+Xd6ZNZYURpuFNXtYGvCF7CVQNSNZLIc2qVm
	dTiPhHaCNE/t55iBp/pBdhXTLTMICTk2PMNlFMCp8oCNr4v1XlEJ6UuKtZE/eDMpuiGivQCFlq
	ATjAjqKgFMgAaZ0c0RUdkvjl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Oct 2019 14:03:09 -0700
IronPort-SDR: bOVE3AWYYRXVBnAY+AWVoVTB4QduQxRR66lYisIhJsjPPHNT446+ePvkPUqXsyhfDnpavzdoSv
	HpA93nX/rtw/irjxgUTnoCsUjdN2S8wHuVGafktIb+AvCd4OvWrmkRQ1AIUTmnfqf9arhZFSHI
	etdskbBgMrNCYzqNwC2250VuQKHQN/OLWbrlq88nxuk2SwzJUs7m/8rWprhzOCMvJO369HCXiv
	Zo6nr1k14LiELtPfJAyBcUDFe5QYhyqEN42jY1OyR6HS++KBg8/7JWm0yS6DugGemCmyK2Dt+C
	F4o=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Oct 2019 14:07:29 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2019 14:02:42 -0700
Message-Id: <20191017210246.19550-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-python][PATCH v3 1/5] python3-pako: Initial commit of version 0.2.3
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
X-List-Received-Date: Thu, 17 Oct 2019 21:14:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v3:
 - Fix package failure

 .../recipes-devtools/python/python3-pako_0.2.3.bb   | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pako_0.2.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb b/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
new file mode 100644
index 000000000..21c48fca6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "The universal package manager library"
+HOMEPAGE = "https://github.com/MycroftAI/pako"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
+
+SRC_URI[md5sum] = "8eb7077075091c50e4b8a9f939607277"
+SRC_URI[sha256sum] = "6be55fd8c5a2a6f02974f37438c1c47a3d9e764ce81c9d0a1a8c9a1815a59778"
+
+inherit pypi setuptools3
+
+do_install_append() {
+    rm -rf ${D}/usr/share
+}
-- 
2.23.0


