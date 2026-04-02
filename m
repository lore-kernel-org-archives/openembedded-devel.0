Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF943D3942C
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 13:49:44 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16034.1775137561002518927
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2026 06:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=V8n2BPUj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: us.ibm.com, ip: 148.163.156.1, mailfrom: archanak@us.ibm.com)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632370Fb367956
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Apr 2026 12:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=R8D8Jj2+pIk7G5xYSr/hmttVOLY0se1pS6JznTvng
	DM=; b=V8n2BPUjpC+43xA1VgTrevvVVZQONVwNkm/S+0M5LLhSw/kdFW8X95UvR
	yn5gIa/C4nzCdzwtwDnq4UHhToCzMd+2voPg79KBzHIA+exPzTV1VbOhpsgPQ/Co
	qB3l08JOJvZZA7dad50e1rsUdrRlBl0Vw8XAPLYKIM0Ifszh5rGxCJKYtwd92EDk
	zaFraWuMAfX0OA5Bocddry0vDU0TN1C6UqbetEvuf1/z2BseKXi6H6gtP2fdJ4l3
	BRUV1UIHxokTwn4UxXAbANnCmi8YzWRFSiDZwCznsXM0aCm5Oyocsyv8RY+gt1fn
	dUMUssBRfF/FfnT6fW7gBxduqNFRQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d66nnvpgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 12:28:11 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 632C71fv013922
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Apr 2026 12:28:10 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4d6ttksweb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 12:28:10 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 632CS8bS7537258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Apr 2026 12:28:09 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D02DB58058;
	Thu,  2 Apr 2026 12:28:08 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C33F958057;
	Thu,  2 Apr 2026 12:28:08 +0000 (GMT)
Received: from gfwa600.aus.stglabs.ibm.com (unknown [9.3.84.13])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  2 Apr 2026 12:28:08 +0000 (GMT)
Received: by gfwa600.aus.stglabs.ibm.com (Postfix, from userid 607776)
	id 858462400CD; Thu, 02 Apr 2026 07:28:08 -0500 (CDT)
From: Archana Kakani <archana.kakani@ibm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Archana Kakani <archana.kakani@ibm.com>
Subject: [PATCH] libspdm: enable shared library build
Date: Thu,  2 Apr 2026 07:27:30 -0500
Message-ID: <20260402122730.1485735-1-archana.kakani@ibm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kQ_4d1F0_05RONc97rPiC2_4-_TxcTIe
X-Authority-Analysis: v=2.4 cv=KslAGGWN c=1 sm=1 tr=0 ts=69ce60db cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=FUJohrcWeqoYL2q-xIsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDExMSBTYWx0ZWRfX+QZpk4bv979D
 F5IcSBp2ZECkVSqgou6tOmABP3cQ0DH2s0OguZH8mciPokidOjr8cLBgLf3wEjDF3VLKfV2jxuA
 P/Gf8hIjFB8R4Nq4Tqml4jARqmYaX3Bc2TL71Qgbfr/pkxln0KETb44TCXGMmtsSR1Rk3WrOGrL
 3KxoCqZyr0e0+bro73pfvRt4UZip7NBAdSjmUBlklHnJFByKjeGCu2heqgs276le7H+4gGXaOvs
 M/p9v6+vOixeq/3w8Q0n6u1ygRdoG0cSb94MOrgkXnATeNHtePplrVXCkQtzAG+Pujz6+b4vALH
 V8rY0TmH+j/1PAhYhn0Caitq/SkZ76vqVpPCQIivlnIm8pdkoeKo5BR3KDSK+oZpiOmVeqqYD5k
 fG9KT4oqy4SrMZgaBcgVmBdeMLTo7ARSw89LTauSpfZI6gRxeFrwhE996rhWVCu73NP9xoLu80A
 fRzWo2itiNOn77W1BXw==
X-Proofpoint-ORIG-GUID: kQ_4d1F0_05RONc97rPiC2_4-_TxcTIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020111
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 13:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125968

Update the libspdm recipe to build and install shared libraries.

Signed-off-by: Archana Kakani <archana.kakani@ibm.com>
---
 meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb b/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
index 04f1ffc1fc..d3e4802d5e 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
@@ -51,6 +51,7 @@ EXTRA_OECMAKE += "\
 	-DTARGET=Release \
 	-DCRYPTO=openssl \
 	-DENABLE_BINARY_BUILD=1 \
+        -DBUILD_LINUX_SHARED_LIB=ON \
 	-DCOMPILED_LIBCRYPTO_PATH=${libdir} \
 	-DCOMPILED_LIBSSL_PATH=${libdir} \
 	-DDISABLE_TESTS=1 \
@@ -60,7 +61,7 @@ EXTRA_OECMAKE += "\
 
 do_install () {
     install -d ${D}/${libdir}
-    install -m 0644 lib/* ${D}/${libdir}/
+    cp -rf lib/* ${D}/${libdir}/
 
     install -d ${D}/${includedir}/${BPN}/
     cp -rf ${S}/include/* ${D}/${includedir}/${BPN}/
-- 
2.51.0


