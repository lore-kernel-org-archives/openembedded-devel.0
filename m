Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web08.5398.1611294349955427923
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 21:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm1 header.b=WTr63wnz;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id EBEBF5C01E8;
	Fri, 22 Jan 2021 00:45:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 22 Jan 2021 00:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=ThaHK2PwxqDiYiSnVcoEx30SD3
	9fzCnrz0mBnb0RYZg=; b=WTr63wnz5nMtbBtPDyL13cY7mjxLJki6mDe7/xEZ3r
	5lSSeDRVjh96K5TzdHxXt04jQnYmk5rsxCJYVTcvI+6YutociQ7x/Maq4TMhQKuH
	GtjxtFKhlNJZpjWrsklH1Oi21jCPXS/3DMbikdUeXWp+jQEYzlHVnSOpeLN4lax0
	nSXig0nz6bRVMQ/GmC4wvs6DIyxB6VsVi+TWHkBNTKXw4gUdUMaqctzypog/d2ZB
	JBqDOcYuhdRfIn7/nYePBsJCphQrGV5mOYj3L98ZagisiFqlVC5PNaPuPVgGlS1y
	G2TWXoakCyeyRfAHXCp5cT9m4xBWu987CgjJwhH6ezHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ThaHK2PwxqDiYiSnV
	coEx30SD39fzCnrz0mBnb0RYZg=; b=UsXcg+3ehhaQ5/qUN04iPIV4ASWILdU8H
	LXFY2DBl0EYNncrsdO9VfZNcOWy1qK41BHtXWEDhidR+uNaP/ajYcmWDXZqH2BCw
	hK3ndsQoPm4+CK46fAI7KedVXGdEU9sy1Ctal4PpxKv9eliCPW0BRRbYezxr330r
	pQZ+Khf7Pci7vgLalTJwHMYGVGJpAkcEqdmFeqmIBtXOg51fQU0kwr5BH1c9LD9n
	Zj/Ytbqa595QE9PfEGXu/0jy97VtTCWUMaMTwiJv1Z/ryblEpIkWL7p8rNw7yUI0
	BKytYJeMcCgblD7D9ujl0Onk0IDEKx5gsNaXIe0JtWLOZAlmaDeWQ==
X-ME-Sender: <xms:i2YKYGauDtpMzlpBE8Yfk32EjlyU_7iH6WKvW9VynVIaIYY62PZGQA>
    <xme:i2YKYJYB7oqBs09TKCjde5ZmenLt0MHs8knQPUzV0jmRWA_c8KJjUd4ZcMC70gyVG
    oWDXfrQ_9NadpnnXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
    ugdrrghuqeenucggtffrrghtthgvrhhnpeeiudejtddvgeeuhfetkeduieejuedvkeeiud
    dvhfduffdvuedtjeeuiefgveeiffenucffohhmrghinhepsghithgsuhgtkhgvthdrohhr
    ghdpphihphhirdhorhhgnecukfhppedvtdefrdehjedrvdduhedrvdefvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
    rdhiugdrrghu
X-ME-Proxy: <xmx:i2YKYA_Ja370WsceisIjtUj3kTJSC2goAmCrP5pFiJRsxmFY3GBORw>
    <xmx:i2YKYIqBP0tBVI4wmBKbt2eMlwcpC5Ef0EDuIVRV4pSBcYF_IUpLUA>
    <xmx:i2YKYBro52vTYcCXsYUBe3x7I4jG4--l64JEacgxT6Gb5RMe5kYi2Q>
    <xmx:i2YKYDGRHJCQ4pUC1OVmDjS8oG6OEobbVOfIryDvC8pLmtwpGoAS3A>
Received: from localhost.localdomain (203-57-215-232.dyn.iinet.net.au [203.57.215.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 527E4108005F;
	Fri, 22 Jan 2021 00:45:46 -0500 (EST)
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-python][PATCH v2 1/2] meta-python: Add hexdump package
Date: Fri, 22 Jan 2021 16:15:37 +1030
Message-Id: <20210122054538.3675758-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hexdump package appears to be abandoned, but it's used as the
dependency of another project I'm packaging.

Change-Id: Id90d770fb48fa502f3abeb541b7febef42799b21
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-hexdump_3.3.bb             | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-hexdump_3.3.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index bf46896f1c9b..41f376b39b55 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -416,6 +416,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-cerberus \
     python3-cvxopt \
     python3-jsonpath-rw \
+    python3-hexdump \
 "
 
 RDEPENDS_packagegroup-meta-python3-extended = "\
diff --git a/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
new file mode 100644
index 000000000000..cb04e17dfdfb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
@@ -0,0 +1,27 @@
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
+
+do_cleanup_hexfile() {
+    rm ${D}${datadir}/data/hexfile.bin
+    rmdir ${D}${datadir}/data ${D}${datadir}
+}
+
+addtask cleanup_hexfile before do_package after do_install
-- 
2.27.0

