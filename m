Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0B564701F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 07:28:54 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id fp1so13086572pdb.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sA3GmAUFmgPk1+JcNCsn237Llyiav8CnxbCsuvS3jfI=;
	b=zQQH7tElsefOP42jMKCpVGFzywUo4LK+8ruKJf+XA10kId5VKUxDRakUu4pFDQVmL5
	6iS6l+ujgprLH1D+vfaRnaB8zBNd9hIlkZREzVBuc8H6JI9P/Ci2rU4aE7bGUD0EaMHV
	sy+b05Ec0cvRwNt93N+T3o691tNu3wMxKx2VGNj/qpRvT8o1eAFC/R67sRy1Q78p5bl+
	0aPb5iIGtybacXoBlRWVIzb3CpHNtcujmJgb8oCW+tEfaVrcKKoPrwWLcjk3CNJsBr6P
	fIdIBwTTGSpm0b2cCtLs4u5pt1eG3Oq5F4e8tiHIjsfpQUQLI2YtkVHbTglqs4wrVAqQ
	dJ8Q==
X-Received: by 10.70.41.136 with SMTP id f8mr5726953pdl.46.1409815734282;
	Thu, 04 Sep 2014 00:28:54 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id pn13sm845213pdb.53.2014.09.04.00.28.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Sep 2014 00:28:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Sep 2014 00:32:33 -0700
Message-Id: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-networking][PATCH 1/6] ipsec-tools: Fix build with glibc 2.20
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
X-List-Received-Date: Thu, 04 Sep 2014 07:28:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ipsec-tools/ipsec-tools/glibc-2.20.patch       | 23 ++++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb               |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/glibc-2.20.patch

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/glibc-2.20.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/glibc-2.20.patch
new file mode 100644
index 0000000..36efc49
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/glibc-2.20.patch
@@ -0,0 +1,23 @@
+squahes below warning
+  warning: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
+
+Seen with glibc 2.20
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: ipsec-tools-0.8.2/src/include-glibc/glibc-bugs.h
+===================================================================
+--- ipsec-tools-0.8.2.orig/src/include-glibc/glibc-bugs.h	2006-09-09 09:22:08.000000000 -0700
++++ ipsec-tools-0.8.2/src/include-glibc/glibc-bugs.h	2014-09-03 22:27:22.551563888 -0700
+@@ -4,7 +4,11 @@
+ #define __GLIBC_BUGS_H__ 1
+ 
+ #define _XOPEN_SOURCE 500
++/* Legacy feature macro.*/
+ #define _BSD_SOURCE
++/* New feature macro that provides everything _BSD_SOURCE and
++ * _SVID_SOURCE provided and possibly more.  */
++#define _DEFAULT_SOURCE
+ 
+ #include <features.h>
+ #include <sys/types.h>
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index 208268f..babce40 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV
            file://0001-racoon-pfkey-avoid-potential-null-pointer-dereferenc.patch \
            file://racoon-check-invalid-pointers.patch \
            file://racoon-check-invalid-ivm.patch \
+           file://glibc-2.20.patch \
           "
 SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
 SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
-- 
2.1.0


