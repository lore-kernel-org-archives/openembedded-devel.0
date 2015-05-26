Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9C31F7322D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 08:19:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4Q8JtMn014367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 01:19:55 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 26 May 2015 01:19:55 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 May 2015 16:19:49 +0800
Message-ID: <d2edf783e8efc2373cd2c398bb89db7b5e39bfea.1432628160.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432628160.git.yi.zhao@windriver.com>
References: <cover.1432628160.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 1/2] smstools: fix makefile override
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
X-List-Received-Date: Tue, 26 May 2015 08:19:55 -0000
Content-Type: text/plain

Fix syntax error in src/Makefile, override in wrong place.
The patch is backport from debian.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../smstools3/fix-makefile-override.patch          |   24 ++++++++++++++++++++
 .../smstools3/smstools3_3.1.15.bb                  |    3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch

diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch
new file mode 100644
index 0000000..f0a1d33
--- /dev/null
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch
@@ -0,0 +1,24 @@
+Upstream-Status: Backport [debian]
+
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -37,16 +37,15 @@
+ # Use the following only on GNU/Linux and only if you need ps listing like "smsd: MAINPROCESS" and "smsd: GSM1"
+ # CFLAGS += -D USE_LINUX_PS_TRICK
+ 
+-all: smsd 
+-
+-smsd: smsd.c extras.o locking.o cfgfile.o logging.o alarm.o smsd_cfg.o charset.o stats.o blacklist.o whitelist.o modeminit.o pdu.o
+-
+ ifneq (,$(findstring SOLARIS,$(CFLAGS)))
+ ifeq (,$(findstring DISABLE_INET_SOCKET,$(CFLAGS)))
+ override LFLAGS += -lsocket -lnsl
+ endif
+ endif
+ 
++all: smsd 
++
++smsd: smsd.c extras.o locking.o cfgfile.o logging.o alarm.o smsd_cfg.o charset.o stats.o blacklist.o whitelist.o modeminit.o pdu.o
+ ifneq (,$(findstring NOSTATS,$(CFLAGS)))
+ 	$(CC) $(CFLAGS) -o $@ $^ $(LFLAGS)
+ else 
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
index c4b6b60..95adecd 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4d21efa1bb2a186360dde4035f860682"
 HOMEPAGE = "http://smstools3.kekekasvi.com"
 
 SRC_URI = "http://smstools3.kekekasvi.com/packages/${BP}.tar.gz \
-           file://sms_binpath_and_psops.patch"
+           file://sms_binpath_and_psops.patch \
+           file://fix-makefile-override.patch"
 
 SRC_URI[md5sum] = "0241ef60e646fac1a06254a848e61ed7"
 SRC_URI[sha256sum] = "ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea02f5bf05234814d59"
-- 
1.7.9.5


