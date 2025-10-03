Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EABCCA470
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 06:56:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2022.1759474593695533172
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 23:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Excub8v2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2371044919=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5936Q9Xb1453681
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Oct 2025 06:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ef/ExjuWL89YeWujWHkX
	x7fq+gAC/SeNad+or8W2LNM=; b=Excub8v2uF8nXtmg0+VtZ3LU8xf2a5s1BlNB
	owd2apVHs0MvpljiBWb1UbQoFlvoSassX9u4sGbXDieAwSum93cHuPbipO5Okk/T
	+65cIWYBlDvgNcJwpzgyh1btoHDYup775hFCZyId4dytiTRe60JNzDkzjUVbNmWM
	z84RF2sFxglutgoBe+ekEueH03YQxxirw+CJiFcV2dOmE7TFGDAkBoV9fDF4qs++
	fYf/xLDC6zYRrSj0z1/vpIgqwKrKdQNqJUA/wsZCU07pQceO6uyUSnVyANsSOJkV
	p2RhRQaAcBguuD1+C7AvU2qEvNs7ERt0FJsnsn7pN4aJkdHJCQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49e6w7qfb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 06:56:32 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 2 Oct 2025 23:56:28 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] mariadb: fix failure for starting of mysqld.service
Date: Fri, 3 Oct 2025 12:26:09 +0530
Message-ID: <20251003065609.499113-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAzMDA1MyBTYWx0ZWRfXymWaKnmHrPig
 m+g3n3+srErdIp/yhS4KWXYMxQ4b8qMhZv3de6PCE2L9Tt5d4r5mo18t4zrW8JQgKuE/Quubde8
 cUdas1YJ0oouAlPNvk/9LjK96H5ysaG8jDAw0X3o/kpUppQ3WY7ugG/4R79NLbtgLA42wNt5dat
 gJZ5XYiZ3T+h1lyeGIhMeveXscMEc+owoPvLGfw7Oc2iY7RTAWUMOSZ9ikmVzW4F6qBOrl69azQ
 y6MU2nxnBdSG+SEOjzUPkQTwkn2oXcZTMDQoV9Jh6xuHBZ2WSLrFPLj8KH6sGz99Nc8NPdcRH4K
 f8rhtxQisJtf0vWWxqtRMQ06OXELNmBAWb+jwPcAG25D7ZChv2Uwr8xtkLvszzaWWRvZhhvW7SU
 t7xmggtsxragrs4mep2z/xzmmmeeuA==
X-Authority-Analysis: v=2.4 cv=Lc0xKzfi c=1 sm=1 tr=0 ts=68df73a0 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=hkEv4HZQAAAA:8 a=t7CeM3EgAAAA:8
 a=SlJAyGScpOzhRhXERX0A:9 a=NA03pvyaApPJG5valX87:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: mTa4zFZo3_D9bBuGDtXKu4AJ2MKu0IXo
X-Proofpoint-GUID: mTa4zFZo3_D9bBuGDtXKu4AJ2MKu0IXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510030053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 06:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120210

From: Yogita Urade <yogita.urade@windriver.com>

It fails to start mysqld.services:

root@qemux86-64:~# systemctl start mysqld
Job for mysqld.service failed because a timeout was exceeded.
See "systemctl status mysqld.service" and "journalctl -xeu mysqld.service" for details.

In the source code, STACK_DIRECTION is already set:
cmake/os/WindowsCache.cmake
192:SET(STACK_DIRECTION -1 CACHE INTERNAL "")
so no need to add in EXTRA_OECMAKE removed from recipe file.

Reference:
https://jira.mariadb.org/browse/MDEV-36051

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 6e7c01a775..f0cec75568 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -95,7 +95,6 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DINSTALL_SYSCONFDIR:PATH=${sysconfdir} \
                  -DMYSQL_DATADIR:PATH=/var/mysql \
                  -DCAT_EXECUTABLE=`which cat` \
-                 -DSTACK_DIRECTION=1 \
                  -DHAVE_SYSTEM_LIBFMT_EXITCODE=0 \
                  -DCMAKE_AR:FILEPATH=${AR}"
 
-- 
2.40.0


