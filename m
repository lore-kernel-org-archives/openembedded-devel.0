Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id B1D2978480
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 18:29:19 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u42so25333701qte.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:29:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BARiMAfz+E6ZdXOWJVjLjbkuo7DyQKRMr19Jp3onLO8=;
	b=qCEuV8T7KzXBn3qLgrtcQ8u7vPZCbDdS9d5Sr13V4cLzUn1d42ZvZkwpDC8DN5lWZi
	0B4sE3pmHPfl7MNU93XX9eZAMdAeXnPLje345e+mO7ycwmrPuYcwTO0dt6P9XkoAoXXl
	1H4mD5KcxqdpuTOw1eqTEqnHLMauSzPm9F4pvZd8eAMpqnIi23uCVy8xL16o4+f6dF8a
	cz8nxwIXc2GfopFTb3LRNxK6R9HGFZvLsQ2D9VW0ALbnXjvoBW/em161uRy5GgU/NZ5G
	BH+YR4i+oWxYJXZsjcDbu7gpd8M6j0vuM4JVpD0dH7NFCCUFS/Zz2XQKyVHcRbymKEZg
	KsXw==
X-Gm-Message-State: AKGB3mJPxHRJOt0Umw4geplUDy87IveauKn1u2ZUgYtAAvIBr9d9F+go
	hb/nfpI/UfC5dkvjclpWSTndn/oc
X-Google-Smtp-Source: ACJfBotjqfIZN/zRQ2aIpdVWhVhWaHEp4djKp4mzw9wdJ4x9kAx+MNAT3LfIsHBkvGaUnf1GlOMVYA==
X-Received: by 10.200.42.70 with SMTP id l6mr6026248qtl.110.1513708160320;
	Tue, 19 Dec 2017 10:29:20 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	w126sm9945140qkb.71.2017.12.19.10.29.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 10:29:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 13:29:13 -0500
Message-Id: <1513708153-1614-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-webencodings: update RDEPENDS to include lxml
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
X-List-Received-Date: Tue, 19 Dec 2017 18:29:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-webencodings.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-webencodings.inc b/meta-python/recipes-devtools/python/python-webencodings.inc
index ed57c52..74b7517 100644
--- a/meta-python/recipes-devtools/python/python-webencodings.inc
+++ b/meta-python/recipes-devtools/python/python-webencodings.inc
@@ -7,4 +7,7 @@ SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab1674858
 
 inherit pypi
 
-RDEPENDS_${PN} += "${PYTHON_PN}-codecs"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-json \
+"
-- 
2.7.4


