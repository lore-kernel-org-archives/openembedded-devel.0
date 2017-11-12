Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id E67827846C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 17:29:18 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id a142so17204416qkb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 09:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OSJXnMdEMPgkPq378Mb+LJG8QpCmceGoYpbD9giWlRY=;
	b=ksJZAkDt9J64ePR00x2MVy9qfEPUu/v94CZiM62Xb6U24JIoWdHL1bZuzxXUbHF8oF
	rA/Ka+jDloFvHCm+BRJBZc+c/sgD0M26fll82HHgVGepRPG+/BS1jw8ygI7Ar6VHOfNU
	yB9E1xcMTinPjHvQayWcy+sABJvlOtTbq0f/pHd6YfsXo7GRroiqT00wJst5WNXS3Coy
	c969zKvObLHnA/Af/Sl8S6+pQ8gzO4YtpJpfYYKvw22zkMbWltczrax+rRICH6DJpsFw
	NZhOppEGWYgLsiUo8QqThwER4vxUr7Vw9H5HGVQcr26GuGvsWHM2MbSy44MIpj4fJuhD
	m0cQ==
X-Gm-Message-State: AJaThX7zhwFZNAF6P46Hwezonn0UEALN+Yd2qxDOeikjJjYzJWmoU+Ce
	9YzSApNZUXtBWAt82k0Bu3wljMTx
X-Google-Smtp-Source: AGs4zMaAFKzbLMvtaKpQLzLkk63nFH89ifQrtNUYZ0skOOh9lPBlDVxckCnOLxl+9rM0Ny9l6ZCwZQ==
X-Received: by 10.55.124.7 with SMTP id x7mr9544061qkc.54.1510507759575;
	Sun, 12 Nov 2017 09:29:19 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 6sm9735039qtz.68.2017.11.12.09.29.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 09:29:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 12:29:13 -0500
Message-Id: <1510507753-8089-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-snimpy: update to version 0.8.12
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
X-List-Received-Date: Sun, 12 Nov 2017 17:29:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-snimpy_0.8.11.bb => python-snimpy_0.8.12.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-snimpy_0.8.11.bb => python-snimpy_0.8.12.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb b/meta-python/recipes-devtools/python/python-snimpy_0.8.12.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb
rename to meta-python/recipes-devtools/python/python-snimpy_0.8.12.bb
index e0747b7..c5af48d 100644
--- a/meta-python/recipes-devtools/python/python-snimpy_0.8.11.bb
+++ b/meta-python/recipes-devtools/python/python-snimpy_0.8.12.bb
@@ -8,8 +8,8 @@ DEPENDS += "libsmi python-cffi-native python-vcversioner-native"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=7c53ab2d1240828625c3e093d049d4f4"
 
-SRC_URI[md5sum] = "7f6270ce2e7206df165602e66d5ceb96"
-SRC_URI[sha256sum] = "10410614c7bff1053ca65bd760ce919f1a074f4988b857df4c57cf35847922b0"
+SRC_URI[md5sum] = "6d016b6356db432e6a87ad708eb8fcb6"
+SRC_URI[sha256sum] = "04efcfba867ffb0e10cc8d7f93a553ceb6bdf2ee34e49762749028a2c76096c1"
 
 inherit pypi setuptools
 
-- 
2.7.4


