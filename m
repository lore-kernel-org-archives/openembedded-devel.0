Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4860CCED619
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 11:21:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10064.1763464875899660462
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 03:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Zsp3N+kS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34175f61ef=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI7CTEp3195615
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 03:21:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+24urzg+yB9qmkfkPokJ
	n4WUUNGunFu/F2LqYpup+r8=; b=Zsp3N+kSM5Pbu1GwfJ9ql/DgDkJFq2aDuRqT
	DGw37vPXBWYUpk+Yw5lTtsloEC31AQT/HUJMY8AHwNcAD5RF/bF5TFu9C/LqBJWK
	70wjemgw8kEXryHV6PVngacE3DsfUhfevOazwTL3AMvS3GJsfDp25h2CknQsT1px
	yRmjwzqFho8P7w/+0gf6WVU9ICMHdRrYgsO41Uh5yVaFdDF4mCDX5/i7XSGOkmxx
	0iWVxS8uLPydRCQOKzHo5+xzaPNLmbQRiJ8dFvHCZqqAABk5bQv3yHdK2jlyE0IG
	eBvSB3PldT6lGZ6hxOu8YAW3ewvqyC+Owvbzl2cDn73iqPB7hA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjb5jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 03:21:15 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 18 Nov 2025 03:21:13 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] libssh : fix CVE-2025-8114
Date: Tue, 18 Nov 2025 16:50:48 +0530
Message-ID: <20251118112048.2681490-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691c56ab cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=xNf9USuDAAAA:8 a=nar8ntqeAAAA:8 a=t7CeM3EgAAAA:8 a=_9gtbkrcAAAA:8
 a=20KFwNOVAAAA:8 a=VOQ0xBVWDwa2k0qS6gIA:9 a=RptMqvEBejqe73AKBt4K:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=mzAfeOUevkGYtpgvwSZb:22
X-Proofpoint-GUID: qqGcKbhe6VTo4VqV-LW3jlQ5y796qiu6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA5MCBTYWx0ZWRfX7ROBlA1wfW4/
 +jImKx4OEUUqcYs4RQqNirYCsIX4FWyXdpVB0Bcuei7qi6SgwdeRCv4mziAjUfdw+mYAmRyDIYe
 cPy+pXi8VeGX6k7cP4YwucoCVK6iTKaBHLxnAylWo4J+AmmpGd/uZLBjAZNMAtlD2pZETq1y8ml
 /1azwiwY+pIEbGG+cHzgdv+kHKlCrp44E2CUyPqmkDVoOG5QYdhJvdzwR/7XJs/KLmA8Wf626qk
 v5jJ+YZU9hxR5JFCY4dw6oLmTLXZtTOBhUNI25TdV+RC503KNsvc3D4offtrTZTi5GdQ3Ja7Iq1
 5L2NWdrs/xMkjSMhVLMY0nmNbOECBafNv7aIGY17WAmMnmvbfnXTXhHlf5n1ZnOE4mwNL4VxRMa
 px9LOvrFUMktnuWkp3XZqyDKztpz4w==
X-Proofpoint-ORIG-GUID: qqGcKbhe6VTo4VqV-LW3jlQ5y796qiu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180090
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 11:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121858

From: Divya Chellam <divya.chellam@windriver.com>

A flaw was found in libssh, a library that implements the SSH protocol.
When calculating the session ID during the key exchange (KEX) process,
an allocation failure in cryptographic functions may lead to a NULL
pointer dereference. This issue can cause the client or server to crash.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-8114

Upstream-patch:
https://git.libssh.org/projects/libssh.git/commit/?id=53ac23ded4cb2c5463f6c4cd1525331bd578812d

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../libssh/libssh/CVE-2025-8114.patch         | 50 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch
new file mode 100644
index 0000000000..44964e17ff
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch
@@ -0,0 +1,50 @@
+From 53ac23ded4cb2c5463f6c4cd1525331bd578812d Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Wed, 6 Aug 2025 15:17:59 +0200
+Subject: [PATCH] CVE-2025-8114: Fix NULL pointer dereference after allocation
+ failure
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2025-8114
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=53ac23ded4cb2c5463f6c4cd1525331bd578812d]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/dh.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/dh.c b/src/dh.c
+index 33883f2d..7116d1dc 100644
+--- a/src/dh.c
++++ b/src/dh.c
+@@ -873,6 +873,8 @@ int ssh_make_sessionid(ssh_session session) {
+     ssh_print_hexa("hash buffer", ssh_buffer_get(buf), ssh_buffer_get_len(buf));
+ #endif
+ 
++    /* Set rc for the following switch statement in case we goto error. */
++    rc = SSH_ERROR;
+     switch (session->next_crypto->kex_type) {
+     case SSH_KEX_DH_GROUP1_SHA1:
+     case SSH_KEX_DH_GROUP14_SHA1:
+@@ -925,6 +927,7 @@ int ssh_make_sessionid(ssh_session session) {
+                session->next_crypto->secret_hash);
+         break;
+     }
++
+     /* During the first kex, secret hash and session ID are equal. However, after
+      * a key re-exchange, a new secret hash is calculated. This hash will not replace
+      * but complement existing session id.
+@@ -933,6 +936,7 @@ int ssh_make_sessionid(ssh_session session) {
+         session->next_crypto->session_id = malloc(session->next_crypto->digest_len);
+         if (session->next_crypto->session_id == NULL) {
+             ssh_set_error_oom(session);
++	    rc = SSH_ERROR;
+             goto error;
+         }
+         memcpy(session->next_crypto->session_id, session->next_crypto->secret_hash,
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 891b2c38ac..3781b501cd 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-8277-1.patch \
            file://CVE-2025-8277-2.patch \
            file://CVE-2025-8277-3.patch \
+           file://CVE-2025-8114.patch \
           "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
-- 
2.40.0


