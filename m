Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7A5F565DE2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:56 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id um1so4385671pbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y7kb4K8/UygQdvh340+dbLaBW8nNsHcfe99PFcFrSt0=;
	b=zGE061W+VRljh3puhuMuXQyp4jXguhklzvbdEsgbf4pgooE8/KpvnR2oVnxv4350fJ
	ANGVc4hIQkW0nag5uxQKuHKTDfyGcf0HLdvMtnO/nC0IrHmKne4LrZdMt44400+7aQ/N
	TxMHnLFb+EBx59+Nsrb9IhJXrxbnq+9UFRYf3phgCbMdgCWId+lyoKxGaa+z01M7uJe6
	5+C7o8VDAauCpsy5ndPnHc/R9+V9/EKVJMyJNWlYx7s4+7m3GJ3TG17OaYcnEEGt9atZ
	sKCHcpI+oxnG5l0+IoU0py3nG/pqEjwRdFSRjiXm393fmXEHkgkC32s2prj6sZKEHBhf
	ZK4g==
X-Received: by 10.66.66.108 with SMTP id e12mr16179366pat.35.1398544378339;
	Sat, 26 Apr 2014 13:32:58 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:42 -0700
Message-Id: <1398544484-27299-19-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 19/21] i2c-tools: Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
index a9e8593..b8be9ed 100644
--- a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
+++ b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
@@ -11,12 +11,12 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/i2c-tools/i2c-tools-3.1.0.tar
 SRC_URI[md5sum] = "f15019e559e378c6e9d5d6299a00df21"
 SRC_URI[sha256sum] = "960023f61de292c6dd757fcedec4bffa7dd036e8594e24b26a706094ca4c142a"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_compile_prepend() {
     cp ${WORKDIR}/Module.mk ${S}/eepromer/
-    sed -i 's#/usr/local#/usr#' Makefile
-    echo "include eepromer/Module.mk" >> Makefile
+    sed -i 's#/usr/local#/usr#' ${S}/Makefile
+    echo "include eepromer/Module.mk" >> ${S}/Makefile
 }
 
 do_install_append() {
-- 
1.7.10.4


