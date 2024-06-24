Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D24C27C4F
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 02:29:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.131629.1719196170358385483
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jun 2024 19:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6905cb426c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O2OLxo013760
	for <openembedded-devel@lists.openembedded.org>; Sun, 23 Jun 2024 19:29:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fryax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 23 Jun 2024 19:29:29 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 23 Jun 2024 19:29:27 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] php: Fix CVE-2024-5458
Date: Mon, 24 Jun 2024 02:29:11 +0000
Message-ID: <20240624022912.3676541-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: oC8HFtTYkNGO82W2HzMTw9xv-eWO9put
X-Proofpoint-ORIG-GUID: oC8HFtTYkNGO82W2HzMTw9xv-eWO9put
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_01,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406240019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 02:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110999

From: Soumya Sambu <soumya.sambu@windriver.com>

In PHP versions 8.1.* before 8.1.29, 8.2.* before 8.2.20, 8.3.* before 8.3.8,
due to a code logic error, filtering functions such as filter_var when
validating URLs (FILTER_VALIDATE_URL) for certain types of URLs the function
will result in invalid user information (username + password part of URLs)
being treated as valid user information. This may lead to the downstream code
accepting invalid URLs as valid and parsing them incorrectly.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-5458

Upstream-patches:
https://github.com/php/php-src/commit/c7486130d97d592aee8809a5bce97e11deac94a5

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../php/php/CVE-2024-5458.patch               | 153 ++++++++++++++++++
 meta-oe/recipes-devtools/php/php_8.2.18.bb    |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2024-5458.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2024-5458.patch b/meta-oe/recipes-devtools/php/php/CVE-2024-5458.patch
new file mode 100644
index 000000000..8f139f0cc
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2024-5458.patch
@@ -0,0 +1,153 @@
+From 7e0e3cc820c493301409a0ce2b6ef95e0ab06b0c Mon Sep 17 00:00:00 2001
+From: Niels Dossche <7771979+nielsdos@users.noreply.github.com>
+Date: Wed, 22 May 2024 22:25:02 +0200
+Subject: [PATCH] Fix GHSA-w8qr-v226-r27w
+
+We should not early-out with success status if we found an ipv6
+hostname, we should keep checking the rest of the conditions.
+Because integrating the if-check of the ipv6 hostname in the
+"Validate domain" if-check made the code hard to read, I extracted the
+condition out to a separate function. This also required to make
+a few pointers const in order to have some clean code.
+
+CVE: CVE-2024-5458
+
+Upstream-Status: Backport [https://github.com/php/php-src/commit/7e0e3cc820c493301409a0ce2b6ef95e0ab06b0c]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ ext/filter/logical_filters.c              | 35 ++++++++++---------
+ ext/filter/tests/ghsa-w8qr-v226-r27w.phpt | 41 +++++++++++++++++++++++
+ 2 files changed, 61 insertions(+), 15 deletions(-)
+ create mode 100644 ext/filter/tests/ghsa-w8qr-v226-r27w.phpt
+
+diff --git a/ext/filter/logical_filters.c b/ext/filter/logical_filters.c
+index 3f58b2a3..ca8e65c1 100644
+--- a/ext/filter/logical_filters.c
++++ b/ext/filter/logical_filters.c
+@@ -89,7 +89,7 @@
+ #define FORMAT_IPV4    4
+ #define FORMAT_IPV6    6
+
+-static int _php_filter_validate_ipv6(char *str, size_t str_len, int ip[8]);
++static int _php_filter_validate_ipv6(const char *str, size_t str_len, int ip[8]);
+
+ static int php_filter_parse_int(const char *str, size_t str_len, zend_long *ret) { /* {{{ */
+	zend_long ctx_value;
+@@ -580,6 +580,14 @@ static int is_userinfo_valid(zend_string *str)
+	return 1;
+ }
+
++static bool php_filter_is_valid_ipv6_hostname(const char *s, size_t l)
++{
++	const char *e = s + l;
++	const char *t = e - 1;
++
++	return *s == '[' && *t == ']' && _php_filter_validate_ipv6(s + 1, l - 2, NULL);
++}
++
+ void php_filter_validate_url(PHP_INPUT_FILTER_PARAM_DECL) /* {{{ */
+ {
+	php_url *url;
+@@ -600,7 +608,7 @@ void php_filter_validate_url(PHP_INPUT_FILTER_PARAM_DECL) /* {{{ */
+
+	if (url->scheme != NULL &&
+		(zend_string_equals_literal_ci(url->scheme, "http") || zend_string_equals_literal_ci(url->scheme, "https"))) {
+-		char *e, *s, *t;
++		const char *s;
+		size_t l;
+
+		if (url->host == NULL) {
+@@ -609,17 +617,14 @@ void php_filter_validate_url(PHP_INPUT_FILTER_PARAM_DECL) /* {{{ */
+
+		s = ZSTR_VAL(url->host);
+		l = ZSTR_LEN(url->host);
+-		e = s + l;
+-		t = e - 1;
+-
+-		/* An IPv6 enclosed by square brackets is a valid hostname */
+-		if (*s == '[' && *t == ']' && _php_filter_validate_ipv6((s + 1), l - 2, NULL)) {
+-			php_url_free(url);
+-			return;
+-		}
+
+-		// Validate domain
+-		if (!_php_filter_validate_domain(ZSTR_VAL(url->host), l, FILTER_FLAG_HOSTNAME)) {
++		if (
++			/* An IPv6 enclosed by square brackets is a valid hostname.*/
++			!php_filter_is_valid_ipv6_hostname(s, l) &&
++			/* Validate domain.
++			 * This includes a loose check for an IPv4 address. */
++			!_php_filter_validate_domain(ZSTR_VAL(url->host), l, FILTER_FLAG_HOSTNAME)
++		) {
+			php_url_free(url);
+			RETURN_VALIDATION_FAILED
+		}
+@@ -753,15 +758,15 @@ static int _php_filter_validate_ipv4(char *str, size_t str_len, int *ip) /* {{{
+ }
+ /* }}} */
+
+-static int _php_filter_validate_ipv6(char *str, size_t str_len, int ip[8]) /* {{{ */
++static int _php_filter_validate_ipv6(const char *str, size_t str_len, int ip[8]) /* {{{ */
+ {
+	int compressed_pos = -1;
+	int blocks = 0;
+	int num, n, i;
+	char *ipv4;
+-	char *end;
++	const char *end;
+	int ip4elm[4];
+-	char *s = str;
++	const char *s = str;
+
+	if (!memchr(str, ':', str_len)) {
+		return 0;
+diff --git a/ext/filter/tests/ghsa-w8qr-v226-r27w.phpt b/ext/filter/tests/ghsa-w8qr-v226-r27w.phpt
+new file mode 100644
+index 00000000..0092408e
+--- /dev/null
++++ b/ext/filter/tests/ghsa-w8qr-v226-r27w.phpt
+@@ -0,0 +1,41 @@
++--TEST--
++GHSA-w8qr-v226-r27w
++--EXTENSIONS--
++filter
++--FILE--
++<?php
++
++function test(string $input) {
++    var_dump(filter_var($input, FILTER_VALIDATE_URL));
++}
++
++echo "--- These ones should fail ---\n";
++test("http://t[est@127.0.0.1");
++test("http://t[est@[::1]");
++test("http://t[est@[::1");
++test("http://t[est@::1]");
++test("http://php.net\\@aliyun.com/aaa.do");
++test("http://test[@2001:db8:3333:4444:5555:6666:1.2.3.4]");
++test("http://te[st@2001:db8:3333:4444:5555:6666:1.2.3.4]");
++test("http://te[st@2001:db8:3333:4444:5555:6666:1.2.3.4");
++
++echo "--- These ones should work ---\n";
++test("http://test@127.0.0.1");
++test("http://test@[2001:db8:3333:4444:5555:6666:1.2.3.4]");
++test("http://test@[::1]");
++
++?>
++--EXPECT--
++--- These ones should fail ---
++bool(false)
++bool(false)
++bool(false)
++bool(false)
++bool(false)
++bool(false)
++bool(false)
++bool(false)
++--- These ones should work ---
++string(21) "http://test@127.0.0.1"
++string(50) "http://test@[2001:db8:3333:4444:5555:6666:1.2.3.4]"
++string(17) "http://test@[::1]"
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/php/php_8.2.18.bb b/meta-oe/recipes-devtools/php/php_8.2.18.bb
index da04ffba6..45ae8936c 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.18.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.18.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0009-php-don-t-use-broken-wrapper-for-mkdir.patch \
            file://0010-iconv-fix-detection.patch \
            file://0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch \
+           file://CVE-2024-5458.patch \
           "
 
 SRC_URI:append:class-target = " \
-- 
2.40.0


