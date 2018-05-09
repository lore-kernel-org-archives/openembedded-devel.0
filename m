Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 1922 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 May 2018 10:04:17 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0130.outbound.protection.outlook.com [104.47.2.130])
	by mail.openembedded.org (Postfix) with ESMTP id 737FE74AF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=L9j0q101DsPnuo37vPx6L+ZF866hycK3j6iQ2JyZWVg=;
	b=hqoP2PxiA+IR53u5vnN/ER694p6w8L4BYY9PfHv4wob8qZymD32aEif2QJGXvBUhIgwfxTj7OPf3e57vDibvv4jykZPgmbyHopkvJ3HpmrmO33GRDDOdQ46Vna46cEu/BlK7a+tbiI2rfXvr0UWNpy4sNfxMf3pIZq/CdtH6Dw0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt (192.89.120.53) by
	VI1PR0201MB2270.eurprd02.prod.outlook.com (2603:10a6:800:52::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.735.17;
	Wed, 9 May 2018 09:32:14 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:31:58 +0300
Message-Id: <20180509093158.2959-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM6PR0402CA0014.eurprd04.prod.outlook.com
	(2603:10a6:209::27) To VI1PR0201MB2270.eurprd02.prod.outlook.com
	(2603:10a6:800:52::8)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(5600026)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0201MB2270; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2270;
	3:mF+J2MO5ucf8oec8k2WH9Ce9ExasG/r00zL/Dh1feTlMvW0Tdvw9soczLU3x3l39ZM9NjBT7lQ2WidnjH1qK8/NoaG/TJ4wf2q600mQRQsMmsLUbJKy6ts+i0gsxL0WY1vZfakl5Q8s573Su/qlR8BUiUWfqMAtPgkDzTgjnlEZmvrIV1peEtwjLqTRu4YnnxQ8ceuM+lJLClC1l41r859GfuQyr655A1d2+WxEkwg3UkaXwkJHb38VynNardyJW;
	25:Z2mtx/bI+O8A0pivTIf3H9W/T0OGmk9W6f9h0B/LT3ETEE/7Ln4Y75MrOhTSKMkWfj0IZSf4sUW2K/sMtJPUF6me0sz+FXM1PQe11T4yTyFHSe5SjdEuEJNtp5GnM0Jw1d8USMIAroCuOavQSpD8S3ENrFLeJTNb6PXYU1peUrhL8iG3XTMALmz03ZmiUpCDVbQfMcm0oWTlQlT31VGAiZMkujjzYKcVyL8sZzpBqfUGGaz9tFPVUniuOoQ1CE6UcB3hSu2JUmNe6ZYzbUH9cqAN9S+Hox0eEknmoxTOLok+eixUtZ1g4754fkGtlykAQMEcYFbSAxm+X+4TV53bYw==;
	31:cHj2rz2qz5ASnGLK6yKpl38M3gKaSPNLkWOlGDXn9lZ5U+AJ8OIv9fmwVBUA4JtxOXoIPmwTdVFfrLBxOm2n1YT5A1W+fLh7csqD3Skjho1rvqIJHgBXuKWf7HO8/gDZxCYOYznw9vswlTmDfuSuuRDmEEI9kkIWfiM9xQwjHBrtVuzGgm5x4PQNmaVqkh8OqTCqhLvqXEyhzawI5sZO/fzUrBuzo+a+dZVnpnSQuRA=
X-MS-TrafficTypeDiagnostic: VI1PR0201MB2270:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2270;
	20:UmcVCVMjJ+IhEIFqN8TKxRD/nG9LuGrLrfQZmI7NR6WGsAuHKk7aFr5i0ECvhjYHiPs8jsAPlKrKSFuGeC8w7M+GeTWLgowPEUCUTGb8YOPaeBOTHVyqWDIoM/TIloZmTiKgRuqKfbzhW+kpiqNvum1vvoJna53mPfZn53YSIDmAIDK5I4SjnLThkmaLrpuqCAEqbKEchD+UnUji1LmAWtJcSk2+TvS0hm9fgLcZ2YSeiFeDIN4OrSIMHpq80OrRuT1qvvgNy1OA3hu0HR44m8fkIjNxDhT/Bq+GkF02tRqO2AyzX9qtvAJ172z/S0DynX3V3qYk9qLwSmAKUn1CbfRxAZfxI/1789rfJvDRHEVlcUERs0+yUL0GYXHCbLKrGxAzQQBEifc2HTjJ7y/GAqAasXoez5pZLMS8SQrxG/4zkqSzOH2Y4ry2DItIMkRzFMCAisVYQ4pZ3EScOvx5YYMwzhXTXxvZdSEf2R8auDq3eqDRe024bFqCS2nXc5v3;
	4:VDenCod7mgRhC3n0XloBoHy7dop9xOB+nmbKvFgfU8pWwWA78pwJLZLFTxwlT/ptEDVdrtlS8At+mk2LagXtHOna8DSmCEQmeQkx+T43vEUGUF8TsedAmKoGc5zyNnOwBAnYh3bapmfZONXv7TqtNi3qN1YUL7BqOHyFQySUCRzGFO8mXVtj54TjHRKUjGAg0rePMb8qcLTkvD8N3tFKOdL5BAnCSvoyUi/GotSe3C/OXzf1a2JUJZBoQlFQjSrOM7SZmnplIaj6R1MzFYmDMA==
X-Microsoft-Antispam-PRVS: <VI1PR0201MB2270AC70AAF5B917BCAF898CE9990@VI1PR0201MB2270.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123558120)(2016111802025)(20161123564045)(20161123562045)(20161123560045)(6043046)(6072148)(201708071742011);
	SRVR:VI1PR0201MB2270; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0201MB2270; 
X-Forefront-PRVS: 0667289FF8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(39380400002)(346002)(39850400004)(366004)(396003)(199004)(189003)(186003)(68736007)(86362001)(16526019)(2361001)(69596002)(3846002)(486006)(74482002)(8936002)(50226002)(6116002)(5660300001)(8676002)(478600001)(2351001)(81166006)(6506007)(386003)(81156014)(47776003)(33896004)(66066001)(26005)(53936002)(97736004)(1857600001)(956004)(6512007)(51416003)(52116002)(48376002)(6916009)(6666003)(105586002)(106356001)(6486002)(1076002)(25786009)(2616005)(7736002)(305945005)(476003)(2906002)(316002)(44832011)(16586007)(50466002)(53416004)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0201MB2270;
	H:piippo.intra.qt; FPR:; SPF:None; LANG:en; PTR:InfoNoRecords;
	A:1; MX:1; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0201MB2270;
	23:UHjmEX4drXlE6bN3fS4NZXtRG2V7ISP0xBVs6oi?=
	=?us-ascii?Q?85piPCJDuxGLRddAI6i/h9hZm7+L7MHv1lB49388WoLnUiyHlH4i38cjs1Fw?=
	=?us-ascii?Q?rTghAfsqk7CZj0F23mplO5BitoyQR0bwXGFqjf+xHdfXzPpeY/nE42y5ylIU?=
	=?us-ascii?Q?GvKLrBMM65WiVmG2wny+UVRB9FvPbD5Owt0lIWK3r7BwciXSQ7HNNJzGMDZo?=
	=?us-ascii?Q?/l+MSc6w5qpdO0GiYHV5zOfVybbKqGnIo7BktRQljNIALAW3F2pBLLgHGal3?=
	=?us-ascii?Q?hnsKcTYJmKe6sibNflbBpQTmrHL+d4sTGgmojFM6K0MWXsMOQW9t603YSUNY?=
	=?us-ascii?Q?LD77p8yOUtS6IRdrY4aVG+TdR7sKYQCmBq0g7Mmn6c9ojOS5c57ZKew/JgUE?=
	=?us-ascii?Q?Lz0C7/qhz7y0Jbz23Rg3oSOn4gUjG/sX2WYokIeHz1xnarGSvXAiUK3y0I2N?=
	=?us-ascii?Q?FyCD9bRORxTOhmIS4MxTMEDK8Mkoz29ZqPMkDO/5jiZUE5XkaPs0LrvQeGd6?=
	=?us-ascii?Q?2ytRQTxltHZ2V5+bJ9davGstotgzNPETrWRoq3EP85Shuc2EiL8QUl6PJmac?=
	=?us-ascii?Q?03zksocpn3Kt65t9ycPie1Nr/yuFrtA8aov0CeLr9mTzxCqlKL7z3oe8Ak4V?=
	=?us-ascii?Q?/HDrNzNTw0vR9ijQtJuvLM/a1hiAglv9NHaAJL1SDW+VPtCOITBBXTTVCUq6?=
	=?us-ascii?Q?rhZXGa8TDoiAGK1b7Rr9AARLbu6LlSSoS+9n+RHjy0eRbtMj78dYyDJdSa/V?=
	=?us-ascii?Q?7nJ0FmkL/6Yd86Z0I9fAyEODZvSFpTNHzoAJ6b49ppRlyyG+mwPFEFbWEgQt?=
	=?us-ascii?Q?VLWhxKnY1juwA18dmbjV4EfTvZH6Mc3jgPbPIMoPacNlTGyzvMwWoDJcGvRd?=
	=?us-ascii?Q?+e5WuLqjj0lCRK1+7GwUFmvd5j/F2Mo4xwsjbRijcCpl6RQ3N9ZOPS/G+bly?=
	=?us-ascii?Q?nIYIgL4UoUEeOlv1l+GgxM/LT4VwXWdNcFHpqxbOVSHaTE4DFufIYgXjV2Xc?=
	=?us-ascii?Q?Y2maPZUvi/olPaU6PnfSGebRfupsWROOg91ftUWlGgoIfA2+1iei4mCtf4zS?=
	=?us-ascii?Q?u63UntEYFTzHU7EjIc2CcRwaoivOgg7eXeAHkGa//LBRlvHgsxBNqkJ6Q3Q0?=
	=?us-ascii?Q?lKpSL+o1XSSbTjLkFh5d1ZrgTG1PvJZm2MeHE8CdV59VZ3RXnLVGcQtk4pa2?=
	=?us-ascii?Q?jyewGC5JnanK/DXIa8Gql2XvEekLTvgu8ptO5PQivNO8zG16J7fNEzGAKTa7?=
	=?us-ascii?Q?PPhF7PZu2Uwjt6XaKCKo95nl9ei+ObCNfMFZQQfBo4w8PG2E037LzLDVayaG?=
	=?us-ascii?Q?6ww=3D=3D?=
X-Microsoft-Antispam-Message-Info: 3hbE3EsTMtAY5gIjTgGnLiRM56rQJq8mVFU/TpJMjxY8aiNQ9bdXfbQgjUZbNOWhlGyTSf3PL9wlnKnXhu8QUBfhEElgNIUSvlVCpCRYEbL05Ph5tQmx+DkWEP/7FYMfDzWnzbsdkj5NxtZSEyAspg1n+4Ufh8kZP1pQFDg4FP7w/lODEttpSPRsQgZhOFbj
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2270;
	6:sNej3nfq/ZK9ZUSURzSRV7PN8Asn6uNdn0kIT/ULc09JzHn4CJUblIupHzrY2Jlx/+TYiQ9J3HzY66IN1dCnwLSOOXlarZlvm8gfubELZ1LD0pJxQF1hwf3PC0f5S+1OryDtZb1gbfzvFL10tGLXFy5IcrnhFzJ/zqP11fmJhXMCI2fqKw1ylDQmgFyH9qInKeHHfc7hufzlSaWIDQ7Tm3enxv1u/XoCfAJADyByqPigLdCNvOA5Syi0O2xq6mVaIkccAgcn9kHCuisQSOTUa1bNkvDPTQxde21vgcc/D0tJhRXfqkw2uVOlbtrqG4YO5cfb96Hryly97yv8HCTLc1EfkdsllJsBFx28H2tNBQ+ViDLRr3G99rU+myfl5088rwFaS+Jns+03NdfPYlG53GNc2QiY9+Lg2gJcoP3kyPXwgVn+3lTty6kdwtKbJ+XGqir3winy20OXNdZ8VbgXUA==;
	5:PRTWmC+fG3onuRrHT+trw7RsX9hcFmInVPhFuolIfHVR0nftgTV6HWbCS6wmMyFTqb3JssugclLH4jXyE+ieMR2czm3dVfMC29hIm20jH0mMQCb9heG+ayDEVVp5MwuxtyYs4wm84w08EyV3XXrd5k85ooBhD0nFt0FqBMiT3Pc=;
	24:HYX7CjDgkdW4VKI2NA1P+1vC8dd3cydsnDLAeRdCAvfRrlok2Rd7voAXDmYGoDr1H3NosUmwH4TnDghDMpO6YtK4mMCWngOvZY2DlGeAwyw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2270;
	7:9KJkHBHASRg4wo5eyraqx4auJQtD7YZbMGw6cps53BkihbghQsCcg2u0GTeMlo2xU9pmLigB7dceRLbb1cxtQK/whFufuX/ciCRVx3trHtJw7JGr4KNY/zdFCHmTWZObO/76nJegoDLfcMvvw3GnclAl7oYZUL7eQKggnjRiG47YAdKC9AkH5waTp2rGT5WeshFazIXD9g/fBOoqz8y+fxeM1osPOxRYI/F8QgK9cu3Q+8nQ6EEPBehKTKcIf7Pj
X-MS-Office365-Filtering-Correlation-Id: 48a3a4d2-05f0-4930-f780-08d5b58fc001
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2018 09:32:14.6442 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a3a4d2-05f0-4930-f780-08d5b58fc001
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0201MB2270
Subject: [meta-qt5][PATCH] nativesdk-qtbase: add quotes to CC and CXX in environment file
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
X-List-Received-Date: Wed, 09 May 2018 10:04:19 -0000
Content-Type: text/plain

CC and CXX include sysroot as argument to compiler and therefore includes
spaces, which need to be quoted to work e.g., with dash.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 4189603..27bd563 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -186,9 +186,9 @@ fakeroot do_generate_qt_environment_file() {
     echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
     echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
     echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
-    echo 'export OE_QMAKE_CC=$CC' >> $script
-    echo 'export OE_QMAKE_CXX=$CXX' >> $script
-    echo 'export OE_QMAKE_LINK=$CXX' >> $script
+    echo 'export OE_QMAKE_CC="$CC"' >> $script
+    echo 'export OE_QMAKE_CXX="$CXX"' >> $script
+    echo 'export OE_QMAKE_LINK="$CXX"' >> $script
     echo 'export OE_QMAKE_AR=$AR' >> $script
     echo 'export OE_QMAKE_STRIP=$STRIP' >> $script
     echo 'export QT_CONF_PATH=${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $script
-- 
2.17.0


