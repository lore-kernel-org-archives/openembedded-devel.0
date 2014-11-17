Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D9C7F72154
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 09:18:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43491362"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Nov 2014 17:15:05 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAH9I3qv012928
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 17:18:03 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 17 Nov 2014 17:18:21 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Nov 2014 17:15:40 +0800
Message-ID: <1416215740-36026-3-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1416215740-36026-1-git-send-email-biannm@cn.fujitsu.com>
References: <1416215740-36026-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 2/2] Porting esmtp from openembedded.
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
X-List-Received-Date: Mon, 17 Nov 2014 09:18:26 -0000
Content-Type: text/plain

The esmtp is not longer being maintained sine 1.2,
but it's used at many distribution now such as Ubuntu trusty(14.04LTS).

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-networking/recipes-support/esmtp/esmtp_1.2.bb | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/esmtp/esmtp_1.2.bb

diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
new file mode 100644
index 0000000..46d468c
--- /dev/null
+++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
@@ -0,0 +1,32 @@
+SUMMARY = "User configurable send-only Mail Transfer Agent"
+DESCRIPTION = "ESMTP is a user-configurable relay-only MTA \
+with a sendmail-compatible syntax, based on libESMTP and \
+supporting the AUTH (including the CRAM-MD5 and NTLM SASL \
+mechanisms) and StartTLS SMTP extensions."
+HOMEPAGE = "http://esmtp.sourceforge.net/"
+SECTION = "console/network"
+
+DEPENDS = "libesmtp"
+
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "http://nchc.dl.sourceforge.net/project/${PN}/${PN}/${PV}/${PN}-${PV}.tar.bz2"
+
+# Have to set this or we get -L/lib in LDFLAGS
+EXTRA_OECONF = "--with-libesmtp=${STAGING_EXECPREFIXDIR}"
+
+inherit autotools update-alternatives
+
+ALTERNATIVE_${PN} = "sbinsendmail libsendmail"
+
+ALTERNATIVE_LINK_NAME[sbinsendmail] = "${sbindir}/sendmail"
+ALTERNATIVE_TARGET[sbinsendmail] = "${bindir}/esmtp"
+ALTERNATIVE_LINK_NAME[libsendmail] = "${libdir}/sendmail"
+ALTERNATIVE_TARGET[libsendmail] = "${bindir}/esmtp"
+ALTERNATIVE_PRIORITY = "10"
+
+SRC_URI[md5sum] = "79a9c1f9023d53f35bb82bf446150a72"
+SRC_URI[sha256sum] = "a0d26931bf731f97514da266d079d8bc7d73c65b3499ed080576ab606b21c0ce"
+
+FILES_${PN} += "${libdir}/"
-- 
1.9.1


