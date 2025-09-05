Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F97CA1016
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 08:15:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16205.1757060149659239270
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Sep 2025 01:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PeaiVkbS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1343d20619=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5856CsFl681643
	for <openembedded-devel@lists.openembedded.org>; Fri, 5 Sep 2025 08:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=7CgYhqZf1/KFRhb17C7V
	x1R86igURSg3jxbspjBfmek=; b=PeaiVkbSCUCdDuC0unHa2QDpY3HyEm81bL4+
	Tc9ALG7OwwWhrtLTYWUDakC8qxQW4RGyUn1ImtgayuYqHDkKbenSqHOFkjKFIKLb
	crvaSWWE2iV/cnOkKgN7Fks6MuDX3TL/ZHqfWkBX+bMi4g6DceK8b7aPgBSlUiPY
	ZyrdYe8V3wmxFSzEDpi9ZsUOzjcv31ijMwhDYJvNnMRHN5h1t509k1RI29nL/hqE
	OSvd9vDwlDgPPm6GuHDuZb6QCticIELndQdESkH5+XVdOXKTG1SR7TRyi+jQFWR3
	zjoQz/Agd5pWNAvdGLwb+zhUN5iaWb4SM02uqmxdF//thxAnQQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7k2hjqw-17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 08:15:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 5 Sep 2025 01:15:40 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 5 Sep 2025 01:15:41 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: update 2.44.1 -> 2.44.3
Date: Fri, 5 Sep 2025 16:15:37 +0800
Message-ID: <20250905081538.3082838-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA3OSBTYWx0ZWRfX0go/h+LjIzwa
 tU+p/LOsodFqJbppM2u9vkK3HFNPs6YrUnRLw9CE3eqtfecI0+o0TUDrAqtKSFoQPvL1PbcXsXI
 ncZfK+dq3g8FzZgAegG6B8U3Lr+sN1dTO0w8uRL9PfWJN8C3w/vvD5Lch8PGo4Vu3ymyJ8+oxh+
 3QRaUwQkFQYIbPo0mAxUCHvIiVymUNjx5UH7YG4ajNEsLTZaBLPBmnaItpz5Mra8uyRknbSHiAq
 eMZiNIWeBtQSRCVZPfDiDbIce819uU/nMABx8K++GZ4Y6PVaOJeR52bDUZ2UKgzVSzzh4cbjRtH
 zeC03soOAVht+3+CwAjYwwcx6xJIL+j4t4QRIP+NWWoRTPkNPNK9PUXJoUJoM8=
X-Proofpoint-ORIG-GUID: Z9lbEDH7TpQCVLATfnlOyy5MJ-kKzWFO
X-Proofpoint-GUID: Z9lbEDH7TpQCVLATfnlOyy5MJ-kKzWFO
X-Authority-Analysis: v=2.4 cv=E8LNpbdl c=1 sm=1 tr=0 ts=68ba9c34 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=LXCGm8LIAAAA:8 a=t7CeM3EgAAAA:8 a=SWqQnwTfyOhUR1d76moA:9
 a=K2vEmuv5VUIA:10 a=fBI0yctglXEA:10 a=NxI9r9ql2kHpUT0AVVEO:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 08:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119313

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:
https://webkitgtk.org/2024/05/16/webkitgtk2.44.2-released.html
https://webkitgtk.org/2024/08/13/webkitgtk2.44.3-released.html

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../webkitgtk/{webkitgtk3_2.44.1.bb => webkitgtk3_2.44.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.44.1.bb => webkitgtk3_2.44.3.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
index fc96d5dc3b..7d70cbda78 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
            "
-SRC_URI[sha256sum] = "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
+SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


