Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D45EC5475B
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 07:22:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6738.1710400937425638535
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 00:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pHA3o/7Z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3803a4b45a=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42E6b301006686
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 00:22:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=YRye/
	VT+lguIUwlDK/diUZAqCSvwhykmUkSD2jjw8Sw=; b=pHA3o/7Z+Fl/tfqoTS4yl
	0MHYNO+ftPPemtjeE27PewOfFsTVjrQgTDkZOwHQROKhk8CKNW2kCuzTMjpe3g3O
	/4Upn0sHrikIIurvG7ObcoHMVo19LndVEo06bxAMzdotPHoM1XLCaQXzNQyBKtlm
	sya74to6y9ese8kVMCuwEdwpG5ojIKZGb7jA1KQeMeaR8T4a17q3m0wEUmcFI7rn
	uUm7DZnNSPOdRnyUMultdjgM+JslaTejqMH+VXmsUTqKv/XjNsXC4fGlseOf1nmh
	lqKzwLuQLOxhdfMAKrVP2IiYkPikHvtKeB0a6fx4l28WgLOLtUQa2PKBibcEG2hu
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrr5mch82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 00:22:17 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 14 Mar 2024 00:22:16 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Thu, 14 Mar 2024 00:22:15 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] postgresql: fix a runtime error
Date: Thu, 14 Mar 2024 15:22:15 +0800
Message-ID: <20240314072215.6854-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ivWYd0340ACHJJ0aSucV5KIXRiYWZh6-
X-Proofpoint-GUID: ivWYd0340ACHJJ0aSucV5KIXRiYWZh6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_05,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=756
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 07:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109311

From: Changqing Li <changqing.li@windriver.com>

initdb on target will fail with below error:
2024-03-13 08:40:23.253 UTC [4410] FATAL:  could not load library "/usr/lib64/postgresql/dict_snowball.so": /usr/lib64/postgresql/dict_snowball.so: undefined symbol: CurrentMemoryContext

Refer [1][2], for cross compile, --export-dynamic is assumed as not
supported, and cause above error. For oe, both gcc and clang support
--export-dynamic, fixed by set LDFLAGS_EX_BE directly

[1] https://www.postgresql.org/message-id/79e63515-0f5e-30f4-136d-96e23b1a817d%40posteo.de
[2] https://github.com/postgres/postgres/commit/9db49fc5bfdc0126be03f4b8986013e59d93b91d#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 868a2e443..e29a5bef7 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -35,6 +35,7 @@ LEAD_SONAME = "libpq.so"
 
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"
+export LDFLAGS_EX_BE = "-Wl,--export-dynamic"
 
 inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext cpan-base multilib_header
 
-- 
2.25.1


