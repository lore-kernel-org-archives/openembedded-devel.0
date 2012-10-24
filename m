Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TQxt2-00045u-Vd
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2012 12:08:33 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so108591eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 02:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=461HLwCOqqG/TKMkha+ss/4n4CiCOHeCXEPud54yLkA=;
	b=MuxCcTqnvJjHhevOmGMGWmWHXtZxy0RwCZKwP4DlHrccBc9CIEMePaYZe0wC9ijXQx
	+8T63tKhPIV+sUmBRT9Izio96y/DCxHsOUFPUU9dhO6QCwCc57pwbRD/eUEHscQGTjP1
	dQdJYw64hahf38xs19Rp+DnhS7IjaWPOMBQqvKe/C20cQud+bk/a3Z1o6jKMeaoWBeGn
	usN7Svi5Mkhp3rr9DVewP6Zi2JDwNhtXiOneimvx3jcz1+REpV+85fT5XJKtv1lrAEin
	s6Uyq9DXr12KwdhkzZaJKvv3yS4hxhngr1hSqdY/+/4FzOCrm+OFfaHsKZe88uMU6THi
	eaVg==
Received: by 10.14.194.72 with SMTP id l48mr20870549een.9.1351072505723;
	Wed, 24 Oct 2012 02:55:05 -0700 (PDT)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 42sm24877760eee.0.2012.10.24.02.55.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 02:55:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Oct 2012 11:55:01 +0200
Message-Id: <1351072501-23261-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkEFiMbb2G0SPIKngNF1rd5SrpZSgqQo2vCkv4MgAUm+1K1vFlLHdcQCAA3wEQEoYC3chOO
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] f2fs-tools: add 1.1.0
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
X-List-Received-Date: Wed, 24 Oct 2012 10:08:33 -0000

These are the tools needed for creating and managing f2fs partitions.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb

diff --git a/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb b/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb
new file mode 100644
index 0000000..cce9af1
--- /dev/null
+++ b/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Tools for Flash-Friendly File System (F2FS)"
+HOMEPAGE = "http://sourceforge.net/projects/f2fs-tools/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=15667d9b3cb737b57471c148b7c50734"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/f2fs-tools/f2fs-tools-${PV}.tar.gz"
+SRC_URI[md5sum] = "cf3608ea7475c8f9a03159d7f22e4d07"
+SRC_URI[sha256sum] = "afd774b80f73721f2c4300c0b4780a24b705b8328df229f3ae37315c8bfbff1d"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
+
+do_configure_prepend() {
+	# workaround for endless do_configure loop:
+	# make: Warning: File `Makefile.am' has modification time 5.3e+04 s in the future
+	touch ${S}/*
+}
-- 
1.7.10



