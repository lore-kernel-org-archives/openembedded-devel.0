Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PmTPy-0002vJ-JY
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 16:54:22 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p17FrHHc025568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 7 Feb 2011 16:53:18 +0100
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Mon,  7 Feb 2011 16:53:17 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Feb 2011 16:53:05 +0100
Message-Id: <1297093986-24331-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.4
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.995
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] cortex-m3: adjusted target cflags
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
X-List-Received-Date: Mon, 07 Feb 2011 15:54:22 -0000

Explicit '-mthumb' is required because Cortex-M3 does not support ARM
instructions and actual flags cause gcc to fail with 'error: target CPU
does not support ARM mode'.

The '-mcpu=cortex-m3' is shorter than '-march=armv7-m -mtune=cortex-m3'
and enables workarounds like '-mfix-cortex-m3-ldrd'.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 conf/machine/include/tune-cortexm3.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/tune-cortexm3.inc b/conf/machine/include/tune-cortexm3.inc
index 6da9aee..a66a33c 100644
--- a/conf/machine/include/tune-cortexm3.inc
+++ b/conf/machine/include/tune-cortexm3.inc
@@ -1,4 +1,4 @@
 # valid options for -march: `armv7', `armv7-m'
-TARGET_CC_ARCH = "-march=armv7-m -mtune=cortex-m3 -mfpu=vfp -mfloat-abi=softfp"
+TARGET_CC_ARCH = "-mthumb -mcpu=cortex-m3 -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv7"
 BASE_PACKAGE_ARCH = "armv7"
-- 
1.7.4



