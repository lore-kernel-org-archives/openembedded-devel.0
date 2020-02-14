Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8B061090
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 19:07:56 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id g3so5272666pgs.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 11:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=vM5HpKh3McpQb2+9eZyVqmvX2UuapdqJNFKIY+lAldg=;
	b=cEWHoNX6eRK6RDQ6m3gEF1MQFDPld9G5wmSSZQ94wT1J6XbVPRFqnZYKghPbn8jSJC
	OTxCT/Ik6aeVv0uPT04Qb2jRmNH/dcWye675FF+QSvkIGhSrTskXTR+aiGT5S9mB58ua
	lOfh1b2xB0uhbCSnyhbIweg8xNHuxmGYkLPPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vM5HpKh3McpQb2+9eZyVqmvX2UuapdqJNFKIY+lAldg=;
	b=RuPmuG5HLdhq0kiaVToo3ZsXIFOsbjMSbdU0sqjwWkq0/uUYZ8nCWjlK7sUq13ae+E
	+wzkIf70SwKZzKo+6wRRxg2/Ny5AHhjeL72lUU0KjuY04MgSty6e7Vx2mK3i8skalOwz
	mL3JEWX/gFzWKcKfdKSyZBXdtwR9+SBKf39nWDS+04HqvRhCgFMXWy5ORABLIQ5jWoCR
	ZGbOh6QkReOxhPinGFNBAsa8mO6xmjlOShGfBbEgjdZWPAucqqn6BuDxFltRn9ZZpCMc
	z1GzvIBGwcMC+OBoVVXM431DlvS3EdwVvX3DcIDoaxz7PtZoX8/U8mNsW97b/n9/0yGv
	wiPA==
X-Gm-Message-State: APjAAAVVD3cazaX7XBDhoI3nITq7vaNKbSKbVlzAb2sXGqiYCV2gus4b
	Ap6IYb9qryXyU6rIc6W931DBwsyFNTri3OG9uu3ezY7JanLO7Y2LnCWWTCfDJvPa8ibYp6Y8NfY
	kvXx9xbeMcgUIB4KUg6MK5h5GRv7GreTGhmRx6OG/pE2IkTqxRXGi+BFQD9ufGcEmep/p2dSQav
	KCqpEMzlS5W0Fmr9VyHcnnyUxfjDxR04A=
X-Google-Smtp-Source: APXvYqywtiRoc0uSsxol0i+cZ8NLSignp2SW1+OIJUDJ2DFsRDUcWKnUlTW3spiJrBRdu57RIXg1cQ==
X-Received: by 2002:a62:7c96:: with SMTP id x144mr5091374pfc.7.1581707277266; 
	Fri, 14 Feb 2020 11:07:57 -0800 (PST)
Received: from lbrmn-lnxub108.ric.broadcom.com ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	c15sm8005113pja.30.2020.02.14.11.07.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 11:07:56 -0800 (PST)
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 11:07:46 -0800
Message-Id: <20200214190746.49762-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.17.1
Cc: Randy Schacher <stuart.schacher@broadcom.com>
Subject: [meta-oe][PATCH v2 1/1] pcimem: add initial version 2.0
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
X-List-Received-Date: Fri, 14 Feb 2020 19:07:56 -0000

From: Randy Schacher <stuart.schacher@broadcom.com>

Initial revision from 09724edb1783a98da2b7ae53c5aaa87493aabc9b

Reviewed-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
Reviewed-by: Randy Schacher <stuart.schacher@broadcom.com>
Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb

diff --git a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
new file mode 100644
index 000000000..107d5a8b7
--- /dev/null
+++ b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Simple program to read & write to a pci device from userspace"
+HOMEPAGE = "https://github.com/billfarrow/pcimem"
+BUGTRACKER = "https://github.com/billfarrow/pcimem/issues"
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+COMPATIBLE_HOST = "(x86_64|aarch64|arm)"
+
+SRCREV = "09724edb1783a98da2b7ae53c5aaa87493aabc9b"
+SRC_URI = "git://github.com/billfarrow/pcimem.git "
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -D -m 0755 ${B}/pcimem ${D}${bindir}/pcimem
+}
-- 
2.17.1


