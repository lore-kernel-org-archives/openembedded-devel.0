Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 623E06FF73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 14:15:02 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f8so1697234qtg.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 07:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tQ4AFCCcd9qU+/ZDqb4+zxNpDEIX7cywe1EipkQtCzQ=;
	b=KVfB6R3cwj5G8Isjp3FLhBjiMSXcGbt+Htv4Q9RPfGnhh0wxZyoSvqoILxiOCY9vuO
	fjbnlo9oMQ5WJYVH+ZO8M1yp12fquDDbhjnxuKnNVVMCXaD4UhhTK9lBeM9NvTs653xt
	DM9AtP4ZASgof0Ut/9r9wQv5VXxrN6IvH1b3YxwB9goVtgliRYyH8m2dO6wLplGjDgvv
	pdxH25Lz5SbJGvcG5hpZyGVGcoGkhHomVnM1Ld20qnhvYB9KwDOyS3qCt7cXChQ8VS6O
	4D9eGf98h5esg/dxGSNOsg4hMD0OOKkSa1rPWMHPqFTdDBgHMd9G6uXsx6+BMSF01/vZ
	jDNw==
X-Gm-Message-State: AElRT7GrUMycljkFmlejxkvNOrXCB9Kjsc8SmVT59QG8dh0YOJbHvaen
	uMCdBuRi2FSo2cDJJpVmR1pUa48c
X-Google-Smtp-Source: AG47ELt6OPeWHgJZlHM618/3iQMuiJ2eH8Yh0Fa1Yxk9oB5n2OGZ9Ki3XoSW47Q5bnR89meP/Fjs5g==
X-Received: by 10.200.35.48 with SMTP id a45mr8337610qta.311.1521555302932;
	Tue, 20 Mar 2018 07:15:02 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	t68sm1716796qkf.62.2018.03.20.07.15.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 07:15:02 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 10:14:54 -0400
Message-Id: <1521555294-6378-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH2] python-pyroute2: add io and pickle to the RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 14:15:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyroute2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc b/meta-python/recipes-devtools/python/python-pyroute2.inc
index f7b57d9..9ec9866 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2.inc
+++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
@@ -13,9 +13,11 @@ inherit pypi
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-io \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-pkgutil \
     ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-shell \
-- 
2.7.4


