Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id A9C8479807
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 07:11:39 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id f6-v6so7550827plo.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Sep 2018 00:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CQmt2vpinaVyVSXuQW5pYO+AU7lvYJg8+XiSerDoMb8=;
	b=EsAlYPuHIPcTmOL93YHseoUOwrG02CHHzL3oK/Qj7e73KwHvie+Cz80cS4hwgf/Zwy
	YienpKUtHTZzx8iPLdwpHTwtdeXEwvIGSn8AkBateKbAjnB++YYbsEnvlclfYkNGEuKS
	j9cl+aIK3aWJu2KRUQQejJISTBhlOOCH5jMT5+PXzcdgWTi3bx9XXHVaKBq67VWzyFUi
	AcZwTvWL7ys33kTlSe2WGvGWAc+psoua8ZLgThvduIwB80+UxWPmzVOmCkcafD5N//Bq
	hSR93BEDsaJQdcYAIRkfneTV75VYSsU2ll3ofNnYrTNTqanN9oGJbG2rsGodyDg+a5Ym
	OrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CQmt2vpinaVyVSXuQW5pYO+AU7lvYJg8+XiSerDoMb8=;
	b=qOP2mcmtZsgYWmh3nM9an+79eonaJKRI8e6T9pyaXuokx3a9hhOOsSrSDTkjPcKwU9
	iGLxP9DGrj0Ilz23g1d3iImjH0SWIVSF5i2eRzCUn164172uRPgUTxiReCuTRJiy4ABL
	JH/HY08rpahEwWnNUFmQeS9NrdnIZuaGwo3ZNDbcBQ4hPK60eS8QJkFlwqxpsaNcZg8r
	VMAp7N/uaVIq/VWBZJyWr5dv49BhwKjeitNOb3A5bkelDYYy8ZgKwVrh+2ec5QF+ANZh
	p9QL6e2+uWL5Xt8x9j95Kh2pYAKX0H2jwoVwBjZB2GCU67rNaBMwnHdMZFpk9l/NqjUg
	lwDg==
X-Gm-Message-State: APzg51BuKgaH+7lDtC5p70u1u/v+0Z/+w/y2E3rvpZMpZck+veB0qirp
	IB+WcftSXApYrQ9+0hmIi5JeUFOT
X-Google-Smtp-Source: ANB0VdYI7PM3OoV/CFK33BGj52ckPbW6dE5QUdtsUy2sZpVWen6mEHy23UYfjwrL2oyXeeJZWOddEg==
X-Received: by 2002:a17:902:5a3:: with SMTP id
	f32-v6mr11836345plf.286.1536390698306; 
	Sat, 08 Sep 2018 00:11:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	a15-v6sm18702212pfe.32.2018.09.08.00.11.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Sep 2018 00:11:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Sep 2018 00:11:24 -0700
Message-Id: <20180908071125.28282-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180908071125.28282-1-raj.khem@gmail.com>
References: <20180908071125.28282-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] umip: Fetch from git.umip.org
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
X-List-Received-Date: Sat, 08 Sep 2018 07:11:39 -0000

* Adjust patches
* Depend on openssl10
* remove spurious dep on rpm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...with-SIGCHLD-and-include-sys-types.h.patch | 21 +++++--------------
 meta-oe/recipes-connectivity/umip/umip_1.0.bb |  6 +++---
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch b/meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
index 8192056d13..153bced396 100644
--- a/meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
+++ b/meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
@@ -20,19 +20,11 @@ Upstream-Status: Pending
  src/main.c | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
-diff --git a/src/main.c b/src/main.c
-index 3cf4072..cd34196 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -31,6 +31,7 @@
- #include <sys/ioctl.h>
- #include <sys/wait.h>
- #include <sys/param.h>
-+#include <sys/types.h>
- #include <pthread.h>
- #include <fcntl.h>
- #include <unistd.h>
-@@ -126,9 +127,9 @@ static void daemon_start(int ignsigcld)
+Index: git/src/main.c
+===================================================================
+--- git.orig/src/main.c
++++ git/src/main.c
+@@ -133,9 +133,9 @@ static void daemon_start(int ignsigcld)
  
  	if (ignsigcld) {
  #ifdef SIGTSTP
@@ -44,6 +36,3 @@ index 3cf4072..cd34196 100644
  #endif
  	}
  }
--- 
-2.16.2
-
diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index 8db252d237..cee44f6c76 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -7,9 +7,9 @@ HOMEPAGE = "http://umip.org/"
 SECTION = "System Environment/Base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=073dc31ccb2ebed70db54f1e8aeb4c33"
-DEPENDS = "rpm indent-native bison-native"
+DEPENDS = "openssl10 ipsec-tools radvd indent-native bison-native"
 
-SRC_URI = "git://github.com/jlanza/umip \
+SRC_URI = "git://git.umip.org/umip/umip.git \
            file://add-dependency-to-support-parallel-compilation.patch \
            file://mip6d \
            file://mip6d.service \
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/jlanza/umip \
            file://0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch \
            file://0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch \
            "
-SRCREV = "7d67209cd1bba2dd0e183a0fa07eeef07964dd14"
+SRCREV = "cbd441c5db719db554ff2b4fcb02fef88ae2f791"
 
 S = "${WORKDIR}/git"
 
-- 
2.18.0


