Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXJ-00036v-IL
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:58 +0100
Received: by mail-pb0-f41.google.com with SMTP id xa7so9965882pbc.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=h9VWGsarj/Mnaa7W4UviH97AEhhx1iRqOaD4LeYyXa0=;
	b=FY6w1IFEsrl4DdeQrFp9NGWiSnlHTFv40m8JMH4eZ6P7AGkFjtD6wnkNk24EXYPOSp
	rwFZeY0AviIVsik1ycc5BUCA8k3qiDQ9eWsx/eSLIg9IfWoAeE1Q95e/hN1aznPYxeM6
	x3bPuxhp74hYs4C49Vd89LZpMCfHLGch1fPPqLASH0OEalWVJuga/8hoyNqviodjXeYI
	fUiIioDYQTB0F+vRLr4EwVPBFMYwN1eHJ59iSg2oHfkmfa81IwUnG1Ed6BhgcvWHzZs4
	4sJUyTrgi6kgPyAl2fWo98HdeUrNj3V9VLLkEfimDRWBLe2SDMRktNH7QakB9FUa0RHS
	hTRQ==
X-Received: by 10.68.236.97 with SMTP id ut1mr2645661pbc.164.1357463629337;
	Sun, 06 Jan 2013 01:13:49 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:39 -0800
Message-Id: <1357463568-26241-16-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 16/25] libuio: Add recipe for version 0.2.1
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
X-List-Received-Date: Sun, 06 Jan 2013 09:29:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libuio/libuio_0.2.1.bb |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libuio/libuio_0.2.1.bb

diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
new file mode 100644
index 0000000..c16bbd3
--- /dev/null
+++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Libuio - helper library for UIO subsystem."
+SECTION = "base"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+
+SRC_URI = "git://libuio.git.sourceforge.net/gitroot/libuio/libuio"
+
+inherit autotools
+
+SRCREV = "e1e0e4fa28838b3115e215c9553905fe630ca145"
+
+S = "${WORKDIR}/git"
+
+PACKAGES += "${PN}-tools"
+
+FILES_${PN} = "${libdir}"
+FILES_${PN}-tools = "${bindir}"
-- 
1.7.9.5



