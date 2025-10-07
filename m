Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07339CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 04:46:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11675.1759812377524833479
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 21:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tCFt5FGV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2375c254ad=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5974ISH32180209
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Oct 2025 04:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=n+DkszJfdgM8moWYzWXa9rsLihPeYDG/Pf2Ptkw/RN4=; b=tCFt5FGV5dvX
	2ppkAYezh4afShTZXcJnLoGJ4w4MzaQAf6ooO8kpExwnDhcXMjhbtg9fbHsjqM3w
	aT1Cs/p9G3CVrFHoWsIdp+Ny3dw+VvwirKtpafUXF9FxhmcpqKLOoMKQMjhkd37+
	5vpNlnIutbDOvxA0XTWKbUZE/AqzCDx0cMy8mcUTw1NW2ov5FRvyswNnTbpW+z6I
	T4Z8tjLdQp8sfP0cXmdNtPEaKzzjc4gT5O1A2/8HMGDKbOJPhX29Up1Nf6PBlupx
	b8EUU9MA+SJeNzwLiSSry/GZIgzsaxt9s/sIb94f0pcFhZOwJqGOKlqZmVuvFkI9
	P6YEKJdjXA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jtj3aghx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 04:46:16 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 6 Oct 2025 21:46:15 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 6 Oct 2025 21:46:14 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][PATCH 2/2] python3-django: upgrade 4.2.20 -> 4.2.24
Date: Tue, 7 Oct 2025 10:16:08 +0530
Message-ID: <20251007044608.1006175-2-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251007044608.1006175-1-soumya.sambu@windriver.com>
References: <20251007044608.1006175-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: aSrksa6W_zu6wJ_MGSeYW00xU6cak7zg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDAzNSBTYWx0ZWRfX+j+U8Id4Za+r
 46MdldeiwNUO/XFHAoFzUAElKDZPQfdfSDtlJGFZ1VXyxF94IrOqwNLpzonWM6HqAKJ1A6KFSgi
 gjDtJTtTXrLFV7ph5dS+m2P8A3pu9Jzcj1xcwxv2p8yZFgoWvDfaNGlH8941leqwSe5PwR42X8S
 +YFjshHVGWoFACpIvFwJVtpvEilpfDfaN5jZl422RI51MtSx0GbH33O/MGhqkfelHDQckBbeoKS
 +KFs453HZXJxhTHf7Daln20qnhaGW34sV9cD5wiYhhjvozJOp8bHzc4NfugN2fTMzK8NJjeGpCd
 sYkHYmUP/faBLSi4dc8xh6GRx43kBPcFBAbMB3iFup24uNJU+1QO7rMVp6uMDcGIEuOH2ZDB551
 K0dPwg08X8rIzPVmMmBc+4orQQUIVg==
X-Proofpoint-ORIG-GUID: aSrksa6W_zu6wJ_MGSeYW00xU6cak7zg
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=68e49b18 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=ArP49Si0AAAA:8 a=t7CeM3EgAAAA:8 a=T0gi9wxAe-xEIBN8uhIA:9
 a=glZLBWN_5F3qvmUqPDV8:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510070035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 04:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120318

From: Soumya Sambu <soumya.sambu@windriver.com>

Release Notes:
https://docs.djangoproject.com/en/dev/releases/4.2.24/
https://docs.djangoproject.com/en/dev/releases/4.2.23/
https://docs.djangoproject.com/en/dev/releases/4.2.22/
https://docs.djangoproject.com/en/dev/releases/4.2.21/

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-django_4.2.20.bb => python3-django_4.2.24.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.20.bb => python3-django_4.2.24.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-django_4.2.24.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-django_4.2.20.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.24.bb
index 8644b282c6..286d757733 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.24.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
+SRC_URI[sha256sum] = "40cd7d3f53bc6cd1902eadce23c337e97200888df41e4a73b42d682f23e71d80"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
@@ -10,5 +10,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.20" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.%" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.40.0


