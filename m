Return-Path: <kwangsub.kim@qt.io>
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40093.outbound.protection.outlook.com [40.107.4.93])
	by mail.openembedded.org (Postfix) with ESMTP id DCC1B60602
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 10:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Br4N6qVePX01DpYLN2gr/pflyOav/soAth+MdlW04sI=;
	b=JGg+95UfY36U7SQo51n8QVLX9V7ipqxEEp5oh9fN+9pnm7oagq6AtcuehmI168FCdyAPiGGS7QLxXsNwrjkvMgrhLii6A56w60tk3lz8vBN3RPre5kP/6T5cdluI79uV+k1aY/385n1Bt4gtvjtoGeff0piklphPxs6yi89zrtg=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=kwangsub.kim@qt.io; 
Received: from localhost.localdomain (175.195.156.153) by
	HE1PR0202MB2489.eurprd02.prod.outlook.com (10.168.183.135) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7;
	Thu, 21 Sep 2017 04:14:36 +0000
From: Kwangsub Kim <kwangsub.kim@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 13:14:07 +0900
Message-Id: <1505967247-22601-1-git-send-email-kwangsub.kim@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [175.195.156.153]
X-ClientProxiedBy: SLXP216CA0059.KORP216.PROD.OUTLOOK.COM (10.174.33.149) To
	HE1PR0202MB2489.eurprd02.prod.outlook.com (10.168.183.135)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2955a5a2-8b10-4c3c-eda7-08d500a74617
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:HE1PR0202MB2489; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2489;
	3:9Aquq9RXuxXvSHKi+qibbpUkGJAIFljRCwhRFaIfw8LWHfq76W0OpAmrUgR8j7ZSaaaisGCzSMZhTgGNj3RFReAnYGA2BJUn3oueZGvHddsPyUUfYLY0eeMe2mclcKKnqdeC/N1BciyE/XSDceDngbdxZP+DVtwb3IDsqHJDi1uHPvGC7B5bIwExiIsmPbrOLXrhrOPyooBgLKv52oxcyF+2nEsvxgLBi7zWEmgNu6uDkHwIoJ0rzdPXxlbj185s;
	25:2LiJambGZs8hvGL0YH/ZsepGwCU6ychRImrP7lmqkJrVG7xBaHoPM+3NlFQ9ymZjvYWVvKcn1l9WFexzbTfvZd87JIkl/nvyPccyaFZUm7lX5vV2OfFdug5qVJnMf70UPPbJpKmkSjLFIcedKTyX7So2AbMHG6rowPlCJwr0NTov/ruKo3M9wSBbkDTNn1THzVEDmEUDUUb0JCN5S5F6VEoW01AzKfDrYz5APhcr3nKl6oyOwFK7snwohqRyEOcD9SMO3ko0dH/Ki0L5+ukn17skjF0cv4OJRBgBBP66zy+dIFwx4tFRTsvj42JvzhaLO19vo4gZsYtN01G4iXjc1A==;
	31:NxR8cWLHYFY8M+At2mRgW8GmcrXVoEWsQzgvn55UFdn/KCYow4fbbRkKC5lCYk85UjLKoqQuBjM5sJXWzjS60hsqKuCv9GbTxnUe0w2MWjP4+sRZ2oKSxWPpgBji00gnhhA0mGhX0CnjZUKcg5QtMDB31ZWCzvsVMxsGzit3sM+hT74iK0ObRJRGHxS5LG+ssvGfsTdloowPgr8Q/HNIDMAjBwZsA2LExuiB4KzVPLQ=
X-MS-TrafficTypeDiagnostic: HE1PR0202MB2489:|HE1PR0202MB2489:
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2489;
	20:ouldJS2QAey6mpg/BgWSkWNxQ0+sEQePe4IQEyE8TdWzuw74VQeOmdgJhfk+wD72x3oqzPJX4EhjwkUPlw4B2jPnvgxZL9qiM+OHQ+A3NP19Du66/OY3+mcAvqTvTW7Ku8E3UEzLeOFea0szGMcFlQOuSEDaKVFytfrDbhoeL0vmfTpsFnZQAnpI3BeLK4BTTINsw3fi7+aFp4n+AQiAIG7JXHFs6hBvuuaLgfoZDiuW08ijvw2scsEWiR+HgyqV5mEZhsxYM5q+O7/ynaqV/Ha+Di/wKLfsjIURNqMRVeRjtgtpJHyyt0sHtWtqw5i5NvuZd9CsnVpsTHF20THDnFHiyt6FmU0Y1sNWZt06aZ39EyusExMksg6z6d5N+wlohOehANqtF9naZhKRiCDMZDOsGsWQgzoyK2bdNI2h23uWuZTzJsqAxJSlXtxBYCHDFkunbS4552aTtwK8SdSR2BpJTWc03WVA2a8xslVGkBt2gnbXuYviVTRrJHli0lL9;
	4:JrAav6Tv55XDcqrf4bvuo3Q2O17FtMRXt6l0Po2WRAqI9CGSnjaoXcQpvdze86qJ8QHRjNqYsRoR/y+dkRB5dPCl3PX3B10byWoV1gG0DnFbuRXhsXiIoGOrsG05PkmEPcFz0pyZglKll9OOMTNbkjMpO6jYx5/xRH9+nSZf2lyGBS2s8lUxyGyfsMpeZfxMyxM/OEvG0O5yL4RxbK+X10LgSEsB3be7/+BC8EY2Ow0Z/LT4/QdDvscv9pNy9qBW
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <HE1PR0202MB2489D3F08550E86765FB0F0A86660@HE1PR0202MB2489.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6041248)(20161123564025)(20161123560025)(20161123555025)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:HE1PR0202MB2489; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1PR0202MB2489; 
X-Forefront-PRVS: 04371797A5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(6009001)(39830400002)(346002)(376002)(189002)(199003)(66066001)(50466002)(48376002)(5660300001)(6486002)(478600001)(6506006)(86362001)(97736004)(6666003)(47776003)(189998001)(575784001)(106356001)(81166006)(81156014)(36756003)(6916009)(2361001)(68736007)(33646002)(25786009)(105586002)(8936002)(50986999)(2351001)(8676002)(16586007)(2906002)(3846002)(6116002)(101416001)(16526017)(50226002)(305945005)(316002)(53936002)(5003940100001)(74482002)(7736002)(6512007)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0202MB2489;
	H:localhost.localdomain; FPR:; SPF:None; PTR:InfoNoRecords; MX:1;
	A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0202MB2489;
	23:Z3IIe1+1FxDa/5ydDyArszzF5KxJPm18UUEJL+N?=
	=?us-ascii?Q?3nk8WMO3100kJb6/xdXF5cB5rHU7atbsjIvftdWP119I2zSATTADAncDFVj+?=
	=?us-ascii?Q?GmRoQiErQ9ekj2dGmRnl3/yJl36QdkVbOqYcQ22H/uVJAHhOvStpmSt0LgLR?=
	=?us-ascii?Q?PVpDrQik6LKfSaC7xzQ9tSbsKdiKDKXgrAcsr9tPnwrhtdi95GF55SH5+coM?=
	=?us-ascii?Q?2mAjWDsvp8Lx2fjDkqNU1Jj0Z66foEdwtc8GzjG/5gkLOsLo3N7tMxhWciB8?=
	=?us-ascii?Q?N149+LWtvRW9jYrP5ZlT/hOKnQdpl79KAbFdJL9A11QTzZKrQGIosUcth7lb?=
	=?us-ascii?Q?Jxcpadnvfji3BA/oXw2TfdH+hhJhAU1snID8sWZ+hQ8N61JCDHQT+E8Vih/Y?=
	=?us-ascii?Q?l/CjVEJMD9jY6HU6L7GqRU4cxgSYticxdZ1rzWPC43rcbTpIh25asIlRKL/+?=
	=?us-ascii?Q?yhleitt+Yhz4PL+/A5XlpnHugtqwWTnm4h8yLmUQCmB8aEJoL90LLrhZ6f5K?=
	=?us-ascii?Q?TV2kxOZyjYSZ+pHC50uBAxfEoYoTkKryd1Wr1cSPe1EPf4rhO4m3JG07dj6v?=
	=?us-ascii?Q?21Klwn6/4VCRbQb8bfqWv2UoUH2aHXX5uTWxeXNJ4Ouz+ECe4pL6VQl+RmeU?=
	=?us-ascii?Q?79zeUUizcp4qxeVp21z6C4Kx1vyazQqlnPaklYb8QOyQTU7tmXmPQJn5bdTu?=
	=?us-ascii?Q?7ncYYiUrnFiSnYfdra4US4w9FuSCjIX9KriCtPS66mQ9hc2kBq5HxMvpEo+6?=
	=?us-ascii?Q?K8HsphieIGVDbM/HIzrUL/ZFuTHDmc6dhFtlOsC6cUKqMZhp9vFFh/y5o8y0?=
	=?us-ascii?Q?LKC8Zaji93RBJXCODl/50LhOKzgTaH7wvzQxKvx/R6Lhtwit/ppl61m5Vn8w?=
	=?us-ascii?Q?lcNA2W8MDKTcu3nNes6kRGP9IqR/PUDUHlvS7cCvxCaJeHcT/sHrdNVcnbIM?=
	=?us-ascii?Q?dT242HQKavo0JwHmVYL7L0DR6ttmVj+gDWoieiGU1zx252DCyfN2nWmBMHPX?=
	=?us-ascii?Q?mocQeq+8yWHUmb0Fgg4hnWO+YAud60FgCDmfa9f15RdypweRsWvSnzUYM+fD?=
	=?us-ascii?Q?FFmEl5HVGf5JELT7MOVaTSHB0l5AxUyvnAiO5Iiy/u5UBEUT7js6sH1KYY9n?=
	=?us-ascii?Q?u1yL7FYyn4c8vaWbwPwAQ0insKHVwQRlHjL5zzuUVFud0aY7lslRmFA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2489;
	6:5rkYQ5MDVub+EroPXy5bhYyltNH8ol3103xDTZJRMjEA5UIVcXZNmdw2toaZfef25EUrhm4mywFyZExpsPze9kmwwhpn8b7SUaRz9zEwyxi16aCHGAiCr/GnX+RFvA4Tdg2yU4PCK7JZU8b6Gd5WztDgsNAUt6uqiI1wRtAoZk+eR0t7MZWeyTcEFzxg8yleIBMnJIvgQWIIaCvSYwlPeKqX3AQqKoKLUgV3YIo+5zFMtP4Z1LL6rwkmo/+RLmvRKib+6zqZWt5CAMo+hbsEr8DrX5UUWMb6S+Gn/UQVerXlKMlwgCZGalr1nnNh5Cd1MLg9lgIAhwMmXtclKHRgwA==;
	5:fpaf4kGl8LdJoyVF11SR+lture5PqWyoUgZY9PV5aBrgeXuTc5zoox6s3QrmgL+RKI/0/BVx357S1ismnk+vqmw9mVwnTvige9g4Awy05t9CJki/R4+CqOuTgsGFhkyiClq3E9sr6LnOBTvcpXPrRg3LToMn2xWRyDGv0XjMbTY=;
	24:MbopcxBN0Yug0pYosDpTL/XRRZpoFwApGsK7ovFPJjnZYWNKcaU4mEuwJRVWmwkj1xdsxoJH5VJv11GyqftFW2/ao+4gwjKpG3nRWMZgFQI=;
	7:sO991ZfYc1bhwcm50lByoaZEv4oLh+VDjMFtHJHaFE3njP9olZRNQ1ZmpIzrjOpbDjAVHKgbXSx5nK9GVOq2EoEqipDf7jL9jis7mUwr1KRtHukWw01jDz1392vYVvr2FlY4a93bmSkG8SS8y6SoMEssPOCGhg8Wm3rIHgzOEQuGq4wnD9X6iF5eeUjwiyDT8rMHzWPru1psNB3PTtN5xm93E83Ciuvih+9ysm0cKIc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2017 04:14:36.6117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0202MB2489
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2489;
	23:OeQhNGLgfzhrpRPn6iagxIa92gg7/0DIrEMaWJ4+XOXpa3Ae+fk7dECH5za82F70THOq7nTGCn0BLit/qwwJJtp64aNaBejSVEzF8PapEMjywU3L85uhXdGZzYEijWrBXeF1K2OaOHSRtcnv4HnxFw==
X-OriginatorOrg: qt.io
Subject: [meta-qt5][PATCH] qt5: add missing commercial license
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2017 10:21:37 -0000
Content-Type: text/plain

Signed-off-by: Kwangsub Kim <kwangsub.kim@qt.io>
---
 recipes-qt/qt5/qt3d_git.bb             | 2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb       | 2 +-
 recipes-qt/qt5/qtcharts_git.bb         | 2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb      | 2 +-
 recipes-qt/qt5/qtlocation_git.bb       | 2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb | 2 +-
 recipes-qt/qt5/qtserialbus_git.bb      | 2 +-
 recipes-qt/qt5/qtserialport_git.bb     | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index c354db4..0cb75a6 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "LGPL-3.0 | GPL-2.0"
+LICENSE = "LGPL-3.0 | GPL-2.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv3;md5=8211fde12cc8a4e2477602f5953f5b71 \
     file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 25cd72b..f46cbc2 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "LGPL-3.0 | GPL-3.0"
+LICENSE = "LGPL-3.0 | GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index d3447ef..26881f0 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 471cfee..3737e10 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 19f895e..0aebbd3 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index e123f0d..4b2924b 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
+LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.LGPLv3;md5=382747d0119037529ec2b98b24038eb0 \
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index d3a83a7..0b30043 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & (LGPL-3.0 | GPL-2.0+)"
+LICENSE = "GFDL-1.3 & (LGPL-3.0 | GPL-2.0+) | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 056e237..23f03ce 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -3,7 +3,7 @@ require qt5-git.inc
 
 # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
 # other qt* components use :/
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
-- 
2.7.4


