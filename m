Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1ZBE-00083C-12
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 09:10:04 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so160716eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2012 00:01:41 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.28.205 as permitted sender) client-ip=10.14.28.205; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.28.205 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.28.205])
	by 10.14.28.205 with SMTP id g53mr5097494eea.130.1330243301668
	(num_hops = 1); Sun, 26 Feb 2012 00:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=fGZw4um4Lmxa071582LtzDZX89vrj/m/lC3wRDDs3fE=;
	b=YtlTOUqljX9WKKav6hwRjM2YnIim7RYMQhrEBNIhVqeNWb783UKMDRG8mi1fxJl3zO
	OP26vOl8TtmOvy5gNeg3RzHMwgokPBnhztY3gSILjgcorPFmkycd5JGYQIYgvlAGvXk6
	bFO8QbVwtBXYg2663sjy8lQ6N60bXcrP6ogdo=
Received: by 10.14.28.205 with SMTP id g53mr3877656eea.130.1330243301548;
	Sun, 26 Feb 2012 00:01:41 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm41812533eef.10.2012.02.26.00.01.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 00:01:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2012 09:01:30 +0100
Message-Id: <64ab53576a0a55c3cb21c0bd690b6b4f95ab2769.1330243124.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1330243124.git.Martin.Jansa@gmail.com>
References: <cover.1330243124.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/5] wmiconfig: don't export CC
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
X-List-Received-Date: Sun, 26 Feb 2012 08:10:04 -0000

* it also breaks multimachine sstate checksums:
  basehash changed from 130192c54799615343a7b84bd8132d7d to 41d55a7213b686ffcc52d1a5d515e444
  Variable CC value changed from
  arm-oe-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/OE/shr-core/tmp-eglibc/sysroots/nokia900
  to
  arm-oe-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/OE/shr-core/tmp-eglibc/sysroots/om-gta04

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb b/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
index a1ee671..9114832 100644
--- a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
+++ b/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
@@ -4,13 +4,11 @@ LIC_FILES_CHKSUM = "file://wmiconfig.c;endline=19;md5=4394a56bca1c5b2446c9f8e406
 SECTION = "console/network"
 SRCREV = "5394"
 PV = "0.0.0+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=AR6kSDK.build_sw.18;proto=http"
 S = "${WORKDIR}/AR6kSDK.build_sw.18/host/tools/wmiconfig"
 
-export CC := "${CC}"
-
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
-- 
1.7.8.4



