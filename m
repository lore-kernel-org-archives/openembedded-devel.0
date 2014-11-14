Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CDDBA7210D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:32:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43394096"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2014 17:19:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAE9MKb3027184
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 17:22:20 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 14 Nov 2014 17:22:34 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Nov 2014 17:20:02 +0800
Message-ID: <1415956804-56497-2-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415956804-56497-1-git-send-email-biannm@cn.fujitsu.com>
References: <1415956804-56497-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 1/3] Porting dash from openembedded and upgrade to 0.5.8
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
X-List-Received-Date: Fri, 14 Nov 2014 09:32:20 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-oe/recipes-extended/dash/dash_0.5.8.bb | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dash/dash_0.5.8.bb

diff --git a/meta-oe/recipes-extended/dash/dash_0.5.8.bb b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
new file mode 100644
index 0000000..3b9ea16
--- /dev/null
+++ b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Small and fast POSIX-compliant shell"
+HOMEPAGE = "http://gondor.apana.org.au/~herbert/dash/"
+SECTION = "System Environment/Shells"
+LICENSE = "BSD GPLv2+"
+
+inherit autotools update-alternatives
+
+SRC_URI = "http://gondor.apana.org.au/~herbert/dash/files/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "5c152209680dab3c319e8923f6c51378"
+SRC_URI[sha256sum] = "c6db3a237747b02d20382a761397563d813b306c020ae28ce25a1c3915fac60f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
+
+EXTRA_OECONF += "--bindir=${base_bindir}"
+
+ALTERNATIVE_${PN} = "sh"
+ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
+ALTERNATIVE_TARGET[sh] = "${base_bindir}/dash"
+ALTERNATIVE_PRIORITY = "10"
+
+pkg_postinst_${PN} () {
+	grep -q "^${base_bindir}/dash$" $D${sysconfdir}/shells || echo ${base_bindir}/dash >> $D${sysconfdir}/shells
+}
+
+pkg_postrm_${PN} () {
+	printf "$(grep -v "^${base_bindir}/dash$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
+}
-- 
1.9.1


