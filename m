Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id C14247C3C0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:45:55 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id e17so7443337pgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/q5lP2G41A7dNijCL6uwTx9qkYA9uYJc6YdWsPYBylU=;
	b=ityU9McEx18lZMxn3ZUHHkT2fke1r5281aDGEDsj1RLbhuA47KhaDDykDDt7M3ib5u
	QZLNrthOFCDFR/aBrt6tsBZpmdn8E73dj/wngZ/z1NLsLjyOwyqLUC4WTJwMZT3f0yjJ
	Q7vKEpRJuGckgKxD5qDUEeNyR8QcqE4V/EXRreiXIVyBN55qDoNVkzj2epvrsTE4xi2H
	zP/0Ib8gwcKz3ql0fJ6e8jPQ+vU4YAsVlZ71otHqPOEaXclPacEVrZjQ5M6CNFq6y5rj
	mNeWIKZQfHbOt97OpT0lq29RHa0SMsbfXWwDOwkJDowK5ANAlZua7recpEVStWoO3IiQ
	BkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/q5lP2G41A7dNijCL6uwTx9qkYA9uYJc6YdWsPYBylU=;
	b=lGUxPyj4FF4XOaljx4vG37fT+4O//tkAe5l72zfG/AjkVWcBxoaqWZlL6jMO9vA8/X
	LpKexTEjBHL2Bn5O9w/ND/ceHgD/sufFDlsmVfAUu+cnDqM/7dX/RQyBbwJ4M6LDpCKZ
	68I5/7PE1B5jn9j+uqmMtYGQFa7lK8MlZ1ohy5enmYt11xdW7MBIkeNyk5VsAqSizjxD
	eXYWltjnUhx77t8xCEscPr2estq8/g3rgCwA3a50O+aKvbz1irw6a3+5+Cc2Psa9P1GD
	Ss3N3Onhx2xnemQyWNhR6XgNcKmZyfs0xwRBJmaVG+OiuYHVsBQcYg0URHmLO399cbGS
	aTBQ==
X-Gm-Message-State: APjAAAXYm9sLaKwsb88gZrF7921yaS8TaFbIkq08RWpzG/71PeslDqwb
	clVPKS9Cq5j0HWOvaYwA2O7mrI/M
X-Google-Smtp-Source: APXvYqwLyFvr7aUn0P8TUlBqT/sY5a9Z9vw1Lm5+IJGWKYhGfa7z4keZWmZLYl25EcCHH4CyuYFMEA==
X-Received: by 2002:a17:902:7e46:: with SMTP id
	a6mr5225704pln.150.1551851156482; 
	Tue, 05 Mar 2019 21:45:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m24sm1001144pgv.1.2019.03.05.21.45.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 21:45:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 21:45:39 -0800
Message-Id: <20190306054548.16430-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190306054548.16430-1-raj.khem@gmail.com>
References: <20190306054548.16430-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 03/12] msgpack-c: Upgrade to 3.1.1
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
X-List-Received-Date: Wed, 06 Mar 2019 05:45:55 -0000
Content-Transfer-Encoding: 8bit

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-Werror-class-memaccess.patch     | 35 -------------------
 ...{msgpack-c_2.1.5.bb => msgpack-c_3.1.1.bb} |  4 +--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Fix-Werror-class-memaccess.patch
 rename meta-oe/recipes-devtools/msgpack/{msgpack-c_2.1.5.bb => msgpack-c_3.1.1.bb} (84%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Fix-Werror-class-memaccess.patch b/meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Fix-Werror-class-memaccess.patch
deleted file mode 100644
index b0d772d937..0000000000
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c/0001-Fix-Werror-class-memaccess.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a05d92ae85024d0648f69f95307a1d3e8e51109c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 1 Apr 2018 19:55:38 -0700
-Subject: [PATCH] Fix -Werror=class-memaccess
-
-Casting to void* make gcc happy since its upset about
-object types and rightly so
-
-Fixes
-
-'void* memcpy(void*, const void*, size_t)' copying an object of non-trivial type 'struct msgpack::v2::object' from an array of 'const msgpack_object' {aka 'const struct msgpack_object'} [-Werror=class-memaccess]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://github.com/msgpack/msgpack-c/pull/659]
-
- include/msgpack/v1/object.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/msgpack/v1/object.hpp b/include/msgpack/v1/object.hpp
-index 64da8c53..9721f705 100644
---- a/include/msgpack/v1/object.hpp
-+++ b/include/msgpack/v1/object.hpp
-@@ -661,7 +661,7 @@ inline object::object(const msgpack_object& o)
- inline void operator<< (msgpack::object& o, const msgpack_object& v)
- {
-     // FIXME beter way?
--    std::memcpy(&o, &v, sizeof(v));
-+    std::memcpy(static_cast<void*>(&o), &v, sizeof(v));
- }
- 
- inline object::operator msgpack_object() const
--- 
-2.16.3
-
diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_3.1.1.bb
similarity index 84%
rename from meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-c_3.1.1.bb
index 690a7f444b..90fd44e607 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_3.1.1.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://github.com/msgpack/msgpack-c \
-           file://0001-Fix-Werror-class-memaccess.patch \
            "
-SRCREV = "208595b2620cf6260ce3d6d4cf8543f13b206449"
+# cpp-3.1.1
+SRCREV = "83a82e3eb512b18d4149cabb7eb43c7e8bc081af"
 
 S = "${WORKDIR}/git"
 
-- 
2.21.0


