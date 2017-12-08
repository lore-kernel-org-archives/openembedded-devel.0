Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 71D6A78683
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:25 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c204so6508739pfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XtrGRe/pvl1acjX3gcMazGetQr1j7BVWmtuktMTTD9E=;
	b=RwgfA2Ise3glrZDsywlN5A2cEhibMLZof1x2Gt8/3kydzNGDuyoa49YH1bZ9kpwELc
	8h3hZaZ82E73SsTW+kIj/5d/GO2WHwd1+XhbLaR0tUbCM8B3yYTPsJtbgIlv5jp4REUA
	wgrg6f0SI4A4e5CQBaG9FZtqD4lZ9yXSS/yi8DsIGNsuaZvRQIEnUn6PJOKwenZYO232
	/9i/EamBVcV3tr4JtvsmTHP86HWReadgs+w5Bn6aPHnG5PyE9sU1CGItw8YUoQkurIZS
	wOuZYWLxxNqREsVv1l/7KiGIiMaqyVClpWZ9MRkNA74cWbSPBjA1+74g/vtZ4w2Y/x9M
	obvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XtrGRe/pvl1acjX3gcMazGetQr1j7BVWmtuktMTTD9E=;
	b=aEmr9TcH00J9nI9cbqvfIa+8wFKTRpmt/nCORTR/218gMRjYrD1+cs09a3Li24dwrT
	h3Nibn8WghgIpyBB3Qc1KzdmvYMSbTA0HjOnxCkWwDAYsbP71IIPX+4xQffLi4txPCqb
	hsyshr+20yDurSrnumRJU/9k8M7K/0/xrtdTTEtFqUqg4zDKg8XEx/y2Il0xPJOwrpAT
	40NzmTbDAIG5d4y51GX8A/suVclyKGukoBLPqTcMawl4/hyq6LuZLc6VHgOeUyPtXYak
	br9X17wKcaBklonq6av456VQ1vTakP9fkKELnAoE8dN1tXfgUP7CP7nAA6jFYZifGpT7
	4inQ==
X-Gm-Message-State: AJaThX5N958UFwnxOKJ3IpYMMz3tC7Zis4jKl9DsqbFQaTUtzxcOeHf5
	wMWGHjDuknlDR5abT7jQUlhu/w==
X-Google-Smtp-Source: AGs4zMavmd6mBJXWE6V3PoUMBYm++ORnIFWlktJIaxKHrto13iFIaiKMgpKpPUfxpucGA6eQrfl6dQ==
X-Received: by 10.84.129.226 with SMTP id b89mr28208867plb.258.1512712166254; 
	Thu, 07 Dec 2017 21:49:26 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:25 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:49:00 -0800
Message-Id: <20171208054911.27014-3-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 02/13] python[3]-alembic: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:25 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-alembic.inc      | 13 +++++++++++++
 meta-python/recipes-devtools/python/python-alembic_0.9.6.bb |  2 ++
 .../recipes-devtools/python/python3-alembic_0.9.6.bb        |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-alembic.inc
 create mode 100644 meta-python/recipes-devtools/python/python-alembic_0.9.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-alembic_0.9.6.bb

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
new file mode 100644
index 0000000..2ca6023
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "A database migration tool for SQLAlchemy"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d07407716fd24408b5747b0fa2262775"
+
+SRC_URI[md5sum] = "fcb096bccc87c8770bd07a04606cb989"
+SRC_URI[sha256sum] = "042851ebe9efa07be6dc1395b1793b6c1d8964a39b73a0ce1649e2bcd41ea732"
+
+PYPI_PACKAGE = "alembic"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-editor \
+    ${PYTHON_PN}-sqlalchemy \
+    "
diff --git a/meta-python/recipes-devtools/python/python-alembic_0.9.6.bb b/meta-python/recipes-devtools/python/python-alembic_0.9.6.bb
new file mode 100644
index 0000000..efcb2b1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-alembic_0.9.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-alembic.inc
diff --git a/meta-python/recipes-devtools/python/python3-alembic_0.9.6.bb b/meta-python/recipes-devtools/python/python3-alembic_0.9.6.bb
new file mode 100644
index 0000000..e248fe7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-alembic_0.9.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-alembic.inc
-- 
2.7.4


