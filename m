Return-Path: <prvs=7026ea0ff=Alistair.Francis@wdc.com>
X-Greylist: delayed 383 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Jun 2018 20:21:50 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id C53E577179
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 20:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1529526327; x=1561062327;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=H8rMajEtbXxMVA9cZo5KE8UGCJ94+MplMQjltMy2ggQ=;
	b=OyjEDyYGpmtd5VoCE3BrMvOzNCx7+ybI0yNVYm3fqAwKcCN8XMp4H4v+
	xU2Ff7RpP4QQaTKq1VdVFvAryhbwVOg7OY1VXMqGe92EZCCaBTxiXp2QC
	H7gsAdi9RUCz78qyRUpGXbLvyB3NEGW4kjFoMlOMQG5rTgQ9mskBRIp2k
	8h2C1rRgn1oGW/JEx8BZSPU8Tq8mSo258/yKdKcEeMpg+WAtbFKuIX9BF
	SAiuWiJUdTQUvfkb0X46eRQ1tr5OD4OjykxUdc1XIo/jxZKTbotcN6p88
	jBn/atguU/pE0BkL/PHBpsLYG+84BrYbAqdfK+axHQTlcZ5t34Adnx2Xf w==;
X-IronPort-AV: E=Sophos;i="5.51,249,1526313600"; d="scan'208";a="177973268"
Received: from mail-by2nam05lp0244.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([216.32.181.244])
	by ob1.hgst.iphmx.com with ESMTP; 21 Jun 2018 04:15:46 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xrK9OhoxApV8ifRoDQOeV+SzDsbg9w79pABlhrEPKn4=;
	b=iAnWRcZ6iUOLo90RnohHb4dYZS9jHvTWpyHXLa/cozG3s8F0SE1LsgzBwpI8kfO4h1VHkO/bkKTfEO5vEgJNQYO4uPNEMoVthEqQKOGP1QCuhxuge8gO3/TazMoxgRYrb/R4dB0PvVLq58D7pXOJSORr2Q5QusTiao6GNH4+VNY=
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	BN6PR04MB0386.namprd04.prod.outlook.com (2603:10b6:404:91::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.16; Wed, 20 Jun 2018 20:15:23 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jun 2018 13:15:12 -0700
Message-Id: <20180620201512.23196-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO2PR06CA0073.namprd06.prod.outlook.com
	(2603:10b6:104:3::31) To BN6PR04MB0386.namprd04.prod.outlook.com
	(2603:10b6:404:91::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27d4b4d2-fc82-4809-3398-08d5d6ea8e77
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(711020)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR04MB0386; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0386;
	3:ynfNsp0QCcILTADHVsZ25k5Ja+C1YZjWmxTgwYLZEUa2ybcpASRDHwSzUUuMHdAHz3wLltVMRT7ph0kO8bKOEKaARbpU4OqDkd7vOrYEdMi4w6pscuhDrBc5bXs4S1vSds75t3CXYgetUcHUrVp74Q6AzD3clc5niuInHCieaiw4FfaHsZJYoGZ/0C1eKKvLc+Y/Z4/jcfpXRC12/9ibycIv9VSUPAfNE1IeoR2BX5a9xQyD97mFKJNGtrJjsEqo;
	25:9TSZdZnwJ3kd5EX6VNWkNj3TQrInR9QG0sXrJ2yixUGxUJ0HCk9xvN829axP60SiJLLPfutWHNHTcusfHojZf0qUSik1MANcPBOFdmZl7BEZyslSq6nN9qii+P/72XDLb413qiR/3frumiJRDbaZRJsPs9aJ/YxRkRDZKEKrZG5866HwCWpjN1Kx+8JBZqe2u7O13MXJEl6ZgA5uFWElEDw+d4S8Hu9dyuBugwfdP7oouOV/3xa7ZIvFFc+vNVxNSshTZyNrNruq5a4CE8E6o1dP3WBg+Qx3gALrtTmKmVdx1lF3M6XeBnLN7uP4gVBJKLQUimur/3IHUz9Fol4LIg==;
	31:96V5H3YXbcpoL6M3EHKA6aghom8wLdGaT7o/zeMVGDwwDLhP6iWMyvH9YBSUQOjoQU9G3iaFrXN3S/cglE+N9IdY9oVdkzA0zJKf07dUprjM/BcIRIYDEkH3QbhGUrg7UF3X7ixDr8mgX0LnIk7Dx3gddzjqBbLf26g7JhDdoYqQSHjRsgLHIPxdoCCsTvLWeQO/eH7AjpPjHWd/wZXpHA8jHXnptoLo3DQb6i5e8m8=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0386:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0386;
	20:hV5XqPK/aoaDRlXmYFryyNOzSHk9I1BPFO+RB/mbgjAs9roQiNc5KV9qlGOPx0l/hXrmgWwLeOM34Ua5tLdAWvziuKwFHauosiUKBtiy2Ykuz8XnwEdtngb2BXHw3etmgZJk6stQxIwBq8+AirBB/ijoKNB5SxiZu2buyGP+3vbcLeDQtQ5ykPLA7ayaO0jSBIFHwPhwcKM2jpDHTVEMM6j0slgYTJmKVlntJdyyzmn4OBJDXiy+qHQTZNZCTWv+ih4T3MW60kGRk3KUc2TUSVtYkQ+oTCTgtwWxT8g+Rg1kGQj1R0ig1O5CEozWXlV0i+RxUm6pEMgBbua+r1yAVhAyJDEZtmyI77hBdYTwjEAJmKmkWvHIC4QQhpVVF1DH52TRFJbTfs2Tcalbk1kIZreiieRG1+2eOXKzEzYIauMKyyqabh8UKfFhio2mZEGprBxBjXPlz2EEoYHSuy1dLUXRQ0OxY70cL3MhSKWBWTiPbs+Bj3OcF/RqgAdsVOLo;
	4:a9HWea3RBos1RwUpUgq7+TLOZjB3CZ5zk0zjAqUFBrJN1w0DKesXZ0TQeC4wO5J+7ajUoZb4WxJYoTLwOC4yYQjOavfOytJRIfV03H4g8nbXgyX9DR/o9evahxzRn9KN3667vt20hsX4v4mrqQ70FgzgX2ZEJtYDqQ352D0GRDevvBTyxCfzAi5zj7mxDqzlD7O+ZCubh/iqzHenUbB34vHHI6RY1t5YY75Lxuq+j1ZZhBu5E73PsbLsfSgXZJ6vz1g9ksHGAUvH8JYHuHu4UcyIYfPeVXzNNN9EW/hAK13qr12u23GstNxnZQ8u1wAx4t9lxgZ/xIxrosZ1fRdj+HOY3mhglvJB0wNPCE7Lci+4M/PJdbAPRSipkQaUPKjGAmorDsNhZuOrVK1gUIPbYNINxxS+Y9cYMA5UDQB1LUE=
X-Microsoft-Antispam-PRVS: <BN6PR04MB0386FE2D272CBC6E40AA405890770@BN6PR04MB0386.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(126947320029983)(262104967686372)(5213294742642)(17755550239193);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:BN6PR04MB0386; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0386; 
X-Forefront-PRVS: 070912876F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(366004)(396003)(39860400002)(39380400002)(199004)(189003)(48376002)(966005)(2351001)(1076002)(10710500007)(2361001)(59450400001)(305945005)(52116002)(1857600001)(106356001)(7736002)(51416003)(26005)(16526019)(186003)(68736007)(2906002)(81166006)(8936002)(66066001)(6506007)(6116002)(105586002)(386003)(3846002)(8676002)(50466002)(81156014)(39060400002)(4326008)(47776003)(16200700003)(53946003)(2616005)(25786009)(316002)(72206003)(7110500001)(6916009)(6512007)(478600001)(6306002)(6666003)(476003)(16586007)(6486002)(5660300001)(44832011)(956004)(15650500001)(486006)(53936002)(36756003)(97736004)(575784001)(86362001)(2420400007)(50226002)(579004)(559001)(569006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0386;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR04MB0386;
	23:0/2oSJQzMZcEUE3p6+dhbPWYUjn0z0UXTy2IGkbq1?=
	=?us-ascii?Q?sZtLeW7akQH24X8UaAAG3QcewTsokm3zkkfXIolIstmBrJdJYDKSVzDmVzl7?=
	=?us-ascii?Q?xDK0y5O79kDpu3s/5cnOESK6WgfSEmtQ2fZClexG0wWw3rzYCNOJ1s4p/tx1?=
	=?us-ascii?Q?LA9nkzx8YJUpj43X6wimlStYVZVVIpvziwSM9AwefAyGnCpFCVOYqk8mCSBv?=
	=?us-ascii?Q?sCzgnULQPQ/An+e0cxiNZHP5Dzfqt44oqVi/J6Yj4o61A+pjs/Uc9pApWctB?=
	=?us-ascii?Q?R7c0xgeINQIJfojoD2QnsDk0gqGEwz0Dxpq1rreUMh8Z6jIXaCuqHg1x7iHG?=
	=?us-ascii?Q?G7YgEYWMxNkjqTCztRBRISsCRNBO6fghWkyN8OJRXyI2JZfaDgn8Cxby5FPv?=
	=?us-ascii?Q?yvMtShyihKuOTb6HVk3c5ajwH5VY3vn5tGZSQDTy6Pfo/1i6J5TJLiSod9si?=
	=?us-ascii?Q?ERWPvphM8kOeTyQIdOMMeEg1V1SMp0afG9Gl8Cbz2ZkGbKhRjmIppuMQrcve?=
	=?us-ascii?Q?st/JiCgOSJq94L3B76jXl5GGe+KRyujV7AtCNOoFt33l2vMOH3LOxuj19inT?=
	=?us-ascii?Q?1vjsM1FQmh9IOIf0e0gojYog9Z8uV1+P/tCZwRl+ERQml1IxGEbCe8NKxseg?=
	=?us-ascii?Q?zFyjxv0PR+Frgu4O4gpXZdIHYwP4gDF5C7d5IqavzBLHWio1ZBOaGvhNrjed?=
	=?us-ascii?Q?YSGqEIoS4TalOpQ6wowHDos1/sefSLSpCDcsayaV9oeZtyGLgKx+1Xy2A2S0?=
	=?us-ascii?Q?lmMnSaCPypkMLty7Oc1Wn+6scv1ljlBcvLCY+Binm47SBG/+GACZqQ5/Zcce?=
	=?us-ascii?Q?3GttJI9zhcA0DOMBj0R60sQznNEY7QLhTumFzeur2lEeBQHskZVjdWza0CkM?=
	=?us-ascii?Q?RAmFipdhOsBfTkxvSqv6T8VChdMOdAIEPU1OpwobawOrKr3QF7jUlubXsAm0?=
	=?us-ascii?Q?NS+iDjVjEgWPe0FcX32Kn97WaMNEvzaXQOeBL5uU+G8gyWKK6wibZCsnVvSd?=
	=?us-ascii?Q?ukwSobCNUXxA9BUrlLbe9mITp/DlNwZk+kX9M9ikwEeAkw6pw0zisMDs7eYc?=
	=?us-ascii?Q?RNgIdn69ASSQ+ytRAT5kvHhH6752g3PO3QpUe3SqJWXbqlRBUx9eHSiv/6hd?=
	=?us-ascii?Q?uoLoNEFvBQo5Kb5+c9PzscfO03T9+1+xZt+wuKa10bSkk7bKzPSlqml+9pRX?=
	=?us-ascii?Q?ZMSjHmnS/mUVONK5bDyNstvEAXwlALpNn6q+HWfKHmUlpxvXzlbLsb/4UFz3?=
	=?us-ascii?Q?xfOebUGufeiIvL6cQcIDBlZD/b3l4xWjaGufNTnwsogjIyCYa6+QsyIP8KyH?=
	=?us-ascii?Q?q7fVoE1N+oYvICFTn2fWQTeUgI6uvnd7q4Ueai8N5QlCLcWyjzX7RnrtaeEZ?=
	=?us-ascii?Q?rDEviuaver5eSudgQEzZEmEe/X9zfp3XE0yZr4pLIDoOyHkHpwUu1ZWmnYTn?=
	=?us-ascii?Q?J6tjm1DJvFxrH4rtNO3NkZAPIE7KwgouYn7yMOKo32jk5oDCyCx2dsAw66aC?=
	=?us-ascii?Q?I3KyEF8wGBMoIFH53+Qvo47A9gDYf6EaDb8wzAm6aZkFCZh3cJcl03XaErSH?=
	=?us-ascii?Q?9RDHU7BV++PpSz97w=3D=3D?=
X-Microsoft-Antispam-Message-Info: 9p4ScCUM/gnTqrXE2KifZd1nDhLOp10TZwwK7sh11AszB72W4uQJNNkx2edq/ZmX+gIOcVirdXTgJZa+CYo1QVWPzOMMFyltukIkhivj7z/WKwnbBnFylWS4O7YKCCO9V5fSt2bFuE/5qm4i33fQzB45e00XID21EhYY34wcGh2XmJwmjiAPRMFhVi7fppU1wnXm04nWYgcl5qY7vefmEHr3BaN+cUN80LmEXgq8LlE69Hza/rHlo9VQhoVD15iSC3X0Dki8n3hLM1mtzXEi5Uof+hr9hN5s3YodEqcX2BQMPavzR91l7bUYg5DaOhm92Qf7gSsqVPX/8evuaIB48A==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0386;
	6:iyHpjvtKlQLQNlR6anG/RISIZcPbf3QTzXcARTJMIwXUXlPH4X5OjBKDWu54hUUeL+w5u/AuiTHI60jT0NSF00NTQb06BCRmPGJaZn/jpRr/ONEAW0gI9zhJCUdP4S4EwuGnDmlWkaNe3yJK7RPsP17R7Coak/uKEB45FPSDUAMEjkisTF6xoZt8DimyG1OAE3uiVUa/H5t5A38YJKmhgpQvHsuI7I3NdAsKfXr6s6KpZe6fmqd1YpaR/zG1JJS6LiKMeRC37i/QlwReOVXhe4m/DcR43CCqdRbVLJyritH87DqUEvYKqu22v+KCaLSr/QpFmwZakQlWpZ3czhM8xkuHKUeFpDyujeSWaBwt4fxC7PAeYrT4FgxErWCGlewY5mW29/hAprUz0SIvPNp2deFzD/Pj+O9qcCnFTPKCz+utFFT58y8cv3ApIVWSyaSHOHl8dKEQIj8oCk1x3D+xnw==;
	5:CL1kZ6vnNMMsHMgE21DV16g4BdPIV3RcwT1b4Wn5sA0LNDfbeg7nJu09+k/rAVzi7JWOyZg12agymmzH6mSUHoU+dXN+9rpVoEOT4ij+n2xtqw7U8+/5i8JrQSdezSKjjCdJ+VJHO6Ybjo0R+FcKFbmyC4pZZHiGhCwzGCNmGrg=;
	24:CLn7VwQjDmfIu2KP8SCCaFCDlCOhu2qNVD2LG2zCtMbX7NFIoP5Ly+9x87Xm/GW+jXUnQLj7nihhgQ9AMepiDWf6C39kCtMN5N679cG2lHs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0386;
	7:KtFbAlrdNVNRD8nUV0ZM1cpPIDuBadWJwNEmnBpfiwviE93CiAwsGEsOAOr7aUoiqsjVE0NxX0g86gWwDz1FE2mxYy6quVPg1KnehPJk2siZO5j8gyYFOY6Wq0miUxNruOZnJfuckKHk+hPzkBcTuTOaFCGyaJUZJ3JcdSBv9656MXbs7EA/6WrizwbctbTiARGOHDj2iAqrfu30/Yyx5pZe07ytXSTankcXGlnxF3UhQWqtlMCQGyJpUOQ1OY6u;
	20:Mr7SO5ce3UEHLdCFKA7Qik2Uyx3jJ9I0EhLH5x6b39PaD6s7xj8CapsHb3c1w99bO9gD3RENam/e5rkp/IeXckt9KL9zd71G3HzubsgrjYV2dnpDS+I5LvqCnydjUvgfar/XxJ3/mWKHKm1xHPXC5iQ088ZKmfTninayyXD1MuM=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2018 20:15:23.8973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d4b4d2-fc82-4809-3398-08d5d6ea8e77
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0386
Cc: alistair23@gmail.com
Subject: [meta-oe][PATCH] mozjs: Update Double-Conversion inside mozjs
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
X-List-Received-Date: Wed, 20 Jun 2018 20:21:51 -0000
Content-Type: text/plain

Update the Double-Conversion source inside mozjs to add support for more
architectures.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../mozjs/0003-Add-AArch64-support.patch      |   76 -
 .../mozjs/Update-Double-Conversion.patch      | 1732 +++++++++++++++++
 ...-the-double-conversion-update-script.patch |  175 ++
 .../recipes-extended/mozjs/mozjs_17.0.0.bb    |    3 +-
 4 files changed, 1909 insertions(+), 77 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0003-Add-AArch64-support.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/Update-Double-Conversion.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/Update-the-double-conversion-update-script.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0003-Add-AArch64-support.patch b/meta-oe/recipes-extended/mozjs/mozjs/0003-Add-AArch64-support.patch
deleted file mode 100644
index 6e724292a..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs/0003-Add-AArch64-support.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 15e710e331d36eb279852b5cd1ba37a9a6005217 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen.kooi@linaro.org>
-Date: Mon, 2 Mar 2015 19:08:22 +0800
-Subject: [PATCH 3/5] Add AArch64 support
-
----
-Upstream-status: Pending
-
- js/src/assembler/jit/ExecutableAllocator.h | 6 ++++++
- js/src/assembler/wtf/Platform.h            | 4 ++++
- js/src/configure.in                        | 4 ++++
- mfbt/double-conversion/utils.h             | 1 +
- 4 files changed, 15 insertions(+)
-
-diff --git a/js/src/assembler/jit/ExecutableAllocator.h b/js/src/assembler/jit/ExecutableAllocator.h
-index c071c33..90764c3 100644
---- a/js/src/assembler/jit/ExecutableAllocator.h
-+++ b/js/src/assembler/jit/ExecutableAllocator.h
-@@ -382,6 +382,12 @@ public:
-     {
-         reprotectRegion(start, size, Executable);
-     }
-+#elif WTF_CPU_AARCH64 && WTF_PLATFORM_LINUX
-+    static void cacheFlush(void* code, size_t size)
-+    {
-+        intptr_t end = reinterpret_cast<intptr_t>(code) + size;
-+        __builtin___clear_cache(reinterpret_cast<char*>(code), reinterpret_cast<char*>(end));
-+    }
- #else
-     static void makeWritable(void*, size_t) {}
-     static void makeExecutable(void*, size_t) {}
-diff --git a/js/src/assembler/wtf/Platform.h b/js/src/assembler/wtf/Platform.h
-index 0c84896..e8763a7 100644
---- a/js/src/assembler/wtf/Platform.h
-+++ b/js/src/assembler/wtf/Platform.h
-@@ -325,6 +325,10 @@
- #define WTF_THUMB_ARCH_VERSION 0
- #endif
- 
-+/* CPU(AArch64) - 64-bit ARM */
-+#if defined(__aarch64__)
-+#define WTF_CPU_AARCH64 1
-+#endif
- 
- /* WTF_CPU_ARMV5_OR_LOWER - ARM instruction set v5 or earlier */
- /* On ARMv5 and below the natural alignment is required. 
-diff --git a/js/src/configure.in b/js/src/configure.in
-index 64c7606..0673aca 100644
---- a/js/src/configure.in
-+++ b/js/src/configure.in
-@@ -1121,6 +1121,10 @@ arm*)
-     CPU_ARCH=arm
-     ;;
- 
-+aarch64)
-+    CPU_ARCH=aarch64
-+    ;;
-+
- mips|mipsel)
-     CPU_ARCH="mips"
-     ;;
-diff --git a/mfbt/double-conversion/utils.h b/mfbt/double-conversion/utils.h
-index 0eec2d9..fe26dab 100644
---- a/mfbt/double-conversion/utils.h
-+++ b/mfbt/double-conversion/utils.h
-@@ -58,6 +58,7 @@
-     defined(__mips__) || defined(__powerpc__) || \
-     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
-     defined(__SH4__) || defined(__alpha__) || \
-+    defined(__aarch64__) || \
-     defined(_MIPS_ARCH_MIPS32R2)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
--- 
-1.9.3
-
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/Update-Double-Conversion.patch b/meta-oe/recipes-extended/mozjs/mozjs/Update-Double-Conversion.patch
new file mode 100644
index 000000000..c5979c97b
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/Update-Double-Conversion.patch
@@ -0,0 +1,1732 @@
+From b4961d6e1d273dd9643fc3c055163d5cd3362fb7 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 1 Jun 2018 14:47:31 -0700
+Subject: [PATCH] Update double conversion
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ mfbt/double-conversion/COPYING              |  26 ++
+ mfbt/double-conversion/bignum-dtoa.cc       |  19 +-
+ mfbt/double-conversion/bignum-dtoa.h        |   2 +-
+ mfbt/double-conversion/bignum.cc            |  39 +--
+ mfbt/double-conversion/bignum.h             |   5 +-
+ mfbt/double-conversion/cached-powers.cc     |  14 +-
+ mfbt/double-conversion/cached-powers.h      |   2 +-
+ mfbt/double-conversion/diy-fp.cc            |   4 +-
+ mfbt/double-conversion/diy-fp.h             |  24 +-
+ mfbt/double-conversion/double-conversion.cc | 293 ++++++++++++++------
+ mfbt/double-conversion/double-conversion.h  |  78 +++---
+ mfbt/double-conversion/fast-dtoa.cc         |  29 +-
+ mfbt/double-conversion/fast-dtoa.h          |   2 +-
+ mfbt/double-conversion/fixed-dtoa.cc        |  23 +-
+ mfbt/double-conversion/fixed-dtoa.h         |   2 +-
+ mfbt/double-conversion/ieee.h               |   8 +-
+ mfbt/double-conversion/strtod.cc            |  59 ++--
+ mfbt/double-conversion/strtod.h             |   2 +-
+ mfbt/double-conversion/utils.h              |  62 +++--
+ 19 files changed, 465 insertions(+), 228 deletions(-)
+ create mode 100644 mfbt/double-conversion/COPYING
+
+diff --git a/mfbt/double-conversion/COPYING b/mfbt/double-conversion/COPYING
+new file mode 100644
+index 0000000..933718a
+--- /dev/null
++++ b/mfbt/double-conversion/COPYING
+@@ -0,0 +1,26 @@
++Copyright 2006-2011, the V8 project authors. All rights reserved.
++Redistribution and use in source and binary forms, with or without
++modification, are permitted provided that the following conditions are
++met:
++
++    * Redistributions of source code must retain the above copyright
++      notice, this list of conditions and the following disclaimer.
++    * Redistributions in binary form must reproduce the above
++      copyright notice, this list of conditions and the following
++      disclaimer in the documentation and/or other materials provided
++      with the distribution.
++    * Neither the name of Google Inc. nor the names of its
++      contributors may be used to endorse or promote products derived
++      from this software without specific prior written permission.
++
++THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
++A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
++OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
++SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
++OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+diff --git a/mfbt/double-conversion/bignum-dtoa.cc b/mfbt/double-conversion/bignum-dtoa.cc
+index b6c2e85..06bdf55 100644
+--- a/mfbt/double-conversion/bignum-dtoa.cc
++++ b/mfbt/double-conversion/bignum-dtoa.cc
+@@ -25,12 +25,12 @@
+ // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-#include <math.h>
++#include <cmath>
+ 
+-#include "bignum-dtoa.h"
++#include <bignum-dtoa.h>
+ 
+-#include "bignum.h"
+-#include "ieee.h"
++#include <bignum.h>
++#include <ieee.h>
+ 
+ namespace double_conversion {
+ 
+@@ -192,13 +192,13 @@ static void GenerateShortestDigits(Bignum* numerator, Bignum* denominator,
+     delta_plus = delta_minus;
+   }
+   *length = 0;
+-  while (true) {
++  for (;;) {
+     uint16_t digit;
+     digit = numerator->DivideModuloIntBignum(*denominator);
+     ASSERT(digit <= 9);  // digit is a uint16_t and therefore always positive.
+     // digit = numerator / denominator (integer division).
+     // numerator = numerator % denominator.
+-    buffer[(*length)++] = digit + '0';
++    buffer[(*length)++] = static_cast<char>(digit + '0');
+ 
+     // Can we stop already?
+     // If the remainder of the division is less than the distance to the lower
+@@ -282,7 +282,7 @@ static void GenerateShortestDigits(Bignum* numerator, Bignum* denominator,
+ // exponent (decimal_point), when rounding upwards.
+ static void GenerateCountedDigits(int count, int* decimal_point,
+                                   Bignum* numerator, Bignum* denominator,
+-                                  Vector<char>(buffer), int* length) {
++                                  Vector<char> buffer, int* length) {
+   ASSERT(count >= 0);
+   for (int i = 0; i < count - 1; ++i) {
+     uint16_t digit;
+@@ -290,7 +290,7 @@ static void GenerateCountedDigits(int count, int* decimal_point,
+     ASSERT(digit <= 9);  // digit is a uint16_t and therefore always positive.
+     // digit = numerator / denominator (integer division).
+     // numerator = numerator % denominator.
+-    buffer[i] = digit + '0';
++    buffer[i] = static_cast<char>(digit + '0');
+     // Prepare for next iteration.
+     numerator->Times10();
+   }
+@@ -300,7 +300,8 @@ static void GenerateCountedDigits(int count, int* decimal_point,
+   if (Bignum::PlusCompare(*numerator, *numerator, *denominator) >= 0) {
+     digit++;
+   }
+-  buffer[count - 1] = digit + '0';
++  ASSERT(digit <= 10);
++  buffer[count - 1] = static_cast<char>(digit + '0');
+   // Correct bad digits (in case we had a sequence of '9's). Propagate the
+   // carry until we hat a non-'9' or til we reach the first digit.
+   for (int i = count - 1; i > 0; --i) {
+diff --git a/mfbt/double-conversion/bignum-dtoa.h b/mfbt/double-conversion/bignum-dtoa.h
+index 34b9619..88d936a 100644
+--- a/mfbt/double-conversion/bignum-dtoa.h
++++ b/mfbt/double-conversion/bignum-dtoa.h
+@@ -28,7 +28,7 @@
+ #ifndef DOUBLE_CONVERSION_BIGNUM_DTOA_H_
+ #define DOUBLE_CONVERSION_BIGNUM_DTOA_H_
+ 
+-#include "utils.h"
++#include <utils.h>
+ 
+ namespace double_conversion {
+ 
+diff --git a/mfbt/double-conversion/bignum.cc b/mfbt/double-conversion/bignum.cc
+index 747491a..4786c2e 100644
+--- a/mfbt/double-conversion/bignum.cc
++++ b/mfbt/double-conversion/bignum.cc
+@@ -25,13 +25,13 @@
+ // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-#include "bignum.h"
+-#include "utils.h"
++#include <bignum.h>
++#include <utils.h>
+ 
+ namespace double_conversion {
+ 
+ Bignum::Bignum()
+-    : bigits_(bigits_buffer_, kBigitCapacity), used_digits_(0), exponent_(0) {
++    : bigits_buffer_(), bigits_(bigits_buffer_, kBigitCapacity), used_digits_(0), exponent_(0) {
+   for (int i = 0; i < kBigitCapacity; ++i) {
+     bigits_[i] = 0;
+   }
+@@ -40,6 +40,7 @@ Bignum::Bignum()
+ 
+ template<typename S>
+ static int BitSize(S value) {
++  (void) value;  // Mark variable as used.
+   return 8 * sizeof(value);
+ }
+ 
+@@ -103,7 +104,7 @@ void Bignum::AssignDecimalString(Vector<const char> value) {
+   const int kMaxUint64DecimalDigits = 19;
+   Zero();
+   int length = value.length();
+-  int pos = 0;
++  unsigned int pos = 0;
+   // Let's just say that each digit needs 4 bits.
+   while (length >= kMaxUint64DecimalDigits) {
+     uint64_t digits = ReadUInt64(value, pos, kMaxUint64DecimalDigits);
+@@ -122,9 +123,8 @@ void Bignum::AssignDecimalString(Vector<const char> value) {
+ static int HexCharValue(char c) {
+   if ('0' <= c && c <= '9') return c - '0';
+   if ('a' <= c && c <= 'f') return 10 + c - 'a';
+-  if ('A' <= c && c <= 'F') return 10 + c - 'A';
+-  UNREACHABLE();
+-  return 0;  // To make compiler happy.
++  ASSERT('A' <= c && c <= 'F');
++  return 10 + c - 'A';
+ }
+ 
+ 
+@@ -445,26 +445,27 @@ void Bignum::AssignPowerUInt16(uint16_t base, int power_exponent) {
+   mask >>= 2;
+   uint64_t this_value = base;
+ 
+-  bool delayed_multipliciation = false;
++  bool delayed_multiplication = false;
+   const uint64_t max_32bits = 0xFFFFFFFF;
+   while (mask != 0 && this_value <= max_32bits) {
+     this_value = this_value * this_value;
+     // Verify that there is enough space in this_value to perform the
+     // multiplication.  The first bit_size bits must be 0.
+     if ((power_exponent & mask) != 0) {
++      ASSERT(bit_size > 0);
+       uint64_t base_bits_mask =
+           ~((static_cast<uint64_t>(1) << (64 - bit_size)) - 1);
+       bool high_bits_zero = (this_value & base_bits_mask) == 0;
+       if (high_bits_zero) {
+         this_value *= base;
+       } else {
+-        delayed_multipliciation = true;
++        delayed_multiplication = true;
+       }
+     }
+     mask >>= 1;
+   }
+   AssignUInt64(this_value);
+-  if (delayed_multipliciation) {
++  if (delayed_multiplication) {
+     MultiplyByUInt32(base);
+   }
+ 
+@@ -501,13 +502,14 @@ uint16_t Bignum::DivideModuloIntBignum(const Bignum& other) {
+   // Start by removing multiples of 'other' until both numbers have the same
+   // number of digits.
+   while (BigitLength() > other.BigitLength()) {
+-    // This naive approach is extremely inefficient if the this divided other
+-    // might be big. This function is implemented for doubleToString where
++    // This naive approach is extremely inefficient if `this` divided by other
++    // is big. This function is implemented for doubleToString where
+     // the result should be small (less than 10).
+     ASSERT(other.bigits_[other.used_digits_ - 1] >= ((1 << kBigitSize) / 16));
++    ASSERT(bigits_[used_digits_ - 1] < 0x10000);
+     // Remove the multiples of the first digit.
+     // Example this = 23 and other equals 9. -> Remove 2 multiples.
+-    result += bigits_[used_digits_ - 1];
++    result += static_cast<uint16_t>(bigits_[used_digits_ - 1]);
+     SubtractTimes(other, bigits_[used_digits_ - 1]);
+   }
+ 
+@@ -523,13 +525,15 @@ uint16_t Bignum::DivideModuloIntBignum(const Bignum& other) {
+     // Shortcut for easy (and common) case.
+     int quotient = this_bigit / other_bigit;
+     bigits_[used_digits_ - 1] = this_bigit - other_bigit * quotient;
+-    result += quotient;
++    ASSERT(quotient < 0x10000);
++    result += static_cast<uint16_t>(quotient);
+     Clamp();
+     return result;
+   }
+ 
+   int division_estimate = this_bigit / (other_bigit + 1);
+-  result += division_estimate;
++  ASSERT(division_estimate < 0x10000);
++  result += static_cast<uint16_t>(division_estimate);
+   SubtractTimes(other, division_estimate);
+ 
+   if (other_bigit * (division_estimate + 1) > this_bigit) {
+@@ -560,8 +564,8 @@ static int SizeInHexChars(S number) {
+ 
+ static char HexCharOfValue(int value) {
+   ASSERT(0 <= value && value <= 16);
+-  if (value < 10) return value + '0';
+-  return value - 10 + 'A';
++  if (value < 10) return static_cast<char>(value + '0');
++  return static_cast<char>(value - 10 + 'A');
+ }
+ 
+ 
+@@ -755,7 +759,6 @@ void Bignum::SubtractTimes(const Bignum& other, int factor) {
+     Chunk difference = bigits_[i] - borrow;
+     bigits_[i] = difference & kBigitMask;
+     borrow = difference >> (kChunkSize - 1);
+-    ++i;
+   }
+   Clamp();
+ }
+diff --git a/mfbt/double-conversion/bignum.h b/mfbt/double-conversion/bignum.h
+index 5ec3544..4fdad0c 100644
+--- a/mfbt/double-conversion/bignum.h
++++ b/mfbt/double-conversion/bignum.h
+@@ -28,7 +28,7 @@
+ #ifndef DOUBLE_CONVERSION_BIGNUM_H_
+ #define DOUBLE_CONVERSION_BIGNUM_H_
+ 
+-#include "utils.h"
++#include <utils.h>
+ 
+ namespace double_conversion {
+ 
+@@ -49,7 +49,6 @@ class Bignum {
+ 
+   void AssignPowerUInt16(uint16_t base, int exponent);
+ 
+-  void AddUInt16(uint16_t operand);
+   void AddUInt64(uint64_t operand);
+   void AddBignum(const Bignum& other);
+   // Precondition: this >= other.
+@@ -137,7 +136,7 @@ class Bignum {
+   // The Bignum's value equals value(bigits_) * 2^(exponent_ * kBigitSize).
+   int exponent_;
+ 
+-  DISALLOW_COPY_AND_ASSIGN(Bignum);
++  DC_DISALLOW_COPY_AND_ASSIGN(Bignum);
+ };
+ 
+ }  // namespace double_conversion
+diff --git a/mfbt/double-conversion/cached-powers.cc b/mfbt/double-conversion/cached-powers.cc
+index c676429..06e819d 100644
+--- a/mfbt/double-conversion/cached-powers.cc
++++ b/mfbt/double-conversion/cached-powers.cc
+@@ -25,13 +25,13 @@
+ // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-#include <stdarg.h>
+-#include <limits.h>
+-#include <math.h>
++#include <climits>
++#include <cmath>
++#include <cstdarg>
+ 
+-#include "utils.h"
++#include <utils.h>
+ 
+-#include "cached-powers.h"
++#include <cached-powers.h>
+ 
+ namespace double_conversion {
+ 
+@@ -131,7 +131,6 @@ static const CachedPower kCachedPowers[] = {
+   {UINT64_2PART_C(0xaf87023b, 9bf0ee6b), 1066, 340},
+ };
+ 
+-static const int kCachedPowersLength = ARRAY_SIZE(kCachedPowers);
+ static const int kCachedPowersOffset = 348;  // -1 * the first decimal_exponent.
+ static const double kD_1_LOG2_10 = 0.30102999566398114;  //  1 / lg(10)
+ // Difference between the decimal exponents in the table above.
+@@ -149,9 +148,10 @@ void PowersOfTenCache::GetCachedPowerForBinaryExponentRange(
+   int foo = kCachedPowersOffset;
+   int index =
+       (foo + static_cast<int>(k) - 1) / kDecimalExponentDistance + 1;
+-  ASSERT(0 <= index && index < kCachedPowersLength);
++  ASSERT(0 <= index && index < static_cast<int>(ARRAY_SIZE(kCachedPowers)));
+   CachedPower cached_power = kCachedPowers[index];
+   ASSERT(min_exponent <= cached_power.binary_exponent);
++  (void) max_exponent;  // Mark variable as used.
+   ASSERT(cached_power.binary_exponent <= max_exponent);
+   *decimal_exponent = cached_power.decimal_exponent;
+   *power = DiyFp(cached_power.significand, cached_power.binary_exponent);
+diff --git a/mfbt/double-conversion/cached-powers.h b/mfbt/double-conversion/cached-powers.h
+index 61a5061..a425d7c 100644
+--- a/mfbt/double-conversion/cached-powers.h
++++ b/mfbt/double-conversion/cached-powers.h
+@@ -28,7 +28,7 @@
+ #ifndef DOUBLE_CONVERSION_CACHED_POWERS_H_
+ #define DOUBLE_CONVERSION_CACHED_POWERS_H_
+ 
+-#include "diy-fp.h"
++#include <diy-fp.h>
+ 
+ namespace double_conversion {
+ 
+diff --git a/mfbt/double-conversion/diy-fp.cc b/mfbt/double-conversion/diy-fp.cc
+index ddd1891..f31cf60 100644
+--- a/mfbt/double-conversion/diy-fp.cc
++++ b/mfbt/double-conversion/diy-fp.cc
+@@ -26,8 +26,8 @@
+ // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+ 
+-#include "diy-fp.h"
+-#include "utils.h"
++#include <diy-fp.h>
++#include <utils.h>
+ 
+ namespace double_conversion {
+ 
+diff --git a/mfbt/double-conversion/diy-fp.h b/mfbt/double-conversion/diy-fp.h
+index 9dcf8fb..80a8c4c 100644
+--- a/mfbt/double-conversion/diy-fp.h
++++ b/mfbt/double-conversion/diy-fp.h
+@@ -28,7 +28,7 @@
+ #ifndef DOUBLE_CONVERSION_DIY_FP_H_
+ #define DOUBLE_CONVERSION_DIY_FP_H_
+ 
+-#include "utils.h"
++#include <utils.h>
+ 
+ namespace double_conversion {
+ 
+@@ -42,7 +42,7 @@ class DiyFp {
+   static const int kSignificandSize = 64;
+ 
+   DiyFp() : f_(0), e_(0) {}
+-  DiyFp(uint64_t f, int e) : f_(f), e_(e) {}
++  DiyFp(uint64_t significand, int exponent) : f_(significand), e_(exponent) {}
+ 
+   // this = this - other.
+   // The exponents of both numbers must be the same and the significand of this
+@@ -76,22 +76,22 @@ class DiyFp {
+ 
+   void Normalize() {
+     ASSERT(f_ != 0);
+-    uint64_t f = f_;
+-    int e = e_;
++    uint64_t significand = f_;
++    int exponent = e_;
+ 
+     // This method is mainly called for normalizing boundaries. In general
+     // boundaries need to be shifted by 10 bits. We thus optimize for this case.
+     const uint64_t k10MSBits = UINT64_2PART_C(0xFFC00000, 00000000);
+-    while ((f & k10MSBits) == 0) {
+-      f <<= 10;
+-      e -= 10;
++    while ((significand & k10MSBits) == 0) {
++      significand <<= 10;
++      exponent -= 10;
+     }
+-    while ((f & kUint64MSB) == 0) {
+-      f <<= 1;
+-      e--;
++    while ((significand & kUint64MSB) == 0) {
++      significand <<= 1;
++      exponent--;
+     }
+-    f_ = f;
+-    e_ = e;
++    f_ = significand;
++    e_ = exponent;
+   }
+ 
+   static DiyFp Normalize(const DiyFp& a) {
+diff --git a/mfbt/double-conversion/double-conversion.cc b/mfbt/double-conversion/double-conversion.cc
+index 650137b..7819267 100644
+--- a/mfbt/double-conversion/double-conversion.cc
++++ b/mfbt/double-conversion/double-conversion.cc
+@@ -25,17 +25,18 @@
+ // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-#include <limits.h>
+-#include <math.h>
++#include <climits>
++#include <locale>
++#include <cmath>
+ 
+-#include "double-conversion.h"
++#include <double-conversion.h>
+ 
+-#include "bignum-dtoa.h"
+-#include "fast-dtoa.h"
+-#include "fixed-dtoa.h"
+-#include "ieee.h"
+-#include "strtod.h"
+-#include "utils.h"
++#include <bignum-dtoa.h>
++#include <fast-dtoa.h>
++#include <fixed-dtoa.h>
++#include <ieee.h>
++#include <strtod.h>
++#include <utils.h>
+ 
+ namespace double_conversion {
+ 
+@@ -118,7 +119,7 @@ void DoubleToStringConverter::CreateDecimalRepresentation(
+     StringBuilder* result_builder) const {
+   // Create a representation that is padded with zeros if needed.
+   if (decimal_point <= 0) {
+-      // "0.00000decimal_rep".
++      // "0.00000decimal_rep" or "0.000decimal_rep00".
+     result_builder->AddCharacter('0');
+     if (digits_after_point > 0) {
+       result_builder->AddCharacter('.');
+@@ -129,7 +130,7 @@ void DoubleToStringConverter::CreateDecimalRepresentation(
+       result_builder->AddPadding('0', remaining_digits);
+     }
+   } else if (decimal_point >= length) {
+-    // "decimal_rep0000.00000" or "decimal_rep.0000"
++    // "decimal_rep0000.00000" or "decimal_rep.0000".
+     result_builder->AddSubstring(decimal_digits, length);
+     result_builder->AddPadding('0', decimal_point - length);
+     if (digits_after_point > 0) {
+@@ -137,7 +138,7 @@ void DoubleToStringConverter::CreateDecimalRepresentation(
+       result_builder->AddPadding('0', digits_after_point);
+     }
+   } else {
+-    // "decima.l_rep000"
++    // "decima.l_rep000".
+     ASSERT(digits_after_point > 0);
+     result_builder->AddSubstring(decimal_digits, decimal_point);
+     result_builder->AddCharacter('.');
+@@ -162,7 +163,7 @@ bool DoubleToStringConverter::ToShortestIeeeNumber(
+     double value,
+     StringBuilder* result_builder,
+     DoubleToStringConverter::DtoaMode mode) const {
+-  assert(mode == SHORTEST || mode == SHORTEST_SINGLE);
++  ASSERT(mode == SHORTEST || mode == SHORTEST_SINGLE);
+   if (Double(value).IsSpecial()) {
+     return HandleSpecialValues(value, result_builder);
+   }
+@@ -348,7 +349,6 @@ static BignumDtoaMode DtoaToBignumDtoaMode(
+     case DoubleToStringConverter::PRECISION: return BIGNUM_DTOA_PRECISION;
+     default:
+       UNREACHABLE();
+-      return BIGNUM_DTOA_SHORTEST;  // To silence compiler.
+   }
+ }
+ 
+@@ -403,8 +403,8 @@ void DoubleToStringConverter::DoubleToAscii(double v,
+                              vector, length, point);
+       break;
+     default:
+-      UNREACHABLE();
+       fast_worked = false;
++      UNREACHABLE();
+   }
+   if (fast_worked) return;
+ 
+@@ -415,20 +415,55 @@ void DoubleToStringConverter::DoubleToAscii(double v,
+ }
+ 
+ 
+-// Consumes the given substring from the iterator.
+-// Returns false, if the substring does not match.
+-static bool ConsumeSubString(const char** current,
+-                             const char* end,
+-                             const char* substring) {
+-  ASSERT(**current == *substring);
++namespace {
++
++inline char ToLower(char ch) {
++  static const std::ctype<char>& cType =
++      std::use_facet<std::ctype<char> >(std::locale::classic());
++  return cType.tolower(ch);
++}
++
++inline char Pass(char ch) {
++  return ch;
++}
++
++template <class Iterator, class Converter>
++static inline bool ConsumeSubStringImpl(Iterator* current,
++                                        Iterator end,
++                                        const char* substring,
++                                        Converter converter) {
++  ASSERT(converter(**current) == *substring);
+   for (substring++; *substring != '\0'; substring++) {
+     ++*current;
+-    if (*current == end || **current != *substring) return false;
++    if (*current == end || converter(**current) != *substring) {
++      return false;
++    }
+   }
+   ++*current;
+   return true;
+ }
+ 
++// Consumes the given substring from the iterator.
++// Returns false, if the substring does not match.
++template <class Iterator>
++static bool ConsumeSubString(Iterator* current,
++                             Iterator end,
++                             const char* substring,
++                             bool allow_case_insensibility) {
++  if (allow_case_insensibility) {
++    return ConsumeSubStringImpl(current, end, substring, ToLower);
++  } else {
++    return ConsumeSubStringImpl(current, end, substring, Pass);
++  }
++}
++
++// Consumes first character of the str is equal to ch
++inline bool ConsumeFirstCharacter(char ch,
++                                         const char* str,
++                                         bool case_insensibility) {
++  return case_insensibility ? ToLower(ch) == str[0] : ch == str[0];
++}
++}  // namespace
+ 
+ // Maximum number of significant digits in decimal representation.
+ // The longest possible double in decimal representation is
+@@ -440,10 +475,36 @@ static bool ConsumeSubString(const char** current,
+ const int kMaxSignificantDigits = 772;
+ 
+ 
++static const char kWhitespaceTable7[] = { 32, 13, 10, 9, 11, 12 };
++static const int kWhitespaceTable7Length = ARRAY_SIZE(kWhitespaceTable7);
++
++
++static const uc16 kWhitespaceTable16[] = {
++  160, 8232, 8233, 5760, 6158, 8192, 8193, 8194, 8195,
++  8196, 8197, 8198, 8199, 8200, 8201, 8202, 8239, 8287, 12288, 65279
++};
++static const int kWhitespaceTable16Length = ARRAY_SIZE(kWhitespaceTable16);
++
++
++static bool isWhitespace(int x) {
++  if (x < 128) {
++    for (int i = 0; i < kWhitespaceTable7Length; i++) {
++      if (kWhitespaceTable7[i] == x) return true;
++    }
++  } else {
++    for (int i = 0; i < kWhitespaceTable16Length; i++) {
++      if (kWhitespaceTable16[i] == x) return true;
++    }
++  }
++  return false;
++}
++
++
+ // Returns true if a nonspace found and false if the end has reached.
+-static inline bool AdvanceToNonspace(const char** current, const char* end) {
++template <class Iterator>
++static inline bool AdvanceToNonspace(Iterator* current, Iterator end) {
+   while (*current != end) {
+-    if (**current != ' ') return true;
++    if (!isWhitespace(**current)) return true;
+     ++*current;
+   }
+   return false;
+@@ -462,26 +523,57 @@ static double SignedZero(bool sign) {
+ }
+ 
+ 
++// Returns true if 'c' is a decimal digit that is valid for the given radix.
++//
++// The function is small and could be inlined, but VS2012 emitted a warning
++// because it constant-propagated the radix and concluded that the last
++// condition was always true. By moving it into a separate function the
++// compiler wouldn't warn anymore.
++#if _MSC_VER
++#pragma optimize("",off)
++static bool IsDecimalDigitForRadix(int c, int radix) {
++  return '0' <= c && c <= '9' && (c - '0') < radix;
++}
++#pragma optimize("",on)
++#else
++static bool inline IsDecimalDigitForRadix(int c, int radix) {
++ return '0' <= c && c <= '9' && (c - '0') < radix;
++}
++#endif
++// Returns true if 'c' is a character digit that is valid for the given radix.
++// The 'a_character' should be 'a' or 'A'.
++//
++// The function is small and could be inlined, but VS2012 emitted a warning
++// because it constant-propagated the radix and concluded that the first
++// condition was always false. By moving it into a separate function the
++// compiler wouldn't warn anymore.
++static bool IsCharacterDigitForRadix(int c, int radix, char a_character) {
++  return radix > 10 && c >= a_character && c < a_character + radix - 10;
++}
++
++
+ // Parsing integers with radix 2, 4, 8, 16, 32. Assumes current != end.
+-template <int radix_log_2>
+-static double RadixStringToIeee(const char* current,
+-                                const char* end,
++template <int radix_log_2, class Iterator>
++static double RadixStringToIeee(Iterator* current,
++                                Iterator end,
+                                 bool sign,
+                                 bool allow_trailing_junk,
+                                 double junk_string_value,
+                                 bool read_as_double,
+-                                const char** trailing_pointer) {
+-  ASSERT(current != end);
++                                bool* result_is_junk) {
++  ASSERT(*current != end);
+ 
+   const int kDoubleSize = Double::kSignificandSize;
+   const int kSingleSize = Single::kSignificandSize;
+   const int kSignificandSize = read_as_double? kDoubleSize: kSingleSize;
+ 
++  *result_is_junk = true;
++
+   // Skip leading 0s.
+-  while (*current == '0') {
+-    ++current;
+-    if (current == end) {
+-      *trailing_pointer = end;
++  while (**current == '0') {
++    ++(*current);
++    if (*current == end) {
++      *result_is_junk = false;
+       return SignedZero(sign);
+     }
+   }
+@@ -492,14 +584,14 @@ static double RadixStringToIeee(const char* current,
+ 
+   do {
+     int digit;
+-    if (*current >= '0' && *current <= '9' && *current < '0' + radix) {
+-      digit = static_cast<char>(*current) - '0';
+-    } else if (radix > 10 && *current >= 'a' && *current < 'a' + radix - 10) {
+-      digit = static_cast<char>(*current) - 'a' + 10;
+-    } else if (radix > 10 && *current >= 'A' && *current < 'A' + radix - 10) {
+-      digit = static_cast<char>(*current) - 'A' + 10;
++    if (IsDecimalDigitForRadix(**current, radix)) {
++      digit = static_cast<char>(**current) - '0';
++    } else if (IsCharacterDigitForRadix(**current, radix, 'a')) {
++      digit = static_cast<char>(**current) - 'a' + 10;
++    } else if (IsCharacterDigitForRadix(**current, radix, 'A')) {
++      digit = static_cast<char>(**current) - 'A' + 10;
+     } else {
+-      if (allow_trailing_junk || !AdvanceToNonspace(&current, end)) {
++      if (allow_trailing_junk || !AdvanceToNonspace(current, end)) {
+         break;
+       } else {
+         return junk_string_value;
+@@ -523,14 +615,14 @@ static double RadixStringToIeee(const char* current,
+       exponent = overflow_bits_count;
+ 
+       bool zero_tail = true;
+-      while (true) {
+-        ++current;
+-        if (current == end || !isDigit(*current, radix)) break;
+-        zero_tail = zero_tail && *current == '0';
++      for (;;) {
++        ++(*current);
++        if (*current == end || !isDigit(**current, radix)) break;
++        zero_tail = zero_tail && **current == '0';
+         exponent += radix_log_2;
+       }
+ 
+-      if (!allow_trailing_junk && AdvanceToNonspace(&current, end)) {
++      if (!allow_trailing_junk && AdvanceToNonspace(current, end)) {
+         return junk_string_value;
+       }
+ 
+@@ -552,13 +644,13 @@ static double RadixStringToIeee(const char* current,
+       }
+       break;
+     }
+-    ++current;
+-  } while (current != end);
++    ++(*current);
++  } while (*current != end);
+ 
+   ASSERT(number < ((int64_t)1 << kSignificandSize));
+   ASSERT(static_cast<int64_t>(static_cast<double>(number)) == number);
+ 
+-  *trailing_pointer = current;
++  *result_is_junk = false;
+ 
+   if (exponent == 0) {
+     if (sign) {
+@@ -572,14 +664,14 @@ static double RadixStringToIeee(const char* current,
+   return Double(DiyFp(number, exponent)).value();
+ }
+ 
+-
++template <class Iterator>
+ double StringToDoubleConverter::StringToIeee(
+-    const char* input,
++    Iterator input,
+     int length,
+-    int* processed_characters_count,
+-    bool read_as_double) {
+-  const char* current = input;
+-  const char* end = input + length;
++    bool read_as_double,
++    int* processed_characters_count) const {
++  Iterator current = input;
++  Iterator end = input + length;
+ 
+   *processed_characters_count = 0;
+ 
+@@ -587,6 +679,8 @@ double StringToDoubleConverter::StringToIeee(
+   const bool allow_leading_spaces = (flags_ & ALLOW_LEADING_SPACES) != 0;
+   const bool allow_trailing_spaces = (flags_ & ALLOW_TRAILING_SPACES) != 0;
+   const bool allow_spaces_after_sign = (flags_ & ALLOW_SPACES_AFTER_SIGN) != 0;
++  const bool allow_case_insensibility = (flags_ & ALLOW_CASE_INSENSIBILITY) != 0;
++
+ 
+   // To make sure that iterator dereferencing is valid the following
+   // convention is used:
+@@ -600,7 +694,7 @@ double StringToDoubleConverter::StringToIeee(
+ 
+   if (allow_leading_spaces || allow_trailing_spaces) {
+     if (!AdvanceToNonspace(&current, end)) {
+-      *processed_characters_count = current - input;
++      *processed_characters_count = static_cast<int>(current - input);
+       return empty_string_value_;
+     }
+     if (!allow_leading_spaces && (input != current)) {
+@@ -626,7 +720,7 @@ double StringToDoubleConverter::StringToIeee(
+   if (*current == '+' || *current == '-') {
+     sign = (*current == '-');
+     ++current;
+-    const char* next_non_space = current;
++    Iterator next_non_space = current;
+     // Skip following spaces (if allowed).
+     if (!AdvanceToNonspace(&next_non_space, end)) return junk_string_value_;
+     if (!allow_spaces_after_sign && (current != next_non_space)) {
+@@ -636,8 +730,8 @@ double StringToDoubleConverter::StringToIeee(
+   }
+ 
+   if (infinity_symbol_ != NULL) {
+-    if (*current == infinity_symbol_[0]) {
+-      if (!ConsumeSubString(&current, end, infinity_symbol_)) {
++    if (ConsumeFirstCharacter(*current, infinity_symbol_, allow_case_insensibility)) {
++      if (!ConsumeSubString(&current, end, infinity_symbol_, allow_case_insensibility)) {
+         return junk_string_value_;
+       }
+ 
+@@ -649,14 +743,14 @@ double StringToDoubleConverter::StringToIeee(
+       }
+ 
+       ASSERT(buffer_pos == 0);
+-      *processed_characters_count = current - input;
++      *processed_characters_count = static_cast<int>(current - input);
+       return sign ? -Double::Infinity() : Double::Infinity();
+     }
+   }
+ 
+   if (nan_symbol_ != NULL) {
+-    if (*current == nan_symbol_[0]) {
+-      if (!ConsumeSubString(&current, end, nan_symbol_)) {
++    if (ConsumeFirstCharacter(*current, nan_symbol_, allow_case_insensibility)) {
++      if (!ConsumeSubString(&current, end, nan_symbol_, allow_case_insensibility)) {
+         return junk_string_value_;
+       }
+ 
+@@ -668,7 +762,7 @@ double StringToDoubleConverter::StringToIeee(
+       }
+ 
+       ASSERT(buffer_pos == 0);
+-      *processed_characters_count = current - input;
++      *processed_characters_count = static_cast<int>(current - input);
+       return sign ? -Double::NaN() : Double::NaN();
+     }
+   }
+@@ -677,7 +771,7 @@ double StringToDoubleConverter::StringToIeee(
+   if (*current == '0') {
+     ++current;
+     if (current == end) {
+-      *processed_characters_count = current - input;
++      *processed_characters_count = static_cast<int>(current - input);
+       return SignedZero(sign);
+     }
+ 
+@@ -690,17 +784,17 @@ double StringToDoubleConverter::StringToIeee(
+         return junk_string_value_;  // "0x".
+       }
+ 
+-      const char* tail_pointer = NULL;
+-      double result = RadixStringToIeee<4>(current,
++      bool result_is_junk;
++      double result = RadixStringToIeee<4>(&current,
+                                            end,
+                                            sign,
+                                            allow_trailing_junk,
+                                            junk_string_value_,
+                                            read_as_double,
+-                                           &tail_pointer);
+-      if (tail_pointer != NULL) {
+-        if (allow_trailing_spaces) AdvanceToNonspace(&tail_pointer, end);
+-        *processed_characters_count = tail_pointer - input;
++                                           &result_is_junk);
++      if (!result_is_junk) {
++        if (allow_trailing_spaces) AdvanceToNonspace(&current, end);
++        *processed_characters_count = static_cast<int>(current - input);
+       }
+       return result;
+     }
+@@ -709,7 +803,7 @@ double StringToDoubleConverter::StringToIeee(
+     while (*current == '0') {
+       ++current;
+       if (current == end) {
+-        *processed_characters_count = current - input;
++        *processed_characters_count = static_cast<int>(current - input);
+         return SignedZero(sign);
+       }
+     }
+@@ -757,7 +851,7 @@ double StringToDoubleConverter::StringToIeee(
+       while (*current == '0') {
+         ++current;
+         if (current == end) {
+-          *processed_characters_count = current - input;
++          *processed_characters_count = static_cast<int>(current - input);
+           return SignedZero(sign);
+         }
+         exponent--;  // Move this 0 into the exponent.
+@@ -793,20 +887,23 @@ double StringToDoubleConverter::StringToIeee(
+   if (*current == 'e' || *current == 'E') {
+     if (octal && !allow_trailing_junk) return junk_string_value_;
+     if (octal) goto parsing_done;
++    Iterator junk_begin = current;
+     ++current;
+     if (current == end) {
+       if (allow_trailing_junk) {
++        current = junk_begin;
+         goto parsing_done;
+       } else {
+         return junk_string_value_;
+       }
+     }
+-    char sign = '+';
++    char exponen_sign = '+';
+     if (*current == '+' || *current == '-') {
+-      sign = static_cast<char>(*current);
++      exponen_sign = static_cast<char>(*current);
+       ++current;
+       if (current == end) {
+         if (allow_trailing_junk) {
++          current = junk_begin;
+           goto parsing_done;
+         } else {
+           return junk_string_value_;
+@@ -816,6 +913,7 @@ double StringToDoubleConverter::StringToIeee(
+ 
+     if (current == end || *current < '0' || *current > '9') {
+       if (allow_trailing_junk) {
++        current = junk_begin;
+         goto parsing_done;
+       } else {
+         return junk_string_value_;
+@@ -837,7 +935,7 @@ double StringToDoubleConverter::StringToIeee(
+       ++current;
+     } while (current != end && *current >= '0' && *current <= '9');
+ 
+-    exponent += (sign == '-' ? -num : num);
++    exponent += (exponen_sign == '-' ? -num : num);
+   }
+ 
+   if (!(allow_trailing_spaces || allow_trailing_junk) && (current != end)) {
+@@ -855,16 +953,17 @@ double StringToDoubleConverter::StringToIeee(
+ 
+   if (octal) {
+     double result;
+-    const char* tail_pointer = NULL;
+-    result = RadixStringToIeee<3>(buffer,
++    bool result_is_junk;
++    char* start = buffer;
++    result = RadixStringToIeee<3>(&start,
+                                   buffer + buffer_pos,
+                                   sign,
+                                   allow_trailing_junk,
+                                   junk_string_value_,
+                                   read_as_double,
+-                                  &tail_pointer);
+-    ASSERT(tail_pointer != NULL);
+-    *processed_characters_count = current - input;
++                                  &result_is_junk);
++    ASSERT(!result_is_junk);
++    *processed_characters_count = static_cast<int>(current - input);
+     return result;
+   }
+ 
+@@ -882,8 +981,42 @@ double StringToDoubleConverter::StringToIeee(
+   } else {
+     converted = Strtof(Vector<const char>(buffer, buffer_pos), exponent);
+   }
+-  *processed_characters_count = current - input;
++  *processed_characters_count = static_cast<int>(current - input);
+   return sign? -converted: converted;
+ }
+ 
++
++double StringToDoubleConverter::StringToDouble(
++    const char* buffer,
++    int length,
++    int* processed_characters_count) const {
++  return StringToIeee(buffer, length, true, processed_characters_count);
++}
++
++
++double StringToDoubleConverter::StringToDouble(
++    const uc16* buffer,
++    int length,
++    int* processed_characters_count) const {
++  return StringToIeee(buffer, length, true, processed_characters_count);
++}
++
++
++float StringToDoubleConverter::StringToFloat(
++    const char* buffer,
++    int length,
++    int* processed_characters_count) const {
++  return static_cast<float>(StringToIeee(buffer, length, false,
++                                         processed_characters_count));
++}
++
++
++float StringToDoubleConverter::StringToFloat(
++    const uc16* buffer,
++    int length,
++    int* processed_characters_count) const {
++  return static_cast<float>(StringToIeee(buffer, length, false,
++                                         processed_characters_count));
++}
++
+ }  // namespace double_conversion
+diff --git a/mfbt/double-conversion/double-conversion.h b/mfbt/double-conversion/double-conversion.h
+index 0e7226d..e66a566 100644
+--- a/mfbt/double-conversion/double-conversion.h
++++ b/mfbt/double-conversion/double-conversion.h
+@@ -28,8 +28,7 @@
+ #ifndef DOUBLE_CONVERSION_DOUBLE_CONVERSION_H_
+ #define DOUBLE_CONVERSION_DOUBLE_CONVERSION_H_
+ 
+-#include "mozilla/Types.h"
+-#include "utils.h"
++#include <utils.h>
+ 
+ namespace double_conversion {
+ 
+@@ -130,7 +129,7 @@ class DoubleToStringConverter {
+   }
+ 
+   // Returns a converter following the EcmaScript specification.
+-  static MFBT_API(const DoubleToStringConverter&) EcmaScriptConverter();
++  static const DoubleToStringConverter& EcmaScriptConverter();
+ 
+   // Computes the shortest string of digits that correctly represent the input
+   // number. Depending on decimal_in_shortest_low and decimal_in_shortest_high
+@@ -198,7 +197,7 @@ class DoubleToStringConverter {
+   // The last two conditions imply that the result will never contain more than
+   // 1 + kMaxFixedDigitsBeforePoint + 1 + kMaxFixedDigitsAfterPoint characters
+   // (one additional character for the sign, and one for the decimal point).
+-  MFBT_API(bool) ToFixed(double value,
++  bool ToFixed(double value,
+                int requested_digits,
+                StringBuilder* result_builder) const;
+ 
+@@ -230,7 +229,7 @@ class DoubleToStringConverter {
+   // kMaxExponentialDigits + 8 characters (the sign, the digit before the
+   // decimal point, the decimal point, the exponent character, the
+   // exponent's sign, and at most 3 exponent digits).
+-  MFBT_API(bool) ToExponential(double value,
++  bool ToExponential(double value,
+                      int requested_digits,
+                      StringBuilder* result_builder) const;
+ 
+@@ -268,7 +267,7 @@ class DoubleToStringConverter {
+   // The last condition implies that the result will never contain more than
+   // kMaxPrecisionDigits + 7 characters (the sign, the decimal point, the
+   // exponent character, the exponent's sign, and at most 3 exponent digits).
+-  MFBT_API(bool) ToPrecision(double value,
++  bool ToPrecision(double value,
+                    int precision,
+                    StringBuilder* result_builder) const;
+ 
+@@ -293,15 +292,20 @@ class DoubleToStringConverter {
+   // kBase10MaximalLength.
+   // Note that DoubleToAscii null-terminates its input. So the given buffer
+   // should be at least kBase10MaximalLength + 1 characters long.
+-  static const MFBT_DATA(int) kBase10MaximalLength = 17;
++  static const int kBase10MaximalLength = 17;
+ 
+-  // Converts the given double 'v' to ascii. 'v' must not be NaN, +Infinity, or
+-  // -Infinity. In SHORTEST_SINGLE-mode this restriction also applies to 'v'
+-  // after it has been casted to a single-precision float. That is, in this
+-  // mode static_cast<float>(v) must not be NaN, +Infinity or -Infinity.
++  // Converts the given double 'v' to digit characters. 'v' must not be NaN,
++  // +Infinity, or -Infinity. In SHORTEST_SINGLE-mode this restriction also
++  // applies to 'v' after it has been casted to a single-precision float. That
++  // is, in this mode static_cast<float>(v) must not be NaN, +Infinity or
++  // -Infinity.
+   //
+   // The result should be interpreted as buffer * 10^(point-length).
+   //
++  // The digits are written to the buffer in the platform's charset, which is
++  // often UTF-8 (with ASCII-range digits) but may be another charset, such
++  // as EBCDIC.
++  //
+   // The output depends on the given mode:
+   //  - SHORTEST: produce the least amount of digits for which the internal
+   //   identity requirement is still satisfied. If the digits are printed
+@@ -333,7 +337,7 @@ class DoubleToStringConverter {
+   // terminating null-character when computing the maximal output size.
+   // The given length is only used in debug mode to ensure the buffer is big
+   // enough.
+-  static MFBT_API(void) DoubleToAscii(double v,
++  static void DoubleToAscii(double v,
+                             DtoaMode mode,
+                             int requested_digits,
+                             char* buffer,
+@@ -344,7 +348,7 @@ class DoubleToStringConverter {
+ 
+  private:
+   // Implementation for ToShortest and ToShortestSingle.
+-  MFBT_API(bool) ToShortestIeeeNumber(double value,
++  bool ToShortestIeeeNumber(double value,
+                             StringBuilder* result_builder,
+                             DtoaMode mode) const;
+ 
+@@ -352,15 +356,15 @@ class DoubleToStringConverter {
+   // corresponding string using the configured infinity/nan-symbol.
+   // If either of them is NULL or the value is not special then the
+   // function returns false.
+-  MFBT_API(bool) HandleSpecialValues(double value, StringBuilder* result_builder) const;
++  bool HandleSpecialValues(double value, StringBuilder* result_builder) const;
+   // Constructs an exponential representation (i.e. 1.234e56).
+   // The given exponent assumes a decimal point after the first decimal digit.
+-  MFBT_API(void) CreateExponentialRepresentation(const char* decimal_digits,
++  void CreateExponentialRepresentation(const char* decimal_digits,
+                                        int length,
+                                        int exponent,
+                                        StringBuilder* result_builder) const;
+   // Creates a decimal representation (i.e 1234.5678).
+-  MFBT_API(void) CreateDecimalRepresentation(const char* decimal_digits,
++  void CreateDecimalRepresentation(const char* decimal_digits,
+                                    int length,
+                                    int decimal_point,
+                                    int digits_after_point,
+@@ -375,7 +379,7 @@ class DoubleToStringConverter {
+   const int max_leading_padding_zeroes_in_precision_mode_;
+   const int max_trailing_padding_zeroes_in_precision_mode_;
+ 
+-  DISALLOW_IMPLICIT_CONSTRUCTORS(DoubleToStringConverter);
++  DC_DISALLOW_IMPLICIT_CONSTRUCTORS(DoubleToStringConverter);
+ };
+ 
+ 
+@@ -390,7 +394,8 @@ class StringToDoubleConverter {
+     ALLOW_TRAILING_JUNK = 4,
+     ALLOW_LEADING_SPACES = 8,
+     ALLOW_TRAILING_SPACES = 16,
+-    ALLOW_SPACES_AFTER_SIGN = 32
++    ALLOW_SPACES_AFTER_SIGN = 32,
++    ALLOW_CASE_INSENSIBILITY = 64,
+   };
+ 
+   // Flags should be a bit-or combination of the possible Flags-enum.
+@@ -416,11 +421,14 @@ class StringToDoubleConverter {
+   //          junk, too.
+   //  - ALLOW_TRAILING_JUNK: ignore trailing characters that are not part of
+   //      a double literal.
+-  //  - ALLOW_LEADING_SPACES: skip over leading spaces.
+-  //  - ALLOW_TRAILING_SPACES: ignore trailing spaces.
+-  //  - ALLOW_SPACES_AFTER_SIGN: ignore spaces after the sign.
++  //  - ALLOW_LEADING_SPACES: skip over leading whitespace, including spaces,
++  //                          new-lines, and tabs.
++  //  - ALLOW_TRAILING_SPACES: ignore trailing whitespace.
++  //  - ALLOW_SPACES_AFTER_SIGN: ignore whitespace after the sign.
+   //       Ex: StringToDouble("-   123.2") -> -123.2.
+   //           StringToDouble("+   123.2") -> 123.2
++  //  - ALLOW_CASE_INSENSIBILITY: ignore case of characters for special values:
++  //      infinity and nan.
+   //
+   // empty_string_value is returned when an empty string is given as input.
+   // If ALLOW_LEADING_SPACES or ALLOW_TRAILING_SPACES are set, then a string
+@@ -503,19 +511,24 @@ class StringToDoubleConverter {
+   // in the 'processed_characters_count'. Trailing junk is never included.
+   double StringToDouble(const char* buffer,
+                         int length,
+-                        int* processed_characters_count) {
+-    return StringToIeee(buffer, length, processed_characters_count, true);
+-  }
++                        int* processed_characters_count) const;
++
++  // Same as StringToDouble above but for 16 bit characters.
++  double StringToDouble(const uc16* buffer,
++                        int length,
++                        int* processed_characters_count) const;
+ 
+   // Same as StringToDouble but reads a float.
+   // Note that this is not equivalent to static_cast<float>(StringToDouble(...))
+   // due to potential double-rounding.
+   float StringToFloat(const char* buffer,
+                       int length,
+-                      int* processed_characters_count) {
+-    return static_cast<float>(StringToIeee(buffer, length,
+-                                           processed_characters_count, false));
+-  }
++                      int* processed_characters_count) const;
++
++  // Same as StringToFloat above but for 16 bit characters.
++  float StringToFloat(const uc16* buffer,
++                      int length,
++                      int* processed_characters_count) const;
+ 
+  private:
+   const int flags_;
+@@ -524,12 +537,13 @@ class StringToDoubleConverter {
+   const char* const infinity_symbol_;
+   const char* const nan_symbol_;
+ 
+-  double StringToIeee(const char* buffer,
++  template <class Iterator>
++  double StringToIeee(Iterator start_pointer,
+                       int length,
+-                      int* processed_characters_count,
+-                      bool read_as_double);
++                      bool read_as_double,
++                      int* processed_characters_count) const;
+ 
+-  DISALLOW_IMPLICIT_CONSTRUCTORS(StringToDoubleConverter);
++  DC_DISALLOW_IMPLICIT_CONSTRUCTORS(StringToDoubleConverter);
+ };
+ 
+ }  // namespace double_conversion
+diff --git a/mfbt/double-conversion/fast-dtoa.cc b/mfbt/double-conversion/fast-dtoa.cc
+index 0609422..d338216 100644
+--- a/mfbt/double-conversion/fast-dtoa.cc
++++ b/mfbt/double-conversion/fast-dtoa.cc
+@@ -25,11 +25,11 @@
+ // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-#include "fast-dtoa.h"
++#include <fast-dtoa.h>
+ 
+-#include "cached-powers.h"
+-#include "diy-fp.h"
+-#include "ieee.h"
++#include <cached-powers.h>
++#include <diy-fp.h>
++#include <ieee.h>
+ 
+ namespace double_conversion {
+ 
+@@ -248,10 +248,7 @@ static void BiggestPowerTen(uint32_t number,
+   // Note: kPowersOf10[i] == 10^(i-1).
+   exponent_plus_one_guess++;
+   // We don't have any guarantees that 2^number_bits <= number.
+-  // TODO(floitsch): can we change the 'while' into an 'if'? We definitely see
+-  // number < (2^number_bits - 1), but I haven't encountered
+-  // number < (2^number_bits - 2) yet.
+-  while (number < kSmallPowersOfTen[exponent_plus_one_guess]) {
++  if (number < kSmallPowersOfTen[exponent_plus_one_guess]) {
+     exponent_plus_one_guess--;
+   }
+   *power = kSmallPowersOfTen[exponent_plus_one_guess];
+@@ -350,7 +347,8 @@ static bool DigitGen(DiyFp low,
+   // that is smaller than integrals.
+   while (*kappa > 0) {
+     int digit = integrals / divisor;
+-    buffer[*length] = '0' + digit;
++    ASSERT(digit <= 9);
++    buffer[*length] = static_cast<char>('0' + digit);
+     (*length)++;
+     integrals %= divisor;
+     (*kappa)--;
+@@ -379,13 +377,14 @@ static bool DigitGen(DiyFp low,
+   ASSERT(one.e() >= -60);
+   ASSERT(fractionals < one.f());
+   ASSERT(UINT64_2PART_C(0xFFFFFFFF, FFFFFFFF) / 10 >= one.f());
+-  while (true) {
++  for (;;) {
+     fractionals *= 10;
+     unit *= 10;
+     unsafe_interval.set_f(unsafe_interval.f() * 10);
+     // Integer division by one.
+     int digit = static_cast<int>(fractionals >> -one.e());
+-    buffer[*length] = '0' + digit;
++    ASSERT(digit <= 9);
++    buffer[*length] = static_cast<char>('0' + digit);
+     (*length)++;
+     fractionals &= one.f() - 1;  // Modulo by one.
+     (*kappa)--;
+@@ -459,7 +458,8 @@ static bool DigitGenCounted(DiyFp w,
+   // that is smaller than 'integrals'.
+   while (*kappa > 0) {
+     int digit = integrals / divisor;
+-    buffer[*length] = '0' + digit;
++    ASSERT(digit <= 9);
++    buffer[*length] = static_cast<char>('0' + digit);
+     (*length)++;
+     requested_digits--;
+     integrals %= divisor;
+@@ -492,7 +492,8 @@ static bool DigitGenCounted(DiyFp w,
+     w_error *= 10;
+     // Integer division by one.
+     int digit = static_cast<int>(fractionals >> -one.e());
+-    buffer[*length] = '0' + digit;
++    ASSERT(digit <= 9);
++    buffer[*length] = static_cast<char>('0' + digit);
+     (*length)++;
+     requested_digits--;
+     fractionals &= one.f() - 1;  // Modulo by one.
+@@ -529,7 +530,7 @@ static bool Grisu3(double v,
+   if (mode == FAST_DTOA_SHORTEST) {
+     Double(v).NormalizedBoundaries(&boundary_minus, &boundary_plus);
+   } else {
+-    assert(mode == FAST_DTOA_SHORTEST_SINGLE);
++    ASSERT(mode == FAST_DTOA_SHORTEST_SINGLE);
+     float single_v = static_cast<float>(v);
+     Single(single_v).NormalizedBoundaries(&boundary_minus, &boundary_plus);
+   }
+diff --git a/mfbt/double-conversion/fast-dtoa.h b/mfbt/double-conversion/fast-dtoa.h
+index 5f1e8ee..9c4da92 100644
+--- a/mfbt/double-conversion/fast-dtoa.h
++++ b/mfbt/double-conversion/fast-dtoa.h
+@@ -28,7 +28,7 @@
+ #ifndef DOUBLE_CONVERSION_FAST_DTOA_H_
+ #define DOUBLE_CONVERSION_FAST_DTOA_H_
+ 
+-#include "utils.h"
++#include <utils.h>
+ 
+ namespace double_conversion {
+ 
+diff --git a/mfbt/double-conversion/fixed-dtoa.cc b/mfbt/double-conversion/fixed-dtoa.cc
+index d56b144..fa23529 100644
+--- a/mfbt/double-conversion/fixed-dtoa.cc
++++ b/mfbt/double-conversion/fixed-dtoa.cc
+@@ -25,10 +25,10 @@
+ // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-#include <math.h>
++#include <cmath>
+ 
+-#include "fixed-dtoa.h"
+-#include "ieee.h"
++#include <fixed-dtoa.h>
++#include <ieee.h>
+ 
+ namespace double_conversion {
+ 
+@@ -98,7 +98,7 @@ class UInt128 {
+     return high_bits_ == 0 && low_bits_ == 0;
+   }
+ 
+-  int BitAt(int position) {
++  int BitAt(int position) const {
+     if (position >= 64) {
+       return static_cast<int>(high_bits_ >> (position - 64)) & 1;
+     } else {
+@@ -133,7 +133,7 @@ static void FillDigits32(uint32_t number, Vector<char> buffer, int* length) {
+   while (number != 0) {
+     int digit = number % 10;
+     number /= 10;
+-    buffer[(*length) + number_length] = '0' + digit;
++    buffer[(*length) + number_length] = static_cast<char>('0' + digit);
+     number_length++;
+   }
+   // Exchange the digits.
+@@ -150,7 +150,7 @@ static void FillDigits32(uint32_t number, Vector<char> buffer, int* length) {
+ }
+ 
+ 
+-static void FillDigits64FixedLength(uint64_t number, int requested_length,
++static void FillDigits64FixedLength(uint64_t number,
+                                     Vector<char> buffer, int* length) {
+   const uint32_t kTen7 = 10000000;
+   // For efficiency cut the number into 3 uint32_t parts, and print those.
+@@ -253,12 +253,14 @@ static void FillFractionals(uint64_t fractionals, int exponent,
+       fractionals *= 5;
+       point--;
+       int digit = static_cast<int>(fractionals >> point);
+-      buffer[*length] = '0' + digit;
++      ASSERT(digit <= 9);
++      buffer[*length] = static_cast<char>('0' + digit);
+       (*length)++;
+       fractionals -= static_cast<uint64_t>(digit) << point;
+     }
+     // If the first bit after the point is set we have to round up.
+-    if (((fractionals >> (point - 1)) & 1) == 1) {
++    ASSERT(fractionals == 0 || point - 1 >= 0);
++    if ((fractionals != 0) && ((fractionals >> (point - 1)) & 1) == 1) {
+       RoundUp(buffer, length, decimal_point);
+     }
+   } else {  // We need 128 bits.
+@@ -274,7 +276,8 @@ static void FillFractionals(uint64_t fractionals, int exponent,
+       fractionals128.Multiply(5);
+       point--;
+       int digit = fractionals128.DivModPowerOf2(point);
+-      buffer[*length] = '0' + digit;
++      ASSERT(digit <= 9);
++      buffer[*length] = static_cast<char>('0' + digit);
+       (*length)++;
+     }
+     if (fractionals128.BitAt(point - 1) == 1) {
+@@ -358,7 +361,7 @@ bool FastFixedDtoa(double v,
+       remainder = (dividend % divisor) << exponent;
+     }
+     FillDigits32(quotient, buffer, length);
+-    FillDigits64FixedLength(remainder, divisor_power, buffer, length);
++    FillDigits64FixedLength(remainder, buffer, length);
+     *decimal_point = *length;
+   } else if (exponent >= 0) {
+     // 0 <= exponent <= 11
+diff --git a/mfbt/double-conversion/fixed-dtoa.h b/mfbt/double-conversion/fixed-dtoa.h
+index 3bdd08e..19fd2e7 100644
+--- a/mfbt/double-conversion/fixed-dtoa.h
++++ b/mfbt/double-conversion/fixed-dtoa.h
+@@ -28,7 +28,7 @@
+ #ifndef DOUBLE_CONVERSION_FIXED_DTOA_H_
+ #define DOUBLE_CONVERSION_FIXED_DTOA_H_
+ 
+-#include "utils.h"
++#include <utils.h>
+ 
+ namespace double_conversion {
+ 
+diff --git a/mfbt/double-conversion/ieee.h b/mfbt/double-conversion/ieee.h
+index 839dc47..8949b02 100644
+--- a/mfbt/double-conversion/ieee.h
++++ b/mfbt/double-conversion/ieee.h
+@@ -28,7 +28,7 @@
+ #ifndef DOUBLE_CONVERSION_DOUBLE_H_
+ #define DOUBLE_CONVERSION_DOUBLE_H_
+ 
+-#include "diy-fp.h"
++#include <diy-fp.h>
+ 
+ namespace double_conversion {
+ 
+@@ -99,7 +99,7 @@ class Double {
+   }
+ 
+   double PreviousDouble() const {
+-    if (d64_ == (kInfinity | kSignMask)) return -Double::Infinity();
++    if (d64_ == (kInfinity | kSignMask)) return -Infinity();
+     if (Sign() < 0) {
+       return Double(d64_ + 1).value();
+     } else {
+@@ -256,6 +256,8 @@ class Double {
+     return (significand & kSignificandMask) |
+         (biased_exponent << kPhysicalSignificandSize);
+   }
++
++  DC_DISALLOW_COPY_AND_ASSIGN(Double);
+ };
+ 
+ class Single {
+@@ -391,6 +393,8 @@ class Single {
+   static const uint32_t kNaN = 0x7FC00000;
+ 
+   const uint32_t d32_;
++
++  DC_DISALLOW_COPY_AND_ASSIGN(Single);
+ };
+ 
+ }  // namespace double_conversion
+diff --git a/mfbt/double-conversion/strtod.cc b/mfbt/double-conversion/strtod.cc
+index d773f44..a9e85c1 100644
+--- a/mfbt/double-conversion/strtod.cc
++++ b/mfbt/double-conversion/strtod.cc
+@@ -25,13 +25,13 @@
+ // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-#include <stdarg.h>
+-#include <limits.h>
++#include <climits>
++#include <cstdarg>
+ 
+-#include "strtod.h"
+-#include "bignum.h"
+-#include "cached-powers.h"
+-#include "ieee.h"
++#include <bignum.h>
++#include <cached-powers.h>
++#include <ieee.h>
++#include <strtod.h>
+ 
+ namespace double_conversion {
+ 
+@@ -137,6 +137,7 @@ static void TrimAndCut(Vector<const char> buffer, int exponent,
+   Vector<const char> right_trimmed = TrimTrailingZeros(left_trimmed);
+   exponent += left_trimmed.length() - right_trimmed.length();
+   if (right_trimmed.length() > kMaxSignificantDecimalDigits) {
++    (void) space_size;  // Mark variable as used.
+     ASSERT(space_size >= kMaxSignificantDecimalDigits);
+     CutToMaxSignificantDigits(right_trimmed, exponent,
+                               buffer_copy_space, updated_exponent);
+@@ -204,7 +205,7 @@ static bool DoubleStrtod(Vector<const char> trimmed,
+   // Note that the ARM simulator is compiled for 32bits. It therefore exhibits
+   // the same problem.
+   return false;
+-#endif
++#else
+   if (trimmed.length() <= kMaxExactDoubleIntegerDecimalDigits) {
+     int read_digits;
+     // The trimmed input fits into a double.
+@@ -242,6 +243,7 @@ static bool DoubleStrtod(Vector<const char> trimmed,
+     }
+   }
+   return false;
++#endif
+ }
+ 
+ 
+@@ -263,7 +265,6 @@ static DiyFp AdjustmentPowerOfTen(int exponent) {
+     case 7: return DiyFp(UINT64_2PART_C(0x98968000, 00000000), -40);
+     default:
+       UNREACHABLE();
+-      return DiyFp(0, 0);
+   }
+ }
+ 
+@@ -286,7 +287,7 @@ static bool DiyFpStrtod(Vector<const char> buffer,
+   const int kDenominator = 1 << kDenominatorLog;
+   // Move the remaining decimals into the exponent.
+   exponent += remaining_decimals;
+-  int error = (remaining_decimals == 0 ? 0 : kDenominator / 2);
++  uint64_t error = (remaining_decimals == 0 ? 0 : kDenominator / 2);
+ 
+   int old_e = input.e();
+   input.Normalize();
+@@ -471,6 +472,30 @@ double Strtod(Vector<const char> buffer, int exponent) {
+   }
+ }
+ 
++static float SanitizedDoubletof(double d) {
++  ASSERT(d >= 0.0);
++  // ASAN has a sanitize check that disallows casting doubles to floats if
++  // they are too big.
++  // https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html#available-checks
++  // The behavior should be covered by IEEE 754, but some projects use this
++  // flag, so work around it.
++  float max_finite = 3.4028234663852885981170418348451692544e+38;
++  // The half-way point between the max-finite and infinity value.
++  // Since infinity has an even significand everything equal or greater than
++  // this value should become infinity.
++  double half_max_finite_infinity =
++      3.40282356779733661637539395458142568448e+38;
++  if (d >= max_finite) {
++    if (d >= half_max_finite_infinity) {
++      return Single::Infinity();
++    } else {
++      return max_finite;
++    }
++  } else {
++    return static_cast<float>(d);
++  }
++}
++
+ float Strtof(Vector<const char> buffer, int exponent) {
+   char copy_buffer[kMaxSignificantDecimalDigits];
+   Vector<const char> trimmed;
+@@ -482,7 +507,7 @@ float Strtof(Vector<const char> buffer, int exponent) {
+   double double_guess;
+   bool is_correct = ComputeGuess(trimmed, exponent, &double_guess);
+ 
+-  float float_guess = static_cast<float>(double_guess);
++  float float_guess = SanitizedDoubletof(double_guess);
+   if (float_guess == double_guess) {
+     // This shortcut triggers for integer values.
+     return float_guess;
+@@ -505,18 +530,18 @@ float Strtof(Vector<const char> buffer, int exponent) {
+   double double_next = Double(double_guess).NextDouble();
+   double double_previous = Double(double_guess).PreviousDouble();
+ 
+-  float f1 = static_cast<float>(double_previous);
++  float f1 = SanitizedDoubletof(double_previous);
+   float f2 = float_guess;
+-  float f3 = static_cast<float>(double_next);
++  float f3 = SanitizedDoubletof(double_next);
+   float f4;
+   if (is_correct) {
+     f4 = f3;
+   } else {
+     double double_next2 = Double(double_next).NextDouble();
+-    f4 = static_cast<float>(double_next2);
++    f4 = SanitizedDoubletof(double_next2);
+   }
+-  (void)f2;
+-  assert(f1 <= f2 && f2 <= f3 && f3 <= f4);
++  (void) f2;  // Mark variable as used.
++  ASSERT(f1 <= f2 && f2 <= f3 && f3 <= f4);
+ 
+   // If the guess doesn't lie near a single-precision boundary we can simply
+   // return its float-value.
+@@ -524,11 +549,11 @@ float Strtof(Vector<const char> buffer, int exponent) {
+     return float_guess;
+   }
+ 
+-  assert((f1 != f2 && f2 == f3 && f3 == f4) ||
++  ASSERT((f1 != f2 && f2 == f3 && f3 == f4) ||
+          (f1 == f2 && f2 != f3 && f3 == f4) ||
+          (f1 == f2 && f2 == f3 && f3 != f4));
+ 
+-  // guess and next are the two possible canditates (in the same way that
++  // guess and next are the two possible candidates (in the same way that
+   // double_guess was the lower candidate for a double-precision guess).
+   float guess = f1;
+   float next = f4;
+diff --git a/mfbt/double-conversion/strtod.h b/mfbt/double-conversion/strtod.h
+index ed0293b..58c4926 100644
+--- a/mfbt/double-conversion/strtod.h
++++ b/mfbt/double-conversion/strtod.h
+@@ -28,7 +28,7 @@
+ #ifndef DOUBLE_CONVERSION_STRTOD_H_
+ #define DOUBLE_CONVERSION_STRTOD_H_
+ 
+-#include "utils.h"
++#include <utils.h>
+ 
+ namespace double_conversion {
+ 
+diff --git a/mfbt/double-conversion/utils.h b/mfbt/double-conversion/utils.h
+index 0eec2d9..a748654 100644
+--- a/mfbt/double-conversion/utils.h
++++ b/mfbt/double-conversion/utils.h
+@@ -28,19 +28,34 @@
+ #ifndef DOUBLE_CONVERSION_UTILS_H_
+ #define DOUBLE_CONVERSION_UTILS_H_
+ 
+-#include <stdlib.h>
+-#include <string.h>
++#include <cstdlib>
++#include <cstring>
+ 
+-#include <assert.h>
++#include <cassert>
+ #ifndef ASSERT
+-#define ASSERT(condition)      (assert(condition))
++#define ASSERT(condition)         \
++    assert(condition);
+ #endif
+ #ifndef UNIMPLEMENTED
+ #define UNIMPLEMENTED() (abort())
+ #endif
++#ifndef DOUBLE_CONVERSION_NO_RETURN
++#ifdef _MSC_VER
++#define DOUBLE_CONVERSION_NO_RETURN __declspec(noreturn)
++#else
++#define DOUBLE_CONVERSION_NO_RETURN __attribute__((noreturn))
++#endif
++#endif
+ #ifndef UNREACHABLE
++#ifdef _MSC_VER
++void DOUBLE_CONVERSION_NO_RETURN abort_noreturn();
++inline void abort_noreturn() { abort(); }
++#define UNREACHABLE()   (abort_noreturn())
++#else
+ #define UNREACHABLE()   (abort())
+ #endif
++#endif
++
+ 
+ // Double operations detection based on target architecture.
+ // Linux uses a 80bit wide floating point stack on x86. This induces double
+@@ -55,11 +70,18 @@
+ #if defined(_M_X64) || defined(__x86_64__) || \
+     defined(__ARMEL__) || defined(__avr32__) || \
+     defined(__hppa__) || defined(__ia64__) || \
+-    defined(__mips__) || defined(__powerpc__) || \
++    defined(__mips__) || \
++    defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
++    defined(_POWER) || defined(_ARCH_PPC) || defined(_ARCH_PPC64) || \
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+     defined(__SH4__) || defined(__alpha__) || \
+-    defined(_MIPS_ARCH_MIPS32R2)
++    defined(_MIPS_ARCH_MIPS32R2) || \
++    defined(__AARCH64EL__) || defined(__aarch64__) || \
++    defined(__riscv)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
++#elif defined(__mc68000__) || \
++    defined(__pnacl__) || defined(__native_client__)
++#undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+ #if defined(_WIN32)
+ // Windows uses a 64bit wide floating point stack.
+@@ -71,9 +93,10 @@
+ #error Target architecture was not detected as supported by Double-Conversion.
+ #endif
+ 
+-
+ #include "mozilla/StandardInteger.h"
+ 
++typedef uint16_t uc16;
++
+ // The following macro works on both 32 and 64-bit platforms.
+ // Usage: instead of writing 0x1234567890123456
+ //      write UINT64_2PART_C(0x12345678,90123456);
+@@ -92,8 +115,8 @@
+ 
+ // A macro to disallow the evil copy constructor and operator= functions
+ // This should be used in the private: declarations for a class
+-#ifndef DISALLOW_COPY_AND_ASSIGN
+-#define DISALLOW_COPY_AND_ASSIGN(TypeName)      \
++#ifndef DC_DISALLOW_COPY_AND_ASSIGN
++#define DC_DISALLOW_COPY_AND_ASSIGN(TypeName)      \
+   TypeName(const TypeName&);                    \
+   void operator=(const TypeName&)
+ #endif
+@@ -104,10 +127,10 @@
+ // This should be used in the private: declarations for a class
+ // that wants to prevent anyone from instantiating it. This is
+ // especially useful for classes containing only static methods.
+-#ifndef DISALLOW_IMPLICIT_CONSTRUCTORS
+-#define DISALLOW_IMPLICIT_CONSTRUCTORS(TypeName) \
++#ifndef DC_DISALLOW_IMPLICIT_CONSTRUCTORS
++#define DC_DISALLOW_IMPLICIT_CONSTRUCTORS(TypeName) \
+   TypeName();                                    \
+-  DISALLOW_COPY_AND_ASSIGN(TypeName)
++  DC_DISALLOW_COPY_AND_ASSIGN(TypeName)
+ #endif
+ 
+ namespace double_conversion {
+@@ -139,8 +162,8 @@ template <typename T>
+ class Vector {
+  public:
+   Vector() : start_(NULL), length_(0) {}
+-  Vector(T* data, int length) : start_(data), length_(length) {
+-    ASSERT(length == 0 || (length > 0 && data != NULL));
++  Vector(T* data, int len) : start_(data), length_(len) {
++    ASSERT(len == 0 || (len > 0 && data != NULL));
+   }
+ 
+   // Returns a vector using the same backing storage as this one,
+@@ -182,8 +205,8 @@ class Vector {
+ // buffer bounds on all operations in debug mode.
+ class StringBuilder {
+  public:
+-  StringBuilder(char* buffer, int size)
+-      : buffer_(buffer, size), position_(0) { }
++  StringBuilder(char* buffer, int buffer_size)
++      : buffer_(buffer, buffer_size), position_(0) { }
+ 
+   ~StringBuilder() { if (!is_finalized()) Finalize(); }
+ 
+@@ -249,7 +272,7 @@ class StringBuilder {
+ 
+   bool is_finalized() const { return position_ < 0; }
+ 
+-  DISALLOW_IMPLICIT_CONSTRUCTORS(StringBuilder);
++  DC_DISALLOW_IMPLICIT_CONSTRUCTORS(StringBuilder);
+ };
+ 
+ // The type-based aliasing rule allows the compiler to assume that pointers of
+@@ -280,7 +303,12 @@ template <class Dest, class Source>
+ inline Dest BitCast(const Source& source) {
+   // Compile time assertion: sizeof(Dest) == sizeof(Source)
+   // A compile error here means your Dest and Source have different sizes.
++#if __cplusplus >= 201103L
++  static_assert(sizeof(Dest) == sizeof(Source),
++                "source and destination size mismatch");
++#else
+   typedef char VerifySizesAreEqual[sizeof(Dest) == sizeof(Source) ? 1 : -1];
++#endif
+ 
+   Dest dest;
+   memmove(&dest, &source, sizeof(dest));
+-- 
+2.17.0
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/Update-the-double-conversion-update-script.patch b/meta-oe/recipes-extended/mozjs/mozjs/Update-the-double-conversion-update-script.patch
new file mode 100644
index 000000000..ffeac4982
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/Update-the-double-conversion-update-script.patch
@@ -0,0 +1,175 @@
+From 1c3f6dd9bb478fea0622e8a9ba2efbf19d73e302 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 1 Jun 2018 14:46:47 -0700
+Subject: [PATCH] Update the double conversion update script
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ .../add-mfbt-api-markers.patch                | 94 -------------------
+ .../more-architectures.patch                  | 30 ------
+ mfbt/double-conversion/update.sh              |  8 +-
+ 3 files changed, 3 insertions(+), 129 deletions(-)
+ delete mode 100644 mfbt/double-conversion/add-mfbt-api-markers.patch
+ delete mode 100644 mfbt/double-conversion/more-architectures.patch
+
+diff --git a/mfbt/double-conversion/add-mfbt-api-markers.patch b/mfbt/double-conversion/add-mfbt-api-markers.patch
+deleted file mode 100644
+index b98ec74..0000000
+--- a/mfbt/double-conversion/add-mfbt-api-markers.patch
++++ /dev/null
+@@ -1,94 +0,0 @@
+-diff --git a/mfbt/double-conversion/double-conversion.h b/mfbt/double-conversion/double-conversion.h
+-index f98edae..e536a01 100644
+---- a/mfbt/double-conversion/double-conversion.h
+-+++ b/mfbt/double-conversion/double-conversion.h
+-@@ -28,6 +28,7 @@
+- #ifndef DOUBLE_CONVERSION_DOUBLE_CONVERSION_H_
+- #define DOUBLE_CONVERSION_DOUBLE_CONVERSION_H_
+- 
+-+#include "mozilla/Types.h"
+- #include "utils.h"
+- 
+- namespace double_conversion {
+-@@ -129,7 +130,7 @@ class DoubleToStringConverter {
+-   }
+- 
+-   // Returns a converter following the EcmaScript specification.
+--  static const DoubleToStringConverter& EcmaScriptConverter();
+-+  static MFBT_API(const DoubleToStringConverter&) EcmaScriptConverter();
+- 
+-   // Computes the shortest string of digits that correctly represent the input
+-   // number. Depending on decimal_in_shortest_low and decimal_in_shortest_high
+-@@ -197,7 +198,7 @@ class DoubleToStringConverter {
+-   // The last two conditions imply that the result will never contain more than
+-   // 1 + kMaxFixedDigitsBeforePoint + 1 + kMaxFixedDigitsAfterPoint characters
+-   // (one additional character for the sign, and one for the decimal point).
+--  bool ToFixed(double value,
+-+  MFBT_API(bool) ToFixed(double value,
+-                int requested_digits,
+-                StringBuilder* result_builder) const;
+- 
+-@@ -229,7 +230,7 @@ class DoubleToStringConverter {
+-   // kMaxExponentialDigits + 8 characters (the sign, the digit before the
+-   // decimal point, the decimal point, the exponent character, the
+-   // exponent's sign, and at most 3 exponent digits).
+--  bool ToExponential(double value,
+-+  MFBT_API(bool) ToExponential(double value,
+-                      int requested_digits,
+-                      StringBuilder* result_builder) const;
+- 
+-@@ -267,7 +268,7 @@ class DoubleToStringConverter {
+-   // The last condition implies that the result will never contain more than
+-   // kMaxPrecisionDigits + 7 characters (the sign, the decimal point, the
+-   // exponent character, the exponent's sign, and at most 3 exponent digits).
+--  bool ToPrecision(double value,
+-+  MFBT_API(bool) ToPrecision(double value,
+-                    int precision,
+-                    StringBuilder* result_builder) const;
+- 
+-@@ -292,7 +293,7 @@ class DoubleToStringConverter {
+-   // kBase10MaximalLength.
+-   // Note that DoubleToAscii null-terminates its input. So the given buffer
+-   // should be at least kBase10MaximalLength + 1 characters long.
+--  static const int kBase10MaximalLength = 17;
+-+  static const MFBT_DATA(int) kBase10MaximalLength = 17;
+- 
+-   // Converts the given double 'v' to ascii. 'v' must not be NaN, +Infinity, or
+-   // -Infinity. In SHORTEST_SINGLE-mode this restriction also applies to 'v'
+-@@ -332,7 +333,7 @@ class DoubleToStringConverter {
+-   // terminating null-character when computing the maximal output size.
+-   // The given length is only used in debug mode to ensure the buffer is big
+-   // enough.
+--  static void DoubleToAscii(double v,
+-+  static MFBT_API(void) DoubleToAscii(double v,
+-                             DtoaMode mode,
+-                             int requested_digits,
+-                             char* buffer,
+-@@ -343,7 +344,7 @@ class DoubleToStringConverter {
+- 
+-  private:
+-   // Implementation for ToShortest and ToShortestSingle.
+--  bool ToShortestIeeeNumber(double value,
+-+  MFBT_API(bool) ToShortestIeeeNumber(double value,
+-                             StringBuilder* result_builder,
+-                             DtoaMode mode) const;
+- 
+-@@ -351,15 +352,15 @@ class DoubleToStringConverter {
+-   // corresponding string using the configured infinity/nan-symbol.
+-   // If either of them is NULL or the value is not special then the
+-   // function returns false.
+--  bool HandleSpecialValues(double value, StringBuilder* result_builder) const;
+-+  MFBT_API(bool) HandleSpecialValues(double value, StringBuilder* result_builder) const;
+-   // Constructs an exponential representation (i.e. 1.234e56).
+-   // The given exponent assumes a decimal point after the first decimal digit.
+--  void CreateExponentialRepresentation(const char* decimal_digits,
+-+  MFBT_API(void) CreateExponentialRepresentation(const char* decimal_digits,
+-                                        int length,
+-                                        int exponent,
+-                                        StringBuilder* result_builder) const;
+-   // Creates a decimal representation (i.e 1234.5678).
+--  void CreateDecimalRepresentation(const char* decimal_digits,
+-+  MFBT_API(void) CreateDecimalRepresentation(const char* decimal_digits,
+-                                    int length,
+-                                    int decimal_point,
+-                                    int digits_after_point,
+diff --git a/mfbt/double-conversion/more-architectures.patch b/mfbt/double-conversion/more-architectures.patch
+deleted file mode 100644
+index b8d3804..0000000
+--- a/mfbt/double-conversion/more-architectures.patch
++++ /dev/null
+@@ -1,30 +0,0 @@
+-diff --git a/mfbt/double-conversion/utils.h b/mfbt/double-conversion/utils.h
+---- a/mfbt/double-conversion/utils.h
+-+++ b/mfbt/double-conversion/utils.h
+-@@ -48,20 +48,24 @@
+- // An easy way to test if the floating-point operations are correct is to
+- // evaluate: 89255.0/1e22. If the floating-point stack is 64 bits wide then
+- // the result is equal to 89255e-22.
+- // The best way to test this, is to create a division-function and to compare
+- // the output of the division with the expected result. (Inlining must be
+- // disabled.)
+- // On Linux,x86 89255e-22 != Div_double(89255.0/1e22)
+- #if defined(_M_X64) || defined(__x86_64__) || \
+--    defined(__ARMEL__) || \
+-+    defined(__ARMEL__) || defined(__avr32__) || \
+-+    defined(__hppa__) || defined(__ia64__) || \
+-+    defined(__mips__) || defined(__powerpc__) || \
+-+    defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+-+    defined(__SH4__) || defined(__alpha__) || \
+-     defined(_MIPS_ARCH_MIPS32R2)
+- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+--#elif defined(_M_IX86) || defined(__i386__)
+-+#elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+- #if defined(_WIN32)
+- // Windows uses a 64bit wide floating point stack.
+- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+- #else
+- #undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
+- #endif  // _WIN32
+- #else
+- #error Target architecture was not detected as supported by Double-Conversion.
+diff --git a/mfbt/double-conversion/update.sh b/mfbt/double-conversion/update.sh
+index 81add8e..9ef2e91 100755
+--- a/mfbt/double-conversion/update.sh
++++ b/mfbt/double-conversion/update.sh
+@@ -4,14 +4,12 @@
+ # double-conversion source that we need.
+ 
+ cp $1/LICENSE ./
+-cp $1/README ./
++cp $1/COPYING ./
+ 
+ # Includes
+-cp $1/src/*.h ./
++cp $1/double-conversion/*.h ./
+ 
+ # Source
+-cp $1/src/*.cc ./
++cp $1/double-conversion/*.cc ./
+ 
+-patch -p3 < add-mfbt-api-markers.patch
+ patch -p3 < use-StandardInteger.patch
+-patch -p3 < more-architectures.patch
+-- 
+2.17.0
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 49b7f156e..c5fbab20b 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -7,7 +7,6 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/${BPN}${PV}.tar.gz \
            file://0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch \
            file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch \
            file://0002-Move-JS_BYTES_PER_WORD-out-of-config.h.patch;patchdir=../../ \
-           file://0003-Add-AArch64-support.patch;patchdir=../../ \
            file://0004-mozbug746112-no-decommit-on-large-pages.patch;patchdir=../../ \
            file://0005-aarch64-64k-page.patch;patchdir=../../ \
            file://0001-regenerate-configure.patch;patchdir=../../ \
@@ -16,6 +15,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/${BPN}${PV}.tar.gz \
            file://0010-fix-cross-compilation-on-i586-targets.patch;patchdir=../../ \
            file://Manually_mmap_heap_memory_esr17.patch;patchdir=../../ \
            file://0001-compare-the-first-character-of-string-to-be-null-or-.patch;patchdir=../../ \
+           file://Update-the-double-conversion-update-script.patch;patchdir=../../ \
+           file://Update-Double-Conversion.patch;patchdir=../../ \
            "
 
 SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
-- 
2.17.1


