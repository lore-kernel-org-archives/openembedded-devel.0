Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094DECF8541
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 06:12:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28659.1763619124631051874
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 22:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iwIwIKJT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3419e170cb=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK5QJvV2046408
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 06:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mJOWZ6cIImJLiSe0h4Q7
	yIwgShiexGJuHdJs/hxZM4I=; b=iwIwIKJT/Py1JVMvOsHpGvhqIVq4H3nyqbwj
	cJm7wbidT49NuIBHwdYZgj8cqqzJrGa6fODiB4gW7+DPZmxOrqPVb0X6TrZQo7bY
	dsGH3WQptuAge0Qw/4yHk2YrPIcH4g35CMNZbUzjN64gUfS5Ii0Y5r5qghq/eeu6
	RagHiEL3kRj3f9xu8AMbXmgeZ3njtcMQcdXWYWiitOuFgeJChdY3W+qIaGFI8VXH
	Z6Cv/QlQ28zVSss6Eem+WjzEng3hant9PnlM+GBw+f8zI9k1wXigyld8VvThD1kq
	5gJGk71f+gPpZyZ3h5yf6ZGtD8v52pOeJdtfPtIvHsHCHopVog==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ahrs3r77q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 06:12:03 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 19 Nov 2025 22:12:02 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 19 Nov 2025 22:12:01 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libtracefs: support reproducible builds
Date: Thu, 20 Nov 2025 14:12:01 +0800
Message-ID: <20251120061201.684136-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDAzNSBTYWx0ZWRfX7HNWD6auqBEw
 tZCBJwIIq/00Dad2lj287p6WoHGA2xOMEmEhnhVLLS5agjoNBju6D6EItRNcKz8+WpqIGKt0Uwo
 fwJzHbus4AqTt2x9SDt9kkEXRZdCudac6LaDZxfbWSiIhQ4/idSchFMDInLvTzCloPmxUBnpDA6
 Ufoq0UvMzAsLdksAOjn6nlmqpFi6jK8EyWW4izKJ445M3GHIJXZona4P3BJIu4Oqx4crttbKLO9
 aH383rhdyuGQzTf2DJ3biYPs2Iu7X5GMd1D4p37bkByAwMiKg2Cuf96/vGQTQqboCjcAR/v7OOt
 mgwUkTMgyF39x2eu94gYXZ/zKNsP+Hv2AbpA85+GZYgFI7PMOxHU1LIRbapUQTiaSBz8pFiyOe1
 3NHyyLjOxk39PKInHldg2aDlbjcQmg==
X-Proofpoint-GUID: tlnL9RSlAavqmA7WvCeB-t5tljUbdjhy
X-Proofpoint-ORIG-GUID: tlnL9RSlAavqmA7WvCeB-t5tljUbdjhy
X-Authority-Analysis: v=2.4 cv=f61FxeyM c=1 sm=1 tr=0 ts=691eb133 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8
 a=my7hYvr7XiMy3-_UV_AA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 06:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121928

From: Changqing Li <changqing.li@windriver.com>

[snip of Makefile]
 # bison will create both sqlhist.tab.c and sqlhist.tab.h
sqlhist.tab.h:
sqlhist.tab.c: sqlhist.y sqlhist.tab.h
    bison --debug -v --report-file=bison.report -d -o $@ $<
[snip]

sources of libtracefs is fetched by git, the mtime of sqlhist.y,
sqlhist.tab.c is random. so sometimes, sqlhist.tab.c is regenerated,
sometimes, sqlhist.tab.c in original sources in used. bison used to
gernerate sqlhist.tab.c by upstream libtracefs maybe has different
version with the build host one. This make the final libtracefs.so not
reproducible. This fix touch sqlhist.tab.c to make it has the newest
mtime, and sqlhist.tab.c is not regenerated during build.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
index b6bae96896..35eabc7b11 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
@@ -16,6 +16,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BP
 
 inherit pkgconfig bash-completion
 
+do_compile:prepend() {
+    touch ${S}/src/sqlhist.tab.c
+}
+
 do_install() {
     oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig
 }
-- 
2.34.1


