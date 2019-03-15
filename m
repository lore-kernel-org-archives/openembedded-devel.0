Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 146ED7C740
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 18:18:22 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id j25so2334508lji.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 11:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=y6O1oaPE6FlDvBvPU4XOwumChU77hWXNlxgBKIw3ZMI=;
	b=DVzeEGN940cTTZ4Mrbgz1kZVpOQltMZDQO7aU9Pk407/ju76ht3wHCDn/l6eY8rOfu
	QxmEn/H/rtkE4bLj4VXS9YCyW/kIGtvhnrU/DKnhnuaDomwkpch5VjfMew4VGnl9RHrG
	4dFdMNtvG1iFKkzTM5I8c2loGIFWvr2jRhurSkTmljp4kd6QnS7r0ge1A08ZNcxvo4d+
	gFmfrKwcgKxY+xBffUnZWA3BsjHrrzkTmBJ0GOwhMsGTtO93PnOKAS6c/g61qFv125tV
	ii1OtVQQVH7+pJUyvfwfG3k97SF6rIkSHUeUoUfd362ai/JvtASap87n4cfLSdo0m1WR
	VkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y6O1oaPE6FlDvBvPU4XOwumChU77hWXNlxgBKIw3ZMI=;
	b=ebDvdqgIxB3n6jNeEoOAcz99i9fASfTqRal5sX4kcsKgLU2dP/szUN12mZ8Xhv+8iv
	1+lvQemUV/uKdcYTU0Mn4TbiJz58AiV/AegKSLDsS++9z8B4ygqy7a0Pnuh9R2CJS2xN
	99VH0y0u1q3ww4tX39LrqBopVCbDVVKS9ttHMIgpuGFbMmb/ojemRCAH6CBZcL2vPxGv
	6Z8FvTdkYIUi0LJ40AGHuuSHlgNB0Qng+46HDRls0BHNR9XIXxamPwsrFKB+ZWVL+9dj
	8LuGgsW0y4RQ8MswxtZZcATIJYpfo6O/3uNzHSrquai07aF8qi3AqtEly7khy6bG8lP/
	azDw==
X-Gm-Message-State: APjAAAV9ClznEwzn2AHdIDNVLYMZhIGCqXrEobs4NrwwYypDi89O+uVF
	0hG5do4vts0WqLjqAZY/QGbJ9fVvHDg=
X-Google-Smtp-Source: APXvYqxPtKaA5OVXhKQ5sg06yb0uIptwhOxNQZVk4pQol3YhqNzia5azA5q8r8+6mCqUDUk0EokUBQ==
X-Received: by 2002:a2e:2ce:: with SMTP id y75mr2895308lje.126.1552673902635; 
	Fri, 15 Mar 2019 11:18:22 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 10sm534126ljg.91.2019.03.15.11.18.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 11:18:22 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Mar 2019 19:17:53 +0100
Message-Id: <20190315181753.15834-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] python-networkmanager: update to 2.1
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
X-List-Received-Date: Fri, 15 Mar 2019 18:18:23 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...n-networkmanager_2.0.1.bb => python-networkmanager_2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/python-networkmanager/{python-networkmanager_2.0.1.bb => python-networkmanager_2.1.bb} (70%)

diff --git a/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb b/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
similarity index 70%
rename from meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
rename to meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
index 4e41aa576..3aa41f1ad 100644
--- a/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
+++ b/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
@@ -4,8 +4,8 @@ LICENSE = "Zlib"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8d8bac174bf8422b151200e6cc78ebe4"
 
-SRC_URI[md5sum] = "5fc644a65463031295c6b7dd51a0f1bd"
-SRC_URI[sha256sum] = "bc36507506ad29bfdac941b0987ebd1cc9633c9a9291d7378e229e4515a0a517"
+SRC_URI[md5sum] = "f638d854a3639fb37c0e06d1092a771e"
+SRC_URI[sha256sum] = "aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc"
 
 PYPI_PACKAGE = "python-networkmanager"
 inherit pypi setuptools
-- 
2.17.1


