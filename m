Return-Path: <prvs=184014d2e=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5E71F7F385
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 22:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571180344; x=1602716344;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=xaBPsdLmq29afAShvmKNC6IyODs9Ho1i8C8DsFbcGmU=;
	b=eFks7nXtuwaaYmQ63d3TNaCrlFjsQI4QvZBmIU27dLO4lqbSX3p1PGDF
	GtMOqj0tdjDmU0Ws5GmjlfLy0hwk2t9pyf3GqoRznyCuwlDFfpqAAOOEK
	KTg5zIZ/lygrsPiUeZz89woWhlKRiqt+Qvw2WOWZGNVjCzlWYRktmEE3W
	SFQgEkR7tSxekR6hp6b9MNj2z3+1+Gm/2nO/MI/2vJpPQghejmsQ9BUZA
	lgmUhjc7dWGiBRt7dc+Ca6vARz5rdGhaKtg26yEW63VY/jxAr8TrxPccl
	TM0rA3ENxgfnbyWIj2yYmTsL9QnWnDSFP0H/jk7cmtjjR4z5agRY+vRCT g==;
IronPort-SDR: qvtnA4r3nwFOLgx8n9SxLu94hWqS1WRoPDyZEtshketX3WPvEShHFTlOf1JEwnQfyfBT7JDq7P
	Mz1OvAxEOBmIo4+vdKnUsnI+MQ8HToXXaaFl2awDbvEbaQPv/Aply6RWNStxv7wT4qHfE7u7A5
	ApsyhMT2P4ri4l7/wKh9KgenTbQ6NcVxlpCv3WikBJU2oFsCbk2vEhOMh9i3FNcpHZxNyfUIC9
	2Z2fLmJSOOJUG3EOJ4688y0lctjcFsFzWFmX8RIvyqSnwJBgXltz2dk7wnHY5rI9s1o6uaT3S6
	3Qw=
X-IronPort-AV: E=Sophos;i="5.67,301,1566835200"; d="scan'208";a="122194672"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2019 06:59:04 +0800
IronPort-SDR: 1oOUvuSCQEUX2p2fFWeJnfD/ulg29F2ZN9GFP/vncJO0IYuBaBRx9DpedDNhbAECB1C3osJvpW
	PssnRF/O6CYGLzHwzm0rp1QY5I+jNnXPQKSY0wJmYo9GCx1q3BHANwSQnPseq0Fy0VEH1PPJZm
	/qjQmlOb7V1QUt/1iAjLSmXCH34bhF/o1I7IYHjuj7dIemdAXSQn0bHRDBF0GNdzCNWdGV6pGH
	IKr8+HIgb+0WSgSHrBaWMrismhN1Gb1nSh8uHJpj1tXNzWPHO4A1t9MS8CW+1HVeAh9QT719a7
	IDKt264Dy7x1EOF2yrp+KpNH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Oct 2019 15:54:51 -0700
IronPort-SDR: aelH6Q6Zt2yi5u/PNM7fWbelqOZ5Edr+tleisD3AzWO3Ldh/IjUKg9nU5uocEKBb9NpuJCkzoS
	U7+iEwXFOg5QdMBfEmO5i5gMOfYZFoybgEWnJd5UcUzepx4SuPMuDoKYgJsQtfvoRt4l/J85dy
	jXR0yxCaM9uqcAQR3mHEyuv1FRiivxPqbChr2r786msDOPFDwLjw8EJeGAliwAaMozIu5NdS28
	YCRAx71YiIKGqdKjIkUVADz4hqUrhf3HONbrVWq/iRDjdblMFH3ckXq3GTdWHpnE7BqZb1jnXE
	yV8=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Oct 2019 15:59:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2019 15:54:18 -0700
Message-Id: <20191015225422.18179-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015225422.18179-1-alistair.francis@wdc.com>
References: <20191015225422.18179-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 3/7] python3-msm: Initial commit of version 0.8.3
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


