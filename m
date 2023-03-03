Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EF9C6FA8E
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 01:01:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11820.1677805291299753404
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 17:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lS2JApBH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2426aef11b=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3230wUp5007619
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Mar 2023 01:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=zXFqnV5z8d7Be4HcR3imJig5CvwhRgJpmk+wD+vTNNQ=;
 b=lS2JApBHgBBXJ3ai0l3pnlgrXn47+ItfO5LAIEp3VDuptV/f5bLw4miiQz4v7buxsUSo
 hZbSWbly6j7gQzTeVZxk2Azlim0XqPtImpLltYOjrVHIUvjF5075Drqy6Zl65TFkv4xV
 nJbfvch0C4WBQEAP46K1senC7y09PaWZnVrqHGKZh0HEFKLV+2rv+zj95tSFAQGEt4OW
 W0k+EumNQxZc26xWjsSfeSCnoScHhd2OzLb2CZcJwERWZSpui1AQjqKVwYURw36IPHyq
 eW7kyh+YbbTJYgbB6j26AWxuo5g9O96oLl1mfh1CFD1SqJlyGFfMvh4Hk9LGeCqH/pV1 tg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwp45k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 01:01:30 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 2 Mar 2023 17:01:29 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 2 Mar 2023 17:01:28 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH] postgresql: fix CVE-2022-41862
Date: Fri, 3 Mar 2023 09:01:27 +0800
Message-ID: <20230303010127.3877884-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TBRA_xg3kMc0N5wLc1QTa9Ta72MYHUSv
X-Proofpoint-GUID: TBRA_xg3kMc0N5wLc1QTa9Ta72MYHUSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_15,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 01:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101339

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...rminate-GSS-receive-buffer-on-error-.patch | 50 +++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_14.5.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch
new file mode 100644
index 000000000..2d11b1888
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch
@@ -0,0 +1,50 @@
+From 586b074026d703c29057b04b1318e984701fe195 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 2 Mar 2023 19:10:47 +0800
+Subject: [PATCH] Properly NULL-terminate GSS receive buffer on error packet
+ reception
+
+pqsecure_open_gss() includes a code path handling error messages with
+v2-style protocol messages coming from the server.  The client-side
+buffer holding the error message does not force a NULL-termination, with
+the data of the server getting copied to the errorMessage of the
+connection.  Hence, it would be possible for a server to send an
+unterminated string and copy arbitrary bytes in the buffer receiving the
+error message in the client, opening the door to a crash or even data
+exposure.
+
+As at this stage of the authentication process the exchange has not been
+completed yet, this could be abused by an attacker without Kerberos
+credentials.  Clients that have a valid kerberos cache are vulnerable as
+libpq opportunistically requests for it except if gssencmode is
+disabled.
+
+Author: Jacob Champion
+Backpatch-through: 12
+Security: CVE-2022-41862
+
+Upstream-Status: Backport [https://github.com/postgres/postgres/commit/71c37797d7bd78266146a5829ab62b3687c47295]
+CVE: CVE-2022-41862
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/interfaces/libpq/fe-secure-gssapi.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/interfaces/libpq/fe-secure-gssapi.c b/src/interfaces/libpq/fe-secure-gssapi.c
+index c783a53..a42ebc0 100644
+--- a/src/interfaces/libpq/fe-secure-gssapi.c
++++ b/src/interfaces/libpq/fe-secure-gssapi.c
+@@ -577,7 +577,8 @@ pqsecure_open_gss(PGconn *conn)
+ 				return result;
+ 
+ 			PqGSSRecvLength += ret;
+-
++			Assert(PqGSSRecvLength < PQ_GSS_RECV_BUFFER_SIZE);
++			PqGSSRecvBuffer[PqGSSRecvLength] = '\0';
+ 			appendPQExpBuffer(&conn->errorMessage, "%s\n", PqGSSRecvBuffer + 1);
+ 
+ 			return PGRES_POLLING_FAILED;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
index 1551d3405..5eba1f7b4 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
@@ -9,6 +9,7 @@ SRC_URI += "\
    file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
    file://remove_duplicate.patch \
    file://0001-config_info.c-not-expose-build-info.patch \
+   file://0001-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch \
 "
 
 SRC_URI[sha256sum] = "d4f72cb5fb857c9a9f75ec8cf091a1771272802f2178f0b2e65b7b6ff64f4a30"
-- 
2.25.1


