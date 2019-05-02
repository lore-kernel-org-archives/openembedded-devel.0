Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5DA7D2BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 May 2019 15:45:12 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id t22so1231579pgi.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2019 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=IgjwWjKPZeD+TbMKQ9N58VIZDI9uyhHjrDF1Y/tIJ9Y=;
	b=lNfyxnLuI2ppIt9SnOMqDtSgVM8edKLp1B7H+67pjy0MlH9Xs0WNbp3hzqFvZOz1Mz
	bByue1w6GhKyJIPNOVlcv6fdMEuhb6xsfDbJ03VDgI+dP1+pKcombnJkCRiIS2rp5m7n
	QW6chif71/dAeOlcc4ob9c7KtQjtwxo0xV/iqQilVg+lwFv+vGIzqBxKYCeaBLFEW5JL
	RMIrQKVAsTwAqwrUTc8OA8dcpJxvILzDOxT3jeBdXkg+kCaagdaYPquh8sGd54xgXFgl
	lPzro8Gu++xJ2wSIhsvm3ZqxQtCBzsJYdn5nOFboSiePuspj9Vi0XgZqZbTz1PyhF11/
	AgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=IgjwWjKPZeD+TbMKQ9N58VIZDI9uyhHjrDF1Y/tIJ9Y=;
	b=MUoCx2ICHxDzlaAb2s7jHdppbZSaNzO+nFoYdH+NYTpI6vHiOveL2WzEbQE7Ib9rHE
	CEV2IRLg61FxsfHAwAr8kQV6R3VqYdZfUj7Ijoa3wH+qfd4/vTLRhQxcGVv/o126zEGC
	CkOjseVGzU2FBGdx6Sg/HTy6xdi+EJ95RoLQC5oDPXJho7W5iInd+198Bo2N0iVXjOqE
	iUgBQcpn77TgSucQ9s7q7GH9/DcO9AJvYicqevFLQaHtL+ejRIg16v6oieE35/A+aUDN
	nfegZRnRFSF49CfjidYswLJ9VNQ355nZeisQMboVIn3VVxExeQqYCdJiMo8TNw3Ui64/
	1KYw==
X-Gm-Message-State: APjAAAVUrebFo9DZYalO/1Q7oxL2RbZ4CUhT3iPLPuK4T5i7dAUu6Nd8
	k/VdIYty49+kIrVWv8APShbzCAvEOdQ=
X-Google-Smtp-Source: APXvYqyaFY3VJtAcEZAFgU1PO/sQCx+qZgcjiysM+Sfl38UbIpiuVPi/pAnhj66tBTl9i/ctGXd78w==
X-Received: by 2002:aa7:80c6:: with SMTP id a6mr4987917pfn.114.1556811913848; 
	Thu, 02 May 2019 08:45:13 -0700 (PDT)
Received: from apnavik-DESK.iind.intel.com ([192.55.54.44])
	by smtp.gmail.com with ESMTPSA id
	c127sm54920407pfc.132.2019.05.02.08.45.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 May 2019 08:45:13 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 May 2019 21:13:17 +0530
Message-Id: <1556811797-11018-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] libnfc: Initial recipe for Near Field Communication library.
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
X-List-Received-Date: Thu, 02 May 2019 15:45:13 -0000

Add generic recipe for Near Field Communication (NFC) library.
It also includes testing scheme which is not extensive but elements are already
in place.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/recipes-core/libnfc/libnfc_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-core/libnfc/libnfc_git.bb

diff --git a/meta-oe/recipes-core/libnfc/libnfc_git.bb b/meta-oe/recipes-core/libnfc/libnfc_git.bb
new file mode 100644
index 0000000..d00733b
--- /dev/null
+++ b/meta-oe/recipes-core/libnfc/libnfc_git.bb
@@ -0,0 +1,14 @@
+SUMMARY  = "Platform independent Near Field Communication (NFC) library"
+DESCRIPTION = "libnfc is a library which allows userspace application access \
+to NFC devices."
+LICENSE  = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+SRCREV = "c42e2502d4627d3ea62f83c32677b100bb3cebdc"
+SRC_URI = "git://github.com/nfc-tools/libnfc.git"
+
+DEPENDS = "libusb"
-- 
2.7.4


