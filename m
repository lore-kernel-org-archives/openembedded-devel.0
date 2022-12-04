Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C01C4332F
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 10:16:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.125718.1670148981667113219
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Dec 2022 02:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DmVHEqDH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9337ef6b4b=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B4AEOPo021061
	for <openembedded-devel@lists.openembedded.org>; Sun, 4 Dec 2022 10:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=RSjFtvfiOMvuq5gtpi6sPpSoOU8a9hIAVLihAGq0TQE=;
 b=DmVHEqDHeIDofoW7Yr+1NCK2QUso84PfJOM+NjEW6IrrT7RE3l3qhsRwdN9LSX+Ho8iN
 x62ENAG+NCQ/zrplHtmEYp2UrAe+454i30eyPYK8lvWtVemIIPuUUQTrw7U6ikAFK1Tp
 5a7PYS7eks04u4PYxdMlAhP6Zn/IoXc/EFazUykAbHd3543li9r/Kh036J8lGRBYvN5a
 x7L7y/pW7al7k6wxHJc86Q8SPGKHeBdlgyE2iF9tyzlq27irmIgL8n7q+MPl9SRcgi2k
 qxFNfL7iy2KPkn87S0MXVmZwOa6BNVLJoRfGjcyinf0AJR5bZToUgiHVlg7shqcM15GQ XQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we90rfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 04 Dec 2022 10:16:20 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 4 Dec 2022 02:16:08 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 4 Dec 2022 02:16:07 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] postfix: fix multilib conflict of sample-main.cf
Date: Sun, 4 Dec 2022 18:16:03 +0800
Message-ID: <20221204101603.34759-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: sGvCe3brc3YSPckVW2F5kglMVDVTqXt4
X-Proofpoint-ORIG-GUID: sGvCe3brc3YSPckVW2F5kglMVDVTqXt4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-04_07,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=968 mlxscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212040097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Dec 2022 10:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99946

From: Kai Kang <kai.kang@windriver.com>

It fails to install postfix and lib32-postfix at same time:

| Error: Transaction test error:
|   file /etc/postfix/sample-main.cf conflicts between attempted installs of
    lib32-postfix-cfg-3.7.3-r0.i586 and postfix-cfg-3.7.3-r0.core2_64

Rename sample-main.cf with ${MLPREFIX}.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 8a4428c50..5133caaa4 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -115,7 +115,7 @@ do_install () {
         'data_directory=${localstatedir}/lib/postfix' \
         -non-interactive
     rm -rf ${D}${localstatedir}/spool/postfix
-    mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/sample-main.cf
+    mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/${MLPREFIX}sample-main.cf
     install -m 755 ${S}/bin/smtp-sink ${D}/${sbindir}/
     install -d ${D}${sysconfdir}/init.d
     install -m 644 ${WORKDIR}/main.cf ${D}${sysconfdir}/postfix/main.cf
-- 
2.17.1


