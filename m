Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BDF487D718
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 11:22:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e6so19013035wrw.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 03:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yUigV4oNfpOS0SO4S7h2VNGZPm7VVQEKmMr8uzQDEYc=;
	b=Bi9VrQK+gIkNFtayM0MeiUTiGt2FZ97P+Zb1guPaBtDStVXfjwsom+IoBKBTllAXF+
	alETEta/ZEqSoBPEgc/2eqZERI/U4n7Y/woLWFbAPoWkfwGtfb5SzFvlFvoTdHsr1kLe
	JgHxFfkKylRwBadkYQaO0UbBy9JJG0ld+CDFFfOWeOdztHrZfFdlKyIfjb7MURUJzmXK
	w7cFKuwWj02dhQxW3SnEQt3I0uG0M6e8MRwKNm1fYD1VeRN2LtssU7Lg2No/s7v55AfW
	qd5oeLDUQti+qpPEC9Ub471BxI5/qPII3/nsl8jt9B+a9ir2S1bUIzh6s1WivvfUBfaU
	nu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yUigV4oNfpOS0SO4S7h2VNGZPm7VVQEKmMr8uzQDEYc=;
	b=b+iAHAuk4L+xFRcBJpsWvlc/2WyzPT0uSEinamMafOwVBYztAQhph/ekDgccSy3IzB
	s5MzMGq7QjMlh+x3sBwVkvIP5ztco1xCvOrPEWqx1Yw88teI+fSl4aHKQ70tiXRTunuR
	A8nfB4mOtsgd40nSBu2wUt7ztz/8SJJNHvFzy3Vfj8W569rQQv0zCo0B2Rb3QvGES2m+
	vGEVGlu/UDhCiirbFdneR3si4OqzCFnSRgjlzVRvVyNucYqNn89pZ48mC1k6p9k6FT/1
	4Dw6yx+rbuASpGTX8t892sTTRuvPzU9cY8Xi46kwrxK8zxxlJqirGH2oUn7UWaBXSH0x
	Q8HQ==
X-Gm-Message-State: APjAAAU9McTgPBBUmpqmwklMRadIUIJyDs0FAlpYeBqnIQ+jICuliJF8
	Xk5Up2UEZD3RILhN3viCwHSINdY+QjI=
X-Google-Smtp-Source: APXvYqwyR3733imaY1GLPUzfEE+qp4GbtppAYH59sYcOjqGVRJEwo/rMMCfSO66ddYyuTQojQaykYQ==
X-Received: by 2002:a5d:50c3:: with SMTP id f3mr16618421wrt.14.1574076171959; 
	Mon, 18 Nov 2019 03:22:51 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id x5sm19134479wmj.7.2019.11.18.03.22.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 03:22:51 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2019 11:22:26 +0000
Message-Id: <20191118112225.40480-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-apply-defaults: add recipe
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
X-List-Received-Date: Mon, 18 Nov 2019 11:22:52 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python3-apply-defaults_0.1.4.bb        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-apply-defaults_0.1.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.4.bb b/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.4.bb
new file mode 100644
index 0000000000..8d23678a09
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-apply-defaults_0.1.4.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Apply values to optional params"
+HOMEPAGE = "https://github.com/bcb/apply_defaults"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
+
+PYPI_PACKAGE = "apply_defaults"
+
+SRC_URI[md5sum] = "719abb133f4b46283ebd940fcdf30a78"
+SRC_URI[sha256sum] = "1ce26326a61d8773d38a9726a345c6525a91a6120d7333af79ad792dacb6246c"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-core"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


