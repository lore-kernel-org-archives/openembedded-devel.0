Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37194C7EE43
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:33:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14968.1686321211624948287
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jun 2023 07:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BTEgiZ+z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5524cb4a3f=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359CUa2g018748
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jun 2023 07:33:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=lQfJnsHXpXHXkh92pTf/gJWzfDyHTvgiSaalnmgyoEI=;
 b=BTEgiZ+z8WqVxQbOVxzxnDN+vEj/C2jP7Dm8h7D1USGm82BJjwLx5AIsoMtUPIrhvo7k
 KXb3ESJSXX9lw2ELDpE/sorLDpoD28Gjrrl9zkAGjzPs+lnJXwSK7BlttX6ALCyCpf6I
 jkFA/ei6eIBiCLdfZtuUq6EiNkFQHF3sZahHCrcb8m8h8t4uVaJ5bhP/apEh4ZOVn5RS
 Z7Ysu1Tlwo8X7PWEpvJQqV94igwfTNKcbE+CYeONZxPnD8hY0CirnZ7fqkwNKR55El7M
 D0YFCAyN4ap8SrhEOLNk4hF20UTxcYdMx2yBuoCzobgd9cWAzvCVZuSQKswxp2Hr64BK Mw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2av7arec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 07:33:31 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 07:33:28 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>, <yogita.urade@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] c-ares: fix CVE-2023-32067
Date: Fri, 9 Jun 2023 14:33:10 +0000
Message-ID: <20230609143310.3515700-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: MQJ6oUETAL0xOsphQ64rsS8xDF-EItwf
X-Proofpoint-GUID: MQJ6oUETAL0xOsphQ64rsS8xDF-EItwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_10,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306090122
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 14:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103199

c-ares is an asynchronous resolver library. c-ares is vulnerable
to denial of service. If a target resolver sends a query, the attacker
forges a malformed UDP packet with a length of 0 and returns them to
the target resolver. The target resolver erroneously interprets the 0
length as a graceful shutdown of the connection. This issue has been
patched in version 1.19.1.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-32067
https://github.com/c-ares/c-ares/security/advisories/GHSA-9g78-jv2r-p7vc

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../c-ares/c-ares/CVE-2023-32067.patch        | 87 +++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.18.1.bb   |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
new file mode 100644
index 000000000..cd13e7d9e
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
@@ -0,0 +1,87 @@
+From b9b8413cfdb70a3f99e1573333b23052d57ec1ae Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Mon, 22 May 2023 06:51:49 -0400
+Subject: [PATCH] Merge pull request from GHSA-9g78-jv2r-p7vc
+
+CVE: CVE-2023-32067
+
+Upstream Status: Backport
+[https://github.com/c-ares/c-ares/commit/b9b8413cfdb70a3f99e1573333b23052d57ec1ae]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/lib/ares_process.c | 41 +++++++++++++++++++++++++----------------
+ 1 file changed, 25 insertions(+), 16 deletions(-)
+
+diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
+index bf0cde4..6cac0a9 100644
+--- a/src/lib/ares_process.c
++++ b/src/lib/ares_process.c
+@@ -470,7 +470,7 @@ static void read_udp_packets(ares_channel channel, fd_set *read_fds,
+ {
+   struct server_state *server;
+   int i;
+-  ares_ssize_t count;
++  ares_ssize_t read_len;
+   unsigned char buf[MAXENDSSZ + 1];
+ #ifdef HAVE_RECVFROM
+   ares_socklen_t fromlen;
+@@ -513,32 +513,41 @@ static void read_udp_packets(ares_channel channel, fd_set *read_fds,
+       /* To reduce event loop overhead, read and process as many
+        * packets as we can. */
+       do {
+-        if (server->udp_socket == ARES_SOCKET_BAD)
+-          count = 0;
+-
+-        else {
+-          if (server->addr.family == AF_INET)
++        if (server->udp_socket == ARES_SOCKET_BAD) {
++          read_len = -1;
++        } else {
++          if (server->addr.family == AF_INET) {
+             fromlen = sizeof(from.sa4);
+-          else
++          } else {
+             fromlen = sizeof(from.sa6);
+-          count = socket_recvfrom(channel, server->udp_socket, (void *)buf,
+-                                  sizeof(buf), 0, &from.sa, &fromlen);
++          }
++          read_len = socket_recvfrom(channel, server->udp_socket, (void *)buf,
++                                     sizeof(buf), 0, &from.sa, &fromlen);
+         }
+
+-        if (count == -1 && try_again(SOCKERRNO))
++        if (read_len == 0) {
++          /* UDP is connectionless, so result code of 0 is a 0-length UDP
++           * packet, and not an indication the connection is closed like on
++           * tcp */
+           continue;
+-        else if (count <= 0)
++        } else if (read_len < 0) {
++          if (try_again(SOCKERRNO))
++            continue;
++
+           handle_error(channel, i, now);
++
+ #ifdef HAVE_RECVFROM
+-        else if (!same_address(&from.sa, &server->addr))
++        } else if (!same_address(&from.sa, &server->addr)) {
+           /* The address the response comes from does not match the address we
+            * sent the request to. Someone may be attempting to perform a cache
+            * poisoning attack. */
+-          break;
++          continue;
+ #endif
+-        else
+-          process_answer(channel, buf, (int)count, i, 0, now);
+-       } while (count > 0);
++
++        } else {
++          process_answer(channel, buf, (int)read_len, i, 0, now);
++        }
++      } while (read_len >= 0);
+     }
+ }
+
+--
+2.40.0
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
index 5614d1310..e1b6305b3 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
 SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
            file://CVE-2022-4904.patch \
+           file://CVE-2023-32067.patch \
           "
 SRCREV = "2aa086f822aad5017a6f2061ef656f237a62d0ed"
 
-- 
2.40.0


