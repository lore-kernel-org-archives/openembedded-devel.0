Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0129.outbound.protection.outlook.com [157.56.112.129])
	by mail.openembedded.org (Postfix) with ESMTP id 364427702D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 12:17:26 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.274.16; Fri, 18 Sep 2015 12:17:25 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Sep 2015 15:17:26 +0300
Message-ID: <1442578646-6498-2-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1442578646-6498-1-git-send-email-samuli.piippo@theqtcompany.com>
References: <1442578646-6498-1-git-send-email-samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0039.eurprd08.prod.outlook.com (25.160.207.177) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:tRqgcwQ6/JhELad7xxZQfFUQnpUf1wAydrYmc+9QM8BHrYs4XpWa4IXlfpyISzVw82PzjXScOszGxZjaGK20hLUsuG9wu6juvOTkeyNUIhQMqEudcB3Ivrt6szfP3TaA+0Cc3xGlx6B7Ci3BYSzl036n+1UowxtA7aBTBKeOrt8=;
	3:JabH1cX5GWk1tofr354+gXaR89nUBxHK9b/kp4LaX718MqSMoRs4/7y6wlJ3Q9lUyM3jey81H/Lq14GTWtrUJ3RO2RnZi0P+IRm60SNOXGt+F3enGW1c6sAk1/w57GnBmoJqtn/E8sZmx0Vyd82edQ==;
	25:0orJZY34jc+fIHKCMowNiN7NMA/y15wM7yzHAyMbhGEvJSG56rxWdvmKO72fGNzpYqYE3K2IWUh0Obe1zObNW82jJHC3QK6rXn5Gtoz6qlAM8DY+nJqWnGQzO0BVR27X2InWICGQgBweSHBNlUVsn0U1kSzRRCzhq3gB3fjvhUkhvsuI06jiMIX0F4leFJkBcAKoC1qo5QYCA0MwOUmspTl2+YLVqU7ncNcNEHLIjZ26hCp6dSyq2lDWBixAcRcfBo6xSNXRSDpWl/iGQIv92Q==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:frgo3wjZs9Ny7/lFEOgzY8iDjBx+Fp7qZ5znr301yKC2J0uk7PLR2j5XIM/OLVpMU9HXrFZnGU0jkLOpH+vU/qtFanmn7VHmgxJCgLnmDqq45wsY+mv9BkC3TDf2aDOZzrLFxE9tU8UZGTFu0ro92zSDzpC61dEoXE21bJWYTVgnJ48RWGexga8bzTkS5KBbH2moTe33qmb+Bq6RrwU3/kaMW5Fg0Y5J8DNasGlbHbXCpztVT06c2gOjWO50HnNPOah9q/bB6GI9RIyBleurLHlU+l71wyaaARJCKPD3ONR3HPNenYB3YUX3Ekd1zRUAkCyB7+kI+8wtsBZ59RvsMzUYIdzm8JYh2f61vvxl+oXQpJrzEozrMkfx9Z9h0TtItL6g/zZUQ9D+DDHYoYf7kCdvA9B6Q0aiCRo8OF6ajYten8P1kIZCaLUETeFDCYwWI8fOeEzbna6Nihb6mfb9R7H+wzakJuWj7wgh8eB0g1k/1q7keYCLNkrLHjI4JYur;
	4:9VqzwzFY7WsIpBvzsWwH00JK5wEeG1eFuLkxEeC7TvLTRBSZwkWEwcRAgAn5LFkq9IgJZolA4t28L/aa2i9wa06YM5l48LWVLGFrI4F5BC6fYYNazvefOrjsZcI/8Noz5GWlASZFa7yn0ReGhFPid041bYlNuX80lqS6aZxysVz4TNtlaqZJpU54CDnCVV3IWr9M4nJ0uEe9RqYd2ZYR9u07twKunpx0yhwPbMm1Q5JKmBbvcSXIG0ot8ZVr2wZvgttZz8OOKfUeTmm/N/A+nqL6zeIE2JU2/2B/mYVZskECeNvUmSziPJNveG/zDazU8MeOxWgAwsZRHDIv+7J02A==
X-Microsoft-Antispam-PRVS: <AM3PR02MB1172228376BFF898BDF4270790590@AM3PR02MB1172.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(520078)(8121501046)(3002001);
	SRVR:AM3PR02MB1172; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1172; 
X-Forefront-PRVS: 0703B549E4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(450100001)(62966003)(77156002)(50986999)(76176999)(189998001)(5001860100001)(110136002)(97736004)(5001960100002)(50226001)(107886002)(5001830100001)(40100003)(5003940100001)(4001540100001)(36756003)(77096005)(47776003)(81156007)(92566002)(68736005)(2950100001)(105586002)(122386002)(106356001)(86362001)(33646002)(101416001)(42186005)(66066001)(2351001)(48376002)(50466002)(64706001)(19580405001)(19580395003)(5007970100001)(87976001)(5004730100002)(229853001)(46102003)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1172; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1172;
	23:dZ7XYlGYd3Fsu9AJggRQJypz89o/LR7y4UuMSmkws?=
	=?us-ascii?Q?UOuB7iEjjc8nGi8yXPQysnP9od2hBevfkWPOnNQkR2p0K9Vm2mmPkzk7R7Wl?=
	=?us-ascii?Q?7KHlOPbS6zz4b7p/e4cjJOsYftjXa2fIQ67f8bRsljQICC7f+I24kaIP4+5n?=
	=?us-ascii?Q?nbDPjS+zXlU5SVxMbQte650jrtLaLgSyoja10Q38swdmWqg7xOR3vaccOast?=
	=?us-ascii?Q?ic8PHDOrwMCv1rw2E5s7LpMPBOd+qHNX1BTQ0n+FgzWh8mGMXQ9wEq9eIU0F?=
	=?us-ascii?Q?voObt9yyE7/xNGugYIMFXQ1SGgbMQydOysfKZrfupq7dInE4U3g/f4Qx+GHw?=
	=?us-ascii?Q?YmGHs2Bs+iaUVIsss73MPanuvaYAvm4hO1k6TBDecSDnzhF+oDhu81ilEm00?=
	=?us-ascii?Q?m4qwpBUmNDTq5cOjWo1f6qBsGoI4pfIJpujR04EbKSiLi1iBnvy734dV4pUf?=
	=?us-ascii?Q?336HOGjp9tZAIrApPXVWBLtYE0mHDDX4KAaELm7YRR/aljOdXXEoaJFjz5uJ?=
	=?us-ascii?Q?ndjMRfnfp5CDjIo1T3hhrkp2irFezwXePIrWOUVV4pRoz7GJfOhSC5QVEeRB?=
	=?us-ascii?Q?ASZK3t8ut6V3S/aMz6FilgSxrDHSBiiP6Q7IF7PFGdiTKHXJE4Mg0lC5E18J?=
	=?us-ascii?Q?Rj9VMxpVnQohaI9LHV64Mdfb4jvTShTHHsYrFVPZ4ZJ93bXaJFrJWpEAjLss?=
	=?us-ascii?Q?OrOr1RaMgyU9Y+NNPxuHdzjbJQ2SdvWm3gAlBvtZBg/7xpaF+vUClsi2bOpt?=
	=?us-ascii?Q?2Z4QkbwzKf0l9KseTbCY7zODcVrNpTs6YVZz3mH5Sp8pINsplrp8DSqLiVzi?=
	=?us-ascii?Q?Xut8nO6Ly7Lstheq9vNX2crzydAU5cG2eCwGF0i/O4PEKguwngrKrD7vMtLp?=
	=?us-ascii?Q?0MMQVaCuV/EaaAEXnlIQ1b0CeNutHhbcpNU9tqaO5Bwz95xxeLBBxUwUL2Pv?=
	=?us-ascii?Q?WhWzixrVuNFvdtLWM/8apU0zppeH2yPYELSwTuLS6xOTlnpVqoI1T6AkIy1x?=
	=?us-ascii?Q?vyPirvmTO3AcE7ILIjsUBxR5xcew5oTYwAHNpVdvHoNUTCw4EKxhRAZc7r28?=
	=?us-ascii?Q?0RRAjBqD01LtCos5GMxU0EIB9Eow5pfIUEnnE3QbR+zx2Dcpjs6VYjzt1FZX?=
	=?us-ascii?Q?+RiTindMR2OGbFRBB8NYkrQiJvCD2XBG9aFuFBsSmhNqIrBkjHSR37YeyCko?=
	=?us-ascii?Q?NRdfUaFxma85XJpQQvxCNn5mXXQRu/46RjRDh0Ns6wmvuES7rYaqnNh7Lo71?=
	=?us-ascii?Q?Z4OmYqbTk6aZ7pq42TecIRl5M/qyyORzet2FTi1?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:LGGiR+msppBvYE7T3pcTs+o1NjrVkBzwyvc5le3eS/gvroEVShEdknvmmVAnn9Dj0c0JCqZnNRt2sMwVlhL+/UWsn4YYWLaHKaao6j/yWW8ZcH1C7wrX2kF8wKyvhYAECifEusRTbzJNY/ON7PGoPg==;
	24:Afx3FyKQISCmVcMlWMROpb6pFL6uCzjB44ODA+xM7n4c/tBSdWejK16XKh02v6x0yAmPpPV8u5Og05DtNc1QPA+1CdCm87+m/viQPoiU02s=;
	20:hO7RMeylYFiFqFI2beqdNzAqt4fjw8Bg4xRQAxT/NDy397qdrazDRZz7Gj8/EJUaouiYh+bU28omppgVxHkvGA==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2015 12:17:25.9873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v3 2/2] qt5: package Qt Quick Designer files separately
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
X-List-Received-Date: Fri, 18 Sep 2015 12:17:28 -0000
Content-Type: text/plain

Some modules (at least Qt Quick Controls and Qt Canvas 3d) have extra
files for Qt Quick Designer integration, which are not needed in the image.
Create new ${PN}-qmldesigner package that includes those files instead of
${PN}-qmlplugins.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qt5.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 4c58ad6..17d8fd7 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -45,7 +45,7 @@ INSANE_SKIP_${PN}-examples += "libdir"
 INSANE_SKIP_${PN}-examples-dbg += "libdir"
 INSANE_SKIP_${PN}-examples-dev += "libdir"
 
-PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
+PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmldesigner ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dbg = "1"
@@ -58,6 +58,7 @@ RRECOMMENDS_${PN}_class-target = " \
 RRECOMMENDS_${PN}-dev = " \
     ${PN} \
     ${PN}-mkspecs \
+    ${PN}-qmldesigner \
     "
 
 RRECOMMENDS_${PN}-dbg = " \
@@ -85,6 +86,11 @@ FILES_${PN}-plugins-dbg = " \
 "
 
 # extra packages
+FILES_${PN}-qmldesigner += " \
+    ${OE_QMAKE_PATH_QML}/*/designer \
+    ${OE_QMAKE_PATH_QML}/*/*/designer \
+"
+
 # qmlplugins 1-4 levels of subdirs qmldir + *{.so,*.qmltypes,*.qml,*js}
 FILES_${PN}-qmlplugins = " \
     ${OE_QMAKE_PATH_QML}/*/*${SOLIBSDEV} \
-- 
1.9.1


