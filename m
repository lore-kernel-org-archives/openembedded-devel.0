Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941DBC4708E
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 06:44:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.123744.1670136281580989364
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 22:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=a8ItzY4W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9337ef6b4b=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B46g85p022236
	for <openembedded-devel@lists.openembedded.org>; Sun, 4 Dec 2022 06:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=XzmdYwb3wB72Tqx/B6Wt2aX9JRfX9p0EVu/NjXOUiFc=;
 b=a8ItzY4WMrZYwIiGw+a6/Tj/cr1y4zCvE9oqho1k3FUUy69BSMSwTonNE6EbCXqVmejY
 McOq9f2I9SAcVyQg2UtkaxmeNBQcVcx7TVj4S+NsnvXtUquMaNsldfkcVQlFFIN3bJTc
 KtJ96PrjpIN9o2aDjWKv1hdkFjJrPR8rZSAtUvUFLH+JUJTGKEV/pdwYtfl6+QG1MliV
 zCd+7pcvwnerVXn3Z3BzAMeBcw8k3ZBz0kYs3hsN7yovllunuzDtC5DRM+LUZIlWXTCi
 MEXmY6QFfveT1d49Ap/ma1LetXNP0b/h2T2F3D2w/PZZV7K+7Grv8RAe/fMjNZ5G6pio lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we90p4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 04 Dec 2022 06:44:40 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B46ievw025390
	for <openembedded-devel@lists.openembedded.org>; Sun, 4 Dec 2022 06:44:40 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we90p4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 04 Dec 2022 06:44:40 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 3 Dec 2022 22:44:37 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sat, 3 Dec 2022 22:44:36 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2 0/1] python3-wxgtk4: replace deprecated inspect.getargspec
Date: Sun, 4 Dec 2022 14:44:32 +0800
Message-ID: <20221204064433.5377-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 3rJZFT8QD34Z9yvds3vRGYB7G6bJAjL9
X-Proofpoint-ORIG-GUID: 3GRMvgj5ABNpar5sXvHkuTHz6qvOg1bj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-04_05,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=776 mlxscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212040062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Dec 2022 06:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99942

From: Kai Kang <kai.kang@windriver.com>

Hi Khem,

The backported patch is dos format which ends with CRLF. But the other
part of this commit still end with LF. It seems fail to call `git apply`
directly. So I pushed to github:

https://github.com/kkang-wr/meta-openembedded/commit/b9a114e5c992afd6619512cd78098ef9d9072170

It should be fetched and cherry-picked.

Thanks,

Kai Kang (1):
  python3-wxgtk4: replace deprecated inspect.getargspec

 ...eplace-deprecated-inspect.getargspec.patch | 65 +++++++++++++++++++
 .../python3-wxgtk4/python3-wxgtk4_4.2.0.bb    |  2 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch

-- 
2.17.1


