Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id A02926060F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 22:34:16 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b184so6514522qkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 14:34:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QvOViMjDPDF6zTuwQsqzDJTCY7bPS/3Mra1dusQmsu8=;
	b=OtXqYBrTYktwC4jtgMFotXo+cALM8kVEkWPO+dEIvgjnUMAax/e23BS3LwgQ/WdocC
	TsrjZ58S6ajq/s5pwX4PyeH3UryTKkVSSAeRFcJ84KsVb0DFjtNgZ7zRQDKNDbY7fkkw
	u8qIPKcphfi+WJSL0TqNjZylbgH4p3SUTvVkVUiPg/rMUO7+HlSyG0Yq6RHFaDmfLWNB
	kNsBCdZTa6JLJgc6YCv9ENm6LaCKBWd4eeChO3CXa6chiJz/eGWxy0tPnkJUc/FSyddL
	90t1pzXz1QXVLyZHPmlaiB7NYosB0OvjHGHNks0UhxwPS03DJMPUaRvvxrcHz4YxlcbX
	cw/g==
X-Gm-Message-State: AKGB3mLaUa/QHfqkt9xhvj94lSStzrTIHWqFanzSkJ909WAv8XVNutGP
	Vx9JUL/XG/sWr5pBdnI7exLEice+
X-Google-Smtp-Source: AGs4zMZPJr7UHG8y4YZC3kGTQBII2IcY9xfspFOqi2abH89+nbH5/tX/xzB7Z3X7tZY/ICJrj0sXbQ==
X-Received: by 10.55.3.130 with SMTP id 124mr620305qkd.197.1511994857440;
	Wed, 29 Nov 2017 14:34:17 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	e96sm1930094qtb.84.2017.11.29.14.34.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 14:34:16 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 17:34:11 -0500
Message-Id: <1511994851-25043-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-bcrypt: correct the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 22:34:16 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-bcrypt.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-bcrypt.inc b/meta-python/recipes-devtools/python/python-bcrypt.inc
index 1ea62a3..3e6fa7a 100644
--- a/meta-python/recipes-devtools/python/python-bcrypt.inc
+++ b/meta-python/recipes-devtools/python/python-bcrypt.inc
@@ -11,5 +11,8 @@ inherit pypi
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-shell \
     ${PYTHON_PN}-six \
+    ${PYTHON_PN}-subprocess \
 "
-- 
2.7.4


