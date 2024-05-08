Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A450C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 11:23:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9698.1715167430075857105
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 04:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PIbHgdJp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58581b9602=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4485s8Dp003672
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 May 2024 11:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=bdCv7
	n0z+Up5SMUkX1IYKS5puMtnFWK5CS+c8yTAv1g=; b=PIbHgdJpSoJ4g7yLLHgFt
	39zLp9QfHPq1M7yv+SxIkwDZIFfNovkAR2Kl2RVXnS/d+PTiWAn9FMLmdR5XWlUG
	xegTAxMgMlM7g3oSxRWiQ5J5LETOaaK6vY8GeIC+gXWV6Zk3k8BK5tnO+LXTQE8E
	i8WYFZjcpjMYH+68eUgHObOHQu+iZCeCDHb7jR+Y5koK0SKa6wJVg0JWpePE14kx
	WzM31DpnqWkcmAcVaAfL3GhIR4KCqBMa4p2w7UtESbqnV2dKsQ/IaKa8DgnDGGE7
	iG7gFSpbf8ghudEa0h3kFbRQ962gzE24OuRRs7Acl58bykfYHTbxgnvqKTxgmQDV
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xysjxrpdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 11:23:49 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 8 May 2024 04:23:46 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] php: Upgrade to 8.2.18
Date: Wed, 8 May 2024 11:23:29 +0000
Message-ID: <20240508112329.1522529-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: FYo6OASyGWtaEw-wmFSaADbOG1vGLkPA
X-Proofpoint-ORIG-GUID: FYo6OASyGWtaEw-wmFSaADbOG1vGLkPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_07,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 11:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110276

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


