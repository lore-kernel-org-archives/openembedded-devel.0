Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34B0E606D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 08:38:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6I8d0Pf025074
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 01:39:00 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Jul 2016 01:38:59 -0700
From: <zhe.he@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jul 2016 04:38:58 -0400
Message-ID: <1468831138-130047-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lmbench: Fix compilation error of gcc format-security
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jul 2016 08:39:01 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

oe-core "security_flags: turn potential string format security issues
into an error" add "-Wformat -Wformat-security -Werror=format-security"
to the default SECURITY_CFLAGS, which may cause lmbench compilation
failure.

This patch fixes lmbench's code.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...ttp-Use-puts-instead-of-printf-to-avoid-f.patch | 26 ++++++++++++++++++++++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/lat_http-Use-puts-instead-of-printf-to-avoid-f.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/lat_http-Use-puts-instead-of-printf-to-avoid-f.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/lat_http-Use-puts-instead-of-printf-to-avoid-f.patch
new file mode 100644
index 0000000..8121e37
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/lat_http-Use-puts-instead-of-printf-to-avoid-f.patch
@@ -0,0 +1,26 @@
+[PATCH] lat_http: Use puts instead of printf to avoid gcc
+format-security error
+
+Upstream-Status: pending
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ src/lat_http.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lat_http.c b/src/lat_http.c
+index c630d59..42e64a1 100644
+--- a/src/lat_http.c
++++ b/src/lat_http.c
+@@ -27,7 +27,7 @@ http(char *server, char *file, int prog)
+ 	sock = tcp_connect(server, prog, SOCKOPT_REUSE);
+ 	sprintf(buf, "GET /%s HTTP/1.0\r\n\r\n\n", file);
+ 	if (debug) {
+-		printf(buf);
++		puts(buf);
+ 	}
+ 	write(sock, buf, strlen(buf));
+ 	while ((n = read(sock, buf, XFERSIZE)) > 0) {
+-- 
+2.8.2
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 24cd0b0..b5edaeb 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://use-base_libdir-instead-of-hardcoded-lib.patch \
            file://lmbench_result_html_report.patch \
            file://fix-lmbench-memory-check-failure.patch \
+           file://lat_http-Use-puts-instead-of-printf-to-avoid-f.patch \
 "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
-- 
2.8.1


