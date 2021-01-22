Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web12.5337.1611294350946978007
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 21:45:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm1 header.b=kb2u3UZ6;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 773DC5C0247;
	Fri, 22 Jan 2021 00:45:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 22 Jan 2021 00:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=7psZsLaLjV5bB
	BXdRSyKbBLcPRpaUGkCkD2AOtvOkog=; b=kb2u3UZ6WTjhGZzzOroA1OSfOImAJ
	71GJA8JS+Bhc75CdLAtC6tFOY3VtXFh4hg+P/lHRv1xFaqg8kXhbCe1sDuyzOCF0
	R/U2A38k/IQYqMvwlYxve1lAgW6Q421pGDOZIYCehOBm6DcVLLlBRQuEWFNGGuKK
	WfdmvLtPcQVjN6lDLn1B1ifdV5NW/RkUBsEYV7Haxf4jWQ5nRYHLuQSpDzgZY2gq
	4jCE0vFG96hLNKbI23h2OUZXX7f6A5n0BDJKSbT3eqoDfwzrmHaHbSsdeh0mn8pj
	/tdul0zdumSi0nMNclQcxoTluAizXTUqEmfkKF+omlnzrdhmMkWTVyhLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=7psZsLaLjV5bBBXdRSyKbBLcPRpaUGkCkD2AOtvOkog=; b=WbMpWtwu
	fr9suoQOFNeL1VvLNVdo4NjfREKjF6fDb0I/Cn0cBcWPm3izpuDl4LgMBKHSsF5d
	8BD7fcXFGs0DHrhkkKMVuRA6LxAouR+8UuH1Ax2b9Jsq/jQodmpkfx/duPiAyUWR
	Rsu3DdVRLZCAw2huydBLiNPu8t58k7Qu32OgYmei23VcVUitG2HDVbYvg23CgZU0
	FmR7nzIxd0Tnr5ANP32JeQvf3QBcd8ykt2IAB9mBG5K/a6I4zk6DpLIlkZqZh2+B
	HYPhnI8SV9wxPOFFkXWiOe9YApHaI4xSTTuSm32TroTkbelS9KBhhHBvjGnFucUz
	XTrfseHHJBnazQ==
X-ME-Sender: <xms:jWYKYLxBJKAx19Mf1rQRzQr52OX6_gX8_N9EgKR4tPSuWNwsayK2Lg>
    <xme:jWYKYDQBxavw_aTeBFOd1ocx8YM1UdIMWZ99uaEw4iDf2V9IwsoQtOAv5IELdeVKi
    jot3xn4h-A1jIpuAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeeuhfethfduueefhefffeefteeiueefud
    elvefgkeetfeetkeelteffheejueekheenucffohhmrghinhepghhithhhuhgsrdgtohhm
    necukfhppedvtdefrdehjedrvdduhedrvdefvdenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:jWYKYFWTRk0tmRTLmmaj06YVpY7Av8RGDCYz6OCUZmvY9N7SjO_lqg>
    <xmx:jWYKYFiFqhzkS8B9HCafnYrL5QIQ4D6bc3RuCdA6N2OxRjyW58eEew>
    <xmx:jWYKYNCay-EQ12epqAvEvxc4E1WvY85FNL8O0mf6e2cVro538aQRgA>
    <xmx:jWYKYI-mbGiarUgrVkWRAOuRFTl0_HbZR4AUBECavbO2Klu9YjvbkA>
Received: from localhost.localdomain (203-57-215-232.dyn.iinet.net.au [203.57.215.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 29A381080059;
	Fri, 22 Jan 2021 00:45:47 -0500 (EST)
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-python][PATCH v2 2/2] meta-python: Add jstyleson
Date: Fri, 22 Jan 2021 16:15:38 +1030
Message-Id: <20210122054538.3675758-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210122054538.3675758-1-andrew@aj.id.au>
References: <20210122054538.3675758-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jstyleson is a library to parse JSON with js-style comments.

The license isn't shipped in the pypi package, so it was extracted from
the github repo at [1].

[1] https://github.com/linjackson78/jstyleson/blob/8c47cc9e665b3b1744cccfaa7a650de5f3c575dd/LICENSE

Change-Id: I1e22ef42e823d172fd52f40e84bd5194c131310a
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../packagegroups/packagegroup-meta-python.bb     |  1 +
 .../python/python3-jstyleson/LICENSE              |  8 ++++++++
 .../python/python3-jstyleson_0.0.2.bb             | 15 +++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jstyleson/LICENSE
 create mode 100644 meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 41f376b39b55..5f81fd35b75f 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -417,6 +417,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-cvxopt \
     python3-jsonpath-rw \
     python3-hexdump \
+    python3-jstyleson \
 "
 
 RDEPENDS_packagegroup-meta-python3-extended = "\
diff --git a/meta-python/recipes-devtools/python/python3-jstyleson/LICENSE b/meta-python/recipes-devtools/python/python3-jstyleson/LICENSE
new file mode 100644
index 000000000000..807babd62b64
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jstyleson/LICENSE
@@ -0,0 +1,8 @@
+The MIT License (MIT)
+Copyright (c) 2016 linjackson
+
+Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb b/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
new file mode 100644
index 000000000000..e70ce33efcd2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Library to parse JSON with js-style comments."
+HOMEPAGE = "https://github.com/linjackson78/jstyleson"
+
+SRC_URI += " file://LICENSE "
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=d97b96c7337934ee448ffd4392f32079"
+
+PYPI_PACKAGE_EXT = "tar.gz"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "680003f3b15a2959e4e6a351f3b858e3c07dd3e073a0d54954e34d8ea5e1308e"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

