Return-Path: <Lei.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C06956A4E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 09:52:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5R9q1cf017656
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 02:52:01 -0700 (PDT)
Received: from pek-lpgtest3.wrs.com (128.224.153.83) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 27 Jun 2013 02:52:00 -0700
From: <lei.yang@windriver.com>
To: <lei.yang@windriver.com>, <Joe.MacDonald@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Jun 2013 17:51:59 +0800
Message-ID: <1372326719-11068-1-git-send-email-lei.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH:V3] vlan: Add vlan recipe
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
X-List-Received-Date: Thu, 27 Jun 2013 09:52:01 -0000
Content-Type: text/plain

From: Lei Yang <lei.yang@windriver.com>

A 802.1q vlan support program,which can be used by virt-test

Signed-off-by: Lei Yang <lei.yang@windriver.com>
---
 meta-networking/recipes-support/vlan/vlan_1.9.bb |   23 ++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100755 meta-networking/recipes-support/vlan/vlan_1.9.bb

diff --git a/meta-networking/recipes-support/vlan/vlan_1.9.bb b/meta-networking/recipes-support/vlan/vlan_1.9.bb
new file mode 100755
index 0000000..dea3306
--- /dev/null
+++ b/meta-networking/recipes-support/vlan/vlan_1.9.bb
@@ -0,0 +1,23 @@
+SUMMARY = "802.1q vlan support program"
+HOMEPAGE = "http://www.candelatech.com/~greear/vlan.html"
+LICENSE = "GPLv2"
+SECTION = "console/network"
+
+SRC_URI = "http://www.candelatech.com/~greear/vlan/vlan.${PV}.tar.gz"
+SRC_URI[md5sum] = "5f0c6060b33956fb16e11a15467dd394"
+SRC_URI[sha256sum] = "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d9aeb4868842b4cca"
+LIC_FILES_CHKSUM = "file://macvlan_config.c;beginline=4;endline=62;md5=dc0660d77e4313e8ccdf256fbe436a63"
+
+S = "${WORKDIR}/${PN}"
+
+CCFLAGS = "-g -D_GNU_SOURCE -Wall -I${STAGING_INCDIR}"
+
+do_compile() {
+	${CC} ${CCFLAGS} -c vconfig.c
+	${CC} ${CCFLAGS} ${LDFLAGS} -o vconfig vconfig.o 
+}
+
+do_install() {
+	install -d "${D}${sbindir}"
+	install -m 755 "${S}/vconfig" "${D}${sbindir}/vconfig"
+}
-- 
1.7.1


