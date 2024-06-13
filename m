Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8188FC27C79
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 08:47:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3608.1718268427867286317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jun 2024 01:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6894e13dda=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D7ovBU013202
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 08:47:07 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yme964p2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 08:47:06 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 01:47:05 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 01:47:04 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] tnftp: Disable incompatible-pointer-types warning as error
Date: Thu, 13 Jun 2024 16:47:03 +0800
Message-ID: <20240613084703.1858419-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qx5PQ3cbmD7gPqlrbCxuXsJkIT-vQwrZ
X-Proofpoint-ORIG-GUID: qx5PQ3cbmD7gPqlrbCxuXsJkIT-vQwrZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_01,2024-06-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=730 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406130061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 08:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110889

From: Changqing Li <changqing.li@windriver.com>

Fix lib32-tnftp do_compile failure with gcc-14:
../../tnftp-20230507/libedit/terminal.c:597:56: error: passing argument 2 of 'terminal_overwrite' from incompatible pointer type [-Wincompatible-pointer-types]
  597 |                                 terminal_overwrite(el, &el->el_display[
      |                                                        ^~~~~~~~~~~~~~~~
      |                                                        |
      |                                                        wint_t * {aka unsigned int *}
  598 |                                     el->el_cursor.v][el->el_cursor.h],
      |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../../tnftp-20230507/libedit/refresh.c:114:38: error: initialization of 'wchar_t *' {aka 'long int *'} from incompatible pointer type 'wint_t *' {aka 'unsigned int *'} [-Wincompatible-pointer-types]
  114 |                 wchar_t *firstline = el->el_vdisplay[0];

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/tnftp/tnftp_20230507.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/tnftp/tnftp_20230507.bb b/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
index bdd9759f2..da4466794 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
@@ -36,3 +36,6 @@ PACKAGECONFIG ?= "openssl \
 "
 PACKAGECONFIG[openssl] = "--enable-ssl, --disable-ssl --with-ssl=no, openssl"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
+#fix lib32-tnftp do_compile error with gcc-14
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.25.1


