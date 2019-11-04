Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 350BE7BEDF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 11:38:06 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t1so10730637wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 03:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ow/Xj6vqxu3gQvvAzfPkbOCmRfxqOYCHLIXk9gIl4PY=;
	b=FKHkaFbK5mxhNkXjbqBAyMDBPbVWrK04pzosTUpfAGiYserDXoSJdRhOfdbIYqwy6o
	QNvNAD2EcZkjMwS9+dlafjiNJDdqAo9FBwOmftJyzu6Cab0Y1hOU1alGe+VaWLbMWCHG
	sQYpj7zuRz/fuGL44FcW3WeuD9Mi90ZFC5zFtIhwzOBmLezSvWDIBdVlQ4Ry0dtYz853
	z/CX1ThmQol36lxPLczi+aGCLAlhxxt7YFzGOz1ocwuoN5YMyYZlxMrk7diL2TWYJMsR
	jXtki9hnfduD59f4UiYMAWEmRv+omqFvmP0xWa2TKleKrBuQkAWfdkfS7rSKB86NsTKL
	3rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ow/Xj6vqxu3gQvvAzfPkbOCmRfxqOYCHLIXk9gIl4PY=;
	b=T0B9lJY1ol0D/H44Zfa6biZ4dCF7vhaOKcNmJRGN048mTmDeoYQ2BOfzYtVpJzeJgK
	HAhAMXpm6oxkrCA0xVd1fPPnZGNvJ/1roueGbg3pKVYLrcyoMbQI3SOeGZQrmnh7crH8
	dMOxRmZ0/fVPtDvrqK3c4Cy88oM5Mfx+HSWK65RTg7dRqyds4Rrt0EOix+IWLkW1V3pU
	V5PuszaZjYmaFZDQzX8ZxIjpn9VWLD7XnZnZpZC7D99EuD3HD6nN0cIgHhkl4bu4RrlG
	H0jMXmO6uxh2UZveIno1TseeL+osJFUjtnvnIl9Q14am3QBVjOMS/Bu2xvjT/+srpl5Z
	cCCA==
X-Gm-Message-State: APjAAAVmgsRdpNE1BWB2+7ZZKb7hSrvXMXqewmX7kDRyhiDW5YC3jNdp
	hTHBjBseUQgv3FvIrmwbI17AtWuG
X-Google-Smtp-Source: APXvYqx6vWhOTIfoRo+FQS8KF7myJxRgtPY08fwTrKnZcVEdXmMBT/6P8r4+zZNFkcXxJzB+tCLdyA==
X-Received: by 2002:adf:b199:: with SMTP id q25mr24231680wra.320.1572867486587;
	Mon, 04 Nov 2019 03:38:06 -0800 (PST)
Received: from amue-work.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id g5sm8283581wmf.37.2019.11.04.03.38.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 03:38:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Nov 2019 12:38:00 +0100
Message-Id: <20191104113800.17336-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH V2] mm-common: upgrade 0.9.12 -> 1.0.0 / meson build / add SUMMARY
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
X-List-Received-Date: Mon, 04 Nov 2019 11:38:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{mm-common_0.9.12.bb => mm-common_1.0.0.bb}       | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-core/mm-common/{mm-common_0.9.12.bb => mm-common_1.0.0.bb} (36%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
similarity index 36%
rename from meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
rename to meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
index 4f91f31e4..0b9e58917 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
@@ -1,9 +1,12 @@
+SUMMARY = "Common GNOME build files for C++ bindings"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
 inherit gnomebase
 
-SRC_URI[archive.md5sum] = "be1c61587db989c7677375a729b94672"
-SRC_URI[archive.sha256sum] = "ceffdcce1e5b52742884c233ec604bf6fded12eea9da077ce7a62c02c87e7c0b"
+SRC_URI[archive.md5sum] = "9087b8612d75cbc1fad0c99e15c2a718"
+SRC_URI[archive.sha256sum] = "b97d9b041e5952486cab620b44ab09f6013a478f43b6699ae899b8a4da189cd4"
 
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+GNOMEBASEBUILDCLASS = "meson"
 
 BBCLASSEXTEND = "native"
-- 
2.21.0


