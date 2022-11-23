Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7708C43217
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 03:13:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11595.1669173212419524060
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 19:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UNXJslS0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83266acff9=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AN2YTHc005948
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 03:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=kwjT+NgOTfRi7zBoTXbnoNzb+qPsRr9jYhay/T36QV8=;
 b=UNXJslS0UQ0tU4hXRGZAvEYVnwfmDw0huzG/DiIwzIBewTsKmydgHE1pVGr14QHdDKSF
 CEfJ2zyVqPjh4UbMX4VgbvllEkEkMj4kECBjDdIhUvPYZx0O1owTaFYZrQLsMrlrDlpC
 NM+Bzml/i8zRybwm4uCmkWt+guiaGg6Pe7Z8qAznxDp4m7GB+QLkVMqzlkvSX+dh/O/3
 CrIxzyzXjyn7WvJ2sDcXgAWzqjTYAjTwXQ3KuxVUtDhqUkoPhMg49HoA5heT5Jkewlnp
 JTC4pTf0V4Js3by5vHjrmbpZps9Ov8kiDZUUkprJ0UMTng7dmyZjZFQYndIUyQr46xEz wQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxp48k34p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 03:13:31 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 22 Nov 2022 19:13:30 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 22 Nov 2022 19:13:29 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 2/3] python3-attrdict3: add recipe with version 2.0.2
Date: Wed, 23 Nov 2022 11:13:25 +0800
Message-ID: <20221123031326.11169-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221123031326.11169-1-kai.kang@windriver.com>
References: <20221123031326.11169-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: fiU8rgxQpvo5vnzUTaeW5DpDRMMKAhgT
X-Proofpoint-ORIG-GUID: fiU8rgxQpvo5vnzUTaeW5DpDRMMKAhgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=910
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 03:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99690

From: Kai Kang <kai.kang@windriver.com>

python3-attrdict3-native is required by python3-wxgtk4.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../python3-attrdict3/python3-attrdict3_2.0.2.bb     | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.0.2.bb b/meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.0.2.bb
new file mode 100644
index 000000000..cb44ea71a
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.0.2.bb
@@ -0,0 +1,12 @@
+SUMMARY = "AttrDict is an MIT-licensed library that provides mapping objects that allow their elements to be accessed both as keys and as attributes"
+HOMEPAGE = "https://pypi.org/project/attrdict3/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b37be7e71ebfc92a94bfacf6b20a1cc"
+
+DEPENDS = ""
+
+SRC_URI[sha256sum] = "004c171ca1120cc1755701db99d7fa4944afb1e68950434efdaa542513335fe8"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


