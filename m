Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3742AD262B0
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 06:46:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6641.1768977980219938832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 22:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JUaxW7Dg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54817cf22a=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L20e7i3198663
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 06:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=GCA8IPGag2Nx0QETRore
	aYl3amHWeBPHcf6jnq+AYmI=; b=JUaxW7Dgt1n27MXKGJlkgrx13eET+IdhqQFP
	1mB019yrpzDJ2B95y/HE5DxE1XHl41EzAQf5vrNgHPWpJ8EOmT2tJHZGayGW3psg
	To5p9KVB09pxMHqerrNlPgvqoMaU7LmtINvxgaevW2SkZv/o+g0T3KvcGrB3t5OV
	Dt6Ud6IXwltC/jNX7wJPRLyXvQ73wdPFqQxxNF4f8osGmhZzNmogtJ3xhcmrTR5i
	8Z5bfX+2v7ImK0va3Wwty0jDBr0068sg5bcaRjJox434HzyLVqVWxrIsqoxocENp
	P0v4LsAcoqZ+2FXYR0spukBkEfqHDsqFjZUA3HL3cQ5+HkSl+w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn74r795-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 06:46:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 20 Jan 2026 22:46:18 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 20 Jan 2026 22:46:17 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gtkmm3/gtkmm4: not set BPN
Date: Wed, 21 Jan 2026 14:46:14 +0800
Message-ID: <20260121064614.791543-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA1NCBTYWx0ZWRfX7sUaNy6S5B2t
 ETbA75oz/jKAeXtGx6enuUZuA1QS4KlJyxFl+rQJCg9fhXC3lQIgXQ0Nn+1XEKiPG2Ozmolumml
 ua81yb5GnPl6Tcw+pNCK+6euPPNYOzDYAr68FZz30jvgoRlrq6EmCBSopXhElTwesPaDheYdDVx
 LrnRAp+Wqm02Fz2+ddgpLNpIPJJglu0kQ3jy1c6r3a2vjgZWspWeVol6JyE1lV3/A0yu3rjB+x+
 USW/SpZJmpBmHIVnJqxwxEJ5vRUP+Mt3Z7jlava6TxlQS4EvZYvVJi3HzD5O41RCSzraRfItclA
 wQPuU0mGxW6wYeWZ5W6I6TtfLzBFfO58AgGz0fHcljR8zRC7MGzw1uuipXYE4Z0R8q+ah9pFX2x
 thOQx3wBUfVwIY2jmllcA45TCyxqOv15uNoDS/JkHbixcIWYZ8ncpbjzoNabLw67jtEUyv+9vXL
 hGBQpNXJc3VsvO/fxOA==
X-Proofpoint-GUID: fGWD8BRnw3uXlPGe0WDFlGsMCCvwH2Fj
X-Authority-Analysis: v=2.4 cv=C6rkCAP+ c=1 sm=1 tr=0 ts=6970763b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=Y8F47Iw_hUqxGiOJETQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: fGWD8BRnw3uXlPGe0WDFlGsMCCvwH2Fj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 06:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123683

From: Kai Kang <kai.kang@windriver.com>

Set BPN in gtkmm3 and gtkmm4 recipes is to inherit gnomebase.bbclass
properly. But it uses variable GNOMEBN rather than BPN for SRC_URI and
S in gnomebase.bbclass now, update in the recipes accordingly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb | 3 +--
 meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
index cac6474e73..b09d1150bb 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0-native atkmm pangomm glibmm gtk+3 cairomm gdk-pixbuf-native"
 
-BPN = "gtkmm"
-
+GNOMEBN = "gtkmm"
 
 inherit gnomebase features_check
 
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
index 439ab800f8..0e08bed8a1 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "glib-2.0-native atkmm pangomm-2.48 glibmm gtk4 cairomm-1.16 gdk-pixbuf-native"
 
-BPN = "gtkmm"
+GNOMEBN = "gtkmm"
 
 inherit gnomebase features_check
 
-- 
2.34.1


