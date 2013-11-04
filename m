Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 504AE6D290
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 05:49:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA45njn5014328
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 21:49:45 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.89) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 21:49:45 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <joe@deserted.net>
Date: Mon, 4 Nov 2013 00:49:42 -0500
Message-ID: <1383544182-12671-3-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1383544182-12671-1-git-send-email-bruce.ashfield@windriver.com>
References: <1383544182-12671-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] netcf: move from meta-virtualization to meta-networking
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
X-List-Received-Date: Mon, 04 Nov 2013 05:49:44 -0000
Content-Type: text/plain

netcf was orginally introduced in meta-virtualization, since it provides
functionality required by libvirt, but it is otherwise not bound to
virtualization.

So we can move it to meta-networking, and in the process uprev to the
the latest 0.2.3 functinality.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-networking/recipes-support/netcf/netcf_git.bb | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-networking/recipes-support/netcf/netcf_git.bb

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
new file mode 100644
index 0000000..60d82d1
--- /dev/null
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "netcf"
+DESCRIPTION = "netcf is a cross-platform network configuration library."
+HOMEPAGE = "https://fedorahosted.org/netcf/"
+SECTION = "console/tools"
+LICENSE = "LGPLv2.1"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
+
+SRCREV = "b8a19dc860b38c97c42115d8a559b78853452a4b"
+PV = "0.2.3+git${SRCPV}"
+
+SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git \
+"
+
+DEPENDS += "augeas libnl libxslt libxml2"
+
+S = "${WORKDIR}/git"
+
+inherit gettext autotools
+
+do_configure_prepend() {
+	cd ${S}
+	./bootstrap
+}
+
-- 
1.8.1.2


