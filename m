Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7509C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 04:08:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6647.1715746125731494693
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 21:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5865944998=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F3oTHE021874
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 04:08:45 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yn53qcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 04:08:44 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 14 May 2024 21:08:42 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] php: Upgrade to 8.2.18
Date: Wed, 15 May 2024 04:08:19 +0000
Message-ID: <20240515040819.3739982-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: wBP5hUm0CqEceRn7ASVO_G4rfPX4xbfP
X-Proofpoint-ORIG-GUID: wBP5hUm0CqEceRn7ASVO_G4rfPX4xbfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_16,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 04:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110400

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fixes for CVE-2024-3096, CVE-2024-2756 and other bugs.

Changelog:
https://www.php.net/ChangeLog-8.php#8.2.18

Rebase 0001-ext-opcache-config.m4-enable-opcache.patch to new version

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 ...ext-opcache-config.m4-enable-opcache.patch | 21 +++++++++++--------
 .../php/{php_8.2.16.bb => php_8.2.18.bb}      |  2 +-
 2 files changed, 13 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.16.bb => php_8.2.18.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
index a967d6412..c74369746 100644
--- a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
@@ -1,6 +1,6 @@
-From ca9b419f2c146061f73ee045cb0a069c18b40cd0 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 15 Dec 2021 14:00:08 +0800
+From 889583912ddd7abc628f2703892ec4884db6419a Mon Sep 17 00:00:00 2001
+From: Soumya Sambu <soumya.sambu@windriver.com>
+Date: Tue, 7 May 2024 08:39:16 +0000
 Subject: [PATCH 01/11] ext/opcache/config.m4: enable opcache
 
 We can't use AC_TRY_RUN to run programs in a cross compile
@@ -20,15 +20,18 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
 
 update patch to version 8.1.0
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+update patch to version 8.2.18
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
 ---
  ext/opcache/config.m4 | 204 ++----------------------------------------
  1 file changed, 8 insertions(+), 196 deletions(-)
 
 diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index 2a83fa2..9471b5d 100644
+index 6bf07ad3..5d645b86 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -108,209 +108,21 @@ if test "$PHP_OPCACHE" != "no"; then
+@@ -113,209 +113,21 @@ if test "$PHP_OPCACHE" != "no"; then
    AC_CHECK_FUNCS([mprotect])
  
    AC_MSG_CHECKING(for sysvipc shared memory support)
@@ -40,7 +43,7 @@ index 2a83fa2..9471b5d 100644
 -#include <unistd.h>
 -#include <string.h>
 -
--int main() {
+-int main(void) {
 -  pid_t pid;
 -  int status;
 -  int ipc_id;
@@ -121,7 +124,7 @@ index 2a83fa2..9471b5d 100644
 -# define MAP_FAILED ((void*)-1)
 -#endif
 -
--int main() {
+-int main(void) {
 -  pid_t pid;
 -  int status;
 -  char *shm;
@@ -185,7 +188,7 @@ index 2a83fa2..9471b5d 100644
 -# define MAP_FAILED ((void*)-1)
 -#endif
 -
--int main() {
+-int main(void) {
 -  pid_t pid;
 -  int status;
 -  int fd;
@@ -247,5 +250,5 @@ index 2a83fa2..9471b5d 100644
    PHP_NEW_EXTENSION(opcache,
  	ZendAccelerator.c \
 -- 
-2.17.1
+2.40.0
 
diff --git a/meta-oe/recipes-devtools/php/php_8.2.16.bb b/meta-oe/recipes-devtools/php/php_8.2.18.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.16.bb
rename to meta-oe/recipes-devtools/php/php_8.2.18.bb
index 1cb378fb9..da04ffba6 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.16.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.18.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "2658c1b8935ab6b53a7f209354602761ab07066e66920bc472b8815fd1b43f71"
+SRC_URI[sha256sum] = "ca0b07c254200320f518ac5b3df540a9cf14d866f3c93edc3013b52e06fac796"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.40.0


