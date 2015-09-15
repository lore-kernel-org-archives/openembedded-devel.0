Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5F76E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 21:53:43 +0000 (UTC)
Received: by qgev79 with SMTP id v79so155795341qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 14:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=RZ0XX3xGvMZoCrOb4g4AFzIjP8oQSsseiI4VL5UyOnM=;
	b=hMIid97ZLkqA6TDZjx2jphON8XAfXnwNOT8fnUQvsMUox1w9Do1eQmwaPbwsUBDJ8/
	DrE5nmXXKF2dIXKkhOGtKEgXrUrcju2Rg2LNU9iCobtKCkrXECd29IZJn27T2cgqjoCV
	x7gGiWLw1kqkY2RkOh8NGkpiU0ayYohS//308K8tgnLgatxJcrinBqUkL4o7NQJS423N
	QVhJ4hdCHfb3HvYTZIROF+bS3tSR6VQTZHvrdxnrtQoXpKbqDlazjCeIyoCOB0HP0Pxz
	teFHhyMnQ9zEKhTRg6MmbG6gJGwadvy/y38vwgiqdltT+b//gVlJOJr27XBeNwLMiCIh
	Bkgw==
X-Received: by 10.140.201.79 with SMTP id w76mr37760626qha.82.1442354023750;
	Tue, 15 Sep 2015 14:53:43 -0700 (PDT)
Received: from localhost ([177.194.193.199])
	by smtp.gmail.com with ESMTPSA id 68sm8707689qhc.49.2015.09.15.14.53.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 14:53:42 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 15 Sep 2015 18:53:37 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Sep 2015 18:53:34 -0300
Message-Id: <1442354014-13593-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.5.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] tiobench: Fix build using GCC 5.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2015 21:53:45 -0000

Drop 'inline' of crc32 function to fix build using GCC 5.2

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...-of-crc32-function-to-fix-build-using-GCC.patch | 30 ++++++++++++++++++++++
 .../recipes-benchmark/tiobench/tiobench_0.3.3.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch

diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch
new file mode 100644
index 0000000..5aebb95
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch
@@ -0,0 +1,30 @@
+From 5429ab90eb33eb243fa7b9cd247e0490d72b9da5 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Wed, 9 Sep 2015 15:04:45 +0000
+Subject: [PATCH] Drop 'inline' of crc32 function to fix build using GCC 5.2
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ crc32.h |   1 -
+ crc32.o | Bin 748 -> 2056 bytes
+ 2 files changed, 1 deletion(-)
+
+diff --git a/crc32.h b/crc32.h
+index 62b3433..8fc62b6 100644
+--- a/crc32.h
++++ b/crc32.h
+@@ -18,7 +18,6 @@
+ #ifndef CRC32_H
+ #define CRC32_H
+ 
+-inline 
+ unsigned long crc32( const void* const buffer, 
+ 		      unsigned long length, 
+ 		      unsigned long crc);
+
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
index 3267de2..35af35f 100644
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "\
     http://sourceforge.net/projects/tiobench/files/tiobench/${PV}/${BP}.tar.gz \
     file://tiobench-makefile.patch \
     file://avoid-glibc-clashes.patch \
+    file://0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch \
 "
 SRC_URI[md5sum] = "bf485bf820e693c79e6bd2a38702a128"
 SRC_URI[sha256sum] = "8ad011059a35ac70cdb5e3d3999ceee44a8e8e9078926844b0685b7ea9db2bcc"
-- 
2.5.2


