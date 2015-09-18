Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0148.outbound.protection.outlook.com [157.56.112.148])
	by mail.openembedded.org (Postfix) with ESMTP id BE33D77028
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 12:17:23 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.274.16; Fri, 18 Sep 2015 12:17:20 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Sep 2015 15:17:25 +0300
Message-ID: <1442578646-6498-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0039.eurprd08.prod.outlook.com (25.160.207.177) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:m3NKXtOn229PmLQzLiIV9cZ90BXagG8lTwjtdlrNhVX9Juwhj/hiGdrJrDlrhThz7MyxOxQ8ihtSb7xIE4ZV89RslRTaHpF0roO9a66BSLLND+6MSkdqY9IAkwQSkiaLUs/U4JLPWvfa7XU7jc3/AWlXg+VOE5TOjAsYSUh3DCE=;
	3:RABcfUb5FJy4BDz2ru80g+TttsG+VxOrbxXVMOgDCRmb4KmEmS4GFQ1oshZo5ud4MEsza+Qsrt1Unqva+b3XruJ6Xi9BGxuJONVJiE6t0QRwd0fGOPf+9CKcA+LYZ9N7hRKEo3izhuJAvo8//bhhyg==;
	25:YGZvMYgRQmnYXxsvrZu6sUytmF6sn+sZ2mq3sjrLuLXJ6Onid6YQu6F4DLYEynnvJPt0wyosUOhnUMcOkKbCCOL9IYkCd9MCithuq5KtoGpDl7TwnSdveWdxtzTFeXONFNOI08S6sxhsyUFpC2HqXFz/WF735J1gmmOAqnx7Y/T4W+H5hOniVB3yVgBtckniQF2T4YHNZwDeCGbvrl87f96MTIIKRTo9GZvAhRr031snjqGUF6ILNIvT60NZKXCjxBxS7rjV/u0NJbVeNYvepg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:JpLT+w2PhSKnQC3CJR7goo55WnA/6eMf4LcVsLwyBfnHJi+C4kTkwPT7htd/5z34IL/Lsri5JrOPMixpMXnovlgzAHuGomLRLO/fDFrImEiK9Bl/EqKbz0uAtTDyu8UiURjasKKkwSwiLINCZVIe3XZUK1t5w/koDYM3L7hOKABTxADWPcTs30XeuKntG+rbg+fhkf1X+jQoh09qRdfiWPiAS8FjtKApF6UYz5OS8tmdpHe1sj8iH0uJ+rt/LQJEGTn6PPLweLaYZWqxcgR9jd7ZKsnVIabiG1y2yGys4ie+dmkua/5ZIdZ/Ug07mKknNM2u/Flmpne6BbpoI5TKRs10EwWJPuRLxxr/BvGFJX3bTV/M2AVnnbWCenHgch/3ejgvkASI+3anx97UcnnBLY+K0M6gDm6iYsqZmNcwHfSocF81au2UTwtoxW9Q2u3WMkSp+Tt8733k6E79Xk/yl+8l4yUwmOQkF7J6Ysd/fSDdjCUrEUjqIN4OgzGsg/Tm;
	4:kSsHG+x/NGqSLMMixzHvfhYbug0uoD+M3skmgBL+r+iOAjlRNM9Quoim8Rptek4WJlWUT0z46hVyLvBcmw6nFRodgvMHer8trfgK29+fX24P+97n3qA7C5VOTOqz3tddF9NzFvTzQ9kNNgnjNL8c52sVm1nyi2zSnXxxlrWeBTE+M4IggpkYKlB92hlFBu6muK0u5omjZrGS+iewM+vdWMjNs1yTfcSbVPXaO17d6K3zm+P554GUM2XMGIbxIsyhitcpa+w/uPozW0dJbaP4ugoKrAs0qU7shoFjRCH3jV3XEFee/sMJmWdCuFUJAr58KCjbFXtEm4GrBLkLwRo5hw==
X-Microsoft-Antispam-PRVS: <AM3PR02MB11722D64B9C30FD26796E8E690590@AM3PR02MB1172.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(520078)(8121501046)(3002001);
	SRVR:AM3PR02MB1172; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1172; 
X-Forefront-PRVS: 0703B549E4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(450100001)(62966003)(77156002)(50986999)(189998001)(5001860100001)(110136002)(97736004)(5001960100002)(50226001)(107886002)(5001830100001)(40100003)(5003940100001)(4001540100001)(36756003)(77096005)(47776003)(81156007)(92566002)(68736005)(105586002)(122386002)(106356001)(86362001)(33646002)(101416001)(42186005)(66066001)(2351001)(48376002)(50466002)(64706001)(19580405001)(19580395003)(5007970100001)(87976001)(5004730100002)(229853001)(46102003)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1172; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1172;
	23:bK/Wzn9SltQFacl7AjP/u68uTNJEeyKjRaebA406g?=
	=?us-ascii?Q?FZkNOU8C1eF335tP2KnB09UFcCmLQCc+WamTheLGw5N1xdIAMc0HdttVPIUo?=
	=?us-ascii?Q?1EMqJI8BPDalWI4sID3z9mPqdmS6CgwOBatw9U8g02FL3Z3DMuuisHOKg8nb?=
	=?us-ascii?Q?e+BtUYDVOfsUzzwrrHsdwGQJhkKTp2GAZC1UTB+IBJbwcSdwr/jTuLRbrTD5?=
	=?us-ascii?Q?BtqtdAi8QkzUekI+y6fRMVlpABxa7LBeBC0EakgtMe8oiltMgv7aJ9Zfvd3t?=
	=?us-ascii?Q?sOr2nPlR3Fxz3Vn4VpYSzQWSbCKJ3YqJr1Op4EWkLwfj6An9tdHdC+cb6Rh/?=
	=?us-ascii?Q?GT3ICb3zHn+KJeiTp7eDagFr4RNRIQcxOdHQlq51xyWsgMj++lckRK5PuxrP?=
	=?us-ascii?Q?D21WhDth8SgZc6HlhKO9SH8d0EVmLPKGxl3qZSaQ8VkduxZIdKVKO2+19hgG?=
	=?us-ascii?Q?0ukHS9194duhmGVQBBcj6nAe9wq60gPzGlCdiwNsCPX6mYhD4xGA8OPJNKhK?=
	=?us-ascii?Q?EkgMVmjdZry/PrzeulOGlfyfcr3pEp8FYGIT92C+RvbsqFWDF0oge+/KEMtN?=
	=?us-ascii?Q?V6BURif8Hvl6sIOFBO1mUP5kUacw4uMlT7ipwUReONFZgzdU+IsJmdUyHaxU?=
	=?us-ascii?Q?d9J2/1bx6pZtMik6znSnc1cMWfZvzSbfN8BunJTjnCL43OsQzHcU765Tgzld?=
	=?us-ascii?Q?LwCYrHfcnl0t3u9cnEUabJ8ugfnAaK3TimkA/8vSWRSJYx1vCcfBJUaZsxkL?=
	=?us-ascii?Q?K0FsPQTGp2Go5smcCiLYEf3+/UlitUVlHYO0HI+R0tMB/0W+TlwfQDgb6GTx?=
	=?us-ascii?Q?b3LS+yheKuX/uSLPtFZVBI9bp+5r4yq023qAkr7Tva6fHSCg6Kn5Qe3H+L2o?=
	=?us-ascii?Q?e/Tb/nOW8yy3IL0205ZMK/MWzTr/sFQQ1xhD6BrpQrSzRFFmrWq4qNrnYSfx?=
	=?us-ascii?Q?zmc8cPAnqEt1Nud3GGsdqJErOEvzfG5/626C9joBMZQP6KLnYAX6IvTeazVa?=
	=?us-ascii?Q?NsX78lussKJwojx9JqYYeK463vvZ0SAa+Lqq0qT+JKRbYrkxJcjhxeeGmPk2?=
	=?us-ascii?Q?vmnnTbE7ql/jnsmmwcIxUy3StyuXV5If0vQUo5UcOdDa+RFYv8DG1pMCba2v?=
	=?us-ascii?Q?KyxKrzIfwUxahssWRTliwtyg9dYQGsl2Viht5WmE16LxHdFy1K/c9gheDoRD?=
	=?us-ascii?Q?NoG6Z2WKAz86dACnAnJ7p1yHD2nO2Mn/U2UabkVJwpFPBYCEfxE54N+KA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:0m+XVyOLkNiq/z37jys65xz4FTQ5s1VOJssUhnpLw2EDQpCbkd7rYLgi3E+FdsLIOy7ZHxnl2J25Q0xcIPxIFgoHZqIx8mRqq4PJFCBqnXa5CmW2xnuqbu2OD1FqmWPEm0CEQzSmzYhGqs4IXC+W/g==;
	24:kR6ZVh7/JoaMEYleElT2HIVrgAi/0LHMEntLZ/6bVXhnCLvWWKU8Oz9d+Y4+kXH0sQooxE3NiusPq4ijfczOek46K8ljlWI6A9ccwhC6bV4=;
	20:RFUNWDwNL0+CaaUlCBDWXQIdvL8Nar4epnIGC+QEnlFmEgakXz6EpLvpsIeQzw/K0+6C62qXhxEw05q2Gn9nGQ==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2015 12:17:20.2216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v3 1/2] qtwebkit: do not redefine all PACKAGES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Sep 2015 12:17:24 -0000
Content-Type: text/plain

Modify qtwebkit recipe so that it removes the conflicting {PN}-examples*
packages, instead of redefining all packages again.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 74f98a7..d80ab7f 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -55,8 +55,8 @@ do_configure_prepend() {
 QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
 EXTRA_QMAKEVARS_PRE += "${QTWEBKIT_DEBUG}"
 
-# remove default ${PN}-examples-dbg ${PN}-examples set in qt5.inc, because it conflicts with ${PN} from separate webkit-examples recipe
-PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN} ${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs "
+# remove default ${PN}-examples* set in qt5.inc, because they conflicts with ${PN} from separate webkit-examples recipe
+PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples"
 
 # make sure rb files are used from sysroot, not from host
 # ruby-1.9.3-always-use-i386.patch is doing target_cpu=`echo $target_cpu | sed s/i.86/i386/`
-- 
1.9.1


