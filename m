Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.3090.1610507888587078007
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 19:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm1 header.b=Yhb2ibin;
 spf=pass (domain: aj.id.au, ip: 66.111.4.28, mailfrom: andrew@aj.id.au)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E250E5C00CC
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 22:18:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 12 Jan 2021 22:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
	:to:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=N2E+qXk5WB+QtHfY4NI76nGq+F
	g16KKzGhxUbFXLFnw=; b=Yhb2ibiniqe80fCboc4xC1tzEXWix05cNc7soL0Vxc
	YoQoUsInwxFrV2z/0514fxsT35PvR2KH6KKSU4gbAb+xtXghxeqFNdPJMWo1SJ/j
	ISNHUjX7Dn8C4S60FdZ7/ekD2nGmgLiuYjtFZMtC7/Cr1hoFzwfk3xLpx+v4Vh+j
	ziNzaZ6D3nJ8N9F7KvfqMSxBFkLzUJ3oXlT1spRw8ofwIj+umqyKwdTUw2rWmG4O
	x9rIxjEckJbNJc543/bmeZTOkSj6YOQd4LH90ijDdQJ3Hf056hCJCOP1NQBsxORy
	67jxpDGGnc2yj8wawXMDCKv9RUI1llimotL/XwFnG6CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=N2E+qXk5WB+QtHfY4
	NI76nGq+Fg16KKzGhxUbFXLFnw=; b=JaVwcyEhDZo2rZTiTInOUdW6M0gOb4BNq
	wP0KRD8HGukEKId6Pby3r6VCCa0j2FuUTuE2i1SzccWBI0dYMI0E2DDrJVYyBUl+
	8kF2md/TmNR9gi7rr9QaLITnQvEzTVnIMWz+wRfKHN+/uCjyi65o8HtpAkqhtFV9
	OAm4KWOl7KpasjytqCu5WJO44tHDB51GpyzjfuQsXtpl5d5Je2GQJjmdC6rvH5xD
	oMxa+NdiUcyrt9uhY4zt9XvtvrMj5sZ/PXEiWindJL7SC1MSeCyBIFJhOiHJKTrI
	zqFiqfIUlBOjXr7asN/TJMHFxbRQDvdBf/TZHxZXhXWqp2wUbKzsQ==
X-ME-Sender: <xms:b2b-X7QAyBW8biIEIXzhdVWJTddkPtqEr5s2p9W0R7cI3-15r2Iqsg>
    <xme:b2b-X-xv3DCn_hfLNCW03UG1Ikq2XPyu3TJvFKgqBDLM4QbgXLA8jxIawGwUnJBky
    PnHrYXLO8QEi3ZVOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
    ugdrrghuqeenucggtffrrghtthgvrhhnpeduieellefhueegkeehkedtleekfeekueehff
    efheduvdejudfghfeuledvleevudenucffohhmrghinhepghhithhhuhgsrdgtohhmnecu
    kfhppedugedrvddrkeehrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:b2b-X6MwbxgKAX9SKMzcAWy-_BYnwj-VU-4MyPA6yLo5wszz-MdVig>
    <xmx:b2b-X9Mccx5Gd1iHrawY-YzhbU6HBpty0HJ3B2-70iR04nofUbvwzw>
    <xmx:b2b-X8TEF7HKMjLjmGkejHNV0h27EE4rrU5RwgiMX1HDTSFcGftw7Q>
    <xmx:b2b-X87rNohL2McSfmt7n3uKjYkitvEfBAIEK1XvGnfuqRr-2jU5gA>
Received: from localhost.localdomain (ppp14-2-85-95.adl-apt-pir-bras31.tpg.internode.on.net [14.2.85.95])
	by mail.messagingengine.com (Postfix) with ESMTPA id E48C21080067
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 22:18:06 -0500 (EST)
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] meta-python: Add jstyleson
Date: Wed, 13 Jan 2021 13:47:58 +1030
Message-Id: <20210113031758.2245573-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jstyleson is a library to parse JSON with js-style comments.

The license isn't shipped in the pypi package, so it was extracted from
the github repo at [1].

[1] https://github.com/linjackson78/jstyleson/blob/8c47cc9e665b3b1744cccfaa7a650de5f3c575dd/LICENSE

Change-Id: I1e22ef42e823d172fd52f40e84bd5194c131310a
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../python/python3-jstyleson/LICENSE              |  8 ++++++++
 .../python/python3-jstyleson_0.0.2.bb             | 15 +++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jstyleson/LICENSE
 create mode 100644 meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb

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

