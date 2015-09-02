Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0133.outbound.protection.outlook.com [157.55.234.133])
	by mail.openembedded.org (Postfix) with ESMTP id C98DB76FDE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 09:32:53 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	VI1PR02MB1182.eurprd02.prod.outlook.com (10.163.164.22) with Microsoft
	SMTP Server (TLS) id 15.1.256.15; Wed, 2 Sep 2015 09:32:51 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Sep 2015 12:32:39 +0300
Message-ID: <1441186359-14111-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM2PR02CA0020.eurprd02.prod.outlook.com (25.160.28.158) To
	VI1PR02MB1182.eurprd02.prod.outlook.com (25.163.164.22)
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB1182;
	2:so3eqpVaAipEM2cGIC7YnJM2GB0cjnFige1kVh+MAlGDR9o+LharlIe8fDM8c2zKGLNoliXtHYENnaqP8iOATRmVzaaDwN7Bd5VLGHolEgMjCxr7zfaheUu51/JE5cd055D1KSZ+uper6ts9FN0R0a1K64EsbLC9rZ8DLIwEMho=;
	3:XkaVf3SFsRFr0+613xwjI5kdp/jEt4IM7V1sU3rTEf22QZQBpKfVdG77g6sFqcuWEz8/ryHE8Qza63YjPZke4wIxdw2PrUq20NlXWKsH9wobR1NDYdhWfaXPd/h/4NNpWP+XiwCHmVOlAoxlpMl+XA==;
	25:3R1jUfeqphx3x8IZ1uaKMElKtWdOsjlLrDz9AW/Rmd4sQ4u1HFOqeVkVQop2T/8mbsNfWrkxg96swDWjaz7hpUMtTHXhC7aBo7g3Y4lDUwbTgzy7an39cvF2Uh3Df9i9OWSoaoyOUP4wkpifw5YqZBgus0Xrb41KvKRShnaxHPNRadG6NLI6UlELPGZVstgQJyxB1FjAf91zW3xoqjBRL0b6px18BojGF8owFbszua8pF5QkRL26ekLFxvasVdQzaNi1jDx5Who9M5VN7L4D7A==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR02MB1182;
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB1182;
	20:B/oIWdRIDWJSUWJJI/E2PQW4CLIB5p0Q9+caipwLaq6jj46Vg59Da3jIoKGoL29cmm8la4bsa5xC04OyHORWbGfFIK+O/1ZDg38JbPb6/0nbAP3uSYypJi0G3vaFLLH0IafqQf9ZOw4VdSvI4b6bSy9y9qtAz40t444yyQj6FxSeCoFbnmBtUwFt4qiYZ6JF04wfX6XUK3g6X3TObsYeyZ1lF+oBZg+lNJuis0NmL/0acZ22VxTIona7CFRW1YISbXFOixQHVc1mZueSjQOa30eIcGdZwGRvT1JRT5210yKgXsoCytW1BvSMILg3nP80XRphJEFTVv3JZKpbg6HJTzxpiF22QrfdZyJkbBJ+VlqReEhujDtrM7F4lKT9vfPkQd72niziGEZGA/M6oHUZHjoyIq/Z79f2fFSdvMiJiMegLmOXX0iImZDLrlzKpeduY8VKyoXcinuGiElskQajNVJU9XOypAuVps9T41cJZ7ePBV5J1Jtb4UjWwqmkd2u1;
	4:JdlmapwiI2B7oWDPo5OCREU5ABOWU1db5H9eDC1ozI6NMJgAMfAh+FMIKTw1sTSPnjuM/jhMiulIRsncei8Kh5C5BNCknCsL+02FqpLQH9+tUXEVyiQZ/dACfGQx11wjAZ1Hee3SKQujE7Mg95NlFxpKLo/JBMjTjtkgKc5086IN+5J7iPPMmX8g3B7qCIkKJPihu+KNdsvbk/Y7Gq7aguXuqg4NueO+AW/CkkVa3oIV0f69Zz9YemQCBN98Vr2Ot8SP6NLYpJyFwDdi0cx13J4FC37ZCUasHmxrJQdTZE29ZKdsCfwfWICgHtHFEr6T
X-Microsoft-Antispam-PRVS: <VI1PR02MB11821441A060F227F65B01EE90690@VI1PR02MB1182.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:VI1PR02MB1182; BCL:0; PCL:0; RULEID:; SRVR:VI1PR02MB1182; 
X-Forefront-PRVS: 0687389FB0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(5003940100001)(48376002)(5004730100002)(50466002)(5001860100001)(110136002)(42186005)(97736004)(5007970100001)(4001540100001)(5001960100002)(77156002)(105586002)(106356001)(450100001)(189998001)(62966003)(36756003)(87976001)(19580395003)(5001830100001)(68736005)(40100003)(50226001)(33646002)(46102003)(122386002)(64706001)(107886002)(81156007)(50986999)(2351001)(77096005)(101416001)(92566002)(229853001)(66066001)(47776003)(86362001)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR02MB1182; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR02MB1182;
	23:708IUsS/3nXuJWH67sZZHuJd0YAIrBFO3IZ62Nv3l?=
	=?us-ascii?Q?a9qtcX+NIWESQXTFAniSVuFVZ4njVE4/pXm3aKn1V5n4ydZNFMvQiVEnhSWM?=
	=?us-ascii?Q?tyJigZm7Wr9bzqEqqFKh3Gg5hAg/bwv0ukgQHawXYHvi4Z2XgjLAtXN4qD56?=
	=?us-ascii?Q?4yex48cmvchZSNb3DjRF3dgYPOYd1x3lvvjiBaIv6UyycDuZjmPuwIOyA51R?=
	=?us-ascii?Q?RE8alpB982DeTK9CIJlUjPrK/n1Jk/A8FgF/ahasNWT/+OuqdDSE8ksW17Dm?=
	=?us-ascii?Q?NF8JubHXUjp6EKrDIPcin1O1Oyc/rvtZw3P4yFa/PGNqA99SyfHb6rgHig+Z?=
	=?us-ascii?Q?7bM4QdXxGfgimBDd948qMYuROJsdoQFcEV7vOpYA/OhFSqV14JZ2p/6QTzOC?=
	=?us-ascii?Q?BzEAHQzaeIKZ7lTx49LJdKT1pPlVwgry898I8tAh9FBtUeVlHm5i32MQ338G?=
	=?us-ascii?Q?YyqdqtKzfHJfOo5nh67J5dOZrKAwZE48AmHJa7pdL0ILQKRMUEiVc1TNZn8L?=
	=?us-ascii?Q?SqtXc/BWFabGQmjAc1IHkGzOV+VI6yyxTqc9i2NotO2kJj4wRegCL6LqSmKl?=
	=?us-ascii?Q?F74ZzIVUlHpJEyI/zlFbgpjwik9j51X8QjuFPpKE4EQ8uK69s6FwzClUribG?=
	=?us-ascii?Q?Q6TQIJqBh/LTLRKY3ZJJDxPurVrI0vNBObNMENGOjFusJh/C/Z9v/NUrOhxp?=
	=?us-ascii?Q?Q+/n0eUcs8b48nB/sEwGVl8RORt4n6XIUxMJ/t3d4rERSCaq6IlUR10TPCCI?=
	=?us-ascii?Q?SZuUtXSGUytLbr4pR7zMuQDWfXzn0YDbqtbX1o53qDsZVVloAzAw+cpQ2Ez9?=
	=?us-ascii?Q?HxsMLg+56k0qokByke6fg82f8YmEVAm4mpwtxC96Q1L88mFrswVKeFtLUvj9?=
	=?us-ascii?Q?uUgmz35ucQOlqTbOKvr6uf4tJzhPJ/4xM4uV+eljExmjR+nz5fO47AMEEQYI?=
	=?us-ascii?Q?PK+JLB49lwTGKFjGqvHmC2GmQR7vanjyCIhY3A/EnP3nbF8kZSD/EPcQt2kC?=
	=?us-ascii?Q?kY/wmfDYII4X1GoZslPhOP+0mS5GoKYdLtWF6ix/B5UNtpNp0tqe5Htx6NwM?=
	=?us-ascii?Q?pTtWT8KD1z1V/vt2yTHuBxmngJlk1jyPIscEdjz62gIAKQOYFNcKcfhZZk5M?=
	=?us-ascii?Q?3HSacoU0zbYuvp8ZTbb/l5LBp5CPFr5GhWy/Y5R7+ltkkrlCMN+nJYyiSeNj?=
	=?us-ascii?Q?B0VS4/bbnMDBcEoe/q9KpYYcB1/qRhlJTC1?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB1182;
	5:qs/aRXyfekcr9sl44c3IZgf+NZYkLC+g4iQOwH+PsUtgrikdtbRc9MRlIOyLfeSvKhy3wzcEtqv4wvPTo+ZLI3GBHk4iqkqo35s4bJVO75gI09BmbRaTi8JA2ICGcxPsFCIl/BVIe65cZsEcyYzO4g==;
	24:EiUA7FwdNT/o4jYN8SN+f9rOAXWzIKZ1DyNLQWSZKiP+mfm8XHY9Evyn2XrWb4NsFzZb1S2fSBU1H35RW9pMXZBJiU4iwYDLhSPdOvi10Bo=;
	20:9nkMcuAO3BpqwZfmpStGlME8o/RneeN6ZJ2uxA4j7YECGjAqOU4ab4otzVtytx0yZstU4yT/iyxskZXldhsOeQ==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2015 09:32:51.1218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB1182
Subject: [meta-qt5][PATCH] qt5: package Qt Quick Designer files separately
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
X-List-Received-Date: Wed, 02 Sep 2015 09:32:54 -0000
Content-Type: text/plain

Some modules (at least Qt Quick Controls and Qt Canvas 3d) have extra
files for Qt Quick Designer integration, which are not needed in the image.
Create new ${PN}-qmldesigner package that includes those files instead of
${PN}-qmlplugins.
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


