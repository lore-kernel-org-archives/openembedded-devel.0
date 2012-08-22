Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T4GfU-0000hx-Ev
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 21:32:44 +0200
Received: by pbcwy7 with SMTP id wy7so1834865pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2012 12:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=nJ8Uc+FwkNkNyTYe2p7DHPzzvtRXGt04TnG19I6lRDs=;
	b=VHAGu3MqGMCq1JkUpRdExGe78v3rP6O3bZs/nAKMKw0d48m9HbSdn3NDdp50cRA3iw
	kN3qj/lDaz+JnW6wwI0CoYKeUo6u1EHDQBaK+YqeaU9tFS8gnp3AVX21sLKCPPyiYEQZ
	46FA87MlhvkKTYpyzVdF1rT25nb9nCFsa1dtLVarc1f+Ko7tp+wbxu9UzBMHEzWcq44C
	r35/HbOUaUeuC5f7rG70nS5FT2yLULqBEyCVVOtes+twtCJlEk0zFcVHgupU2yA8izCr
	ECmJbohYHHNtX7yBuobHgIKVQ9K8Fr4TbbF0rMt4kPNK6B1AoTbQINUl13pFyuCWNoWX
	/bvQ==
Received: by 10.66.87.138 with SMTP id ay10mr48313423pab.38.1345663238491;
	Wed, 22 Aug 2012 12:20:38 -0700 (PDT)
Received: from eos.du.ae ([94.205.108.162])
	by mx.google.com with ESMTPS id oj8sm4254996pbb.54.2012.08.22.12.20.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 12:20:37 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2012 23:20:19 +0400
Message-Id: <1345663224-42350-2-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345663224-42350-1-git-send-email-elvis.dowson@gmail.com>
References: <1345663224-42350-1-git-send-email-elvis.dowson@gmail.com>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx 2/7] tune-ppc405: Add glibc configure options.
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
X-List-Received-Date: Wed, 22 Aug 2012 19:32:44 -0000

* Add glibc configure options to get ppc405 specific library.
* Minor changes to tune-ppc405 recipe to specify soft-float option.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 conf/machine/include/tune-ppc405.inc |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/tune-ppc405.inc b/conf/machine/include/tune-ppc405.inc
index 012390e..b148956 100644
--- a/conf/machine/include/tune-ppc405.inc
+++ b/conf/machine/include/tune-ppc405.inc
@@ -4,11 +4,11 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc405] = "Enable ppc405 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc405", "-mcpu=405", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppc405", "ppc405", "${PPCPKGARCH}", d)}"
 
-TARGET_FPU = "soft"
 AVAILTUNES += "ppc405"
-TUNE_FEATURES_tune-ppc405 = "m32 ppc405"
-PACKAGE_EXTRA_ARCHS_tune-ppc405 = "ppc405"
+TUNE_FEATURES_tune-ppc405 = "m32 ppc405 fpu-soft"
+TUNE_PKGARCH_tune-ppc440 = "ppc405"
+PACKAGE_EXTRA_ARCHS_tune-ppc405 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppc405"
 
-#MACHINEOVERRIDES .= "ppc405"
+# glibc configure options to get ppc440 specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc405", "-with-cpu=405", "", d)}"
-- 
1.7.9.5



