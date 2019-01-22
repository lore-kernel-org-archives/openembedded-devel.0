Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0F87BFEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2019 00:38:16 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t6so25349667wrr.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 16:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LUPN72WjsI5BCSuCzNucYFaSZEv+/RHRc80UCUMQT4o=;
	b=DS8YizYsKaGuZEf0TUKzBsOqcCn6tX58NURwlBrpg/5ryH0HO8i99dZT4Zw1LLnc6N
	G/ji8aY/OPJI66MqzQiDXrigKygRepW3F7kz7z3Rsl/Y+dJfcnXfQ5gdjDdRaw1qdhgx
	RDm8SxYub1x503VeIpTH8thsdbZ8tuJFDJorKtxLularZwR1ZbiDQmnbGuPlFknTyxVk
	SOv2Jq241+WQ4Ndmby2PbzyN4we3Ah/aAWPth3tOVku2YEOAXTm242+wubgq35BCeTkS
	+Ax/OYLRRe4mWrT1BomS5jnGWzwq7/SSlWTBY6MkRb0MREOjFoPEuH2XvozXrdRZOsz1
	u4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LUPN72WjsI5BCSuCzNucYFaSZEv+/RHRc80UCUMQT4o=;
	b=uMzosaAQVJIGqU2qFgYvnSaZRGFwnRGbMx2J5M+mquXwHtET1DkRrXx0uVk1GmC+ox
	s3reB/vQCzGJG0nGiRJCuaJ5fofJ1ISR9U8g+R7fGoqmMo1VxLCZDOLEzMtUFjqIT6uh
	hUT8hTonNI7dJgzJei2+t1RTv4h1jpgQ74pUACXvANe1YQ6d2yimN1MHZaMk3U4I73f6
	wJmOD6Bg/kftuTcwkqjylXkn8FWVlD4d5gJVSkwBT+ZLPNyEzfeExchOrAvZJvQIXiAG
	uYL0+D/Kh2x9p23i05HvSJkJDBqARecmmeGf/jhywx64P65O3h+BvtAVnkPpU2VQ97bV
	rCWA==
X-Gm-Message-State: AJcUukfA+UFq1ezXLcrRIGh4ycRWSTXcB0Xn2Ct98fxwdAr8EZe09VEf
	NmvZaoXXsik2BLexncf2ty46yeRA
X-Google-Smtp-Source: ALg8bN6PhnnTnjYpnHDdganrWB7LjHXYfFJnGO05+ROBj4vWL0C3C9CbbTiHkmqEqItnuWnDqmHcbQ==
X-Received: by 2002:adf:c888:: with SMTP id k8mr31816638wrh.6.1548117496614;
	Mon, 21 Jan 2019 16:38:16 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F275D236F96ED284BAEF9F7.dip0.t-ipconnect.de.
	[2003:f0:7f27:5d23:6f96:ed28:4bae:f9f7])
	by smtp.gmail.com with ESMTPSA id
	j8sm134645303wmd.0.2019.01.21.16.38.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 16:38:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2019 01:38:02 +0100
Message-Id: <20190122003802.19373-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190122003802.19373-1-schnitzeltony@gmail.com>
References: <20190122003802.19373-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] python(3)-rdflib(-native(sdk)): initial add 4.2.2
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
X-List-Received-Date: Tue, 22 Jan 2019 00:38:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-devtools/python/python-rdflib.inc     | 15 +++++++++++++++
 .../python/python-rdflib_4.2.2.bb                 |  2 ++
 .../python/python3-rdflib_4.2.2.bb                |  2 ++
 3 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-rdflib.inc
 create mode 100644 meta-python/recipes-devtools/python/python-rdflib_4.2.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb

diff --git a/meta-python/recipes-devtools/python/python-rdflib.inc b/meta-python/recipes-devtools/python/python-rdflib.inc
new file mode 100644
index 000000000..f92734aa7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-rdflib.inc
@@ -0,0 +1,15 @@
+SUMMARY = "Character encoding aliases for legacy web content"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=68c1a3bb687bd63b8e5552f3ea249840"
+
+SRC_URI[md5sum] = "534fe35b13c5857d53fa1ac5a41eca67"
+SRC_URI[sha256sum] = "da1df14552555c5c7715d8ce71c08f404c988c58a1ecd38552d0da4fc261280d"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-isodate \
+    ${PYTHON_PN}-pyparsing \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-rdflib_4.2.2.bb b/meta-python/recipes-devtools/python/python-rdflib_4.2.2.bb
new file mode 100644
index 000000000..7ed0f5f9a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-rdflib_4.2.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-rdflib.inc
diff --git a/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb b/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb
new file mode 100644
index 000000000..6511df3ce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rdflib_4.2.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-rdflib.inc
-- 
2.20.1


