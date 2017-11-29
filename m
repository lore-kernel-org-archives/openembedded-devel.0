Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 17A667826C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 23:29:51 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r184so6686082qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 15:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ci14BMr68Uz+0+2SiP2p3UcECBeueXLldf78v6BvaR4=;
	b=RcbUz05GCqWEiVu+LdIrnEPMHBVm2XgruB6MPWlRksR3B/t2+E+1wV7Jmz7TuAE9Hb
	mkID2oqFivo5mGBHxE68PGn7jRoc1Y/r6nshyN8k3w3D/la2d31rzEQIdYKBnE8IrXSe
	OyfqFb8ZNP3GR8SardgsXnMvPwdUHL/wi3DyBlQsZZtVEC/Vo90+ICZn5zVjjjVJrfTY
	Or6wvWH8HbfLNyMeCD+8m4cvAkAcz4W4m9qefHiUw25oE1g4EAkSRN2L33YhmJBfZnU1
	czZmeghGpEYD1GOplregigMVFBDo5Xz88o3N6e05C3PMQAkDhbiH+ZjwN6blAvLULba5
	56zw==
X-Gm-Message-State: AKGB3mIdZZ+DN3uUBNP62tq2bBUbKbDvYQyt5vZGtXis6teHrqZulB6D
	ts0mF2vjRKLlzXEhgcwwE3C9Szx5
X-Google-Smtp-Source: AGs4zMa9jf+h6YKmGjfsS9L8tSsYJcVAMw1W1IK+3EY1nGNNoHVRTqcWxuAx+bTUqB3KqcR/p59wLA==
X-Received: by 10.233.232.13 with SMTP id a13mr191584qkg.186.1511998192912;
	Wed, 29 Nov 2017 15:29:52 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	d79sm2042549qkb.58.2017.11.29.15.29.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 15:29:52 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 18:29:46 -0500
Message-Id: <1511998186-14937-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-dateutil: correct the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 23:29:52 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-dateutil.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index ca51059..0e076b4 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -14,7 +14,8 @@ PACKAGES =+ "${PN}-zoneinfo"
 FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
 
 RDEPENDS_${PN}_class-target = "\
-    ${PYTHON_PN}-core \
     ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-six \
-    "
+    ${PYTHON_PN}-stringold \
+"
-- 
2.7.4


