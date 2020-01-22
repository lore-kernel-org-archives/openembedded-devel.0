Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 904DC7FC1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:38:23 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id x7so2910679pgl.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Zqh2/NiUoir5yixo2I+jGsX/d8QaOsNq8/OUf60Otlo=;
	b=hvgvcMa5rNVqsLhaHWZknEY5O2Ugx7vJOY5DqKSWn4yAVvq7mtkcFDguXIERyAWXZG
	rIA9aJWY45f77Oq0K1qQssH+hJTzGzRkbvtWbH+1nxUkDKpZzsXPdovNi6bIhs920hNL
	Qru18vLjipB/X5/GmWik12aZUvsQe2Uz6n8lV4a6u5Thcslp0XRkx6V+VeHkZzxZKrFs
	qRxjwAaSjTknHYDNEpwc6/Tahzvp5CnyniMCaQUortLPw2f99Cf/QOo9Yu2xVI+kG/WU
	9/6QANidWFCjM/yf1d2XstS/peYcOXv6vXvoovO1JQ4GN1gKqiWE1GFl3Z3cN6M6yolf
	aLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Zqh2/NiUoir5yixo2I+jGsX/d8QaOsNq8/OUf60Otlo=;
	b=faEB3FEZzEBjSh0E0aUamN7bXoLILL3yRKbsXtD6gnzbdkQKxIzzOxjwJfzc/55+yo
	JHeg+B52TRQscQRgOnZytdKCyTBiAUCO2z/d89d3A/hteuop0tywjqP3p8qrkUxS5TEM
	ucnnOUQapOJ35dQZ4vQJFIxjuIrgqrO3SpDE8Ob+ljIkIiWvaxY3WIQIGKLk6fTlriSx
	IQrfNH3xtuFE2ng6VPSYeeqqgpvNHAU7JO53vy7lRRYQ2ckdEbLCWcREF19lMLnkjh3u
	FFZcODhRjaj1tl2NXAgz9NFTb6k8nyhLJxtg1u/ZCRLS8Nq5rsVbJIj5hBIbsmFifFsE
	mXBQ==
X-Gm-Message-State: APjAAAVxOpviRj+7gvlpJoD5fnSYHG1q+/09XkldO9C/VrosW6Pk0zA5
	GcwzwCm7/hk+ArOOUNRG0jxGScVec6g=
X-Google-Smtp-Source: APXvYqySYE8vVezzByqlYqayh9v19DmDkNkImDxJVEx93D4Q135iV578ItvCRR740plAmvDqY+/+pw==
X-Received: by 2002:a63:6d05:: with SMTP id i5mr9931443pgc.120.1579675104071; 
	Tue, 21 Jan 2020 22:38:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	100sm1600283pjo.17.2020.01.21.22.38.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 22:38:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 22:38:12 -0800
Message-Id: <20200122063823.242098-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 01/12] python-m2crypto: Use PYTHON_PN instead of hardcoding python name
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
X-List-Received-Date: Wed, 22 Jan 2020 06:38:23 -0000
Content-Transfer-Encoding: 8bit

Lets this inc file become usable for py3 module as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-m2crypto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
index 5f5444f37e..76dd58ce04 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc
+++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
@@ -17,7 +17,7 @@ PYPI_PACKAGE = "M2Crypto"
 inherit pypi siteinfo
 
 DEPENDS += "openssl swig-native"
-RDEPENDS_${PN} += "python-typing"
+RDEPENDS_${PN} += "${PYTHON_PN}-typing"
 
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
-- 
2.25.0


