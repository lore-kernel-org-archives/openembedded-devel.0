Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8B0CA0EED
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 07:46:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.34032.1756108010572861286
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 00:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QUgAH8S4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0332d1973f=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57P5j4Ik2818873
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 00:46:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=a1hmVq4PSUvUEALVGF6e
	tOvYpadBRctL7fL9b239Reo=; b=QUgAH8S4Wjuyqy2iVyyVYim9qSm2Lz7O7zgh
	WSKhxIXgTKGLQh4fyEfZrg39qwUeyFinltsz29KIQ5oDaCyW0efNxRd75eF7t21C
	GCW0EOj4PTWiqlpFI3AWFyvgDSapBZADH8Rto3t/3tByZuMWI4V8ywSundMcrmDp
	QdZP51FEZQIz1vHoN6DAlAX6qSm0tK48vkGThMVsSAyGDwvazyph1RDEMPnt2TlA
	s7OEdOdfzL7zqBkWjRS0ES1cnbpfBRuHiUiOMH3Syks8he1SeeHvYn51SKFDoj8x
	SLnyDA9VvNQRBJiHZlEsff2MKxf2IvBZiDiLlfKUW7jgwSpQEg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48qd5hh9q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 00:46:50 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 25 Aug 2025 00:46:49 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 Aug 2025 00:46:49 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] passwdqc: correct the SRC_URI
Date: Mon, 25 Aug 2025 15:46:48 +0800
Message-ID: <20250825074648.2949841-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDA2OCBTYWx0ZWRfX0ClE3JQNJ1lf
 PMZzJ6L4G/gaGlWGRtEiUgcQDC+4PdejEFBFJeF24Kg6VOMQC92hds8lLw2heObPkZo42dAaXKv
 yVl5SZnAQQjT5axPiCE5cJsEgcK3HafpwATDf6ArHcOXAqNA0ZnO5e52AztxfroCTIavwxTc0rr
 v1qCxVtaUFJgRyDeBUIsQzPapA4R1If8cHq0AJm8cITNgLwSsLWVIg46mDayYOA0XhpOKJzpxFh
 35pKbsOQRvNd4V39e9uPBwfR02zT+6Ym5w1Q8gqmBEig6S8iP6vca8d74w5+qI4bslG7lH9ikIq
 4TpqSmOQ6nWfY7UF7Kj2//r7DYJGDos9WKddEwnTGIvLdHVCEihMT6cwhcUwbY=
X-Proofpoint-ORIG-GUID: fno2iAMzFhnaPmoAm4cTkmK7QK2uD1f8
X-Authority-Analysis: v=2.4 cv=QNdoRhLL c=1 sm=1 tr=0 ts=68ac14ea cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=XkRKQH6RAAAA:8 a=OPAOpny1AAAA:8 a=t7CeM3EgAAAA:8
 a=KYjiVFhI82W20ilUqDIA:9 a=ZXulRonScM0A:10 a=1gUyE30hU_ULiMxJiLUW:22
 a=Vt4qOV5uLRUYeah0QK8L:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fno2iAMzFhnaPmoAm4cTkmK7QK2uD1f8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 07:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119093

From: Jiaying Song <jiaying.song.cn@windriver.com>

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb b/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
index 8694052e61..2b9356f60e 100644
--- a/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
+++ b/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
@@ -27,7 +27,7 @@ REQUIRED_DISTRO_FEATURES = "pam"
 LICENSE = "BSD-1-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ac99c8678577a1c2f9f04cccee411d5d"
 
-SRC_URI = "http://www.openwall.com/${BPN}/${BP}.tar.gz \
+SRC_URI = "https://download.openwall.net/pub/projects/${BPN}/${BP}.tar.gz \
            file://makefile-add-ldflags.patch \
           "
 SRC_URI[sha256sum] = "53b0f4bc49369f06195e9e13abb6cff352d5acb79e861004ec95973896488cf4"
-- 
2.34.1


