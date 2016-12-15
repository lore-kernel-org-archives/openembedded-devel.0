Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 194A37722E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 02:09:48 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y68so1872164pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 18:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=95VTYPZshoFcDyIIGZng7J2wZrGGYZoJVjvHSI6+nec=;
	b=ldwa3INCCQveCJty2jevX8LGvO8pcyKgRWwz1KqTcCeGlbTYBguROi7EgHT/W3Gwtn
	AgDWZ2Y/EF24w6AyeacU+w5H/jfpK8iTu8QTDTSwYvDagqkiP/VqNYlRv3qbhXiMxXrS
	sKrQNBcxnL9xDMY5P/fKX5tn8zqbmRyNPpZh7iidehKahZ70OCS0K39Ia7cjQajyNTiz
	wgMTuZqwAqqBMPnIPLdtGEMLo0aRqdGTEidvTLsgU8FWkdIdg0uvY2MwjG1lF2UAh1Du
	92UY9ilULTX/qpqnuGb5ZJt9EaGcbgCFx/2ibA5vrlJiXkBlHkdP4Ey4UxRREOOasz+G
	mxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=95VTYPZshoFcDyIIGZng7J2wZrGGYZoJVjvHSI6+nec=;
	b=nXlDUbwvxPXj16VeI9dTcM9sMVCXvQPQ2+UJV/shshZKVXUsxAfT1t+hmPcMDEEWhY
	1S9VoDeWhYBtrf8w2gKaEcxUM7SpUFDD5KIEmrAslhJ5CyfEBfHQk8FgmXkgndrzFsIg
	E16BrJxYsSmKvTAbhLpZgsiuFS1nUVcY4Qp3WMAukzJmO85C+cdueaCNaP0He+7PZKfV
	hAKXeKbJEoJNzIv+RY5BCP1aVgkijYqoCpWfpY3a5kanVeobo/E++12VCzbZqlAjfx/j
	3jmiJeucsYNAvDB9Gm6EGX15OO8sRBeBfZRomjoLheFqNVL7qMAUqKsktFY8Xku7bQMP
	hgHQ==
X-Gm-Message-State: AKaTC02RdWRHGHtHdT0cBzxQPyOz67OKGz0LwAWe8nf45DK8d0InqptPkiIJQ8IbL8AebQ==
X-Received: by 10.99.139.199 with SMTP id j190mr191279003pge.115.1481767790249;
	Wed, 14 Dec 2016 18:09:50 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c142sm90098329pfb.23.2016.12.14.18.09.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 18:09:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2016 18:09:36 -0800
Message-Id: <20161215020940.10105-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161215020940.10105-1-raj.khem@gmail.com>
References: <20161215020940.10105-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] libmng: Add recipe
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
X-List-Received-Date: Thu, 15 Dec 2016 02:09:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb

diff --git a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
new file mode 100644
index 0000000..b176d09
--- /dev/null
+++ b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Development files for the Multiple-image Network Graphics library"
+HOMEPAGE = "http://www.libmng.com/"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=32becdb8930f90eab219a8021130ec09"
+SECTION = "devel"
+DEPENDS = "zlib lcms"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${P}.tar.gz"
+
+SRC_URI[md5sum] = "7e9a12ba2a99dff7e736902ea07383d4"
+SRC_URI[sha256sum] = "cf112a1fb02f5b1c0fce5cab11ea8243852c139e669c44014125874b14b7dfaa"
+
+inherit autotools-brokensep pkgconfig
+
+PACKAGECONFIG ??= "jpeg"
+
+PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,libjpeg-turbo"
+PACKAGECONFIG[lcms] = "---with-lcms2,--without-lcms2,lcms"
+
-- 
2.10.2


