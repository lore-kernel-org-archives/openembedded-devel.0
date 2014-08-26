Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E89C6AC6B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Aug 2014 02:07:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7Q27ULl020978
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 19:07:31 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 25 Aug 2014 19:07:30 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Aug 2014 10:07:28 +0800
Message-ID: <1409018848-4649-1-git-send-email-xiao.zhang@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] beecrypt: add config option --with-dev-dsp
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
X-List-Received-Date: Tue, 26 Aug 2014 02:07:33 -0000
Content-Type: text/plain

Add this configure option for developer to control if the
/dev/dsp should be used on target. Instead of judging it
based on the very device file of build server.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 .../beecrypt/beecrypt/add-option-dev-dsp.patch     | 34 ++++++++++++++++++++++
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch

diff --git a/meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch b/meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch
new file mode 100644
index 0000000..83b6f7a
--- /dev/null
+++ b/meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Pending
+
+---
+ configure.ac |   12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -106,6 +106,16 @@ AC_ARG_WITH(python,[  --with-python[[=AR
+   fi
+   ])
+ 
++AC_ARG_WITH(dev-dsp,[  --with-dev-dsp          enables dev/dsp for entropy producing. auto for auto-detecting dev/dep on host. [[default=no]]],[
++  if test "$withval" = yes; then
++    AC_DEFINE([HAVE_DEV_DSP], 1)
++  else
++    if test "$withval" = auto;  then
++      ac_detect_dev_dsp=yes
++    fi
++  fi
++  ],[ac_detect_dev_dsp=no])
++
+ # Check for expert mode
+ if test "$ac_enable_expert_mode" = yes; then
+   BEE_EXPERT_MODE
+@@ -464,7 +474,7 @@ linux*)
+       ac_cv_have_dev_dsp=no
+     fi
+     ])
+-  if test "$ac_cv_have_dev_dsp" = yes; then
++  if test "$ac_cv_have_dev_dsp" = yes && test "$ac_detect_dev_dsp" = yes; then
+     AC_DEFINE([HAVE_DEV_DSP], 1)
+   fi
+   ;;
diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index 209b92e..1e626f1 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/beecrypt/beecrypt-${PV}.tar.gz \
            file://fix-for-gcc-4.7.patch \
            file://run-ptest \
            file://beecrypt-enable-ptest-support.patch \
+           file://add-option-dev-dsp.patch \
           "
 
 SRC_URI[md5sum] = "8441c014170823f2dff97e33df55af1e"
-- 
1.8.5.2.233.g932f7e4


