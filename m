Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QEfMO-0002BH-Hu
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 12:19:12 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p3QAGdD0021322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 26 Apr 2011 12:16:40 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Tue, 26 Apr 2011 12:16:39 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2011 12:16:32 +0200
Message-Id: <1303812993-6107-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.4.4
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 1/2] bitbake.conf: use HOST_CC_ARCH in CPP
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
X-List-Received-Date: Tue, 26 Apr 2011 10:19:12 -0000

Using plain 'gcc -E' for CPP is wrong because some macros are defined
only for certain ${HOST_CC_ARCH} flags.  Checks using ${CPP} might
return wrong results hence.

Omitting ${HOST_CC_ARCH} from 'gcc -E' can also break builds for
compilers configured e.g. for '-mcpu=cortex-m3'.  Such gccs require
'-mthumb'; even when invoked with '-E':

| $ arm-linux-uclibceabi-gcc -E - < /dev/null
| # 1 "<stdin>"
| <stdin>:1:0: error: target CPU does not support ARM mode
| $

| $ arm-linux-uclibceabi-gcc -mthumb -E - < /dev/null
| # 1 "<stdin>"
| # 1 "<built-in>"
| # 1 "<command-line>"
| # 1 "<stdin>"
| $

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 17a494d..5fb90e2 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -473,7 +473,7 @@ TOOLCHAIN_SYSPATH ?= "${TOOLCHAIN_PATH}/${TARGET_SYS}"
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS}"
+export CPP = "${HOST_PREFIX}gcc -E ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS}"
 export CCLD = "${CC}"
 export AR = "${HOST_PREFIX}ar"
@@ -488,7 +488,7 @@ PYTHON = "${@sys.executable}"
 export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
 export BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
 export BUILD_F77 = "${CCACHE}${BUILD_PREFIX}g77 ${BUILD_CC_ARCH}"
-export BUILD_CPP = "${BUILD_PREFIX}cpp"
+export BUILD_CPP = "${BUILD_PREFIX}cpp ${BUILD_CC_ARCH}"
 export BUILD_LD = "${BUILD_PREFIX}ld"
 export BUILD_CCLD = "${BUILD_PREFIX}gcc"
 export BUILD_AR = "${BUILD_PREFIX}ar"
-- 
1.7.4.4



