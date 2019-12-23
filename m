Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 026546C108
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 22:58:55 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id n9so1977985pff.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 14:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mQsNWrx+UP+30BOrlPwlFJpnomreZoa+Q7E9yMugCeM=;
	b=dNBizpXoYXtano3yrssfaN0CsjzzIIhE2wEZDhMy9iTsL2t/gini3d6G2cb4EmvzAR
	a6hV28ZhcT80PQI99aCk8my9thWtfr1Bw02ncpv+lmStah9JgrbwtNRWP71wXTGkN9QN
	KeN+MBu5xgwJInyO1cBYdQ73wgyakHWbgwTsSwRjvTR3QgSGm44Q9kxX8J8ag4ork7/P
	KgiBWEncbRHnEwsBskE5d7r5n7jsh7NE6g4RgGlgxRjf/ntUK0Ve0aL7zlSKPc1Apsic
	Gbn+rISkOQIpmQjZmONw5Yksoc7+EKOKe+QHSOou+enUCqMJuXjNzSUCG4RSxeSMTBKT
	D4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mQsNWrx+UP+30BOrlPwlFJpnomreZoa+Q7E9yMugCeM=;
	b=Vqgd17xx/pJBUvGx5FdFkxdPJdeuYi49M7DSfnowEwyc+5quytsiiLtJvK7B1ZbN+f
	Bxya9WUGXXFwoZdMP8z0A0uRD4CMeXhO5RihDlUYrImRZhBw82+topKNw0AsecPhNuOQ
	REA5o5CbL2SIzqvTdTLK8qa8C+OxW2Tn/0KPWtv4gZjQNmJX0VDdou9PHgAoq3HlBnC3
	A2EkRSU+FWcaVL1ix0mKbtSYrMPZBX8/vtmfOgYiQ0ajjvfiYfVm376nnOo2GETG5e9h
	COBwpgi/OyKpR7uz+4f1bLy2mc6o0S6pCZD7gtRvWjDN5V/IcB39kAxqKbaFbgV/0i61
	Z/8Q==
X-Gm-Message-State: APjAAAX326n7TlCYiKqeCmQJcplo+nKQoEhFZIt/oTAbVqynwcY4ZtAp
	hw6aOZaFAtI2JiT9e7StxFpBEdFq4TA=
X-Google-Smtp-Source: APXvYqzAAu7olnoGDsACrNvcsKylPDTmIpfID3b93ChoEP/z7uX8N+6LvxfAuISh3F8XL6H0CXvDFw==
X-Received: by 2002:a65:6842:: with SMTP id q2mr34825449pgt.345.1577141936567; 
	Mon, 23 Dec 2019 14:58:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id c2sm526448pjq.27.2019.12.23.14.58.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Dec 2019 14:58:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Dec 2019 14:58:43 -0800
Message-Id: <20191223225846.2277629-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/4] pam-plugin-ldapdb: Include <stdexcept> for std::invalid_argument
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
X-List-Received-Date: Mon, 23 Dec 2019 22:58:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-stdexcept-for-std-invalid_argument.patch | 25 +++++++++++++++++++
 .../pam/pam-plugin-ldapdb_1.3.bb              |  4 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-include-stdexcept-for-std-invalid_argument.patch

diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-include-stdexcept-for-std-invalid_argument.patch b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-include-stdexcept-for-std-invalid_argument.patch
new file mode 100644
index 0000000000..0a93411533
--- /dev/null
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-include-stdexcept-for-std-invalid_argument.patch
@@ -0,0 +1,25 @@
+From 3e97c9004f4ec58ca3696ee6298f91e6eeb76e04 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Dec 2019 14:46:25 -0800
+Subject: [PATCH] include <stdexcept> for std::invalid_argument
+
+Upstream-Status: Submitted [https://github.com/rmbreak/pam_ldapdb/pull/11]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pam_ldapdb.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pam_ldapdb.cpp b/pam_ldapdb.cpp
+index 9baf1e6..be5d85c 100644
+--- a/pam_ldapdb.cpp
++++ b/pam_ldapdb.cpp
+@@ -1,5 +1,6 @@
+ #include <map>
+ #include <string>
++#include <stdexcept>
+ #include <utility>
+ #include <syslog.h>
+ #include <pwd.h>
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
index 6864cc3174..626b22fe48 100644
--- a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
@@ -11,7 +11,9 @@ inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
 SRCREV = "84d7b260f1ae6857ae36e014c9a5968e8aa1cbe8"
-SRC_URI = "git://github.com/rmbreak/pam_ldapdb"
+SRC_URI = "git://github.com/rmbreak/pam_ldapdb \
+           file://0001-include-stdexcept-for-std-invalid_argument.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.24.1


