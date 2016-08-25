Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 82960 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Aug 2016 11:05:39 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0137.outbound.protection.outlook.com [104.47.2.137])
	by mail.openembedded.org (Postfix) with ESMTP id DDFE67318A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 11:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RGxMpfotDZ4f4Qj29rzYdDOEWfeYYYVc8Zfep7xGrJU=;
	b=McafmX/LCPJ9DTD1/iaHPV/Za0/XAxwRGiZaE8cvVQ1GaLRZ/oj+TUltaAWJYox9/cT4OQsLT5LQdeDfOamrMFncC20IYqWqKDs6gRS14WbExsO/Ezl4dVRfzu8u4qdcth6oYvD7H1UbRcFdOCvUe7oZJbKG92lhibPcNzTJTXk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt.io (192.89.120.53) by
	DB5PR02MB1238.eurprd02.prod.outlook.com (10.162.163.144) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.587.9; Thu, 25 Aug 2016 09:29:27 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Aug 2016 12:29:09 +0300
Message-ID: <1472117349-25661-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: VI1PR0901CA0077.eurprd09.prod.outlook.com (10.167.203.173)
	To DB5PR02MB1238.eurprd02.prod.outlook.com (10.162.163.144)
X-MS-Office365-Filtering-Correlation-Id: 20e5ee39-69f5-4229-20c0-08d3ccca4f97
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1238;
	2:7JmA5ekhQarNAcwXO3QmCTgymACfyo7nNDJFDH94xoXWR1VEs5HodpZdyz0nq3vMLk9Yke94UKTi6iyQWbjp2DvixpVW5NrtOTWmleLhW7algj14GgKcAvjCqNQPgYLVvIK9Nni6FwHfgQTnnOqZDVfTQQ/HoP0DRjLpDGLoJlIKAPsNO6dHlVTMSBKW7ZHG;
	3:td5sISfamJlsBm42yVpc37Y/orxd5rUlHnyotl9YSM28WdqU9OTFFqLCsDTff1i4Bq/NFL30OMXoFrk6Lnrcz3SU92ZQAPyzewI9FAa6W7HRBURqTRkWR6OInix8v7TR;
	25:JQZKE5j0S43Bn0vYfOv+HD2qh+Tv8iduNmaWylmk/Lca0Na1tE7c3mKzdysJBZrM/2pjsisAuBwektZLNaSIe2OaKlblNIYLt4QTct9kZbXRD5c7uHdjwTjwl+6wpYX07Q02zllDfupZIo/SLRP6TgaQio4r5S+wHIv1FaYiFXQmfznmmqAndZvsWcPYRQsrNuflm3Szx0nj/lLhMSADTFyM0bRTZ+322v9bx95nFSINwJn3x0ftL5d47ivTDl/9qQA8qs+WBnO12iP1x8ua+gvT5nWK/RzSJGH6opXfogSXRpbFO5LChCk/Bstk9m6tL6ygXiq84L4409FG3yndVjATZ6WUjAu0X3tAd4UXz+rS60oI9ZXT5K+g5RIQr+O3nclMzAcKk6NHHsSibTDeKkbaLhy/OlE1JQt3C97Yr3k=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1238;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1238;
	31:jmJYnboEiZtlt8k9UTNqUTVlU7ONj3ZDinHqFIQo2zuVn0EYZhKEgy2CY+3jwsYKT2v7MV2gmNKRHwcoey2/HvpxUfxh/XVDYucoTpv54/bm3icao5z7M0pggeF9WZHRIyHM64P4wVmmLeEiMAe+Nbfaag54WbSSUrydQuMGx1/XIt0k4mrYLkfzryuHNyr2a/ysdlmhnq6EBERRjodecsjaLhE8UzgHXSNiN8EU0TY=;
	20:d5Wo8mVwkGuplA5N821LFARNj0Icj2Cih4ohS+a984rCGyP1PXPSfszBR+yc8bSu/ocDr6QG2meZHcAjTbyEjQgEFfNLe1EvY5Qf/jpiadHqoP7UD+9vRz6BcmLIU0TIo1XOzy46fPx+o/oB942mnuN8dUOSsGFAA7p54CRYC1kSXgAKL3fs/H0kMPIrk8liYrbZ56UigG2HD7VVL/sLtNEyhuOB4tMSKzuF1diQ3L2n4Z87ri7oST941hshRdkF;
	4:qi2yB+CTZg+dw0jLbUZW7l4O30bzuQMYBemD0jnXRqIsULjk4qMFx+7VLkfyoTf2OxsA2NVbrmzcbCgLnxf0kmILge9EszHxHk1t8i4XRSRHzCFSeKtlOowgRozze93O2oARXrpPVizIIioECzP+G5hu5Gvtku6jhri7G9hLFFn6TTFXlwgfnzWTUBed5AfDZYuSxOTMbUaTfwqaZT28AzTlEHV50yNLHj4C3oB42rqJkd0cSbvay/h1V4V4fB1jGCibg6oh30aMGBnWUl+sf9UCXwIhJViLCmNn1Z6hCdV6yxAWUDoBmLDD1FgSt3483NmsHny2RfuzxeT1Fr9zvtUxWu5N58PjHG0+Prf2y1KN9hg36D8AIK5DInISHpxBcEOmagmibDPmQwOhYML9cJ0Pt+3S6n1K98IMyXstDFk=
X-Microsoft-Antispam-PRVS: <DB5PR02MB1238F9E0DBF3E49745FFC693E9ED0@DB5PR02MB1238.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6043046)(6042046);
	SRVR:DB5PR02MB1238; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1238; 
X-Forefront-PRVS: 0045236D47
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(199003)(189002)(305945005)(42186005)(74482002)(50226002)(105586002)(53416004)(106356001)(66066001)(92566002)(81166006)(48376002)(50466002)(77096005)(47776003)(8676002)(31430400001)(6116002)(2906002)(3846002)(81156014)(86362001)(586003)(7736002)(19580395003)(19580405001)(107886002)(5003940100001)(229853001)(2351001)(7846002)(189998001)(110136002)(101416001)(450100001)(97736004)(8558605004)(69596002)(33646002)(5660300001)(36756003)(68736007)(50986999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1238;
	H:piippo.intra.qt.io; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1238;
	23:1usu7VX203u7fY2lu6VwzbO/p2lS0+e04ZT5iliqt?=
	=?us-ascii?Q?s4M72uhI7zxqxsMZbvVWy+X+S0lhIyg+TMeZmW8FM7XjLp+TgdT6Rz8yHtQA?=
	=?us-ascii?Q?8TSCtiMM9TGV0zJ3GYKgcYfndcnhjQN8selHd1HM2FmNrdoTkvXG3neXY00o?=
	=?us-ascii?Q?aLKQUtMrn6qYnaZ5ncWUwGHbU7deJaRxkLtL6g9LoteT+JymxehyHQq/8Q1S?=
	=?us-ascii?Q?oJ72sJwEaleMn6zmoiIYgNzLllkJo3t+1QQrgFGsszvl+7Rt/7ENZVHNQ6AF?=
	=?us-ascii?Q?ZqZk2WUjYxQUy6DAVCbidkAfKDonB9JUif82oyUBTwT9iLvD9jjM+giCbfa0?=
	=?us-ascii?Q?Dq9c9CUN7c1++GwC6l7dptMu5bMBaiBF7QJrFNCnOnyy25103kD+LqF1IPLb?=
	=?us-ascii?Q?oIPVn4uH56Ys9oe3By3CZnj2sNWvjdVomsfagJfaz0UA3jyYZdnwZ1/LinGl?=
	=?us-ascii?Q?3hEgCQb4hrGSt1sGSSFKjeyrP2k6HII5WbvEZiuJHH1qA4rwnCUKOqu++j8Z?=
	=?us-ascii?Q?/Rs1OWGlZ/dDyxj+pV3TAC4mA94U18wx0bdJxVtaJaFJSRCYufN1Mj7eLl3w?=
	=?us-ascii?Q?xF2lCNmcGtS0QZRed2gRiRY3kLfvux9HI7F3pOTFlvdQCd2xbuhVFQCEj3/+?=
	=?us-ascii?Q?IZzYJLJQUEHTtAAAbEu4++HiHHb2WUZ1LX4tWEWhHSfrIju+xcXkjpTOLvKD?=
	=?us-ascii?Q?tOq0FbJZmaH5UrLpagm5EBITmkcF4nd9nXdAw2K/ixQgAryPu0B63xtBPQ61?=
	=?us-ascii?Q?e0HkJ7UyygiGhs7prHS+5frgFNOWuxT1mHPXjEkMdJKlDL2/KW4sLh1KmrqL?=
	=?us-ascii?Q?03Ic1rqlvBvgbmK4smTPVG2wVqvtlww8pwxUhnXaZ/AQyO5k8rp5QATxLw8G?=
	=?us-ascii?Q?0buHApPfmwIt0eSiW/IB1mCOtRnbqk1WwseK4HYWRoutWZg0k4nFt8ugq1Jd?=
	=?us-ascii?Q?rXkNJfhW0u8uPeioi8ne8PUjmOKcyw43wydG/+pb4hYxUCw6IO6fJlaS6xml?=
	=?us-ascii?Q?9Y0byTL7q7ohamRPdqzyVwzmfGLARL0tHgU9JdA6YiHzMcP5A/zM8/eSllqT?=
	=?us-ascii?Q?7Oyk+97DHsnE1EWPxEB3Ft6LipkA9lv5beGMkxKXV9Woc9gWYU7HMwG682Sw?=
	=?us-ascii?Q?gEgrI4toX9stl4Fe3Aa6NvXXQ/iCUiZZvYHM0pFWvkYvat6oBrriA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1238;
	6:Z4epYS8izRjzEvNKl/kvjwm7korJvBYBHdpAHwnjQie0vs93+YcWOLX0jrPANjkDRiW/GVbETrjH6LrneSJuXH8x/jj/7IgtrJYQywgF296s5pe21lzjSXPwGEmLZrYO6BCF3m4uv+mIWyx9wYYp0+b1TdwmNNOQYuZWunJW+ZYw7VKIR9/2/put20BnSavRhcGRuoyRKVaPfhISpxOWNvJ6KuKd5uzJ58Nyui4Q3eNzua1Vh/tb9M0P0r5Uf8hfxNhmMjJLCmLQ23iG9WmuSM0gBhvqMrMfvVJdkonr5xqgA+2/Hyjeyp9nj6HQdETp;
	5:FebNShFDDmL5ymHWKGHNrYILrFScabUsFau3407Ds8Gh4st475epwAURBQfi+GKNcERHdqKeQjQ4/eVdzKpYIO2OcUBocBZUKpEJfnpViE9j1RoDb11gwquCBiAtAz13TVxSyePmVHqDLgQkfpeP6w==;
	24:kP2za5Pl11UWvUeb0kdmzwf7DbhACZZqJuVdroYjfwV6N3T+x6ds69litiueYZ8FY9iQniVm1H8cbmVZXrFnNCqZ408dJXdZRLDX4kp96cY=;
	7:yZ0nzIlcRa67CZDIUjkdC/33k+a4Jqr3iBs9fILxRVKvjlS86gTc0yri9yfDkj1I/aDX3fejt/pk4eL2Urap8cog5AAmxPeKFo2v/Lkx1LHInpSWOqFOQaVMpuHIR8CHi0s2q7MGWdp56G4c85xEy/dsGCN4O4K1pdColiYPau/jBNgXgnyEblFFrK/dkR5Y75CDmFh73z9r4lqoo9XNAH1hvQ/1ffDO/ahkl5fkePTR6HMOlzAYSFw3q4+1kt2M
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2016 09:29:27.7204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1238
Subject: [meta-qt5][PATCH] qtvirtualkeyboard: add PACKAGECONFIG options
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
X-List-Received-Date: Fri, 26 Aug 2016 11:05:40 -0000
Content-Type: text/plain

Add all available configurations to PACKAGECONFIGs.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 recipes-qt/qt5/qtvirtualkeyboard_git.bb | 42 ++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index ff478f3..7e2f445 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -1,11 +1,51 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
 
+# To enabled Nuance T9 Write support, you need to provide the licensed components
+# and enable "t9write" in PACKAGECONFIG. This can be done in a separate .bbappend file.
+# for example:
+#T9WRITEPACKAGE = "${HOME}/Downloads/zzEval_QT_T9Write_Alpha_v750_20150916.zip"
+#SRC_URI += "file://${T9WRITEPACKAGE};subdir=git/src/virtualkeyboard/3rdparty/t9write"
+#PACKAGECONFIG = "t9write lang-all"
+
+PACKAGECONFIG ?= "lang-all lipi-toolkit"
+PACKAGECONFIG[hunspell] = ",CONFIG+=disable-hunspell,hunspell"
+PACKAGECONFIG[t9write] = "CONFIG+=t9write"
+PACKAGECONFIG[lipi-toolkit] = "CONFIG+=lipi-toolkit"
+PACKAGECONFIG[lang-all] = "CONFIG+=lang-all"
+PACKAGECONFIG[lang-ar_AR] = "CONFIG+=lang-ar_AR"
+PACKAGECONFIG[lang-da_DK] = "CONFIG+=lang-da_DK"
+PACKAGECONFIG[lang-de_DE] = "CONFIG+=lang-de_DE"
+PACKAGECONFIG[lang-en_GB] = "CONFIG+=lang-en_GB"
+PACKAGECONFIG[lang-es_ES] = "CONFIG+=lang-es_ES"
+PACKAGECONFIG[lang-fa_FA] = "CONFIG+=lang-fa_FA"
+PACKAGECONFIG[lang-fi_FI] = "CONFIG+=lang-fi_FI"
+PACKAGECONFIG[lang-fr_FR] = "CONFIG+=lang-fr_FR"
+PACKAGECONFIG[lang-hi_IN] = "CONFIG+=lang-hi_IN"
+PACKAGECONFIG[lang-it_IT] = "CONFIG+=lang-it_IT"
+PACKAGECONFIG[lang-ja_JP] = "CONFIG+=lang-ja_JP"
+PACKAGECONFIG[lang-ko_KR] = "CONFIG+=lang-ko_KR"
+PACKAGECONFIG[lang-nb_NO] = "CONFIG+=lang-nb_NO"
+PACKAGECONFIG[lang-pl_PL] = "CONFIG+=lang-pl_PL"
+PACKAGECONFIG[lang-pt_PT] = "CONFIG+=lang-pt_PT"
+PACKAGECONFIG[lang-ru_RU] = "CONFIG+=lang-ru_RU"
+PACKAGECONFIG[lang-sv_SE] = "CONFIG+=lang-sv_SE"
+PACKAGECONFIG[lang-zh_CN] = "CONFIG+=lang-zh_CN"
+PACKAGECONFIG[lang-zh_TW] = "CONFIG+=lang-zh_TW"
+
+EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'CONFIG+=disable-desktop', d)}"
+
+PACKAGES += "${PN}-dictionaries"
+RRECOMMENDS_${PN} += "${PN}-dictionaries"
+FILES_${PN}-dictionaries = "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/*/*.dat"
+FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
+
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
 SRCREV = "626e78c9660cff063e1f9370538b5a424631571c"
-- 
1.9.1


