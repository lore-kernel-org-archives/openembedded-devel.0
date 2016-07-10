Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 41780606D1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 13:04:25 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id r68so13844979qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 06:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o7rxVL9biJhLs+bf4fqAXvk/obJ018aKsQqyJkXTxy8=;
	b=bIdv231kLw4A1Hpc5/OgRFTz13xbO3c2nSgW43IM/CKVdgLeORW11ib7MfdDFnDK3s
	IS2ibglKRz14xDtUrHg6izm+1HLUjL/ECdi5GnOOVIgBtX7KET6hhFv0V+1Hoi/FaBGq
	6xmfpKuwn+MnJqvlqpfnJPj5+8vTwSitYaGPaYE15nprwyNdwqIlghwPfC/dzwVDxwYY
	6vTvf9BghWYG1HYFjFRgjh4nyYsyn7uEoE3Kw4ubYaJlQGs5Z0Bx0dpPn20bbsAqKBVt
	LgZRCUL8BNDR6pUmfSF8J00qiqRupMl8RjHGRK9B5dEfEFusWawrmNEPwplFUw8oiSbB
	7OTQ==
X-Gm-Message-State: ALyK8tKtICXB1BPX2dXJS3gNhJOoaNvovNqB7Efk+ajhZBtZAX32VOKAS8+78GsQgnD0Ug==
X-Received: by 10.55.185.131 with SMTP id j125mr5681820qkf.170.1468155865936; 
	Sun, 10 Jul 2016 06:04:25 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a67sm2900044qkc.24.2016.07.10.06.04.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 06:04:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 09:04:17 -0400
Message-Id: <1468155857-13944-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1468155857-13944-1-git-send-email-derek@asterius.io>
References: <1468155857-13944-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-urllib3: correct RDEPENDS to work on a minimal python instance
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
X-List-Received-Date: Sun, 10 Jul 2016 13:04:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-urllib3_1.16.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.16.bb b/meta-python/recipes-devtools/python/python-urllib3_1.16.bb
index 9479f96..87a2852 100644
--- a/meta-python/recipes-devtools/python/python-urllib3_1.16.bb
+++ b/meta-python/recipes-devtools/python/python-urllib3_1.16.bb
@@ -8,4 +8,9 @@ SRC_URI[sha256sum] = "63d479478ddfc83bbc11577dc16d47835c5179ac13e550118ca143b62c
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "python-netclient"
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-zlib \
+    "
-- 
1.9.1


