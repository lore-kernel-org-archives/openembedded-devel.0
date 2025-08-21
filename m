Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0415CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:06:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4811.1755767169618144825
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EleS0F4I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0328e38336=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L602Hi1828228;
	Thu, 21 Aug 2025 02:06:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=i823y63aDpzhf9NIp8Fz
	FZtEuw+ang4yowfl5vZO9cY=; b=EleS0F4IPTZI5qgcP+G9Q+LYo84O60p2/CWY
	6VXOsjrJBLCMy/XdBt1Em14HcUZ+jW+EIXFAtcnZmCZyKxW7fuHAyRWQtMPBJ3WH
	Eq0GrNLGT1VE0aBlK5wWT3xXfotfrwUPRYz391dMzCXi030fn8NTLX+barPxZg4h
	4T3TpwaW9gNEmDsbLQu9C5MzLhaXrWAHkXrQkx+XcRNFaW4yVvSs0UK5OoY+41J9
	5RMalcFxOCgXa+MaOjtufmYvhFWXnGL/JbKHJDwNH0xTgIaC8beAW7qjZ/jAcDH+
	fkv45oTX2wUJe5e7UYdv15EyiK1pWKu2Zt0Jo9bj2CyRHLl3BA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydq9x57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 21 Aug 2025 02:06:08 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 02:06:10 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 02:06:09 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <skandigraun@gmail.com>
Subject: [PATCH V2] openvpn: change ptest output format
Date: Thu, 21 Aug 2025 17:06:06 +0800
Message-ID: <20250821090606.313089-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA3MCBTYWx0ZWRfXwVw8W7jSrv3M
 h527MVSeUSH8IhFv6biWn8dF5TYBijjo4ZEXbeknwDnw+ONU1OV/gMYNp23dF8PPrCq1o2hFAmk
 vm4jI7EH8tIHJIFW9DqcKtsGuDKXZzn0RLqizi06nKrLQ5nsDRXN32u8WJ04IcB6MCU7ogOq4V2
 uphQexUEktophN9m4hCxu2l74EhAazZ/bTWDgsx25GDWmYsVlDP5U+glP8l2/J2NPQoaNTdFVhv
 yaUo9b/XlEMPrdQJ/bGIceckC7HGCTPNJ77tTeeRPntCskIn2NN4L4Z9HOlV6ti5iOYSsWi5NtN
 WyxapficwCug2hLPQkwLohv3k03dGuDuQaQxzxuqEQU3P7iepgstdEvEjD2YSY+qGtweq41hrJM
 +iNmtIdJbjpiyStjmyhiZK0S6sGw+w==
X-Proofpoint-GUID: AS_oXK_1NDls1tFwa-5Aziaoq4z2iqYr
X-Authority-Analysis: v=2.4 cv=aKupab9m c=1 sm=1 tr=0 ts=68a6e180 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=G0X9Gb4pawF0VkgNkrMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: AS_oXK_1NDls1tFwa-5Aziaoq4z2iqYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119072

From: Jiaying Song <jiaying.song.cn@windriver.com>

The format selected is the automake "simple test" format: "result: testname".

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../recipes-support/openvpn/openvpn/run-ptest            | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/run-ptest b/meta-networking/recipes-support/openvpn/openvpn/run-ptest
index 5b187d9086..19f66b5c56 100644
--- a/meta-networking/recipes-support/openvpn/openvpn/run-ptest
+++ b/meta-networking/recipes-support/openvpn/openvpn/run-ptest
@@ -1,5 +1,8 @@
 #!/bin/sh
-for x in `find ./ -name Makefile`;
-do
-	make -C `dirname ${x}` -k runtest-TESTS
+
+find ./ -name Makefile | while read -r x; do
+    make -C "$(dirname "${x}")" -k runtest-TESTS | sed \
+        -e 's/^\(\[       OK \].*\)$/PASS: \1/' \
+        -e 's/^\(\[  FAILED  \].*\)$/FAIL: \1/' \
+        -e 's/^\(\[  SKIPPED \].*\)$/SKIP: \1/'
 done
-- 
2.34.1


