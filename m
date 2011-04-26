Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QEfMR-0002BP-7m
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 12:19:15 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p3QAGh6Z021335
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 26 Apr 2011 12:16:44 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Tue, 26 Apr 2011 12:16:43 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2011 12:16:33 +0200
Message-Id: <1303812993-6107-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1303812993-6107-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1303812993-6107-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 2/2] *native.bbclass: use HOST_CC_ARCH in CPP
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
X-List-Received-Date: Tue, 26 Apr 2011 10:19:15 -0000

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
 classes/canadian-native.bbclass |    2 +-
 classes/native.bbclass          |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/canadian-native.bbclass b/classes/canadian-native.bbclass
index 3cd003c..50ecc11 100644
--- a/classes/canadian-native.bbclass
+++ b/classes/canadian-native.bbclass
@@ -37,7 +37,7 @@ LDFLAGS = "${SDK_LDFLAGS}"
 export CC = "${CCACHE}${SDK_PREFIX}gcc ${HOST_CC_ARCH}"
 export CXX = "${CCACHE}${SDK_PREFIX}g++ ${HOST_CC_ARCH}"
 export F77 = "${CCACHE}${SDK_PREFIX}g77 ${HOST_CC_ARCH}"
-export CPP = "${SDK_PREFIX}gcc -E"
+export CPP = "${SDK_PREFIX}gcc -E ${HOST_CC_ARCH}"
 export LD = "${SDK_PREFIX}ld"
 #export CCLD = "${CC}"
 export AR = "${SDK_PREFIX}ar"
diff --git a/classes/native.bbclass b/classes/native.bbclass
index 1e7a6ec..0f65792 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -54,7 +54,7 @@ export CONFIG_SITE = ""
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}"
 export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}"
-export CPP = "${HOST_PREFIX}gcc -E"
+export CPP = "${HOST_PREFIX}gcc -E ${HOST_CC_ARCH}"
 export LD = "${HOST_PREFIX}ld"
 export CCLD = "${CC}"
 export AR = "${HOST_PREFIX}ar"
-- 
1.7.4.4



