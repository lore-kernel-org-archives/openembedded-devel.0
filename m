Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id BA2167FD3F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 07:50:34 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id u131so2327387pgc.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 23:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=loElPpggtZHlugikdzdACWT1ARZT1xOe0I8u0bCiH4A=;
	b=mUzY0bnC6zOJ0U+ywrC5HCzNesOIcj2YQkmympViFWot6EzPpbyV+YlzaqZQhaFlMD
	z7iljFvCQBLFLdpc49jUjF8jN2LYPypA/uA4Dsx6BDhX55SC/Vju/xxRuCppqdOMP820
	RzVmggqkIKzrORo16+/taEeho/cW3btgxys1zmNcdmjDe58KeNfTh1pCBrKPYyoTNu4w
	VLTcPhm/+xc+m8ch+l33J3Uve4GS+XIEfJQWuDzUXXYCJHOsKQfFJUS/QBJlcoEMBwY7
	3VRI01aTxu7EdfWHXaXWJ1KfDMPgC1YZeZinXrIfzFnTIwzjV4AGdXdjjH7DjkkRCPsj
	HLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=loElPpggtZHlugikdzdACWT1ARZT1xOe0I8u0bCiH4A=;
	b=nMs2lq00bvqI7DksVsQq8q6o1lIodfCEivxzfsJzXTb066d0be9/3EheIEDMZDvMnd
	peFNPrDC7olqPywIsCfPy22+tj1muI4OkW6NmMxDFqfpoV0fO/a21tWZQ+Ph7+bKezjF
	iZq9U325rDG7uCl7opErVJt37A8rp2vb/g/djAGOpq8dAPHoldK3wCKo/fnZnM1rbGdf
	XZq1sCC23pg/uVtvQGSIJAMZKjb1zAaGslOn6YMyuAvJUfgE7kKONKa2WLz/S9x3Q6jV
	nKBTEeZMoyacSmJjF5wZkLEwHrw4X1xuiNLLXWrYOhmfrLF2bnSojoW8E7+bO813jOw4
	Q6dw==
X-Gm-Message-State: APjAAAWNiT+2mUQhmawRlmeB2AP7OqSXF9bANO9N8GakKWJiV6WjqeIU
	XW47aqUbKj/5g/WGlRylNdX4nIrFM1Y=
X-Google-Smtp-Source: APXvYqwEXoTtnYQ8YF89asteLJrKKuseQHR7On9YUPijnz7dQHOfGW6k34U9vZX6L4nPPLz+kaJ8dQ==
X-Received: by 2002:a63:220b:: with SMTP id i11mr8321346pgi.50.1579938635542; 
	Fri, 24 Jan 2020 23:50:35 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:ddac:a57d:b60a:6cb7])
	by smtp.gmail.com with ESMTPSA id
	d3sm8123422pfn.113.2020.01.24.23.50.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 23:50:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jan 2020 23:50:13 -0800
Message-Id: <20200125075013.37774-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-tqdm: add target RDEPENDS
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
X-List-Received-Date: Sat, 25 Jan 2020 07:50:34 -0000
Content-Transfer-Encoding: 8bit

* Missing target run-time dependencies:
  - python-lang (functools)
  - python-logging
  - python-numbers
  - python-subprocess

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-tqdm_4.41.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-devtools/python/python-tqdm_4.41.1.bb b/recipes-devtools/python/python-tqdm_4.41.1.bb
index 2dfaa61b..22393bb4 100644
--- a/recipes-devtools/python/python-tqdm_4.41.1.bb
+++ b/recipes-devtools/python/python-tqdm_4.41.1.bb
@@ -10,4 +10,11 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "aa3d5fd173c9fea7408cad14c0e73d5d"
 SRC_URI[sha256sum] = "4789ccbb6fc122b5a6a85d512e4e41fc5acad77216533a6f2b8ce51e0f265c23"
 
+RDEPENDS_${PN}_append_class-target = "\
+    ${PYTHON_PN}-lang \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-subprocess \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0


