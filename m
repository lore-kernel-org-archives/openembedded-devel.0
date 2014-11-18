Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B91C27211F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 05:54:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43547531"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Nov 2014 13:50:29 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAI5rSi3001750
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 13:53:28 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 18 Nov 2014 13:53:47 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Nov 2014 13:52:49 +0800
Message-ID: <1416289969-11515-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <A8FC939F80655644A89BB21CCD3741E87C5B6F@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <A8FC939F80655644A89BB21CCD3741E87C5B6F@G08CNEXMBPEKD02.g08.fujitsu.local>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH v2] nicstat : add new recipe
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
X-List-Received-Date: Tue, 18 Nov 2014 05:54:48 -0000
Content-Type: text/plain

nicstat is a tool that prints out network statistics for all network
interface cards (NICs), including packets, kilobytes per second,
average packet sizes and more.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb

diff --git a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
new file mode 100644
index 0000000..142c164
--- /dev/null
+++ b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "nicstat is a Solaris and Linux command-line that prints out network \
+statistics for all network interface cards (NICs), including packets, kilobytes \
+per second, average packet sizes and more."
+HOMEPAGE = "http://nicstat.sourceforge.net"
+LICENSE = "Artistic-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4a94da2a1f918b217ef5156634fc9e0"
+SRC_URI = "http://softlayer-sng.dl.sourceforge.net/project/nicstat/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "9a0b87bbc670c1e738e5b40c7afd184d"
+SRC_URI[sha256sum] = "c4cc33f8838f4523f27c3d7584eedbe59f4c587f0821612f5ac2201adc18b367"
+
+do_compile() {
+	${CC} ${CFLAGS} ${LDFLAGS} -o nicstat nicstat.c
+}
+do_install() {
+     	install -d ${D}/${bindir}/
+	install -d ${D}/${mandir}/
+     	install -m 0755 ${S}/nicstat ${D}${bindir}/
+	install -m 0644 ${S}/nicstat.1 ${D}/${mandir}/
+}
-- 
1.8.4.2


