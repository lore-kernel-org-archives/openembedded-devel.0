Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 05B757FDB0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 15:29:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t2so54420601wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jan 2020 07:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZKm96C2s/Y38AbIDcXznaUQkOM8/mk1goC/k5ktXwWM=;
	b=B1ux+RPRT+NcKy1KEBjFY8jL2cjkTdAOruXa9/vet26l31y0iA23Fp3amnxeLy41rn
	Ser9KhH0B2VPgZQtEXSUWeROfb/Yujupb81UuWOQKVPDB7rhSWkjHD94HyLhNXSxHuGU
	ORsEcpWaqkHWvhB+byOz0IyOL5EyhiZEUVZGUQpZ1yiMEKjl/0HccyXq9E6sJ3K1dpAo
	DMw5G0yQfdCj7qYsHl/Zp3xeXNp0ZOa9x0yqXIAMb2E4Wy+dJBXCcVHUfvW8JE9EWIu9
	m060iiTlOTFYk2MucJFVXk9fQp7JsPxVYyB9GsgKyRIXBjA4z9TiFz5SI9l9m2/T4mmK
	kVdQ==
X-Gm-Message-State: APjAAAVurHw2a1Cx5aE7jd3pmAyzE++WUKixWkd0jywA0xAZOf/0JuEh
	z32M5xABBqfVhsOkHHlIpymDgzoP
X-Google-Smtp-Source: APXvYqwY6MWTM6fPY0+aWi/MShMq35js6LOY/SiGNbXUZMX9+NbwUsWKV6amlSAlis7xZ/qyvRExgA==
X-Received: by 2002:adf:eb8e:: with SMTP id
	t14mr108727754wrn.384.1578410963445; 
	Tue, 07 Jan 2020 07:29:23 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	u8sm27236485wmm.15.2020.01.07.07.29.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Jan 2020 07:29:22 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jan 2020 15:29:22 +0000
Message-Id: <20200107152922.23676-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-jsonrpcserver: allow to use as non-root
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
X-List-Received-Date: Tue, 07 Jan 2020 15:29:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This version has some file system permission issues, all
the files are readable by the owner only (in the archive
from pypi.org). Given all files in the target file system
will ultimately be owned by root, this means that this
package can only be used by root.

Fix the permissions, and hopefully the next version will
have the archive fixed. The version has been hard-coded
on purpose here so as to remind us to double-check if
the _append() is still needed after a version upgrade.

Signed-off-by: André Draszik <git@andred.net>
---
 .../recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
index 7d464b16c..ceae6abd8 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
@@ -21,3 +21,7 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_append() {
+    chmod 0644 ${D}${PYTHON_SITEPACKAGES_DIR}/jsonrpcserver-4.1.0-py3.7.egg-info/*
+}
-- 
2.23.0.rc1


