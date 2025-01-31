Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB1BC02196
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 12:51:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18100.1738327889655646872
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 04:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4126352c6f=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VCks53029329
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 12:51:29 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44gf780q34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 12:51:28 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 31 Jan 2025 04:51:26 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 2/5] redis: fix CVE-2023-45145
Date: Fri, 31 Jan 2025 12:50:57 +0000
Message-ID: <20250131125100.3348102-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250131125100.3348102-1-divya.chellam@windriver.com>
References: <20250131125100.3348102-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=JOrBs9Kb c=1 sm=1 tr=0 ts=679cc750 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=7UKGVgRVAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=yN_tHXhYjEfibkU2S8cA:9 a=8Ox4Rr8FuIIqx5qz5MW0:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _I-6QBDaTlv8XWWTdaac2dQGv4Yz9c3B
X-Proofpoint-GUID: _I-6QBDaTlv8XWWTdaac2dQGv4Yz9c3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2501310098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 12:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115192

From: Divya Chellam <divya.chellam@windriver.com>

Redis is an in-memory database that persists on disk. On startup,
Redis begins listening on a Unix socket before adjusting its
permissions to the user-provided configuration. If a permissive
umask(2) is used, this creates a race condition that enables,
during a short period of time, another process to establish an
otherwise unauthorized connection. This problem has existed
since Redis 2.6.0-RC1. This issue has been addressed in Redis
versions 7.2.2, 7.0.14 and 6.2.14. Users are advised to upgrade.
For users unable to upgrade, it is possible to work around the
problem by disabling Unix sockets, starting Redis with a restrictive
umask, or storing the Unix socket file in a protected directory.

Reference:
https://security-tracker.debian.org/tracker/CVE-2023-45145

Upstream-patch:
https://github.com/redis/redis/commit/7f486ea6eebf0afce74f2e59763b9b82b78629dc

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../redis/redis-7.0.13/CVE-2023-45145.patch   | 72 +++++++++++++++++++
 .../redis/redis/CVE-2023-45145.patch          | 72 +++++++++++++++++++
 .../recipes-extended/redis/redis_6.2.12.bb    |  1 +
 .../recipes-extended/redis/redis_7.0.13.bb    |  1 +
 4 files changed, 146 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-45145.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2023-45145.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-45145.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-45145.patch
new file mode 100644
index 0000000000..aab1bbfeb0
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-45145.patch
@@ -0,0 +1,72 @@
+From 7f486ea6eebf0afce74f2e59763b9b82b78629dc Mon Sep 17 00:00:00 2001
+From: Yossi Gottlieb <yossigo@gmail.com>
+Date: Wed, 11 Oct 2023 22:45:34 +0300
+Subject: [PATCH] Fix issue of listen before chmod on Unix sockets 
+ (CVE-2023-45145)
+
+Before this commit, Unix socket setup performed chmod(2) on the socket
+file after calling listen(2). Depending on what umask is used, this
+could leave the file with the wrong permissions for a short period of
+time. As a result, another process could exploit this race condition and
+establish a connection that would otherwise not be possible.
+
+We now make sure the socket permissions are set up prior to calling
+listen(2).
+
+(cherry picked from commit a11b3bc34a054818f2ac70e50adfc542ca1cba42)
+
+CVE: CVE-2023-45145
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/7f486ea6eebf0afce74f2e59763b9b82b78629dc]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/anet.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/anet.c b/src/anet.c
+index 4ea201d..10840fc 100644
+--- a/src/anet.c
++++ b/src/anet.c
+@@ -407,13 +407,16 @@ int anetUnixGenericConnect(char *err, const char *path, int flags)
+     return s;
+ }
+ 
+-static int anetListen(char *err, int s, struct sockaddr *sa, socklen_t len, int backlog) {
++static int anetListen(char *err, int s, struct sockaddr *sa, socklen_t len, int backlog, mode_t perm) {
+     if (bind(s,sa,len) == -1) {
+         anetSetError(err, "bind: %s", strerror(errno));
+         close(s);
+         return ANET_ERR;
+     }
+ 
++    if (sa->sa_family == AF_LOCAL && perm)
++        chmod(((struct sockaddr_un *) sa)->sun_path, perm);
++
+     if (listen(s, backlog) == -1) {
+         anetSetError(err, "listen: %s", strerror(errno));
+         close(s);
+@@ -457,7 +460,7 @@ static int _anetTcpServer(char *err, int port, char *bindaddr, int af, int backl
+ 
+         if (af == AF_INET6 && anetV6Only(err,s) == ANET_ERR) goto error;
+         if (anetSetReuseAddr(err,s) == ANET_ERR) goto error;
+-        if (anetListen(err,s,p->ai_addr,p->ai_addrlen,backlog) == ANET_ERR) s = ANET_ERR;
++        if (anetListen(err,s,p->ai_addr,p->ai_addrlen,backlog,0) == ANET_ERR) s = ANET_ERR;
+         goto end;
+     }
+     if (p == NULL) {
+@@ -498,10 +501,8 @@ int anetUnixServer(char *err, char *path, mode_t perm, int backlog)
+     memset(&sa,0,sizeof(sa));
+     sa.sun_family = AF_LOCAL;
+     strncpy(sa.sun_path,path,sizeof(sa.sun_path)-1);
+-    if (anetListen(err,s,(struct sockaddr*)&sa,sizeof(sa),backlog) == ANET_ERR)
++    if (anetListen(err,s,(struct sockaddr*)&sa,sizeof(sa),backlog,perm) == ANET_ERR)
+         return ANET_ERR;
+-    if (perm)
+-        chmod(sa.sun_path, perm);
+     return s;
+ }
+ 
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2023-45145.patch b/meta-oe/recipes-extended/redis/redis/CVE-2023-45145.patch
new file mode 100644
index 0000000000..f132deb83a
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/CVE-2023-45145.patch
@@ -0,0 +1,72 @@
+From 7f486ea6eebf0afce74f2e59763b9b82b78629dc Mon Sep 17 00:00:00 2001
+From: Yossi Gottlieb <yossigo@gmail.com>
+Date: Wed, 11 Oct 2023 22:45:34 +0300
+Subject: [PATCH] Fix issue of listen before chmod on Unix sockets 
+ (CVE-2023-45145)
+
+Before this commit, Unix socket setup performed chmod(2) on the socket
+file after calling listen(2). Depending on what umask is used, this
+could leave the file with the wrong permissions for a short period of
+time. As a result, another process could exploit this race condition and
+establish a connection that would otherwise not be possible.
+
+We now make sure the socket permissions are set up prior to calling
+listen(2).
+
+(cherry picked from commit a11b3bc34a054818f2ac70e50adfc542ca1cba42)
+
+CVE: CVE-2023-45145
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/7f486ea6eebf0afce74f2e59763b9b82b78629dc]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/anet.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/anet.c b/src/anet.c
+index a121c27..91f6171 100644
+--- a/src/anet.c
++++ b/src/anet.c
+@@ -397,13 +397,16 @@ int anetUnixGenericConnect(char *err, const char *path, int flags)
+     return s;
+ }
+ 
+-static int anetListen(char *err, int s, struct sockaddr *sa, socklen_t len, int backlog) {
++static int anetListen(char *err, int s, struct sockaddr *sa, socklen_t len, int backlog, mode_t perm) {
+     if (bind(s,sa,len) == -1) {
+         anetSetError(err, "bind: %s", strerror(errno));
+         close(s);
+         return ANET_ERR;
+     }
+ 
++    if (sa->sa_family == AF_LOCAL && perm)
++        chmod(((struct sockaddr_un *) sa)->sun_path, perm);
++
+     if (listen(s, backlog) == -1) {
+         anetSetError(err, "listen: %s", strerror(errno));
+         close(s);
+@@ -447,7 +450,7 @@ static int _anetTcpServer(char *err, int port, char *bindaddr, int af, int backl
+ 
+         if (af == AF_INET6 && anetV6Only(err,s) == ANET_ERR) goto error;
+         if (anetSetReuseAddr(err,s) == ANET_ERR) goto error;
+-        if (anetListen(err,s,p->ai_addr,p->ai_addrlen,backlog) == ANET_ERR) s = ANET_ERR;
++        if (anetListen(err,s,p->ai_addr,p->ai_addrlen,backlog,0) == ANET_ERR) s = ANET_ERR;
+         goto end;
+     }
+     if (p == NULL) {
+@@ -484,10 +487,8 @@ int anetUnixServer(char *err, char *path, mode_t perm, int backlog)
+     memset(&sa,0,sizeof(sa));
+     sa.sun_family = AF_LOCAL;
+     strncpy(sa.sun_path,path,sizeof(sa.sun_path)-1);
+-    if (anetListen(err,s,(struct sockaddr*)&sa,sizeof(sa),backlog) == ANET_ERR)
++    if (anetListen(err,s,(struct sockaddr*)&sa,sizeof(sa),backlog,perm) == ANET_ERR)
+         return ANET_ERR;
+-    if (perm)
+-        chmod(sa.sun_path, perm);
+     return s;
+ }
+ 
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.12.bb b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
index 3ed6867816..52dcffedb8 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
+           file://CVE-2023-45145.patch \
            "
 SRC_URI[sha256sum] = "75352eef41e97e84bfa94292cbac79e5add5345fc79787df5cbdff703353fb1b"
 
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index dc5f9b7a89..caccf01f64 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            file://CVE-2023-41056.patch \
+           file://CVE-2023-45145.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.40.0


