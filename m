Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DA0C5479D
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.106121.1671917642338335707
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IjusGg8q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLWRPB030212;
	Sat, 24 Dec 2022 21:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=al2HKQR8AXfdNOoQ9b7pisrcq5WLlPlPd0T72T3sIag=;
 b=IjusGg8q33AE10QiREXs6hjxGz5WyJ2F13rfkGj76+1r8gi7JtZfbAgEb1VHvvcAfu8/
 rLO1EJgG9v8aLbHhbKWkXwvOyI0XPRLP6IDE7GMT2NpzbW1Xd6nOgv4CtTLdKg3rUf+4
 jH50GgbzoUz9X3OhFLBkz0XiMt0LTtqZAR9XL1Li6UDLUqeLi0pltHMJDbm2EzbGeZTS
 P+Q9g7NBD3zc6gdDeJIiqx6FNgZqJc4Tyy1PS9PRw8hPZ5V8PCOOVlCViPtRwZ35Vhc8
 JosYBJ8MB9suiNx9Eo3RPENLf5/9vLsRxiQIvxP6cg10T5ZRV6YH8qhDLMgjq316DHYf fw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn30fd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 21:34:01 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:34:00 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:33:59 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 05/16] garcon: 4.16.1 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:36 +0800
Message-ID: <20221224213347.39959-6-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: oY3yntfEcE8qufrsVnA12BexIJe8EksA
X-Proofpoint-GUID: oY3yntfEcE8qufrsVnA12BexIJe8EksA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=821 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100213

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/garcon/{garcon_4.16.1.bb => garcon_4.18.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_4.16.1.bb => garcon_4.18.0.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb b/meta-xfce/recipes-xfce/garcon/garcon_4.18.0.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_4.18.0.bb
index 14f0c4a64..6a1ee7b7f 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.18.0.bb
@@ -11,7 +11,7 @@ inherit xfce gtk-doc gobject-introspection features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[sha256sum] = "84914927a2c1fda167f67af26a6640630a744a22940df508aa6c752cdbd3d21d"
+SRC_URI[sha256sum] = "54633487566a8b8502b71c11a7f719efe27c069bd5773cc95f11ff4ea8f11a14"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
2.17.1


