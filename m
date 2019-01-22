Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 080987BDAF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2019 00:38:15 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id x10so25365971wrs.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 16:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bsT2QAyHaOV5lFb34eJM/ECs2SzCeQaHrSKljeYikm0=;
	b=Dg3Pmsha4opbjWyIp1zfZvAqhv28F9zmQvgQHkDiXw8aTNOVo+q1hEbi8z4KQKp8IL
	IjWdEjHTRr2jsNk+g5SxWXLlUsaP2FhR6DCK50wdr3pHngpcU2i+ilaIa9ghG+J/11II
	asby89Ftvos4BG026NYtr3xMKwbuH1cWVxBIXu8clAUHbSuJ8Smt3vvPpWUdmvotTYpp
	MBTU610Nq/ArqJ4w63N7D1doOffhVAYuvZvmhaN+8P0Wqu+B2IsRGk/QrDClFZbXgE3e
	VxtRLKjEicGczulKt55FLDxOddJ4iBA2tJes1iRgmEsiDi9XZgO74N7iJ95LttxfoM90
	9ioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bsT2QAyHaOV5lFb34eJM/ECs2SzCeQaHrSKljeYikm0=;
	b=KPzPL+OF7t9qpBIM7a9zfq4xx8qAg0HnY5EXqkWCTUdKwoelvQxuNDZp46gl7TslU3
	v/da1qDB5Ata5LklEagdfSQQVX4cAZiU2C+pveYmCPk5w/S5XVqAUW6hcwYxP11UnMuf
	XS1djuAyqR6c4AcwDBGJ3nPpLPAPlmVVcoNTWkvRZwvdJHQijDFXxHI/vyC0ZO0VH9gl
	cKSM+w1U1Q2pyVYYuk/3VoGbN2nRiGrqSLwo5k9x+Zslc72BVJd4xJUhADk3BApO3zfm
	DK8R636dJmE3Q+D5sqgCRnse1J0SJ/E2rlHz3MmOQoYkgNS9TFW3kIvXi/r2Uaxj6y/X
	j1cg==
X-Gm-Message-State: AJcUukdN6iXR+oVkt6kOF5f04oqQ29loA1xcw2fu1jucXDIvo6vMI3ms
	/1A1b6ViYm107l/FqFD/dUxSaS3d
X-Google-Smtp-Source: ALg8bN54CdKKDQc2Cnjco+luYdN/RD5b3qn1y0PWivgJ1+ouiJxtf5xs2DhpxyvDj6E+CDryOLvbIg==
X-Received: by 2002:adf:9246:: with SMTP id 64mr32007431wrj.130.1548117495568; 
	Mon, 21 Jan 2019 16:38:15 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F275D236F96ED284BAEF9F7.dip0.t-ipconnect.de.
	[2003:f0:7f27:5d23:6f96:ed28:4bae:f9f7])
	by smtp.gmail.com with ESMTPSA id
	j8sm134645303wmd.0.2019.01.21.16.38.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 16:38:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2019 01:38:01 +0100
Message-Id: <20190122003802.19373-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190122003802.19373-1-schnitzeltony@gmail.com>
References: <20190122003802.19373-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] python(3)-isodate(-native(sdk)): initial add 0.6.0
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
X-List-Received-Date: Tue, 22 Jan 2019 00:38:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-devtools/python/python-isodate.inc     | 14 ++++++++++++++
 .../python/python-isodate_0.6.0.bb                 |  2 ++
 .../python/python3-isodate_0.6.0.bb                |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-isodate.inc
 create mode 100644 meta-python/recipes-devtools/python/python-isodate_0.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-isodate.inc b/meta-python/recipes-devtools/python/python-isodate.inc
new file mode 100644
index 000000000..f5b605eef
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-isodate.inc
@@ -0,0 +1,14 @@
+SUMMARY = "Character encoding aliases for legacy web content"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+
+SRC_URI[md5sum] = "0e1203fce27ce65e2d01c5f21c4d428f"
+SRC_URI[sha256sum] = "2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc9ff2d8"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-isodate_0.6.0.bb b/meta-python/recipes-devtools/python/python-isodate_0.6.0.bb
new file mode 100644
index 000000000..d48e12346
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-isodate_0.6.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-isodate.inc
diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb b/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
new file mode 100644
index 000000000..0e79ae995
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-isodate.inc
-- 
2.20.1


