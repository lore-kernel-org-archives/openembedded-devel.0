Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1463970322
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 03:14:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7E3EiKB008313
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 20:14:45 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 13 Aug 2014 20:14:43 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Aug 2014 11:14:45 +0800
Message-ID: <1407986086-29096-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] ntp: Disable debugging by default
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
X-List-Received-Date: Thu, 14 Aug 2014 03:14:50 -0000
Content-Type: text/plain

From: Xufeng Zhang <xufeng.zhang@windriver.com>

There is a problem in configure.ac file that whether or not
'--enable-debugging' is specified in configure cmdline, debugging
is always enabled.
We should disable ntp debugging by default.

Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
---
 .../ntp/files/ntp-disable-debugging.patch          |   23 ++++++++++++++++++++
 meta-networking/recipes-support/ntp/ntp.inc        |    1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch

diff --git a/meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch b/meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch
new file mode 100644
index 0000000..3c94d8d
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch
@@ -0,0 +1,23 @@
+set ntp_ok to no if ntp debugging is not enabled.
+
+Upstream-status: Pending
+
+There is a problem in configure.ac file that whether or not
+'--enable-debugging' is specified in configure cmdline, debugging
+is always enabled.
+We should disable ntp debugging by default.
+
+Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
+
+---
+--- a/configure.ac
++++ b/configure.ac
+@@ -2458,7 +2458,7 @@
+         [+ include ntpd debugging code]
+     )],
+     [ntp_ok=$enableval],
+-    [ntp_ok=yes]
++    [ntp_ok=no]
+ )
+ case "$ntp_ok" in
+  yes)
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 49f9901..2c8f488 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -23,6 +23,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://sntp.service \
            file://sntp \
            file://ntpd.list \
+           file://ntp-disable-debugging.patch \
 "
 
 inherit autotools update-rc.d useradd systemd
-- 
1.7.10.4


