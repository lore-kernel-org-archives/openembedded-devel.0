Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37965.1795594141592411406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MIoqOFQs;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so5127803eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594141; x=1796198941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfhuDsSSmVJ5PrT8n5c04lZ0T/hHZviEBm0oKSIsABg=;
        b=MIoqOFQseJ5avhAj+8EuiU4iJD3fVGQriBwJbzbJoPzUOyGNRrlZCN62iityxZp+6F
         u17sCOOPWWERpXJy84d5C2mLl7V2nqrsbK+JqY+GX9WqyW8fXOMOslrKL8BVPtIU+9Pt
         4LwDbx6RNKCytJh3vsW87XLaJPbPYUC5LW5CE+r48wFsK9asPvVjcdYog1e1bmtTG63V
         tcaLlq7kaiBJE1sN0VAm75FH3z2MjZWrkhu2l+1oztqr7e+5Om2kFPtglBa/QK5GVMkX
         kSG5q/nDZ7ItRsBikbLSTriAI5ciWvGNmw2HKv7dtppvQ43sWZVTKo5/EqkYwYh41wgr
         3SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594141; x=1796198941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UfhuDsSSmVJ5PrT8n5c04lZ0T/hHZviEBm0oKSIsABg=;
        b=DSq0oqifaMzZ08UIyqv5ETp7urV3vQy/Tu1prTDpgVtorO2rewJRHuq2NRWKxblw50
         i3+9zUFwmuJ+3N/YcKHlDThOVhxyqseawGr0+zV73tDRrt0RVCZd2FMIr8F17dD4RJa2
         dAQCEm570UZCpbOvEVLRh0ItsNaZXF+Gr4s0Nj4HGwWws8SkKmeVUM5pN43XQ5AUpHi4
         wxGb91HN3smiz4derJIzHv7P7QabBdINDt1jRp9isN2WJS4LzS1BQca0PyL+Eo+NAOR6
         EMzuXmSc0RxigEhvj5A4WYqrVNO1DDKK7IK6pTuXLX0bRxwNGuDuQ53gm6+nWLSrKAaA
         lLEw==
X-Gm-Message-State: APuU4Z9ipkJBU+sSFcrh9QfYM79waQ5e2EuJztEDnHDRTqKT/j5LXAcW
	QSkOa3l7IOMf0qD2HHa5jKTDQzBvSKsFh6W96LhvCz6yZFvwvtWfZ2Z5y/kaAPyb
X-Gm-Gg: AZFdTZcLTy7SlHZuRwuSGNFNTxJ19dYNGaHrXLRF8lWFaPIcnlMdN/Y1pic6a8YLCU9
	3EQMxyRfgRahwl1wx+lhB+FEdbhfufVLYF1HvGuai+im4Y4FxU6kFcd4K7UxMtZy9+oxN5j/vFU
	pO4U9CrjCwfONJT6KOm31gVYTcWw1qtU3XnjpTdLDhQoPW0LrKflpjvf0Iaqw+npDAkR5Wr1saP
	pAPH0d6KVWIgjTl12KTEF0V4j+pF3hnN9LohL7OYOy/DbWDeEjNGEQYdXvWFgjaDLF5rZwEVDrR
	X8RS+E7XQ8wVZXvoCxco4l6nj2xQJJ3m6A2c0CqtZziRZ6bkEvyYIoiTiOqPkoOhSESCBL0duJO
	FhB23h32YG6+bKHpwwyWFdkomFkSPP+qkXOKEy4PlbBQeP4TFTAMbEc3ajVLhkt2ncLA0wVrvbJ
	iAqGg1UsplbgsSC/cgrAmZedyditsxyvckbHijozxMz4V1+FAH5kdOFZ8nTnYJP4czH+kLtqjpT
	ry7a+4iA8jXceMN4Z719bBcTcBWsrnHMbVU9s8fEsEHXlnRyTmg6ZxidNgGUG2gD85KTlEHfE8i
	NYOGTiWFojmzmCzWa0Bc+gOlPO8CGxIRrVF8VO+K3IsUWWRFQdcJvwxzmqMuJc5MO873x/5agqH
	NOJU51dRYaHavNscdNQ2D6MNp8l79xVaQpzXVOJ1+Mxk5G2M8WwyGv7ZUuZhk5NMQ8mej14vJ7M
	bNSSQrIeHjnx4nBVnCpjNaL08F8vYht3mEee9Pz/1hhlDGbmFrRGZI0w3GO3bFUeCJSxRRiAhUU
	zyF1PkhPP8I18i308o/Vt0SigxjfIr2Yr/LYCzdcV2PQo0AQLuFbAFRDIqkUqNbfd2k6Ti1sqDt
	cQFZ
X-Received: by 2002:a05:7301:618f:20b0:386:ad3b:a48a with SMTP id 5a478bee46e88-386ad3ba7cfmr9643547eec.5.1795594140949;
        Wed, 25 Nov 2026 00:09:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:09:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 08/14] python3-pypdf: Add recipe
Date: Wed, 25 Nov 2026 00:07:19 -0800
Message-ID: <20261125080732.2419614-69-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133066
Content-Type: text/plain; charset="utf-8"

pypdf is a pure-python library for splitting, merging, cropping and
transforming PDF pages. psutils 3 needs it for its PDF support.

Built with flit_core. The optional extras (cryptography for AES,
pillow for images, fonttools) are not pulled in. Native variant is
needed because psutils imports it while generating man pages.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-pypdf_7.1.1.bb             | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pypdf_7.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pypdf_7.1.1.bb b/meta-python/recipes-devtools/python/python3-pypdf_7.1.1.bb
new file mode 100644
index 0000000000..95be8b6eeb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pypdf_7.1.1.bb
@@ -0,0 +1,29 @@
+SUMMARY = "A pure-python PDF library"
+DESCRIPTION = "pypdf is a pure-python PDF library capable of splitting, \
+merging, cropping, and transforming the pages of PDF files. It can also \
+add custom data, viewing options, and passwords to PDF files."
+HOMEPAGE = "https://github.com/py-pdf/pypdf"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=15692a75ec5daafc92ff9e5505a17cc5"
+
+SRC_URI[sha256sum] = "2eff4e2fc5fb22a6d6711e6f1166cdc9ab5765d90cd0d77dfea3f4aa91a27b1d"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} += " \
+    python3-codecs \
+    python3-compression \
+    python3-core \
+    python3-crypt \
+    python3-datetime \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-math \
+    python3-netclient \
+    python3-numbers \
+    python3-stringold \
+    python3-xml \
+"
+
+BBCLASSEXTEND = "native nativesdk"
