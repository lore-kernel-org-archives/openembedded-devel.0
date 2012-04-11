Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SI33l-0002gL-P2
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 21:18:29 +0200
Received: by wibhj13 with SMTP id hj13so1069601wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=PdTQ9Bgj+ZadwvGhaUuYt8dVq1aO6x0X09Ymm7f9VXE=;
	b=JC1zicEyAcJE6mm//MBH7t7lAxBNv1/A1stjw5lVXHDUocbexVe8aFG+rqTcVwFji3
	iclxfoCkr1M/r83sDCSBEC9oh6t3rO8MJIr70MmdfEDwOB20T1ElkkSFkS5PMean6Rjr
	ZyFpfU/qbum/koCpobf/E+2Vazph0TmR2VNUK1C+PIQ3mSkNwsVqkx1RRv95TlMOSX6g
	Qn8J3EXtnUCDY3dfMfdG4iXyErgla/EEp+rVo8yxL5BOrilQ9BUBJZ/oCuNhIQcxsZhT
	fggdR4zmYVEnTYI4yRpU7W0TEPQNYFCyZNSIRcA9SzRcxn6r2/eKG5U8Yx5m2gGXZpU0
	feiQ==
Received: by 10.180.79.135 with SMTP id j7mr9050872wix.19.1334171350767;
	Wed, 11 Apr 2012 12:09:10 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm12584920wib.7.2012.04.11.12.09.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 12:09:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2012 21:09:05 +0200
Message-Id: <1334171345-8703-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQlV9wy7bxAZuaSUUqiT2DsqOjaNl1aImafgxAm+XDHnO+okPQRZDdHndxDDr3UF+YenC1gy
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe] cpuburn-neon: add cpuburn app for neon and neon-cortexa8
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
X-List-Received-Date: Wed, 11 Apr 2012 19:18:29 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb |   31 +++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb

diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb
new file mode 100644
index 0000000..bb9ca1c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "CPU burn app that loads the NEON coprocessor fully"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://burn.S;md5=823abc72c2cd448e87df9bc5355a4456"
+
+PR = "r1"
+
+# only for ARM systems infact it should check for MACHINE_FEATURE
+# neon or something. For now we spare non arm arches from picking this up
+
+COMPATIBLE_HOST = "arm.*"
+
+SRC_URI = "http://hardwarebug.org/files/burn.S;name=mru \
+           http://github.com/downloads/ssvb/ssvb.github.com/ssvb-cpuburn-a8.S;name=ssvb"
+SRC_URI[mru.md5sum] = "823abc72c2cd448e87df9bc5355a4456"
+SRC_URI[mru.sha256sum] = "01d9fc04f83740c513c25401dcc89c11b2a5a6013e70bfca42b7b02129f88cd2"
+SRC_URI[ssvb.md5sum] = "f1af41dcd56e4f0f7e92b67109dc01ed"
+SRC_URI[ssvb.sha256sum] = "95e2267a684be0d848dd6f935e769fa3ed810274ebacddc3fe8ddac4b34838c2"
+
+S = "${WORKDIR}"
+
+do_compile() {
+	${CC} ${CFLAGS} ${LDFLAGS} burn.S -o burn
+	${CC} ${CFLAGS} ${LDFLAGS} ssvb-cpuburn-a8.S -o burn-neona8
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/burn ${D}${bindir}/burn-neon
+	install -m 0755 ${S}/burn-neona8 ${D}${bindir}/
+}
+
-- 
1.7.2.5



