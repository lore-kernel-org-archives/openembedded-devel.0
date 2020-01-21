Return-Path: <ticotimo@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id C025B7EC40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 05:03:20 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id m13so857314pjb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 21:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YaesG16A8uY91oqw8JE17JVtI32NLbiAhg1Tnb350lU=;
	b=iZt5/G8PYQdNc46MsEZV1LwQ1rDq+5YhEmwdXWwUVm9PZclAWkC9+Kl6h3Tu5HedGY
	llitEsbGVXRHDE2aqlO6e5IKIzVGNL567fxEN8RelLCwMsIKq+scHfYf1v78K/0DYmvJ
	exlBT3sJnmN7VONf048/cqJoMMoKc88EYsnSyXm6n85+w5zZL7P1mEXdAOXTjTDIQcyO
	4YZB7/TkyDzxS5Scgv8mPo9E/SF8omlzFS1iwlCMyEe9uIMx5MBYdpPOY5/K5h0WcSqk
	E/RZPEanHy9OZreaS6UZpro5MmroXyOBB8OOHdtjw7rl4ztQG7nCrSp/OaLu0njIzeoC
	KOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YaesG16A8uY91oqw8JE17JVtI32NLbiAhg1Tnb350lU=;
	b=rCwPlyeA6GJfyloqSL+8Jp6VDAs0A8Ecn7kKyNB4C7XlyMWOtqmfF4XSfpkHtb1clQ
	SQER/0iORcokfiNNUarEezEslWrOsfpR3daoHWowMsl8IL4JOSML1Rqwov6APBVmE6Eb
	8/hYAi4DOJ+LgoqsO3hHcxTfhSzE1bj/wsLPJjTpRUbsKnF3Ok9roictd1d2sEbxY2qh
	ku5aX+1RDB09dkJRxpEOj5XLN7mK5l0efJvBV0vNyiM/MVZ9kxRtckOUA6sPPpuJrRHc
	qPyAjBWHQIlGmPyJtBZYPuoyCc5OJy10wScU2YaCBiiySHAAa2D2KVUY6+DnrF4dJmtv
	3VuQ==
X-Gm-Message-State: APjAAAUy+ZojuXv5z2EwY9Min8Fa+pmGXYhs/Y9ERctuBUg6Iwko0JAA
	AF2UAGgZxcnkb7qXeklfRyqa4QpiNpA=
X-Google-Smtp-Source: APXvYqyyP7/KFGOtMXuVTkSdjBbMDVoSuva20nPCYPmzPk2o/V1ZVvOIkRkmO5Cww0Sa4h9JD5a3eA==
X-Received: by 2002:a17:902:8341:: with SMTP id
	z1mr3478651pln.178.1579583001464; 
	Mon, 20 Jan 2020 21:03:21 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:7c96:1b52:3429:d935])
	by smtp.gmail.com with ESMTPSA id
	y62sm43387877pfg.45.2020.01.20.21.03.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 21:03:21 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2020 21:02:55 -0800
Message-Id: <20200121050257.16561-2-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200121050257.16561-1-ticotimo@gmail.com>
References: <20200121050257.16561-1-ticotimo@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][PATCH 2/4] python-deprecated: add recipe for 1.2.7
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
X-List-Received-Date: Tue, 21 Jan 2020 05:03:20 -0000
Content-Transfer-Encoding: 8bit

Python @deprecated decorator to deprecate old python classes, functions or methods.

Dependency for python-pymisp

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python-deprecated_1.2.7.bb            | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-devtools/python/python-deprecated_1.2.7.bb

diff --git a/recipes-devtools/python/python-deprecated_1.2.7.bb b/recipes-devtools/python/python-deprecated_1.2.7.bb
new file mode 100644
index 00000000..da2c7600
--- /dev/null
+++ b/recipes-devtools/python/python-deprecated_1.2.7.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Python @deprecated decorator to deprecate old python classes, functions or methods."
+HOMEPAGE = "https://github.com/tantale/deprecated"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=44288e26f4896bdab14072d4fa35ff01"
+
+SRC_URI[md5sum] = "93d65f6a4efc9aebebfd28c9413dfd19"
+SRC_URI[sha256sum] = "408038ab5fdeca67554e8f6742d1521cd3cd0ee0ff9d47f29318a4f4da31c308"
+
+PYPI_PACKAGE = "Deprecated"
+
+inherit pypi setuptools
+
+S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
+
+RDEPENDS_${PN} += "python-wrapt"
-- 
2.25.0


