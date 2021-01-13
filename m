Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web10.3027.1610507876047583536
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 19:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm1 header.b=d00UaJgi;
 spf=pass (domain: aj.id.au, ip: 66.111.4.28, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 5E27D5C00CC
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 22:17:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 12 Jan 2021 22:17:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
	:to:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=cfhE8JRz4psD9IeFgyXeZxPy/j
	9O0HFQ9WxH80JHI/0=; b=d00UaJgi5vI15hqKrpr/VvSHvB16Hatn145HUYZY7w
	FWi/Yw/GGObDpAipVCnwDm6viAj+dmsJ+NF6Dxwwc66Ap0nJWiJHjfou8lrCdmNc
	N/fLN4V4wl5/Bg4WnRxNp1oI1FILAQ+3MHFA2i5r6jYWh20PkqahYlIPoPnRtib9
	TeM0Qxommc9z6SDi4efbHFk/BxJM0UONokHCWqjG12gTL7oKx+VoXkuHqWUDcyBN
	g6yFAP0NYJBqLxsB8REgKwVhOMbJMJs+1LuKbBDZJRSMyLR1rrdRAMYcfRySuVik
	PSzKmHqwh5kO1Y4oGLLtr2jeaeEq6hiHlWumiE/82AOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cfhE8JRz4psD9IeFg
	yXeZxPy/j9O0HFQ9WxH80JHI/0=; b=PNbvZqxMAnytR4slBubYQHLyppO/6Wfkb
	v/yEkt+4Fbc3105UFOKxv133FBGulklTLaMC0hthEAZYrFQoAFMCHouEYXFiTK1c
	u9sVl9uSIuWXCVYoauguzuJW/Z6S2N74lUeGhJgYj+MF07SNVplM/As/hgo1wTpS
	jXuYrRMsXWmEu2BzwtdMneCHcHSK/+fwIPVLn9Kn0G6wNt3VwacJFOEQnWc152td
	qk/vGp9mAWwHV8pWB8LNVqYfRRApBHPrvTO1puFCqOpYr4nBHkrs2QSJi0iDvfn3
	A6H2TsgMmoSVE9B6M39YaHn1GwQJHiaZ2aloAgR0x5y0YLr/AXLCA==
X-ME-Sender: <xms:Ymb-X-UG_osR5IzW21R-BTBUxe0Y9ZCQW4mAiBly5lHeRl8FPvSHHA>
    <xme:Ymb-X6nJbA7VPSQJLh_3utGkSCQDCZVwz6QG2U-wcY4gtqCAkeaFbBNZumXttuQYt
    QsARssOPqOqbsWWNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
    ugdrrghuqeenucggtffrrghtthgvrhhnpeeiudejtddvgeeuhfetkeduieejuedvkeeiud
    dvhfduffdvuedtjeeuiefgveeiffenucffohhmrghinhepsghithgsuhgtkhgvthdrohhr
    ghdpphihphhirdhorhhgnecukfhppedugedrvddrkeehrdelheenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdr
    rghu
X-ME-Proxy: <xmx:Ymb-XyYLrE4lrogM964ph0Zglyw9zyYjWynxk0FNRuLCL3sbyH7WgQ>
    <xmx:Ymb-X1VPMJEeE3W5IN2ENzwvLMRYfA-FeFR3_hT3Kge_EoJIL3zQug>
    <xmx:Ymb-X4npd03ODTFbZrje3doNGUnes6rHAublBuQQW1WjTmHFXp0xkA>
    <xmx:Y2b-X0yJcJjdohpkuLjLfxXRTjGr-nrfw-H0hNj8OUtqGUZOBtJEOw>
Received: from localhost.localdomain (ppp14-2-85-95.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.95])
	by mail.messagingengine.com (Postfix) with ESMTPA id E35E2240057
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 22:17:53 -0500 (EST)
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] meta-python: Add hexdump package
Date: Wed, 13 Jan 2021 13:47:44 +1030
Message-Id: <20210113031744.2245509-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hexdump package appears to be abandoned, but it's used as the
dependency of another project I'm packaging.

Change-Id: Id90d770fb48fa502f3abeb541b7febef42799b21
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../python/python3-hexdump_3.3.bb             | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-hexdump_3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
new file mode 100644
index 000000000000..eb4bf994d4f4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
@@ -0,0 +1,20 @@
+SUMMARY = "view/edit your binary with any text editor"
+
+# The homepage listed on pypi is [1] but the repository has been removed.
+# Instead, set the homepage to pypi.
+#
+# [1] https://bitbucket.org/techtonik/hexdump/
+HOMEPAGE = "https://pypi.org/project/hexdump/"
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
+
+PYPI_PACKAGE_EXT = "zip"
+
+inherit pypi distutils3
+
+SRC_URI[sha256sum] = "d781a43b0c16ace3f9366aade73e8ad3a7bd5137d58f0b45ab2d3f54876f20db"
+
+S = "${WORKDIR}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

