Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPWHk-0007dU-U3
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 11:55:49 +0200
Received: by wgbds1 with SMTP id ds1so3659055wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 02:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=VoYtmFUd4n6t48y3urPK5c/pdxz/XwT0dPs4F+N1faM=;
	b=S1wlkVdAqqOuBvzMPDOCkyBXiFV8G0wV9GGeIfdnfmDhcnDmhYpSg1e31M5Q499rRK
	HXPKNpyLpw4mkvxzMYsOtGYMJEp3PGKParSmTuATVBluQVQmc/OxMiN029Nj5kcmBRCM
	42eq3QArmH4ILFCEzGg6gzUuubDlbi8CobWIWQ/aywJpS5C04Bu2tE6GwpmDkdMDPOgZ
	3bCNFtJaii0cKoTkU64Ua9/8n6MqLnaASATDgtDr1czyoRTYcE/7r7N3OUOWoCgsCkDN
	1MzI6UzdrQTU2fncSw4vfY0+idzdZEJHqW1OlJYpQk9S5i5bEK5J/j5PVKAvswRHlBGn
	fl5A==
Received: by 10.216.131.34 with SMTP id l34mr16589007wei.54.1335951964949;
	Wed, 02 May 2012 02:46:04 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm43149489wib.6.2012.05.02.02.46.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 02:46:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 May 2012 11:45:31 +0200
Message-Id: <1335951932-6143-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlylYJQZXR0M+Uqfnve4/FGwri9EgwpCQOogjBLcqFUZdXg4rPDxMdHbziSlpObIS2nDlhG
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe/denzil][PATCH 5/6] gcc-crosssdk-intermediate_4.5.bb: with-headers has been moved from common include
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
X-List-Received-Date: Wed, 02 May 2012 09:55:49 -0000

From: Khem Raj <raj.khem@gmail.com>

To accomodate gcc 4.7 which needed a different option
than --with-header this option setting has been moved
into version specific recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Tested-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb            |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
index 971f3ba..61a0dfb 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
@@ -1,3 +1,3 @@
 require recipes-devtools/gcc/gcc-cross-intermediate_${PV}.bb
 require recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
-
+EXTRA_OECONF += " --with-headers=${STAGING_DIR_TCBOOTSTRAP}${SYSTEMHEADERS} "
-- 
1.7.10



