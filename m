Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q8RBw-0000xz-Va
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 07:58:41 +0200
Received: by gxk3 with SMTP id 3so1150751gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2011 22:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=jScF0Ad787JOV2CYbAP0d9z4XsYVc1woWBTHsBr8klE=;
	b=GjLmGYGN7YWmweFSbFoZwuegDj+RO5rNi2y7rKqxdDJN+W1CBQTT2jICBQz19LcFgL
	pwhqpJXQkfcgYLwS10L126WyAqeD+J1TJJ2yaGKAcFb3LmTUz/YzgxqxNlhgoVhTJ1gr
	H1o6qKIERGnTLcZxAOc9vnbYXQAHXherPLVtc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=BMrDx4jKoPNoPCtmcIbY/ijYa6qTetLRhrHtFqq8dLQHt/yISt5Wvl6VtRgdmnkf07
	4D6tNB2qF9ClOS1l8stq+rHxLrLH2hP++CNZe3ZVa8Z1dAjXMTaTAzvnjHCzRf3jkQTc
	2jfwXs/yEw8AcWx1b44akHx0vN6HeNW2V39oc=
Received: by 10.150.58.4 with SMTP id g4mr2836589yba.155.1302328589592;
	Fri, 08 Apr 2011 22:56:29 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p28sm280822ybk.0.2011.04.08.22.56.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Apr 2011 22:56:28 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Apr 2011 11:26:19 +0530
Message-Id: <1302328581-30367-1-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 1/3] omap3-sgx-modules: Update TI816x Module Location and Platform variables.
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
X-List-Received-Date: Sat, 09 Apr 2011 05:58:41 -0000

From: Siddharth Heroor <heroor@ti.com>

* With Graphics SDK 4.03.00.02, TI816x module location and platform
  has been made more generic - ti81xx. This is to support TI814x
  which uses exactly the same SGX core as TI816x.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 .../omap3-sgx-modules_1.6.16.3977.bb               |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
index 867e21d..5a59883 100644
--- a/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
@@ -31,10 +31,10 @@ PVRBUILD = "release"
 PACKAGE_STRIP = "no"
 
 TI_PLATFORM_omap3 = "omap3630"
-TI_PLATFORM_ti816x = "ti8168"
+TI_PLATFORM_ti816x = "ti81xx"
 
 MODULESLOCATION_omap3 = "dc_omap3430_linux"
-MODULESLOCATION_ti816x = "dc_ti8168_linux"
+MODULESLOCATION_ti816x = "dc_ti81xx_linux"
 
 MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM}"
 
-- 
1.7.0.4



