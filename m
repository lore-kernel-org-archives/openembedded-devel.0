Return-Path: <prvs=18631316f=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 49AFD7F69D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 21:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571346879; x=1602882879;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=xaBPsdLmq29afAShvmKNC6IyODs9Ho1i8C8DsFbcGmU=;
	b=DUJB95p+TlBUZ8PZzBRQN+94vpRukGRQrZxilO6ZYub4h74PzlO4ISna
	aUYuF/EprfOgpTDWT/OStoDFtkCsjMzifkJZ5IwLs/QlZX8JwQLL0K3Fj
	sKLvJtMKnu+hAryuEJo2+gqSnsqKjPO1yhMt3+NWcVtHj9bf5MJbOnGGx
	uXuD0+yk8Cm06JePiNqYLacf4XaFXDZYWNZOs5vM/b2wrwYUVt/ws2Jxq
	nDO8Y/yqE4AzMLoqVd/lAcPe6+yzCQ4zXIhmxX3e4wIHMpoVex6Bmpj6l
	TpdabZ1Pmw0ayxiKdUKR+PZLt/AxQgAzXCDxbVHNT5ZEjy2Stam6Bgc0r w==;
IronPort-SDR: M+jMtv4z6/Y9HuHGQaQ9PHFIXv667eYFrkujwpRfvAAcRWWJwxYterHsHHV5L3U5l+miSREVG7
	vXApIq48Sx46oVLMh1y5O5+bezXMCA5JcTJ6uqnC3MrhMcjRCy2eJwX2V6XfQGf+rhUuZ3NJkG
	4xihCnW/WM8hXrc9DureBBwMN7Ye81iXn41+njeFiKlDTHh6ZR3ZmC+EDA2lMmE1yJ/GGJ0QTQ
	7r8AWCgwoUOteqaeDHDYcsI7qJjZG47xI1JqkA6twLYMuslHKurr5ywEErdyypxQasRaodNp/h
	Pq4=
X-IronPort-AV: E=Sophos;i="5.67,309,1566835200"; d="scan'208";a="125212827"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 05:07:31 +0800
IronPort-SDR: k6IlMn8L9JzDyn5an0rhwxuo4SvMX6PNv86T7Nc6TSDCEd5GfEnqJd+i4+lE5CcUzBXBa7qN2A
	RXP8//tW5dnuzXzx+RCmaWAbG1tgqwWgbXtVSj4MP0SO5CsTGPKaLRqtGx6WL9FzLQ++Tre1tj
	XhXvmcGPuqFZAFEV6ZlKFADvp0K8TosO7JCuxNLw8XVUmLNBiSH7NgFpJJnSUylG6qJF4dQw6r
	zStAb3kW1NYS7gMMrmGyybxyubhW3l6LklqDlsG4HXNouOdYgbiZl4uI2GAbsdBsJpPqJZwMjj
	mlcvfUjzsz7MnSnteOT4rjkx
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Oct 2019 14:03:10 -0700
IronPort-SDR: +i92FxXPwbF0ds443GUKYVUSUwBEeSt2tPCm4V94yjBxpKiPc0e4jMORmMHq9qHC+KtP4LfefB
	dOwGLEptXR5dLRtFOpa2aKJjOCVOfPUdfZNppmclh7Hs8bK97p30EfFt7T8ojiXOLatWsgbtuW
	10Guwjiq1DwKdW4AXBt/MyjHDof1N27put0L9VuaVJA1RFC6c+pyqKmWiOVRwYY8wFevaniBse
	BNU6ykdox2LK9EbqYIuLCq+p2dt5bbtAKxC5S2ykS7SOtiMvmmfrP7rEon6v/ZDthR+nddyOge
	ACw=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Oct 2019 14:07:30 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2019 14:02:44 -0700
Message-Id: <20191017210246.19550-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017210246.19550-1-alistair.francis@wdc.com>
References: <20191017210246.19550-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v3 3/5] python3-msm: Initial commit of version 0.8.3
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
X-List-Received-Date: Thu, 17 Oct 2019 21:14:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../python/python3-msm_0.8.3.bb               | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-msm_0.8.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.3.bb b/meta-python/recipes-devtools/python/python3-msm_0.8.3.bb
new file mode 100644
index 000000000..24e1ccb3b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-msm_0.8.3.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Mycroft Skill Manager, in python!"
+HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-manager"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
+
+SRC_URI[md5sum] = "d5f580c58389b337f5577cb92f36e788"
+SRC_URI[sha256sum] = "c201785997f3b766ec376a89bbb3367889ac542183ca26733ffe002bb94917b4"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    python3-pako \
+    python3-monotonic \
+    python3-appdirs \
+"
+
+do_install_append() {
+    # Stop this from being installed
+    rm -rf ${D}/usr/share
+}
-- 
2.23.0


