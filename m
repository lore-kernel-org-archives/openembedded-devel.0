Return-Path: <prvs=184014d2e=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 119B37F385
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 22:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571180344; x=1602716344;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=cUtfShSuHyW3Fb+958svYpfwf7L1XqUC0KrZLElftn4=;
	b=fkdc65NdY9/9q5PqQzUaIBWLFcWq90ARDSpYARFIaM2/YwOzeUaEFz5d
	ks9aT1tEBvSrmR8XM9hh3fmtuC7HL0SNPo0X9jI+jc68q2u3nlAdiu/kp
	hNUW2GxnIw0kaNbBfoJot7vsgjbPPiIKvnKF5H6Q9wA7vlCJ5khd81DSM
	F93XhImbSti7c3/VaV0BjB/geSqzD1C0tzFzun+NoroPv/mYsXPFa9RKz
	Fol8El+3RmTj2dr81hC5Mae02WcchnTGCNPMT15gNbzJstOBXR7GAFOwC
	rifJ4PPjtlnsmJ8kbaeD8RNOrhfID41fVKU5qphyyMq9ZOXoIqKzPcOgt Q==;
IronPort-SDR: lJH5PL2DJ1e/sElrVvwcFiqtH/ZFzCkEJ78KI68e1jPCxKG9yvagT7CBJwQN7i3tD9qzsltrSY
	nklbdZaEKw7N8aWngeRpdNIxDra487E18E04rdOnwfWH//FEp6FsKDUqttq6XqwwsaVfKX68gF
	taszxJ3Fnyc2xFmG+j97gWmiN0vb0bjG4/JFUcBFWJPw1+ftiL+qX1yO1lzv+wkSws1qBu4q9v
	87bV61nJqe/di68Nfu8jzoMefNt+Td+45qCbwDYMwil7HF/R6aNRcClkRHTSUSEv1xU6V7LuMA
	f8o=
X-IronPort-AV: E=Sophos;i="5.67,301,1566835200"; d="scan'208";a="122194670"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2019 06:59:03 +0800
IronPort-SDR: F3atVnNIKKCLpZLWqKsIJVZKksRMBUhH2PSuQUax0gfFnnqO136kXIaNFFEHrBTBvQoZqMc4r2
	cBGQm6pvEuy96RnqFzV70SUfh/JiMpYdixpjvGSzBzFxcbz7E9AvAVB8Mmqz6Lsp1Bf+rY2/+9
	rSUk6dFh/1H/NsYKWsdBAkrMo/vAy0iTMw8+Sb44vztAUSVOLD7XobWHwbW1wJHxbAvcnKpYnR
	uteYlI8HyCdb4ZYD1bnmniQFflFlIoAY8j3MUeHUbr1WeKoYEMA+6n646l6jqA/dSY+cKA5B8I
	tkpt7O3Gv+4j44jOZY8xOyR9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Oct 2019 15:54:51 -0700
IronPort-SDR: kpNw+eNQ9Dw1eWZ1w/CdrkqhjucT6CHJbP9KbSC5GuFYxA2YETEM7qJ0bZM+KG08fOy7Tozutx
	7oCfca5hwNmaFDboKIZV4P63X6jmOWXgz6Mp+JLIQJt10rTK/UqgKtDBTiwAvk9P8vOEGNYA2i
	bp1A9SgcmJObH6cuZqJLZiStsq0/ilKBMnfr7SEcLjiu+3qMXMKzVraAVhs+T778HTJQTcjEVE
	H8u19G4x0cDKuMjrgpfYS0hIP+612E5EHLx8x+qdihRoiry3Q8J6D72AxxKYu25FoHFsPHkI1K
	XVo=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Oct 2019 15:59:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2019 15:54:16 -0700
Message-Id: <20191015225422.18179-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 1/7] python3-pako: Initial commit of version 0.2.3
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
X-List-Received-Date: Tue, 15 Oct 2019 22:59:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-devtools/python/python3-pako_0.2.3.bb        | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pako_0.2.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb b/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
new file mode 100644
index 000000000..24efa44e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
@@ -0,0 +1,9 @@
+SUMMARY = "The universal package manager library"
+HOMEPAGE = "https://github.com/MycroftAI/pako"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
+
+SRC_URI[md5sum] = "8eb7077075091c50e4b8a9f939607277"
+SRC_URI[sha256sum] = "6be55fd8c5a2a6f02974f37438c1c47a3d9e764ce81c9d0a1a8c9a1815a59778"
+
+inherit pypi setuptools3
-- 
2.23.0


