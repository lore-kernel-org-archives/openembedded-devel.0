Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE24786C8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:07 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id f6so7442781pln.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XtrGRe/pvl1acjX3gcMazGetQr1j7BVWmtuktMTTD9E=;
	b=Tomhb0DveY6NX6ROnEQwKpfG9axxWvOwskwavSEwHo6So6LBg0GVA6m3jqTqv3b7ex
	afhVvBuy+hZf9y+XLICyif0oKPfFyHwtV3CLCaBLHERp+w2SQYNRPLf0cR6iLeGbvCTb
	LKav2RNVJmCrwOIWVs2TJ+9+lE3lO06BxzLyyYresDo2o0Ry9mGGyitYcWwdxOoJEURk
	+XbDQ9IPWsVz6wP6uk6NPJ80skp0S8EXsyhCyTFkf473Uod0myenwUxVnnL6uMgzkjkV
	R5Ss/SjAwvt6EZTjqxQqfiTz6ndK2+L+lv5nuw4yWJgOJ541fx3chkPd2PEO5mU8Wy1K
	mCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XtrGRe/pvl1acjX3gcMazGetQr1j7BVWmtuktMTTD9E=;
	b=ba68BZP5pP0txu2ifsYsopj0xBHTit27KLQAZj5ieLocJmIBDkrIK807qxOt2GiwVl
	6QQLcGH9Xw963v8QPPxwTvU87j/ccuD88T1cw/vBnt5nLcPcwnUfOTiwvfonlgTHmlDw
	DJLHHEDiZXNB51wUNEDE6vXiLL947iw3R7dxftFbcqRZP+3P8GK9FkjQhlXFHa/p/AVW
	0jv8whiF8qlk6mTGWS4EKgSvDMJbP/sbmlkS7ds3yv2qCc49/OVKa9RFxG9eDt+1XZ5y
	+Gh4MrjhuhtcLqHrjgnOFaeJp9Jgcu5JjL7aJI8Zj6o8hwMwF+Ue2rxk41SLVXle6GhF
	qBHQ==
X-Gm-Message-State: AJaThX6i1V66xD0zE1c08qnE4y0jrFsMtWlrcu5kEhlOmxSlWBiYvc9W
	fGk6QK2wBRn1sadkGbJ9VcFyxA==
X-Google-Smtp-Source: AGs4zMbL6uUNb6zkDX6UppDP8YB3Y9O4AZEafsVIWFlMOWLAFgSLdE2FRia+i/IVoZNstQd6370Rhg==
X-Received: by 10.84.217.2 with SMTP id o2mr8350305pli.338.1512191589175;
	Fri, 01 Dec 2017 21:13:09 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:08 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:45 -0800
Message-Id: <1512191576-2302-3-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 02/13] python[3]-alembic: new recipes
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:08 -0000

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


