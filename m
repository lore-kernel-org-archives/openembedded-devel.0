Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 690EF65D00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 11:17:41 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r68so13760727qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 04:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eRhtzPjP8G3IX4NYExs+pbmuAbXyQ47RgE/w3lBpUFE=;
	b=mTS5axXTqPum7eP+F2RXh51rdPNGFmyqr19le/C/zFSXVKmOCJE7yAlCerCQpDU+ga
	a/ZQUgkw+9tOQ3G/LlluQ1mi5WRNCVmlf1kg22xh/HYCPmOEaQzGA7zm17vkjANzTjhr
	Ce7vuBOp2WtubGQu+8f1mdqviERdN7UsiE8azOgZvWX51xJ9v1OIVwdFzB209Ts+AHfl
	AD7R32kNoCJt/AUJcC3CeV5KWkJ7rYJ0y4IJJev2gz9nsijdQ0SSJ+RKHs+rl/2DFQ4w
	C39yv1XSKuaiVkGL9TDIr64aKBsMGqHF24KS/iEX66OQE/QpPgjo5L3fh++iCYz0eQGl
	itsQ==
X-Gm-Message-State: ALyK8tIx8p0sX8tdw+84Lgg82ayumBx52nJ6cG/LirmYGI618cLmzr84aOBo8Y4/rx5C0g==
X-Received: by 10.55.147.133 with SMTP id v127mr19036499qkd.109.1468149462493; 
	Sun, 10 Jul 2016 04:17:42 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	r63sm1946524qkf.14.2016.07.10.04.17.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 04:17:41 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 07:17:32 -0400
Message-Id: <1468149452-9888-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-yappi: correct RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Sun, 10 Jul 2016 11:17:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-yappi_0.94.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-yappi_0.94.bb b/meta-python/recipes-devtools/python/python-yappi_0.94.bb
index bfc0e03..83f2bc9 100644
--- a/meta-python/recipes-devtools/python/python-yappi_0.94.bb
+++ b/meta-python/recipes-devtools/python/python-yappi_0.94.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "15cc17dba1252ecaae29ced1e96c216165d93fd3e9ea05dff1f5e5866f
 PYPI_PACKAGE = "yappi"
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-core \
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-threading \
     "
-- 
1.9.1


