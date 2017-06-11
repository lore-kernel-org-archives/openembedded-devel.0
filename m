Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 495D7780A8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 13:02:12 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v104so16365724wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=w/O5UsMAD4OXGxcyYTRCeN4vFMLzfhhvYLDscNjACGg=;
	b=PrX5QK3kczoYBvPRIeg0yTUFytUml23RactjvC6HV8IPwPoQP+h55i2e7NFbX4zW7v
	iL8kr0w0Jaa7mUzgEDhVGo28RseOhlZgwfbl3D6wyiJX1LeBcMo0KuZ9LFkimyrQfgI2
	VD45cDtc+oHTaBdr9oJwKwz2lh+3JQHbQGrkZKgTppkfhnWCCxLTEzM37dh0SyBev+JO
	2Toj7NCvqFizwjPffL/COUUo+xkwMHmqSg6aWeP8pSNPvuY1OGviVTGKW2A0YVlM43LJ
	fcdEuSRcPeolmqfj5dTTHDbUsqcg0QQ+y6V4VxeKcqvlH4P6TsyQbSxhzc4u+89hSVf/
	r+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w/O5UsMAD4OXGxcyYTRCeN4vFMLzfhhvYLDscNjACGg=;
	b=uPhgzUrZA3yiT762039NfAVhApDEiFgnO/zdGTC258QvbDt1aLQvPpSVFr4FbYNsAt
	oM4nQn5vF6OkfBc6qlPNxmavvnlCcZO2A5oJfjzIuZcM8cG3lTcD4CJVZlrbTMyZcE7G
	MRKkzbmG/K2c18nWvlYWHwAaW52qfxfWjd92KRk1ActqxUPFd8C3HYnAWCgRTfIfZZoL
	Gt4M62GJXHbDX2VcU9Mu11I73AjHlM/DlzqV6+iHplfhY+f/iUCGRH8wWXSjvf5ngipR
	kMIiRxw2HBgBILYxkGwBZbXA7vvbMgRBfyqEvCjJFVfFdZsZZcSwibMAgltmoaXmoz/Z
	ebmA==
X-Gm-Message-State: AODbwcA5EPLZsZ8IXoHJYdNK+4UowCF6Go8a6CBpsr3aGT4vNb9qe0oX
	cT9GoMOitEVWstP59/o=
X-Received: by 10.80.175.34 with SMTP id g31mr38994751edd.24.1497186132977;
	Sun, 11 Jun 2017 06:02:12 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.206.46])
	by smtp.gmail.com with ESMTPSA id g48sm4352718edc.9.2017.06.11.06.02.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 06:02:12 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jun 2017 15:01:50 +0200
Message-Id: <1497186110-4460-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH V2] librcf: fix a clang compiling issue
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
X-List-Received-Date: Sun, 11 Jun 2017 13:02:16 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A error was observed with clang compiler, as follows:
| src/RCF/RCF.cpp:49:
| src/RCF/ClientStub.cpp:28:
| include/RCF/Future.hpp:49:26: error: 'enrol' is a private member of 'RCF::ClientStub'

it can be fixed by declaring Future as a friend class of ClientStub.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 ...lientStub.hpp-fix-a-clang-compiling-issue.patch | 35 ++++++++++++++++++++++
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch

diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
new file mode 100644
index 0000000..e949dee
--- /dev/null
+++ b/meta-oe/recipes-devtools/librcf/librcf/0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
@@ -0,0 +1,35 @@
+From d78851b6f87f2472f041102d7b3726ffc009bfad Mon Sep 17 00:00:00 2001
+From: Ming Liu <peter.x.liu@external.atlascopco.com>
+Date: Tue, 6 Jun 2017 05:54:20 +0200
+Subject: [PATCH] ClientStub.hpp: fix a clang compiling issue
+
+A error was observed with clang compiler, as follows:
+| src/RCF/RCF.cpp:49:
+| src/RCF/ClientStub.cpp:28:
+| include/RCF/Future.hpp:49:26: error: 'enrol' is a private member of 'RCF::ClientStub'
+
+it can be fixed by declaring Future as a friend class of ClientStub.
+
+Upstream-Status: Pending
+
+Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+---
+ include/RCF/ClientStub.hpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/RCF/ClientStub.hpp b/include/RCF/ClientStub.hpp
+index 9882cf4..8465625 100755
+--- a/include/RCF/ClientStub.hpp
++++ b/include/RCF/ClientStub.hpp
+@@ -372,6 +372,8 @@ namespace RCF {
+ 
+     private:
+ 
++        template<typename U>
++        friend class Future;
+         friend class FutureImplBase;
+ 
+         template<
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index cf0a8e7..4c9683a 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=7586a312b9e978f9d6fac9a5780d1f84"
 SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
            file://0001-Add-CMake-build-files.patch \
            file://aarch64-support.patch \
+           file://0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch \
           "
 
 SRC_URI[md5sum] = "7ecb3c73f7eb66dba8790b659374f690"
-- 
2.7.4


