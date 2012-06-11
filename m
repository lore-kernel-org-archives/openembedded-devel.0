Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Se6oL-0004Jz-MJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 17:45:46 +0200
Received: by ggnp4 with SMTP id p4so2450696ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2012 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ro5jq4CbwOUtipECBVtRemomWwn75SL6lIVDus21158=;
	b=fwtSKEhaNrD30/ztw80pEprlpmvxBSW+jFhY9TKfb3+LE9Cy/OhWPhFHl1A+eih0TC
	7wvOCh3tzcXXNixuiQ6wcPIicFWCRMygWBPzyZn4UrjNJk4SmNJZv2tDh7e8uUF3VaAM
	zzFpyzhS4lfXUe7LN0qJsZrveuwAO31I8u2nnN8AW7iP40YzScIpUUz8ee/pz3a6iz8p
	ZSk1Op9ItrvTya2pYUExAT0OaMHsG6Yl69WHmLE5mM6PxFt9OJUo0EFdhb/ZcaBE8dkO
	Wn0L5e4XAFSB1s/yc0X8kwC8ASB6vJ/i61VAx/uCRueFB/Vfn1md772zHV00ZuJOx+9Y
	m1Jg==
Received: by 10.236.75.163 with SMTP id z23mr21585515yhd.3.1339428911862;
	Mon, 11 Jun 2012 08:35:11 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id c12sm26056214ann.15.2012.06.11.08.35.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jun 2012 08:35:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jun 2012 12:34:58 -0300
Message-Id: <9a4427b73e6410ee3c7d194a38225a54778fffae.1339428767.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1339428767.git.otavio@ossystems.com.br>
References: <cover.1339428767.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1339428767.git.otavio@ossystems.com.br>
References: <cover.1339428767.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 3/3] cpuburn-neon: fix packaging to use a date as version and valid sources
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
X-List-Received-Date: Mon, 11 Jun 2012 15:45:46 -0000

 * The package were not versioning the sources as the files had no
   version on its name. We workaround it mangling the DL_DIR;

 * We now dynamically check if the machine has or not neon feature and
   set COMPATIBLE_MACHINE.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../{cpuburn-neon.bb => cpuburn-neon_20120610.bb}  |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-benchmark/cpuburn/{cpuburn-neon.bb => cpuburn-neon_20120610.bb} (68%)

diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb
similarity index 68%
rename from meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb
rename to meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb
index bb9ca1c..5bc3129 100644
--- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb
@@ -2,19 +2,17 @@ DESCRIPTION = "CPU burn app that loads the NEON coprocessor fully"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://burn.S;md5=823abc72c2cd448e87df9bc5355a4456"
 
-PR = "r1"
+DL_DIR_append = "/${PN}-${PV}"
 
-# only for ARM systems infact it should check for MACHINE_FEATURE
-# neon or something. For now we spare non arm arches from picking this up
-
-COMPATIBLE_HOST = "arm.*"
+# Ensure to make this available for machine which has neon
+COMPATIBLE_MACHINE = "(${@bb.utils.contains("TUNE_FEATURES", "neon", "${MACHINE}", "Invalid!", d)})"
 
 SRC_URI = "http://hardwarebug.org/files/burn.S;name=mru \
            http://github.com/downloads/ssvb/ssvb.github.com/ssvb-cpuburn-a8.S;name=ssvb"
 SRC_URI[mru.md5sum] = "823abc72c2cd448e87df9bc5355a4456"
 SRC_URI[mru.sha256sum] = "01d9fc04f83740c513c25401dcc89c11b2a5a6013e70bfca42b7b02129f88cd2"
-SRC_URI[ssvb.md5sum] = "f1af41dcd56e4f0f7e92b67109dc01ed"
-SRC_URI[ssvb.sha256sum] = "95e2267a684be0d848dd6f935e769fa3ed810274ebacddc3fe8ddac4b34838c2"
+SRC_URI[ssvb.md5sum] = "0acc570d943c41c7f8602b9ff6fa111d"
+SRC_URI[ssvb.sha256sum] = "bfddd3226a499ffdf71bb58c05ccdc6dac5bb2c2c3bdb10ac610ee0b60aac087"
 
 S = "${WORKDIR}"
 
-- 
1.7.2.5



