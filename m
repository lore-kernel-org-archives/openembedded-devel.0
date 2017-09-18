Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id B8E1778215
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 20:42:12 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id g128so1091652qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9WRvXLZoi+2xS1HrzXH7Jf1igSQ+3O0fYls8IN3jLlA=;
	b=R/KRdgeZ9fY8DG3fJO8aqkZLxB5eZR9s7Im+vm37NRyGWS4+WxhBml2ApDyKNgdz4K
	cZka+oMNMNhqVTvnqvXx8MRXKDNVq5Axs9fHxAsCbA99STE93h2R/uT8v5GSb6tJfEGw
	lWXUWHQ+dgSL87z09jkfXg7irdH0gREY3JuIxWHEyYQfnOXVal71z53sIrLUWCiyv/ZX
	IEionWPMJBnZspRcc7hN5vOD26xTsl7tLG+HMH4UfKrn7q3FqiyxRvZ2XIqiUJkvjU4n
	SzF0v7DJcKytsuzRY43ZL5pCU9WukzhuJwQvzG9RDFRIkBGEahWQaYTNFB5W8IbijH1o
	69UQ==
X-Gm-Message-State: AHPjjUiuZDrhAP83//sLgsNDob7SITEKFt/kfG94CaYIoem95JCUlUhD
	8n5GKxH9PoBq7Usaz+Y=
X-Google-Smtp-Source: AOwi7QCBQi6DvrTE6KFdyS9GgtNo/FLZ8eAiECRKp0fOXD4y+4Y8zEAsmVTg4dR48NKn1lUUa7fOcQ==
X-Received: by 10.55.64.136 with SMTP id n130mr4425720qka.38.1505767333345;
	Mon, 18 Sep 2017 13:42:13 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	b27sm5838062qtc.78.2017.09.18.13.42.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 13:42:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Sep 2017 16:42:06 -0400
Message-Id: <1505767326-22541-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyro4: update to version 4.62
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
X-List-Received-Date: Mon, 18 Sep 2017 20:42:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-pyro4/{python-pyro4_4.61.bb => python-pyro4_4.62.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-pyro4/{python-pyro4_4.61.bb => python-pyro4_4.62.bb} (70%)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.61.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.62.bb
similarity index 70%
rename from meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.61.bb
rename to meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.62.bb
index bda2dc7..041c4ff 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.61.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.62.bb
@@ -2,8 +2,8 @@ SUMMARY = "Python Remote Objects"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=378acef375e17a3bff03bd0f78c53220"
 
-SRC_URI[md5sum] = "34b25f257db2318072d1683c4a4f1ba2"
-SRC_URI[sha256sum] = "c465cb2ea2a90b887988d4249de8c0566bdfb16101fdc570e07e598a92e94d1e"
+SRC_URI[md5sum] = "6e2fef3dc8b29773a87abbaa8e9abe15"
+SRC_URI[sha256sum] = "e301edfb2bc47768b7222a68cae8de8be796d1d9f61cdbd1af9039985ed5009c"
 
 PYPI_PACKAGE = "Pyro4"
 
-- 
2.7.4


