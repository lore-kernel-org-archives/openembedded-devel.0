Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4024.1793330236823804698
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 20:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PVr+r53X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: vaibjind@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U2K9e91961424;
	Fri, 30 Oct 2026 03:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m815aeZ2Y6S
	S2UNTZt51ituWePCfih6T4LtCTVi4hvQ=; b=PVr+r53XWQH7ix3HSh58TkvazzQ
	2TBcMah6QgoDknBmeIjPOHA5bpowoW9STx7u8ujba+HMGjUWuDE1jSt25xldZbqQ
	8+XFYrL9igIbm7eAb3/xW3k7U3Fo518CszJB4pZQwzNKW8HUNhiLcbJla2CutHah
	GBcf+iwd6K075SpznGf9YbeDIcDxshj71EOKV3G4ksfiLppkdRcjauoWvT7wJcVu
	h1bMJrGkD5qJB5PZgCt54cQNPmIEcO6vcNHk+U+1d0vBlykmPVeUOCJ+HxmQbkzo
	GsZUnlkTQdthEbgmb+S6IgO1RsVgnlSUkabrMzNzgthGY7pGAUD9WwITQJA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qgxtm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 03:17:15 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69U3HBSH504985;
	Fri, 30 Oct 2026 03:17:11 GMT
Received: from hu-devc-hyd-u22-a.qualcomm.com (hu-vaibjind-hyd.qualcomm.com [10.147.244.121])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69U3HBo9504979
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 03:17:11 +0000 (GMT)
Received: by hu-devc-hyd-u22-a.qualcomm.com (Postfix, from userid 4734334)
	id 1AB50643; Fri, 30 Oct 2026 08:47:10 +0530 (+0530)
From: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, Vaibhav Jindal <vaibjind@qti.qualcomm.com>
Subject: [meta-oe][PATCH v2] wrk: fix parallel build failure due to missing obj directory
Date: Fri, 30 Oct 2026 08:46:34 +0530
Message-Id: <20261030031634.3740225-1-vaibjind@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMKF1so2GEPYnN5jnGfzbT2g9hh_Zg7eOtngna8Pb=0m_5GbJw@mail.gmail.com>
References: <CAMKF1so2GEPYnN5jnGfzbT2g9hh_Zg7eOtngna8Pb=0m_5GbJw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: YnL0aTnmUGyE1lBxZ1BmbdM7nsTpfYjw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAxMiBTYWx0ZWRfX2caOm05PT/O7
 +1N0W1wsAjX0SuBuWty/dbsFtfVrF1hUhZmVGob41CPRHAM+7n+yxb6BgziMdQWuna7DywsoMZd
 AgDRok4i3VJZbhrBeBmkfjzjMhxYwsM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAxMiBTYWx0ZWRfX5poZF76EZupC
 EovmgNoVKhF3lWkTdumPxb4iINAtES+Ubt7tA30DFwqEk5ZkP5DqBUrXaswI8nL2ZZjv1zlKwdf
 aKtNY/TMAAXzQUXnSRBbR+yz3g3HsaJfDECxg7wH8KdpiEwKbOktdSLDeflZtd0jeUdR8swejg6
 67JvxtrqEym7D8fai/90eo35Dfs/zPWzNO1FHSWxsbBxivMYafRLQSqTDjzt+l/WXiFnYoQtTIV
 dNklmryXyejawe/iDO0/jEVNqz3gXYlyHiCSup4m8NVf2mkuKHppZVxC9ry0bt8/vvbiwExLSEE
 pP7WOUds9+/bU0/VvQJINSDXyLf2/ht5gJgOky+GsVu7DGPH8njWcvjVsNepxbQ8j1Zctb1BpM4
 plAHyK84yzuI32uqmUZ6hLg2oRitkNm21on7ZeFVz6fVC84D4LAFcS9xxBrLBklV9Z0S9v62CCB
 rix+IywKm8h9pUAO3kA==
X-Proofpoint-ORIG-GUID: YnL0aTnmUGyE1lBxZ1BmbdM7nsTpfYjw
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae40c3b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=_Y2gOFyC22x1hoYQTOcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 03:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131680
Content-Type: text/plain; charset="utf-8"

The obj/bytecode.c rule in the wrk Makefile has no dependency on the
obj/ directory, so with parallel make luajit can run before obj/ has
been created and fails:

  LUAJIT src/wrk.lua
  luajit: .../obj/bytecode.c: No such file or directory
  make: *** [Makefile:64: obj/bytecode.c] Error 1

wrk only supports in-tree builds (relative obj/ and src/ paths, B = S),
so create ${S}/obj via do_compile[dirs], keeping ${S} last so make
still runs from the source directory.

Signed-off-by: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
---
v2: use do_compile[dirs] = "${S}/obj ${S}" instead of mkdir in the
function, as suggested by Khem Raj. wrk's Makefile is in-tree
only (B = S), so obj/ is under ${S}; ${S} is kept last so make runs
from the source dir.

 meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb b/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
index 47ca9ada01..1eaf97a382 100644
--- a/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
+++ b/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
@@ -23,6 +23,10 @@ EXTRA_OEMAKE = "\
     CFLAGS='${CFLAGS} -I${RECIPE_SYSROOT}/usr/include/luajit-2.1' \
 "
 
+# wrk's Makefile is in-tree only (relative obj/, src/) and its obj/bytecode.c
+# rule doesn't depend on obj/, so create it before make runs in ${S}.
+do_compile[dirs] = "${S}/obj ${S}"
+
 do_compile() {
     export LUA_PATH="${RECIPE_SYSROOT_NATIVE}/usr/share/luajit-2.1/?.lua;;"
     oe_runmake
-- 
2.34.1

