Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Se6oJ-0004Jr-T0
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 17:45:44 +0200
Received: by yenl13 with SMTP id l13so2438145yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2012 08:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=9iIJddwiE8YFmsuPA2hXVwD54jEphxrvaKV8vBlcZSc=;
	b=UT1vVSXGFYvsNJU0FtcbtTZb+QFFeiIIMV4O+MI6bDGrFtpG72GexnyF1GRr70V00H
	wvJcqELiN9a7pgmwjbadmLi3z6rxMVshi/PktrAOFcptq/ok8SuvkQWHnjZlsS9noYSR
	Gi1qZKk42bmKXsqnaQAQfVB2eA51vdImLc1kZVP4ZKNgaFxrWB9QMLrjxF6a2kqy+Y+g
	9B1kSgLLNpks4VoMiGQXyBXMGc3wJPfiWdQZFSxXnAHFXIEvcIn1Un6PAZbKV3V6HcAi
	AqDT79d2p8qRQs/FWL2TibgNtOZFgDmDHfsE9Pg06yUc37tt88+EdvGT0ROcAJB32HVU
	t8wA==
Received: by 10.236.79.35 with SMTP id h23mr21861308yhe.60.1339428910057;
	Mon, 11 Jun 2012 08:35:10 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id c12sm26056214ann.15.2012.06.11.08.35.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jun 2012 08:35:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jun 2012 12:34:57 -0300
Message-Id: <35554bb06b4c779574cdb162c1701b0791afd459.1339428767.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1339428767.git.otavio@ossystems.com.br>
References: <cover.1339428767.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1339428767.git.otavio@ossystems.com.br>
References: <cover.1339428767.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 2/3] nodejs: force use of -mfpu-abi=soft for ARMv5
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

The build system defaults to 'softfp' but this use hardware
instructions that are not available making node to fail to run on
ARMv5 based CPUs. Now we check if TARGET_FPU is 'soft' and change the
default of the build system so it works.

Tested on i.MX233 (ARM926EJ-S)

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
index 7136ffc..972d02a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=914812f2875eef849b5c509cc25dcb4f"
 
 DEPENDS = "openssl"
 
+PR = "r1"
+
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
            file://fix-hardfloat-detection.patch"
 
@@ -16,6 +18,9 @@ S = "${WORKDIR}/node-v${PV}"
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 
+# Workaround a build to proper use soft FPU for armv5
+FORCE_SOFT_FPU = "${@bb.utils.contains("TUNE_FEATURES", "soft", "yes", "no", d)}"
+
 do_configure_virtclass-native () {
   sed -i -e s:\'/usr/lib:\'${STAGING_LIBDIR}:g wscript
   sed -i -e s:\'/usr/local/lib:\'${STAGING_LIBDIR}:g wscript
@@ -40,6 +45,10 @@ do_configure () {
   export CC=gcc
   export CXX=g++
 
+  if [ "${FORCE_SOFT_FPU}" = "yes" ]; then
+    sed -i "s,'default': 'softfp','default': 'soft',g" ${S}/deps/v8/SConstruct
+  fi
+
   ./configure --prefix=${prefix} --without-snapshot
 }
 
-- 
1.7.2.5



