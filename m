Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416A9C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 07:30:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.127518.1671089435557154782
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Dec 2022 23:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=k54aswOa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93488afd4e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BF7NerA030697
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Dec 2022 07:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=t/h3hpv7WxMx/NZvDARwR45BuPqr5occmQMia8+qIa0=;
 b=k54aswOakgSx3EU6sxZqx+WtGBuBNn3KFp/b5QWu5X6z42qzIVsC6C6X01vkWUyP4BCW
 LwkLyu0+LK6Tp6gOBgnVJ7S3YvFiWqYjzR3Gb+9tgqH7N9UZCTrhc/yWuQbd9mOg0835
 SyTEfpo+D/+G5iRzoKoQa5+jyhVZON9k55djf9D3eyc0YrdZZaRsTwf2nn8KUMdPK73h
 QSvUD0eK5TvpZc4eYT1VjXiSnh/wF+71ZzZcDjdgtCHgH8ySK0oXIxxBqlHRP/tDmFp+
 99m0+nAZBpU5jQeyHuUAgKPrcQnDNhd8GS9wuAIROpqIfMmPbvqTSAnzezqRR4e8Z9wS jg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3meyg5ha9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Dec 2022 07:30:34 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 14 Dec 2022 23:30:33 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 14 Dec 2022 23:30:32 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] graphviz: Do not build tcl support for native
Date: Thu, 15 Dec 2022 15:30:31 +0800
Message-ID: <20221215073031.3781726-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XMH4ly6vzVK3bU15zcZEEZl3rTKK4RjC
X-Proofpoint-GUID: XMH4ly6vzVK3bU15zcZEEZl3rTKK4RjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_03,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=911 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212150058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Dec 2022 07:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100080

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


