Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6E539615B5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:25:55 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id p14so10121079pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KIf0CJJDfFAP5GGINE/MHo/vI6amjZzxWUSH7ep6HEw=;
	b=YstHwnuPvEUtlmLjjmg30lrmc3WzWkzuwJrlUG/EV1fcrNDarHYno8p8VeMndJJqnm
	9xi7xCTH46mikRuqI6/PyMH7DJlSmBxHlEqcgFnmfxBcYi2k4U2YR/46nFI9Ad7kkF1r
	yobQ1234KVwzYDSEx3wS5ibrXuSdvgIauPVoMWmWWFO3fe2ZhEA74yH7LVInlNfPiD6C
	WwqlxzC1zKTZkBeOUcqxH8Cl6Kp1zmwKd9bOsDMW9+jXo55rZBmHLRe2ndUQjiDWsrUc
	XDCSrRzb9m4gUP+GW+4RyGdu200HDG9zMUxchtVyVoMjvzw4xS+LbQli/p3ONCEZ5NQi
	9+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KIf0CJJDfFAP5GGINE/MHo/vI6amjZzxWUSH7ep6HEw=;
	b=UfJnJ0Q6uH84kdaFZ2UG0pJNxNEFeYrYw5P/oXBr0AlvFzigwcxbzS645QgMRUeLEt
	Bdl4egYJ9Q2J1Ru54p49W63WIUFgqxmelb6Dwg8EjfANWE/dULvKr9MzT1w6au6Jlu/h
	eWQBd8K2wSpAjwzD2in5t8PJeYa5GzppDuIqcL4C1e/45omEo3s+pbSfIK8gmPGqdvgU
	/Ujn86MsceTgazFKfXCkvKJvmBtQaLfai8o9qVdlR+6SMQkHsqN4tW+4V6LV40yMAi6P
	sh7QVzWna31BHlqGgH7694p6uOAXRZ+HqsNG9W85JeboxmbsY+NOvyl7Ph9Z5cy6NN5+
	5Oew==
X-Gm-Message-State: APjAAAVld7yzfdgNEnMz2Yp1U1aVVVkmwwkLx6oft644f906eO6gsZ9N
	ngyEp6aiCqP9rIMVQbUa9qOFmTrk0Ic=
X-Google-Smtp-Source: APXvYqywpeNcq+n1/6AFoFpAIpv01YA0GtxLx4w3pz4zfMrkaLR5hNWJ1PHNgl7dVl9ZhQNTEtDnZg==
X-Received: by 2002:a62:7b54:: with SMTP id w81mr20047224pfc.127.1582007155644;
	Mon, 17 Feb 2020 22:25:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id ev5sm1571898pjb.4.2020.02.17.22.25.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 22:25:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 22:25:59 -0800
Message-Id: <20200218062601.3743291-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/3] python3-pyflakes: Add python3 version
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
X-List-Received-Date: Tue, 18 Feb 2020 06:25:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pyflakes_2.1.1.bb             | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb
new file mode 100644
index 0000000000..c138822400
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "passive checker of Python programs"
+HOMEPAGE = "https://github.com/dreamhost/cliff"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=5127315117a8561a1504343d59620647"
+
+SRC_URI[md5sum] = "a0f71a15724e553c46e03ba5ed56703c"
+SRC_URI[sha256sum] = "d976835886f8c5b31d47970ed689944a0262b5f3afa00a5a7b4dc81e5449f8a2"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-prettytable \
+    ${PYTHON_PN}-cmd2 \
+    ${PYTHON_PN}-pyparsing"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


