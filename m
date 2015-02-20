Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8702A73632
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 10:06:24 +0000 (UTC)
Received: by padet14 with SMTP id et14so6899250pad.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 02:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=njEowEzgNEy26+RQigwaokHtA/9YNJ74ZZaCjllxGFc=;
	b=g6jP5oR1bZQxUX69A6ObW8IJiPYWjB/LsnBfhE33APmXHej9SoY3Tltv2fYaIE9qXc
	C2boAoonfHoPxUnk6w2LqEa94OoFtQf2J4mr5cO8Ov+BiCacYkdycpDIOA+tY5pRBvlD
	THul6Haa9crW/4pXByco00tnxOsdGahYdXf1OyFPA485X2s378ZtDW6OWHyvpMzHky60
	5UYxS/xAEcn4+nbr04HaqtwDkCSrl3KihlOXh3YrLMmE8fnw102tZN79FgsbCQZPkEFd
	xQUITV0hMD00E7qlGKLMxpj+4dYrR8Jmepmo9tfG65piapQiQ6D8h1TJx9/JbX0wqO/Q
	pWQg==
X-Received: by 10.70.38.163 with SMTP id h3mr15153885pdk.95.1424426786190;
	Fri, 20 Feb 2015 02:06:26 -0800 (PST)
Received: from Pahoa2.mvista.com ([192.165.183.201])
	by mx.google.com with ESMTPSA id
	qm12sm26443109pdb.36.2015.02.20.02.06.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Feb 2015 02:06:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Feb 2015 02:06:14 -0800
Message-Id: <1424426775-17553-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][PATCH 1/2] edac-utils: Add new package
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
X-List-Received-Date: Fri, 20 Feb 2015 10:06:29 -0000

From: Armin Kuster <akuster@mvista.com>

Userspace helper for kernel EDAC drivers (Error Detection and Correction)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-support/edac-utils/edac-utils_git.bb   | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/edac-utils/edac-utils_git.bb

diff --git a/meta-oe/recipes-support/edac-utils/edac-utils_git.bb b/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
new file mode 100644
index 0000000..e5621ad
--- /dev/null
+++ b/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Userspace helper for Linux kernel EDAC drivers"
+HOMEPAGE = "https://github.com/grondo/edac-utils"
+SECTION = "Applications/System"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=1;endline=2;md5=1fbd81241fe252ec0f5658a521ab7dd8"
+
+DEPENDS = " sysfsutils"
+
+SRCREV = "f9aa96205f610de39a79ff43c7478b7ef02e3138"
+PV = "0.16+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://github.com/grondo/edac-utils;protocol=http"
+
+inherit autotools-brokensep
+
+do_configure_prepend () {
+    touch ${S}/ChangeLog
+    ${S}/bootstrap
+}
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
+
+RDEPENDS_${PN} = " perl"
-- 
1.9.1


