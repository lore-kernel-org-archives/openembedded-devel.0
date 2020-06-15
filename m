Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.10769.1592195331918092033
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2020 21:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ScvaqsUJ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 2B60420B4780; Sun, 14 Jun 2020 21:28:51 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2B60420B4780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1592195331;
	bh=EBwhpbuQP1EUqfRQXnN1WrZlH8SFA2AH2Zxo/Lj/zTA=;
	h=From:To:Subject:Date:From;
	b=ScvaqsUJn0eovQ8w0bt4+rBt02h1JGFuunDnabQlxgKOfmbZ3lnZCdGYUzTal7e8e
	 Oe6nKS5+9RZmN+wTxdx81XbtKLyx7hTNKFN58kXlt+V5bA+CBRYyMFjYYtbf4P/L89
	 mWKAhMi4Iycaz9ZkpEPg1UM5kwuEWGDd8/v035qY=
From: paul.eggleton@linux.microsoft.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] protobuf-c: disable parallelism to avoid race condition
Date: Sun, 14 Jun 2020 21:28:45 -0700
Message-Id: <1592195325-52107-1-git-send-email-paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

Unfortunately 489d3b4b932ee8016d792341f8ea5836a9522cd4 did not completely
fix the problem - if you try cleaning and rebuilding protobuf-c-native it
doesn't take long to reproduce the issue on a 32-core machine. I spent
some time trying to debug this but failed, there is still a race between
generating t.test-full.pb.h and compiling cxx_generate_packed_data.c
despite BUILT_SOURCES and explicit dependencies. I even tried converting
the multiple target rules to use grouped targets (&:), that didn't fix it
either. Disabling parallelism as a workaround only costs ~20s and it
turns out that upstream is switching to Meson soon anyway:

  https://github.com/protobuf-c/protobuf-c/pull/340

Signed-off-by: Paul Eggleton <paul.eggleton@linux.microsoft.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
index bb8aecd..6fef0be 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
@@ -22,6 +22,11 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
+# After several fix attempts there is still a race between generating
+# t.test-full.pb.h and compiling cxx_generate_packed_data.c despite
+# BUILT_SOURCES and explicit dependencies.
+PARALLEL_MAKE = ""
+
 PACKAGE_BEFORE_PN = "${PN}-compiler"
 
 FILES_${PN}-compiler = "${bindir}"
-- 
1.8.3.1

