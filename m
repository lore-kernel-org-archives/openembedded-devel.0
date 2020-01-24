Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id A3E467FCC8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 08:10:52 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id u131so613164pgc.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 00:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tLboFKPKQtpbylZ8JKWgAIyaPOI7Vcvy32oJavkdF4s=;
	b=U//3nhMx8bUz06kt3ds6ZJa+uZ1e1AwrTJANRvy4dgvUDtmj5kcvoyvesT87vTjbXE
	7MjYpca+HgN1YC9cC+JWAzDpuztc8YzrGjEaNGu4RbeFZYusuURk5ZDkYgdvnzfjV5u1
	kDSYbYPJaOccdFSIBYHdVqfbwmjOTxlN04RY817ZBf8fw5WXd0ocgo8qf3dAzsxGwNpJ
	hUVVY/KjQ/fivOi/pp3DNHywSVAJYPQfxBfh1pXKP1V/dOCjiyuQ7gGL8NYCMHurqDhv
	Qc20prFRx6j5rbGxl3DRv1DlOEgAL03et2Y9Jo+ydcjRihUkZXSQQ80BGsVTAwLiADw+
	EDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tLboFKPKQtpbylZ8JKWgAIyaPOI7Vcvy32oJavkdF4s=;
	b=glUtVWvbyp/rJcDKTBMrlljoqX3UAkHCwlpiJsFFSsZafB1yaj+7P/lFBKKNOZzMHM
	sopwZpEYfZw9qMcb8xyvqYu95QfSWIHAH1KGjkIiEifH5azri5faO8uDkJGoM86ySUL6
	lPZKX75HRg4IO7SoYAdR6mUEArz8DAqcNCTFrx7/UGjCgI01lrWi2Q/9ciMCQFw10UrG
	KFAC2CsoFLENPy9QQvJyLJhdUWA02KW43NyjJibdmafD5wuRoMg3WjcahiF+fdNYIhD9
	TFVSjB56ZoMGzmeBEGWyvXdkpS5Wd5howDM4LGsIUtMH36+fYI5DDidNvwTrxnDpbHnv
	6jWA==
X-Gm-Message-State: APjAAAXYKFvPJSaGo9CiQapdVGk1Rs02JThq+QUs2d9zy4v2xAwJP8Q+
	Kgw5WzFNiSl9meRZIpCKOKkYCkUUD0c=
X-Google-Smtp-Source: APXvYqxj89+50jT89e9oFPhCL9x1kJiznhL6Fb0cQ4duP8Q6WNpDpbEdGtQGpMOVpQXXUGVOLZi41Q==
X-Received: by 2002:a62:e411:: with SMTP id r17mr2063933pfh.119.1579853453469; 
	Fri, 24 Jan 2020 00:10:53 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:3c89:c57:830d:1156])
	by smtp.gmail.com with ESMTPSA id
	g24sm5252809pfk.92.2020.01.24.00.10.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 00:10:53 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jan 2020 00:10:25 -0800
Message-Id: <20200124081026.21969-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH 1/2] python-pyconnman: add target RDEPENDS
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
X-List-Received-Date: Fri, 24 Jan 2020 08:10:52 -0000
Content-Transfer-Encoding: 8bit

* Missing run-time dependencies:
  - python-numbers
  - python-future

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python-pyconnman/python-pyconnman_0.2.0.bb            | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb b/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
index 77ec0f72..770cc4b9 100644
--- a/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
+++ b/recipes-connectivity/python-pyconnman/python-pyconnman_0.2.0.bb
@@ -10,4 +10,10 @@ SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "connman python-dbus python-pprint"
+RDEPENDS_${PN} += "\
+    connman \
+    python-dbus \
+    python-future \
+    python-numbers \
+    python-pprint \
+"
-- 
2.25.0


