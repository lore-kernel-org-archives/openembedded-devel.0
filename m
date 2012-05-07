Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRTaV-0002LU-Ad
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 21:27:15 +0200
Received: by wgbdr1 with SMTP id dr1so4424977wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=sFeafbVTW9bq6qfni9U6rHR6qzdpvRbo/AIg1fs4VUQ=;
	b=L7upTJ80aP9kpvmRoK0R9HrjF6J8HSWysJ0VjLz3gL6zrmVmUtFP59lF+htfD6Km+K
	uf5HmEceciHaEpnCFhhzX6BPXsdBu2XtpzWJOGVWFyQzxRYeUx6JEkE/1JKe9crNlhr2
	HMefqGjDMBJxXr/o+uYqZIZUESAQiQ8pxEOSnNqReSMu11gkWoZj3wholR6VCrgt/1Bk
	8Jgrmo9R0eBOsFytbjlhdNhfr2/EAbFmsRBF/PuOtCNtdhDYVkQP54Rr1hir9SmqTDIR
	ZtpO8BxSbmKAK176TfMijEJX6UpO3rAA3j3KnEEdSCLD3+gDnAilwlx7mnPJQdWfHxji
	vK0g==
Received: by 10.180.90.102 with SMTP id bv6mr3789957wib.6.1336418244894;
	Mon, 07 May 2012 12:17:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fo7sm22288438wib.9.2012.05.07.12.17.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 12:17:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 21:17:02 +0200
Message-Id: <5c22d88fe27592f4ef279e562cba063676f8d1fe.1336418115.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <675fd0d4926f10fb8409a05d802f3d6908bd559e.1336418115.git.Martin.Jansa@gmail.com>
References: <cover.1336417488.git.Martin.Jansa@gmail.com>
	<675fd0d4926f10fb8409a05d802f3d6908bd559e.1336418115.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1336418115.git.Martin.Jansa@gmail.com>
References: <cover.1336418115.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gpe][PATCH 7/7] kernel.bbclass: Use kmod-native instead of module-init-tools-cross
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
X-List-Received-Date: Mon, 07 May 2012 19:27:15 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 66398ef..b431f8e 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base module_strip
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
+DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
@@ -274,7 +274,7 @@ if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
 	mkdir -p $D/lib/modules/${KERNEL_VERSION}
 fi
 if [ -n "$D" ]; then
-	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
+	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 else
 	depmod -a
 fi
@@ -352,9 +352,8 @@ python populate_packages_prepend () {
 		if m:
 			kernelver_stripped = m.group(1)
 		path = d.getVar("PATH", True)
-		host_prefix = d.getVar("HOST_PREFIX", True) or ""
 
-		cmd = "PATH=\"%s\" %sdepmod -n -a -r -b %s -F %s/boot/System.map-%s %s" % (path, host_prefix, dvar, dvar, kernelver, kernelver_stripped)
+		cmd = "PATH=\"%s\" depmod -n -a -b %s -F %s/boot/System.map-%s %s" % (path, dvar, dvar, kernelver, kernelver_stripped)
 		f = os.popen(cmd, 'r')
 
 		deps = {}
-- 
1.7.8.6



