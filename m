Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3EEB978835
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 18:25:47 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d125so432516qkc.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 10:25:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Hsp7kvfgh2mYZulIRCLEImA08r/F8z0Vd7oZ1FdvQhY=;
	b=gNGWxgC2/CZFfF/Bko90Oi/jsrdyG3VUDvMQ5wwsxXJOeE9rVJf/hH06+Av/qU0NDh
	LjeQcri2OB6nkwAJPiptKq1BpcMUF+vZjYt4qNfg2+X54Ik2uR5krNlbNXtod0hW68wF
	PkxHSGYhJV2uPHs1ujF5v72fYRuy6pk9HNDxgc0Z05PzsIB7NfpUjMlj0luaGuatDT4z
	TNW+FwFTY/vE/ELleaXMobT/wtNLD4KzYFM2zhvFjX/LLawTiovoV/bgbLd4UL5YiH74
	1JR0UFL/jn6oF5+prdj9Zm2l8Q4Zl0gqdGjG/KedtMesjX5ueLbPMUmOZtKzJ0SZMuST
	IXCA==
X-Gm-Message-State: AJaThX6nr6AU/oUtDwZh5aUHahOK/pXnTtBWgq8NsEjUm6UKcFIqShsV
	eyCrAfJNRvU1ejuGbTFmAqoMDwRx
X-Google-Smtp-Source: AGs4zMbFjX39tt6WmXzFnPTj7htYR49pQZehBSDzfvpjp7MdNfhawIDrG1/nvrWMwVERKixWdc7g5A==
X-Received: by 10.55.16.86 with SMTP id a83mr9362402qkh.222.1510943148218;
	Fri, 17 Nov 2017 10:25:48 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	f126sm2804124qkd.20.2017.11.17.10.25.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Nov 2017 10:25:47 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Nov 2017 13:25:40 -0500
Message-Id: <1510943141-24038-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-grpcio: update to version 1.7.0
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
X-List-Received-Date: Fri, 17 Nov 2017 18:25:47 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-grpcio_1.6.3.bb => python-grpcio_1.7.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-grpcio_1.6.3.bb => python-grpcio_1.7.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.6.3.bb b/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python-grpcio_1.6.3.bb
rename to meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
index 203bb36..3ca7d53 100644
--- a/meta-python/recipes-devtools/python/python-grpcio_1.6.3.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "6637c4dfee8166f69be7571591b6c57c"
-SRC_URI[sha256sum] = "e9662782c58bc21be26163b78136eaed091dfd45fac699cb711ee9eeeb7e2f9b"
+SRC_URI[md5sum] = "b564632793132fd35cdff984d6b309b0"
+SRC_URI[sha256sum] = "6662af1f07cf7a3d171a7f56afc2cfeff262a5f2c52d15ae5ea581d0c367aea8"
 
 # For usage in other recipes when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4


