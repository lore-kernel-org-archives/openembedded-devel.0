Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2k3I-0004a9-R0
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 14:58:45 +0100
Received: by ghbz2 with SMTP id z2so1635094ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Feb 2012 05:50:16 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.157.10 as permitted sender) client-ip=10.236.157.10; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.157.10 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.157.10])
	by 10.236.157.10 with SMTP id n10mr595421yhk.41.1330523416035 (num_hops
	= 1); Wed, 29 Feb 2012 05:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=+23DGPgAgegANr+9lqCNg5l754FSg4iOe2K+sJ5t09M=;
	b=NhjTNZ2Qpbc3v+fREra32+drDbueZRRZeQFgpbD6aS7G/oWmCQ6MadEe3FU2pG/Z0Y
	GxCOmDxN8bmW1khNGXeInC3OR7JKrkDBGbtXW8A5N5o6bJFAoP8dKEhhOpir9fIQh7sE
	YGMpV6wrD1YRB+zB0HedILJKJYp0XVsePpCIY=
Received: by 10.236.157.10 with SMTP id n10mr469071yhk.41.1330523415967;
	Wed, 29 Feb 2012 05:50:15 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id f40sm34442349ani.16.2012.02.29.05.50.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Feb 2012 05:50:15 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Feb 2012 13:50:07 +0000
Message-Id: <f02b204f1c714d7aa3b83ca0aed94f42694089b4.1330523387.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330523387.git.otavio@ossystems.com.br>
References: <cover.1330523387.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/1] More quotting fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Feb 2012 13:58:45 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-connectivity/gnuradio/gnuradio.inc |    2 +-
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc    |    2 +-
 meta-oe/recipes-support/opencv/opencv_2.3.bb       |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio.inc b/meta-oe/recipes-connectivity/gnuradio/gnuradio.inc
index 80ac407..144d588 100644
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio.inc
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio.inc
@@ -10,7 +10,7 @@ INC_PR = "r1"
 inherit distutils-base autotools pkgconfig
 
 export BUILD_SYS
-export HOST_SYS=${MULTIMACH_TARGET_SYS}
+export HOST_SYS="${MULTIMACH_TARGET_SYS}"
 
 EXTRA_OECONF = " \
   --program-prefix= \
diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
index 44de2a2..865deb2 100644
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
+++ b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
@@ -28,7 +28,7 @@ INITSCRIPT_PACKAGES = "${PN}-server"
 INITSCRIPT_NAME = "mysqld"
 INITSCRIPT_PARAMS = "start 45 S . stop 45 0 6 1 ."
 
-export ac_cv_path_PS=/bin/ps
+export ac_cv_path_PS="/bin/ps"
 export ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null"
 PARALLEL_MAKE = " "
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
diff --git a/meta-oe/recipes-support/opencv/opencv_2.3.bb b/meta-oe/recipes-support/opencv/opencv_2.3.bb
index 1a4bb4f..fdb56a9 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.3.bb
@@ -31,7 +31,7 @@ inherit distutils-base pkgconfig cmake
 export BUILD_SYS
 export HOST_SYS
 export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
-export PYTHON=${STAGING_BINDIR_NATIVE}/python
+export PYTHON="${STAGING_BINDIR_NATIVE}/python"
 
 TARGET_CC_ARCH += "-I${S}/include "
 
-- 
1.7.2.5



