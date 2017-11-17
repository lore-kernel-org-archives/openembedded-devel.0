Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 62BA178538
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 18:11:02 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id a142so377149qkb.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 10:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZHJspRR7sS9dzY3+jntR+QmT/j5+IW6CMVh5VIBiDnM=;
	b=oO0y7RTyFz4jfiIpQPxcMlzgEBUt3pur7lZWCfpPOs7Mx3bXIppXr4fS3bhKmoMwLE
	DwUA6LNQDHVRRKGjcxDAhnqsgmaTew1Iwjur5ad/c0Pavql6I/a80aKJU/MjPJ0jiEBP
	b+kZdiG0eFcile7Y0OR12sbicsl25Xj0+L6M9v+QQV+puAOqd/yUna84YxRhIiRtzaN/
	o1MGWsPfEueD9LJTPSNwlvCOAzzB7py8DGwJuqwvk3A1k3B1LqFLZkAQAgHwa08jKaR1
	SY164KJ2e2aFZfiNdR4BgDcR91cbLOgS9+k8hLuE/x7PEfdUQUpzMr66yxmmVMrJLGh5
	BP0g==
X-Gm-Message-State: AJaThX7k6ggrXfHVMFNhO9JKPhalNGSRImKRfgoWQ29mW/VVpF6pvWhp
	bElFKNSp0a2zdOAjIvLsRlki6ykn
X-Google-Smtp-Source: AGs4zMaC6vlVDeIIbU5dyo3u4Cw1Tlr61lWuRoPmfqKLrlgSFaUOH5oqT69JSVJKXQZxOfMLz9zE6Q==
X-Received: by 10.55.22.221 with SMTP id 90mr9427666qkw.284.1510942263195;
	Fri, 17 Nov 2017 10:11:03 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id x52sm93719qta.26.2017.11.17.10.11.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Nov 2017 10:11:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Nov 2017 13:10:55 -0500
Message-Id: <1510942255-22577-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-jinja2: update to version 2.10
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
X-List-Received-Date: Fri, 17 Nov 2017 18:11:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-jinja2.inc                 | 4 ++--
 .../python/{python-jinja2_2.9.6.bb => python-jinja2_2.10.bb}          | 0
 .../python/{python3-jinja2_2.9.6.bb => python3-jinja2_2.10.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jinja2_2.9.6.bb => python-jinja2_2.10.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-jinja2_2.9.6.bb => python3-jinja2_2.10.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index 35cbb0b..cd50d93 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
 
 PYPI_PACKAGE = "Jinja2"
 
-SRC_URI[md5sum] = "6411537324b4dba0956aaa8109f3c77b"
-SRC_URI[sha256sum] = "ddaa01a212cd6d641401cb01b605f4a4d9f37bfc93043d7f760ec70fb99ff9ff"
+SRC_URI[md5sum] = "61ef1117f945486472850819b8d1eb3d"
+SRC_URI[sha256sum] = "f84be1bb0040caca4cea721fcbbbbd61f9be9464ca236387158b0feea01914a4"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-textutils \
diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.9.6.bb b/meta-python/recipes-devtools/python/python-jinja2_2.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jinja2_2.9.6.bb
rename to meta-python/recipes-devtools/python/python-jinja2_2.10.bb
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.9.6.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jinja2_2.9.6.bb
rename to meta-python/recipes-devtools/python/python3-jinja2_2.10.bb
-- 
2.7.4


