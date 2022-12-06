Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42619C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 06:27:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.41099.1670308065626078656
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Dec 2022 22:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lnRtMnLY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9339f7e6b5=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6619Vo010088
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Dec 2022 22:27:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=t/h3hpv7WxMx/NZvDARwR45BuPqr5occmQMia8+qIa0=;
 b=lnRtMnLYnz+VKEZ9nJCpv0pPTv9DQWLCj3qYDm5Vjk5yJgJe46IlyjNElwJYJxrTd0FJ
 pdOoju9pq82F5JIYVMFg47WpV3+Q6LwN6x6eBxx+lYUhS7x34P7OJyhjL32l1SRt5j9/
 RJIMOCOje0Z9dfdgHrzTa8hLOJKEUIx2ITzcMzKFRF5GHtdbX5hA0kn9AwHf7DmimcPv
 cW4jPeLHvwiP8VssiqlDSRQtjyKnBo6TbfPtSl6IhJG5T2hii4iVMwAaJP8BfDI8octi
 jrOnwvas/dhV/XOfJ85TH/tQNfmQ9yYh7TEU+1MJU7e76XusK0himzRtfi5NBYFD0GMH pg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m82m6t317-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Dec 2022 22:27:45 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 5 Dec 2022 22:27:44 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 5 Dec 2022 22:27:43 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] graphviz: Do not build tcl support for native
Date: Tue, 6 Dec 2022 14:27:43 +0800
Message-ID: <20221206062743.1746120-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: MW_zoF_v_ye7n8QgfQArguHZQIAZ8BkX
X-Proofpoint-GUID: MW_zoF_v_ye7n8QgfQArguHZQIAZ8BkX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_04,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=947 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212060052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 06:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99956

From: Changqing Li <changqing.li@windriver.com>

with enable-tcl=yes, task do_configure looks for tclConfig.sh on
buildhost, and source it. But there is no dpkg-architecture in current
PATH, and the tclConfig.sh enter into an dead loop since
dpkg-architecture not found and finanlly Segmentation faulted. Therefore
it is better to disable tcl

do_configure failure:
using /usr/lib/tclConfig.sh
/usr/lib/tclConfig.sh: line 2: dpkg-architecture: command not found
/usr/lib//tcl8.6/tclConfig.sh: line 2: dpkg-architecture: command not found
...
/usr/lib//tcl8.6/tclConfig.sh: line 2: dpkg-architecture: command not found
/usr/lib//tcl8.6/tclConfig.sh: line 2: dpkg-architecture: command not found
NOTE: The following config.log files may provide further information.
Segmentation fault (core dumped)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
index 4c51af669c..967b9321b8 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
@@ -58,6 +58,9 @@ EXTRA_OECONF:class-nativesdk = "\
                 --disable-r \
                 --disable-sharp \
                 "
+EXTRA_OECONF:class-native = "\
+                --disable-tcl \
+                "
 CFLAGS:append:class-target = " -D_typ_ssize_t=1 -D_long_double=1"
 CFLAGS:append:class-nativesdk = " -D_typ_ssize_t=1 -D_long_double=1"
 do_configure:prepend() {
-- 
2.25.1


