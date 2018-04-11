Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id B24D0746DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 12:30:46 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b198so1579379qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 05:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=V1E3DZ9442Z2FuZ53KHKx1+ueagv5BKCBWQ17a2M9z0=;
	b=Yzhggl6efyinQxRj54QGMagUXTLvkCQq+ebY6OK9vr9QUbKPHZ0pp7POs8lA89ne3f
	2d2JID+P211scOU+/2MhGVgbBn4GBRhotw0bSL/AHlboivEaPWKItYelGgr5ASO0rUbX
	ACUHX6z0ZQrFKXuWuDqz5+TymSUeJeeVSclR8fYC1W2k3vjFxlifPsX8gljU1E/t1pTN
	Vhy8jQr8zZsW0rlkckobdwCp7YF5PtWjlL8dHacO8oEwoswpoBNXPHa025Iv8vAXK8OJ
	t3i2WvUgGRjqQfNG0Z8jtm8ijQp8WLuKD+FsNV4nfyYdrQdnKf/4RnVGeLa0fwTTHgmB
	4pkQ==
X-Gm-Message-State: ALQs6tDTJxjNPuJpNssaQ/N3we3iMg5XMnWEL/I5Yc3wkAkpaNmLiSIg
	u1TGcvriS28oi/aGVOx6/zL659jc
X-Google-Smtp-Source: AIpwx4/cO/LIQq7AGXAGiywNcaxnOFlVnJPpkT8kg1PtmBT7PfWu4bbM6z6MFjq9Tms6G+TXUSPnsw==
X-Received: by 10.55.77.66 with SMTP id a63mr6360617qkb.93.1523449846817;
	Wed, 11 Apr 2018 05:30:46 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	x127sm690069qke.87.2018.04.11.05.30.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Apr 2018 05:30:45 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2018 08:30:18 -0400
Message-Id: <1523449818-21242-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-attrs: Adjust the RDEPENDS to include crypt rather than cryptography
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
X-List-Received-Date: Wed, 11 Apr 2018 12:30:47 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-attrs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index c29f058..ad76852 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -9,6 +9,6 @@ SRC_URI[sha256sum] = "1c7960ccfd6a005cd9f7ba884e6316b5e430a3f1a6c37c5f87d8b43f83
 inherit pypi
 
 RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-ctypes \
 "    
-- 
2.7.4


