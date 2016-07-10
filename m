Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9AE606D1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 13:14:35 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id q62so1424577qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 06:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Xw0g53+rrX74akNF5NnKenRbruw520Y9q0PvvWR8vuo=;
	b=I4jw/BTUT48srNwwKS3VME9DSH+q/heQDMVdAPB6oG0XWk6Ffb5Vh1s8WoUIUQpoga
	edtVAUxr6Ijn2VN5ud3TNnoqR7RogT/p70iR/+umSAmCMQXQ80GXcjH+09CdzptWikQ7
	OI8LJLaVdX6E/k7SDxCIAS3ifzY8ktWD+7ZwsqKEZexaP9ELgN8crMtiw/iibPVXUv8v
	N9l232c6akt8AkcP2APrzLsXwJVJvxPepv4IiQIE+SgNYZ3b7s27WhCYco99MwboiY+L
	9fq+JzebljqTjh2Imc/4UdvMP44Eu0cPuvH+OvifGDTZpU9p6TARALqfggV6nqpkHiaq
	2+OA==
X-Gm-Message-State: ALyK8tKUBSeNHemisYH/LBSa3ODGNha45z7lBTZL2MBul+cCh19JosX1kRs6tn/NoEW2sQ==
X-Received: by 10.55.159.148 with SMTP id i142mr19623774qke.53.1468156476620; 
	Sun, 10 Jul 2016 06:14:36 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	b66sm1049488qkj.39.2016.07.10.06.14.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 06:14:36 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 09:14:28 -0400
Message-Id: <1468156468-28251-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-ujson: correct RDEPENDS to pull in needed python packages
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
X-List-Received-Date: Sun, 10 Jul 2016 13:14:36 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-ujson_1.35.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-ujson_1.35.bb b/meta-python/recipes-devtools/python/python-ujson_1.35.bb
index 29207f3..4ef3d18 100644
--- a/meta-python/recipes-devtools/python/python-ujson_1.35.bb
+++ b/meta-python/recipes-devtools/python/python-ujson_1.35.bb
@@ -10,4 +10,7 @@ SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a22
 PYPI_PACKAGE = "ujson"
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "python-numbers"
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-numbers \
+    "
-- 
1.9.1


