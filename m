Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CEAEF4ECD
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 11:55:16 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53310.1775476512375310499
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 04:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EMZxZ4KG;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8117; q=dns/txt;
  s=iport01; t=1775476512; x=1776686112;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f4M9MndZ8I9TFYunn/lbfFEgFvS/cLegaH6efCciirI=;
  b=EMZxZ4KGDn0qVwi19pitnFvF5Jg3gv5BrQw20IhGJ6tWKK3fOnuAIcTG
   ftrFScY4en5V8UfYYrN0vUZVwu00pqZyQFYEGj7axY1P7keyIYxluNhLn
   GFcXZuJZcrxnI3iZqXKltD0ft17BU2U83y1PfGiiMpj+LFvJr+lgkbwed
   IkZTN2Bop/DVAMopk9Bt+K8QKHK5tRf9qnEQbEwCGK4qgvtD1hPeOjSdH
   UIr8QOvUwlzkWgYffSJ6PDRJH9Rw8Nz1je++Vo3h6mVS0Tymq4XtkZ1aj
   4DK1+xQIvTmMrEHbkkfxqi4mZQBBwkBBzMJo/3FVmPir3auBATHq7sUhL
   w==;
X-CSE-ConnectionGUID: LciztflzRvS0Cc0rVixyPw==
X-CSE-MsgGUID: YRU1Xa0aS3effd7b0iA5Ug==
X-IPAS-Result: =?us-ascii?q?A0DHAgD2ndNp/43/Ja1aglmCV3FfQkkDlCeCIZ4dgX8PA?=
 =?us-ascii?q?QEBD0QNBAEBkjMCJjUIDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBOAEYAVkDAQJaIyGDAgGCcwIBEbYSgiyBAYMoATEFCQICQ?=
 =?us-ascii?q?AFP2yYBCxQBgTiFPogcWxgBhHonGxuBcoEVg2iBBYFcAgIBF4gKBIIigQ6BY?=
 =?us-ascii?q?R6BaQaETYdfSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgUuGS?=
 =?us-ascii?q?nRtgRODd2YDCxgNSBEsNxQbBD5uB4shJ4I2ZycBExgXgX0YERGlUqEOCiiDd?=
 =?us-ascii?q?IwelToaM6oEZ5kGjgmWUIRogWoBOYFZcBWDIglJGQ+OLQsLiHHAbyM1AgkDM?=
 =?us-ascii?q?AEHAgcOAoFzkX0BAQ?=
IronPort-Data: A9a23:3MnHSqqb5uPjH4iGyXQrLum4rxNeBmJIZBIvgKrLsJaIsI4StFCzt
 garIBnUM/ffamWmKt53YYy/9UxUvZOHmoJkHgA//HhgFHxGpePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfrf8E035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sJ8AHNS+
 /gKEi42NjuI3/iIwaKqcvY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Wo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUfrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TVHJ0Ixh7I/
 T6uE2LRMysnbeyWkTO+qX+iiOOQl3v6cd8vG+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMIBgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaY0D58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:pckt1qv3qhZ1UWvC929roaIM7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:Ofh7DW+tVg94bJ1+tCGVv2ofG9I5fHnP9mnre2SzUXxXSa2EcUDFrQ==
X-Talos-MUID: 9a23:tZx4aQqzRo5P+MsBgfwezwBYCZ5Y6vynMxsAn5sK5MPcNAUtBjjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,163,1770595200"; 
   d="scan'208";a="710500834"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Apr 2026 11:55:11 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 3E12F180001B5
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Apr 2026 11:55:11 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id DFCCBCC12B5; Mon,  6 Apr 2026 04:55:10 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][whinlatter][PATCH 1/3] libssh: Fix CVE-2026-0968
Date: Mon,  6 Apr 2026 04:54:54 -0700
Message-Id: <20260406115454.1241643-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 11:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126035

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] and [2] as mentioned in [3]

[1] https://git.libssh.org/projects/libssh.git/commit/?id=796d85f786dff62bd4bcc4408d9b7bbc855841e9
[2] https://git.libssh.org/projects/libssh.git/commit/?id=212121971fb26e1e00b72bd5402c0454a4d84c03
[3] https://security-tracker.debian.org/tracker/CVE-2026-0968

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../libssh/libssh/CVE-2026-0968_p1.patch      |  64 +++++++++
 .../libssh/libssh/CVE-2026-0968_p2.patch      | 132 ++++++++++++++++++
 .../recipes-support/libssh/libssh_0.11.3.bb   |   2 +
 3 files changed, 198 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p2.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p1.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p1.patch
new file mode 100644
index 0000000000..97ae88b2be
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p1.patch
@@ -0,0 +1,64 @@
+From 14a1c80ce06cd2c3e4798ec08b25a55ddaf95076 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 22 Dec 2025 20:59:11 +0100
+Subject: [PATCH 1/4] CVE-2026-0968: sftp: Sanitize input handling in
+ sftp_parse_longname()
+
+CVE: CVE-2026-0968
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=796d85f786dff62bd4bcc4408d9b7bbc855841e9]
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit 20856f44c146468c830da61dcbbbaa8ce71e390b)
+(cherry picked from commit 796d85f786dff62bd4bcc4408d9b7bbc855841e9)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/sftp_common.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/src/sftp_common.c b/src/sftp_common.c
+index 13512b8d..b05597d8 100644
+--- a/src/sftp_common.c
++++ b/src/sftp_common.c
+@@ -461,16 +461,21 @@ static char * sftp_parse_longname(const char *longname,
+     const char *p, *q;
+     size_t len, field = 0;
+ 
++    if (longname == NULL || longname_field < SFTP_LONGNAME_PERM ||
++        longname_field > SFTP_LONGNAME_NAME) {
++        return NULL;
++    }
++
+     p = longname;
+     /*
+      * Find the beginning of the field which is specified
+      * by sftp_longname_field_e.
+      */
+-    while (field != longname_field) {
++    while (*p != '\0' && field != longname_field) {
+         if (isspace(*p)) {
+             field++;
+             p++;
+-            while (*p && isspace(*p)) {
++            while (*p != '\0' && isspace(*p)) {
+                 p++;
+             }
+         } else {
+@@ -478,8 +483,13 @@ static char * sftp_parse_longname(const char *longname,
+         }
+     }
+ 
++    /* If we reached NULL before we got our field fail */
++    if (field != longname_field) {
++        return NULL;
++    }
++
+     q = p;
+-    while (! isspace(*q)) {
++    while (*q != '\0' && !isspace(*q)) {
+         q++;
+     }
+ 
+-- 
+2.51.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p2.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p2.patch
new file mode 100644
index 0000000000..6de0d6cb3d
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0968_p2.patch
@@ -0,0 +1,132 @@
+From 5ad81f0514bf547055fd17dd4ca05121f1e512c9 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 22 Dec 2025 21:00:03 +0100
+Subject: [PATCH 2/4] CVE-2026-0968 tests: Reproducer for invalid longname data
+
+CVE: CVE-2026-0968
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=212121971fb26e1e00b72bd5402c0454a4d84c03]
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit 90a5d8f47399e8db61b56793cd21476ff6a528e0)
+(cherry picked from commit 212121971fb26e1e00b72bd5402c0454a4d84c03)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ tests/unittests/CMakeLists.txt      |  7 +++
+ tests/unittests/torture_unit_sftp.c | 86 +++++++++++++++++++++++++++++
+ 2 files changed, 93 insertions(+)
+ create mode 100644 tests/unittests/torture_unit_sftp.c
+
+diff --git a/tests/unittests/CMakeLists.txt b/tests/unittests/CMakeLists.txt
+index 79f3856c..53478af9 100644
+--- a/tests/unittests/CMakeLists.txt
++++ b/tests/unittests/CMakeLists.txt
+@@ -98,6 +98,13 @@ if (UNIX AND NOT WIN32)
+     endif (WITH_SERVER)
+ endif (UNIX AND NOT WIN32)
+ 
++if (WITH_SFTP)
++    set(LIBSSH_UNIT_TESTS
++        ${LIBSSH_UNIT_TESTS}
++        torture_unit_sftp
++    )
++endif (WITH_SFTP)
++
+ foreach(_UNIT_TEST ${LIBSSH_UNIT_TESTS})
+     add_cmocka_test(${_UNIT_TEST}
+                     SOURCES ${_UNIT_TEST}.c
+diff --git a/tests/unittests/torture_unit_sftp.c b/tests/unittests/torture_unit_sftp.c
+new file mode 100644
+index 00000000..12940039
+--- /dev/null
++++ b/tests/unittests/torture_unit_sftp.c
+@@ -0,0 +1,86 @@
++#include "config.h"
++
++#include "sftp_common.c"
++#include "torture.h"
++
++#define LIBSSH_STATIC
++
++static void test_sftp_parse_longname(void **state)
++{
++    const char *lname = NULL;
++    char *value = NULL;
++
++    /* state not used */
++    (void)state;
++
++    /* Valid example from SFTP draft, page 18:
++     * https://datatracker.ietf.org/doc/draft-spaghetti-sshm-filexfer/
++     */
++    lname = "-rwxr-xr-x   1 mjos     staff      348911 Mar 25 14:29 t-filexfer";
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_PERM);
++    assert_string_equal(value, "-rwxr-xr-x");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_OWNER);
++    assert_string_equal(value, "mjos");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_GROUP);
++    assert_string_equal(value, "staff");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_SIZE);
++    assert_string_equal(value, "348911");
++    free(value);
++    /* This function is broken further as the date contains space which breaks
++     * the parsing altogether */
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_DATE);
++    assert_string_equal(value, "Mar");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_TIME);
++    assert_string_equal(value, "25");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_NAME);
++    assert_string_equal(value, "14:29");
++    free(value);
++}
++
++static void test_sftp_parse_longname_invalid(void **state)
++{
++    const char *lname = NULL;
++    char *value = NULL;
++
++    /* state not used */
++    (void)state;
++
++    /* Invalid inputs should not crash
++     */
++    lname = NULL;
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_PERM);
++    assert_null(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_NAME);
++    assert_null(value);
++
++    lname = "";
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_PERM);
++    assert_string_equal(value, "");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_NAME);
++    assert_null(value);
++
++    lname = "-rwxr-xr-x   1";
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_PERM);
++    assert_string_equal(value, "-rwxr-xr-x");
++    free(value);
++    value = sftp_parse_longname(lname, SFTP_LONGNAME_NAME);
++    assert_null(value);
++}
++
++int torture_run_tests(void)
++{
++    int rc;
++    const struct CMUnitTest tests[] = {
++        cmocka_unit_test(test_sftp_parse_longname),
++        cmocka_unit_test(test_sftp_parse_longname_invalid),
++    };
++
++    rc = cmocka_run_group_tests(tests, NULL, NULL);
++    return rc;
++}
+-- 
+2.51.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
index ab47931fa3..1d4fd637d9 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
@@ -11,6 +11,8 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://run-ptest \
            file://CVE-2026-3731_p1.patch \
            file://CVE-2026-3731_p2.patch \
+           file://CVE-2026-0968_p1.patch \
+           file://CVE-2026-0968_p2.patch \
           "
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
-- 
2.35.6


