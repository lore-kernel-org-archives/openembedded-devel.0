Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1TdXpt-0007LL-En
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 03:57:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAS2h2AE029469
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 18:43:02 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 27 Nov 2012 18:43:01 -0800
From: "yanjun.zhu" <yanjun.zhu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Nov 2012 10:42:58 +0800
Message-ID: <1354070578-5401-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.11
In-Reply-To: <3487>
References: <3487>
MIME-Version: 1.0
Subject: [PATCH] libproxy: Fix for CVE-2012-4504
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
X-List-Received-Date: Wed, 28 Nov 2012 02:57:17 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

Reference:https://code.google.com/p/libproxy/source/detail?r=853

Stack-based buffer overflow in the url::get_pac function in url.cpp
in libproxy 0.4.x before 0.4.9 allows remote servers to have an
unspecified impact via a large proxy.pac file.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4504

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---
 recipes-support/libproxy/libproxy_0.4.7.bbappend          |  5 +++++
 .../libproxy/patches/libproxy-0.4.7-CVE-2012-4504.patch   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 recipes-support/libproxy/patches/libproxy-0.4.7-CVE-2012-4504.patch

diff --git a/recipes-support/libproxy/libproxy_0.4.7.bbappend b/recipes-support/libproxy/libproxy_0.4.7.bbappend
index e2d2ea2..55d3332 100644
--- a/recipes-support/libproxy/libproxy_0.4.7.bbappend
+++ b/recipes-support/libproxy/libproxy_0.4.7.bbappend
@@ -1,10 +1,15 @@
 PRINC = "1"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/patches:"
+
 # the libproxy-${PV}.tar.gz had many warning/error messages
 SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.zip \
 	file://g++-namepace.patch \
 	file://libproxy_fix_for_gcc4.7.patch \
 	"
 
+SRC_URI += "file://libproxy-0.4.7-CVE-2012-4504.patch \
+           "
+
 SRC_URI[md5sum] = "62585570de17d10f03a5a63b701ffd52"
 SRC_URI[sha256sum] = "429a19c57d9990349d622beecc805b23051caa62a478066bff5d9a312a8937be"
diff --git a/recipes-support/libproxy/patches/libproxy-0.4.7-CVE-2012-4504.patch b/recipes-support/libproxy/patches/libproxy-0.4.7-CVE-2012-4504.patch
new file mode 100644
index 0000000..323a571
--- /dev/null
+++ b/recipes-support/libproxy/patches/libproxy-0.4.7-CVE-2012-4504.patch
@@ -0,0 +1,15 @@
+diff -urpN a/libproxy/url.cpp b/libproxy/url.cpp
+--- a/libproxy/url.cpp	2012-11-26 10:08:47.000000000 +0800
++++ b/libproxy/url.cpp	2012-11-26 10:05:54.000000000 +0800
+@@ -472,9 +472,10 @@ char* url::get_pac() {
+ 				// Add this chunk to our content length,
+ 				// ensuring that we aren't over our max size
+ 				content_length += chunk_length;
+-				if (content_length >= PAC_MAX_SIZE) break;
+ 			}
+ 
++			if (content_length >= PAC_MAX_SIZE) break;
++
+ 			while (recvd != content_length) {
+ 				int r = recv(sock, buffer + recvd, content_length - recvd, 0);
+ 				if (r < 0) break;
-- 
1.7.11



