Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0132.outbound.protection.outlook.com [157.55.234.132])
	by mail.openembedded.org (Postfix) with ESMTP id 36A606018C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2016 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=digiaonline.onmicrosoft.com; s=selector1-theqtcompany-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=mg0NuYh9uAi9pN/G+HhEIvQOvirKcD0F2yZMUUSc05E=;
	b=T6Oi4Ke80w3xhefN2gqZm0bxfWEnMvxd3yYXyjnc/ZWHNE5enMwuvfP09FKDTUvDH4lizghrCcYCn10+m8o6a/vc86XewMGd07fOaPB9UIjkGtgF1996uv9aw2OMH3OtnvFjb6tnJSZiDoz9AR46TWqaOi91I/5WEyh8ESx5e0c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=theqtcompany.com;
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1175.eurprd02.prod.outlook.com (10.162.163.21) with Microsoft
	SMTP Server (TLS) id 15.1.396.15; Wed, 3 Feb 2016 15:13:06 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Feb 2016 17:12:39 +0200
Message-ID: <1454512359-2140-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: VI1PR07CA0065.eurprd07.prod.outlook.com (25.164.94.161) To
	DB5PR02MB1175.eurprd02.prod.outlook.com (25.162.163.21)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	2:1kPJgJsmiAeeNnHffhOziRqwFziH1GlZz7yAR1OG+JlUaCQzs5wccWlxs8tRdApgWXRcPwcCzWqf1pX6DVF+BnxawFrHTPuhr0Iw7B6W8iKl3vULe9muie+gGylCg403uvXW6AOklxrWET+qZe+W/g==;
	3:30T7n8bO1MGAsVy4/FZ2dU9hIFjukWyFRxy4yYskMQXp8Q2qkR8C6Fi2l9cwaYTiqodWJ22f8ldRq/A3WI1eX2BXvYnCsutJwrcweCRZFkpKBi1b3Cqi/J0iNrfqDji3;
	25:ggMLWWr4lKBbHMtbPssYW2vMvUMJD7HOWxhGvlDbC6rCPbqqa1teNZq+JT/k0iwCdkkfu8QVIecRgHfrIkETNRQGNvPlqGF2EYK1UADMg4/2i4tfbOQAHzH/b8I8esAxYQtlnlAJPjngp+rcJ4wLvsV42NCK6o4KN9jrLQvzFvbIuysg1/cAV3s03kgRMfiSKxrbqqpCtJPdrjm5LWozlA4bwPx3AZNK4gaVE+NY0IWGy5KV2Iy2X3wI6y+koVkM
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1175;
X-MS-Office365-Filtering-Correlation-Id: 25d70817-82bc-4e5b-577c-08d32cac8557
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	20:LCrskjp7BX8aMMVnTu/nYkNaeTSj/11CB9h1TxnALYtxxHIonEHzhf8jYvzrB/b4NfITI2JZ63BWUeOvTqJkEkaDV+6MWxJ103FTz8LjQz0Nonp7yEuciEftxZQ48V/u8B45E/K8N4PmZ1k6PnO939V3RMx+CO/2mKdL/7uHTL7JhF3HBl3rGRu/ePb7P3WZdjIDAQTF7yeNxUERgHqp7chcIxi5FNX1tncionioQZyCUhM1ouAVAajAo1msWeny9HDEn3+/7Md3pu5JMoehGtrvkekDrfoU4T0x/yR7tFWj5PmDoM7FGxzuoL8IdY+s+UFB1CNJ/uLIhDgOn1uakIcF0chA0mK9oiRTOQ1a5982ShVuzrlEVfScHViTQRBA+9Z2HiVjnSxkFxyz2HHf5rVtPhhMLxdb2uPampmsZ7bczpWBFVAYPdgnxx8gz95vE4QC/CW/NDE2Q/tb9M8qBQ3GFCR0a10+854nUR7citTxnnxK3qggtsGBjNjXKunY;
	4:1XegzbS1BopjQ0cILVzmq0Z07m5ZJTw2OZB6ZzJ9D58Cada+efqmHMR8R8k0NIC6WBBzEWbq5uc1jMOm39bqZewraX0URFtzO4fxp0quvboq+/6fefMsxrnyAak2jMIPn+omg9vGqSQPqfwXFE5Al3MZEnbmfSL82bRhsmiEzmuv1YCjm5njZg2Uy3L0h8/GMEgbrQIDXo+FMW+l+OCPE/Royq0lfw/xhgc5A5qNuclGlUfwLeIbu5HCSqtIJFwGCNUugmU8Nb+8HebxQ+r8bN9XRTXX2uazmdMC6ZSADMmvlWj6qiXFJB/O+4zPKOX6c1sayMKObXwZfZrAbZFLLbKADZIoun7SBRSiaDMz4lf3Tf0YarHlGGrYwWxz1ROv
X-Microsoft-Antispam-PRVS: <DB5PR02MB1175635F3BE09A4B09A1B9A890D00@DB5PR02MB1175.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:DB5PR02MB1175; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1175; 
X-Forefront-PRVS: 08417837C5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(36756003)(586003)(107886002)(77096005)(50986999)(40100003)(42186005)(6116002)(33646002)(4001430100002)(5001960100002)(1096002)(66066001)(5008740100001)(47776003)(19580395003)(229853001)(50466002)(92566002)(5003940100001)(19580405001)(50226001)(122386002)(189998001)(48376002)(5004730100002)(575784001)(2906002)(450100001)(87976001)(86362001)(4326007)(2351001)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1175; H:piippo.it.local;
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1175;
	23:hc9kDButiX1BTBzqAAnt8/JUTlRrqIxZaDvEUERL4?=
	=?us-ascii?Q?M7bGes31x6zKod3pWeZ423LGClRheaRfl7Z8kK270ObgaDk6I5R6NqK7kedX?=
	=?us-ascii?Q?Em4mrvn9g1mJ/3v+mFQKtPZDSmGOkgn6Rpp6S0Vec3I/2l3FFatEn7bQzcZm?=
	=?us-ascii?Q?RAnf0lS8P0/uepyLP4dc9KE9uTo5c9eanf2wm9sZ2IPd7eTj/gO2xuEMMk5R?=
	=?us-ascii?Q?Tw3ASsNTnAKZQ7bxZQMsy+6xf03CPCqQG5lmiXnkciiZc93NXpMlQ8n4hISl?=
	=?us-ascii?Q?x+fXDTXkpo74mA2pyXZfbdRGQn8AaPbJ1qgrhDjPW2yc5H/ctglOevdp2g8f?=
	=?us-ascii?Q?7CvzGGkMgH7pB+z1uvYMcMn6rTlLD220JJpdRj3zBMfl/+l/2CesaK8mE2iA?=
	=?us-ascii?Q?F347eBYMHLHNoI6PoiY2FHB3Tdp9SYnquHXf/SePj8QiwFbmsZJqhhVR6W0H?=
	=?us-ascii?Q?RNoKd6XpQqpUl9Ffffo6bQ9vh2DRTpoXogCFWF7WmXzVbfUYO7v12hPJ3h0R?=
	=?us-ascii?Q?a70s9mS7gDhkqvRoC1caP0Aem/8QXA9Hz+MMMQjcA/cKejfeqeogQK7HdRzo?=
	=?us-ascii?Q?87zVgR8xa9eWIIOZimzUBZ+Vm4aX0xJTWbleMLd5jqAPNIaB4xBOgde/DrH1?=
	=?us-ascii?Q?PS1i2/8MRkeie+NT2KRGI+/Q6S6IPBxbzCsnggh4F7MePWe19ySstZGmvt8Z?=
	=?us-ascii?Q?s/Bc4yMbsIvLm19oX4jO7ySNDxw4IoHUS0frUZShaDlhFF+cFAQQRYuLB+Lj?=
	=?us-ascii?Q?VZpuPYoGlVTENY3uA1NYSJzOgauTf1ib6iYwLf4u8TOtOrxg0YEcpqvWVMKg?=
	=?us-ascii?Q?YmgmAgsWgFuPqTqTOBUuUZDeHoosSqm+KnEE1/DQxoDoXBsJn/ybt28II3Kn?=
	=?us-ascii?Q?AyWRjaPKkTSmsqsjcj/l68FM53iO86icz2ewLtrNELPYubTmAu4i7PH6U9BH?=
	=?us-ascii?Q?WOfJurer3W+t5LVggHhZBfADjyN+dthHPr/58iaLg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	5:WLBwTKimWThUZ8EqqpwHIGl/7d0vTJKHDNXxOXwiEfYA+tHBlRTf6fW+9Z4u9NvfiJyFlQ9P/RiEMfkScc7l0dP9J8vGimWw8toqfUHQSXWK9bZV0Wn5XHY5gKQ7Bz72J8SVMJGOS75o9qnrtKX1OA==;
	24:XAJQm3XAlQg/jDbAAzB9QlsGTKrYaGmDOzXxMBGBMBjs2bCjGF1TdhafLCvd4I4QxemHGyM3gg/YWXvR3huN4QDf14WQNrZPhXrFHfSFXwI=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2016 15:13:06.8868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1175
Subject: [meta-qt5][PATCH] qt5: use common PACKAGECONFIG to build examples
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
X-List-Received-Date: Wed, 03 Feb 2016 15:45:20 -0000
Content-Type: text/plain

Each Qt module's examples can now be enabled with PACKAGECONFIG.
Replace the webkit patch with a PACKAGECONFIG option and follow
common practice by not building QtWayland examples by default,
those can be enabled in a .bbappend with PACKAGECONFIG += "examples"

Enabling PACKAGECONFIG[examples] in qtbase, will still cause every
Qt module to build their examples.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qt5.inc                             |  3 +++
 recipes-qt/qt5/qtwayland_git.bb                    |  2 --
 ...amples-enable-building-examples-by-defaul.patch | 29 ----------------------
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  4 +--
 4 files changed, 4 insertions(+), 34 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index ce9d976..70e4b30 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -5,6 +5,9 @@ inherit qmake5
 
 PACKAGECONFIG_OPENSSL ?= "openssl"
 
+PACKAGECONFIG[examples] = ""
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'examples', 'QT_BUILD_PARTS+=examples', '', d)}"
+
 # we don't want conflicts with qt4
 OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
 OE_QMAKE_PATH_ARCHDATA = "${OE_QMAKE_PATH_QT_ARCHDATA}"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 059c2db..128794c 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -20,11 +20,9 @@ DEPENDS += "qtbase qtdeclarative wayland wayland-native qtwayland-native ${XKB_D
 
 QT_WAYLAND_CONFIG ?= "wayland-compositor"
 QT_WAYLAND_DEFINES ?= ""
-QT_WAYLAND_BUILD_PARTS ?= "examples"
 
 EXTRA_QMAKEVARS_PRE += "CONFIG+=${QT_WAYLAND_CONFIG}"
 EXTRA_QMAKEVARS_PRE += "DEFINES+=${QT_WAYLAND_DEFINES}"
-EXTRA_QMAKEVARS_PRE += "QT_BUILD_PARTS+=${QT_WAYLAND_BUILD_PARTS}"
 
 FILES_${PN}-plugins += " \
     ${OE_QMAKE_PATH_PLUGINS}/*/*/*${SOLIBSDEV} \
diff --git a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
deleted file mode 100644
index 3034f95..0000000
--- a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8900f45818b7f181d2b57ceebdf086c78d2ee6b0 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 8 Oct 2013 00:18:10 -0400
-Subject: [PATCH] qtwebkit-examples: enable building examples by default
-
-Examples are provided in sources, but the build for them is not enabled by
-default. Since example binaries are packaged separately to ${PN}-examples,
-having them built by default makes more sense.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- qtwebkit-examples.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/qtwebkit-examples.pro b/qtwebkit-examples.pro
-index 3fcecf1..2da8a36 100644
---- a/qtwebkit-examples.pro
-+++ b/qtwebkit-examples.pro
-@@ -2,4 +2,4 @@ requires(qtHaveModule(webkit))
- 
- load(qt_parts)
- 
--SUBDIRS += doc
-+SUBDIRS += doc examples
--- 
-2.6.1
-
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index f915083..a0d4e9f 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -13,9 +13,7 @@ LIC_FILES_CHKSUM = " \
     file://examples/webkitwidgets/imageanalyzer/imageanalyzer.cpp;endline=39;md5=b0739af76072fbe303dc04b6941e054f \
 "
 
-SRC_URI += " \
-    file://0001-qtwebkit-examples-enable-building-examples-by-defaul.patch \
-"
+PACKAGECONFIG ?= "examples"
 
 DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
-- 
1.9.1


