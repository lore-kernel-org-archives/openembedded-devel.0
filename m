Return-Path: <jhofstee@victronenergy.com>
X-Greylist: delayed 1156 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 Nov 2017 11:43:18 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0113.outbound.protection.outlook.com [104.47.2.113])
	by mail.openembedded.org (Postfix) with ESMTP id 9864C77D16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Nov 2017 11:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pECvhEdegEvIXptKSxV8kK0FoId/L4kDhGstJio/vPE=;
	b=RvBpKbQMIGE9nQOl7cj3CAt5uXVGMudOJtAyWcO4s+Y9AnQOIKteZMZMsHul5Dkr6kSZ3JJYPO0SgKY6zLcct7VEmyGD/643klplvUT0tDkCJOkhiZr40yTxH2WMclZyWuavZwb8707SkkOcV0gXbOjAx0RbgpzoPjdX/3you3o=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
Received: from localhost (213.126.8.10) by
	AM3PR07MB1057.eurprd07.prod.outlook.com (2a01:111:e400:536e::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.260.2;
	Tue, 21 Nov 2017 11:43:17 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Nov 2017 12:42:58 +0100
Message-Id: <1511264578-10324-1-git-send-email-jhofstee@victronenergy.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [213.126.8.10]
X-ClientProxiedBy: AM5PR0402CA0017.eurprd04.prod.outlook.com
	(2603:10a6:203:90::27) To AM3PR07MB1057.eurprd07.prod.outlook.com
	(2a01:111:e400:536e::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08656ff5-23c0-4955-047a-08d530d50e9a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:AM3PR07MB1057; 
X-Microsoft-Exchange-Diagnostics: 1; AM3PR07MB1057;
	3:GhOaAujOfnytvSZwdarVqgF+no3f9ic7V7WR6+fJDIgg4ol3cgnMBiU5BpLBfpWN7i+i43+EqREEXRk40HjFSjfp8GC7lNx7jXU0/SZIdp6VPz4YEPnM3Jck3Pm0NinFsLdQUEIngMG640sJQ74/PxRvIcg3fykvg+bzGSfdubkGklwm4tFlB0Lg3yQ+dCaEUHUEzknFkeBhwdca6ACXTFssZepM6AeRJwTw7OEUCXKwYTK4CKoGGoVHQyP+7LG3;
	25:fLsJVkJVEwX4e7oBolDS/iviHi1it6u/zhkfEhnrTP5oQxFrlQRfXepvWr7ND6/LJvMttFKF/pNZeIo3ED8KYquVNndbXocb5Bv7KlvFI/fJV8dBj+m5wkTxNrjL1IMxSg9dKx1kHLvcr4TAAnzDpj3fHHNYshx9SYj03k5GiBhTKU1Cu12HEdW1DyQ7AybF0PSKhPsO+RWg0T93RF+Xoc8DLOtWaqh6wKT/8+dfZfMFs1M1NI0A20CDhI+H3qTJJle34/4Lmt2I6b161dCpsOxlHA9Chielnr/Rg0bqp9WXKRYvZCiKN3F86uCyCKkVJ66z6ju9sM4iLrWsyRL8K5uXcNEbDwMBeOedccOotFQ=;
	31:WTsI+Ral6P3SG1J881hkqUKoNh8Dd3ZPdKOKKfsIEBJvf6wc8ctJsPsmQ0PeeXTTwudcvssOt29p+SVZuActHV8YAnY9zQdHabi5ny5+ksPE1xDlGv2X7XoI5WHm44hzxe8bF5m6aDlUtNIpAj7lpqubDxb0uYe67odmBNZ8meeQxFhrwHIf2j73HamUucv/bbyv+RZ84TinmZqpx4k+8/YPVYZS/HsGKyRv7R0FriA=
X-MS-TrafficTypeDiagnostic: AM3PR07MB1057:
X-Microsoft-Exchange-Diagnostics: 1; AM3PR07MB1057;
	20:FthylaJwV+A9fS0AMpg0LN8NjwIloqZxcpCPE6X474Sw7CKldmUWF3bY93iSxNmONZCpJw+mXcLvp7naVbgDyFR9zlSXAWcK13sso8Tt8tLRJ8xj5uUchN6GG5yK3NT4Bbf8+b1PcZhgCCsPdKwx3Fy2LpH3dWIUEik7ILmZM8tG8NPbsm+5OTRQAPUCZRdYmqdqlWgTZ1Ab7FA3woViVtfABxmpP1poC0MOqKa0I9667QRrSTyUitkHZMTSbu7a;
	4:O+VB1b32V3BbmM+iHEQue5rUNxK4NSabcPrSNhiTcBO50jF2HgCwfy/oSMhF40PuVlN0BrsAOfB9LXmkkK5MQr7T2KsF6h+gySdSLdgF7zko8Ym3Kc061n2C5Qe1dyiVblmLVYDDp2/ZwdY0zVjTj26eDUoCb/qeMHpKgIhnezQkVCy2y9Q50tEuatWLg/yCxlsZRZjw8jElUiWmgIxCkxyi2MNDZBQKlX64xOo2fqmAMWT9/J56ARfzW7JQs+csJj1OIf1SYNLqEerXLEzZ3gHrU53yWOYeJlq3esMxxpZs1e2PqM1cOUKkBkFXb9FT
X-Microsoft-Antispam-PRVS: <AM3PR07MB10579C24A700A5CE43958797C0230@AM3PR07MB1057.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(248736688235697);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(3002001)(3231022)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123555025)(20161123564025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM3PR07MB1057; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM3PR07MB1057; 
X-Forefront-PRVS: 049897979A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(6009001)(376002)(346002)(39830400002)(199003)(189002)(2906002)(101416001)(50986999)(48376002)(6916009)(50466002)(25786009)(5660300001)(6116002)(3846002)(8936002)(68736007)(189998001)(6496006)(316002)(66066001)(16586007)(50226002)(6486002)(2361001)(33646002)(106356001)(8676002)(4326008)(2351001)(81166006)(47776003)(7736002)(81156014)(5003940100001)(305945005)(478600001)(76506005)(575784001)(86362001)(97736004)(16526018)(6666003)(105586002)(53936002)(36756003)(107886003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR07MB1057; H:localhost; FPR:;
	SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR07MB1057;
	23:ds4s9RC8Sq/OWh/Pg86vV5b7f5K7/YsEOesUzHCHm?=
	=?us-ascii?Q?4s33ObcCYI81+0AdHyW1Kn8w7sMz6JDcytom5GXk6PMbp/ibYpN8PXX34HNa?=
	=?us-ascii?Q?9pJG9LmjcREvUymekApTtx2Kpdq/C4GJ83REKL74j7qUoE1bKGLaibtWfoAA?=
	=?us-ascii?Q?namuBM+nFGK1lyhzDliyLoqpgzCZgV3pGyfs5sXlughkuT++4ifVANcYhWYC?=
	=?us-ascii?Q?XeIbsrhcGOQK6hRuDV4Oig29gYRoo0a60Rom863zdeC4AAGrei2bhp1uz5LU?=
	=?us-ascii?Q?bTuHWS9h78Kv/HrAWuhSyp10mXMc2u/ZwtsdWJ6NF2XipPPAdScia2LM7nYe?=
	=?us-ascii?Q?CU389hu8wAn+sO0FEyNvt+fMZEGCSjw4QYLKLv+KAumuxzrEPRof/hzhrmBG?=
	=?us-ascii?Q?8gJbyWVb7Cq6AE1M4TtlCOZ4bEjhZVnnP600457ktf55rsUZZdYMYikW6EBn?=
	=?us-ascii?Q?YRakyHbYLdsKNDQtcZVIY1xKQ1f2aAG2QuFkcFnvLXVZDMtqT4OpVEYUuBpB?=
	=?us-ascii?Q?+jvWQCiCRjR3KueqjLNsuE9h40rVBmomwKXA56aR+faBtqx0rEZGTCy9jxB4?=
	=?us-ascii?Q?7N27EjW66gh9uToFDyWRI1wS1qRp5vb3UhNmc1kmP8LFz0NA0zLIqKSqkKng?=
	=?us-ascii?Q?QYohde6TAB6KwMgrU6LkQpE4rUwYUabaAxy6M6pwSmKU0eIRHkxtK1Hl/p23?=
	=?us-ascii?Q?dj4ZU6BCsDpCO7P9wLK+dZpqoTk/cmAXua8r/0Nfkh5nhRh6Gm9fgW5GIrxe?=
	=?us-ascii?Q?MrbLTd3AErC+so8TE8249yxgcCGb6t1HFuuymGLxY4IyviJuXKgrlAlZUrl2?=
	=?us-ascii?Q?kgOSTyj3P5qbGUpgYLSqkHUZeQi5FD0xklknv2YLmgb7A/VtocAd/SrOqYR8?=
	=?us-ascii?Q?B1hxczdCvvfAehEBI7mFlfA9sDQVrCQaHX5zNj0706bHZyOMB1wrWK3mKIlG?=
	=?us-ascii?Q?drXsOmyPXcS80/bDSthVnTIaHlIsvmrlDD2oLQZZcSKEITHa+LaVulOEZwpS?=
	=?us-ascii?Q?j72HjUMNoRhEMBOKJ2miCQ1WP6/NXq6wrkaw8Je/ZRoEy/MOhvp0tr/PCWM/?=
	=?us-ascii?Q?LW6ncpNqduqyc9jScChB+YWQg8k7A+tqrPEBjx6Wqlb57v1b+tqTwKnqMWFR?=
	=?us-ascii?Q?DHyADHVtGIT9tg2VLA99BrllwMYwi1F?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR07MB1057;
	6:BE3CWG9tyF70gQ0EjfpcpcdbSz+EXfiYrLiXPVhlJdM2L2rKidzsc3vL8toKafc9LrRym+wGbaf1b+ebKl8qc9lwrJfF1O8sbAO/F3jV61BD4polieMpxnWlxnf35xDvHmlPOWz80Dp6MjpHMvpD7X59ACRmrUjarp/ejzRwxHw8KZLm6U2esEyJGJ914FzjCcTvsQ1XivLUBAfEv/OMrKBmskcAZxTNIVIJKUjhmRIm0482nmukWDFC5LA5h+t1iti4Y/C0CN/V9Vc8lOI/45P1wwIShmWKC5fma3fZm8ulgXTlpjA0SOUgpWHQmeRUl51FOnaPYpSl1iRt84say87PAXxgQZGijFjEay1MpcI=;
	5:RewJvjbau9wOJx0q5wtureHPwmkSBmZeuKMGk5dXBDWZ0M3fwTKP3Y269crma0UmzXYcvPbBm4cCFzD4gb26eraIvr6lkPAN13b2iWtRhKXsMfdvWkx+s+zlhdW2cNHJLFwYw70zWMQxGlDBf2dkNNjKmty1t9GhxqwcxX9qX9M=;
	24:nDQ2jpwW2XsZnweYCmKTrhKRex5NkCyGJm+z/UQ07QX10KYTHL/I59/nSVnu1/TtWtGoHFv+CHY1ipNORTKpa17uRMrDri8aBDDWhdOoX/I=;
	7:XUWid31HoNKxsrqCXykU+j1YgBpPtFZR7aqH9voM/Hy0Go9vXuRVIDK6rjqYYzRkrRN1bzy35CB5MyCuDwgzyIK48YtSTrH5zLeOSjg8DKqv+jyJavO/c46Tm5zh3tyGcRkYGclNufjBen7F9lrBuRv446SbSQzbP1L7r3QaYLP/UCnAJ9lZ93YPM/rb4ZZwl63MN8FOJLXlCIfIhvbwIvTykop/zANUqH2HBEF4UlqClh96/5wLU8Ya1ksqxLJF
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2017 11:43:17.3310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08656ff5-23c0-4955-047a-08d530d50e9a
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR07MB1057
Subject: [meta-qt5][PATCH] qtdeclarative: fix build without opengl support
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
X-List-Received-Date: Tue, 21 Nov 2017 11:43:19 -0000
Content-Type: text/plain

Don't build the qtdeclarative opengl example without opengl support,
since it causes a build error. The included patch comes from buildroot.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 ...uickviewcomparison-and-quickwidget-needs-.patch | 58 ++++++++++++++++++++++
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +
 2 files changed, 60 insertions(+)
 create mode 100644 recipes-qt/qt5/qtdeclarative/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch

diff --git a/recipes-qt/qt5/qtdeclarative/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch b/recipes-qt/qt5/qtdeclarative/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
new file mode 100644
index 0000000..875634f
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
@@ -0,0 +1,58 @@
+From b4db5c6cef877b33b5e7cd5a07fe4a7e6797dcfc Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 16 May 2017 19:47:19 +0200
+Subject: [PATCH] examples: qquickviewcomparison and quickwidget needs OpenGL
+ support
+
+Fixes:
+
+  main.cpp:(.text._ZN11QQmlPrivate10createIntoI6FbItemEEvPv[_ZN11QQmlPrivate10createIntoI6FbItemEEvPv]+0x18): undefined reference to `QQuickFramebufferObject::QQuickFramebufferObject(QQuickItem*)'
+  .obj/main.o: In function `QQmlPrivate::QQmlElement<FbItem>::~QQmlElement()':
+  main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED2Ev[_ZN11QQmlPrivate11QQmlElementI6FbItemED5Ev]+0x5c): undefined reference to `vtable for QQuickFramebufferObject'
+  .obj/main.o: In function `QQmlPrivate::QQmlElement<FbItem>::~QQmlElement()':
+  main.cpp:(.text._ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev[_ZN11QQmlPrivate11QQmlElementI6FbItemED0Ev]+0x64): undefined reference to `vtable for QQuickFramebufferObject'
+  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x48): undefined reference to `QQuickFramebufferObject::isTextureProvider() const'
+  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0x4c): undefined reference to `QQuickFramebufferObject::textureProvider() const'
+  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb4): undefined reference to `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
+  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xb8): undefined reference to `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::UpdatePaintNodeData*)'
+  .obj/main.o:(.data.rel.ro._ZTVN11QQmlPrivate11QQmlElementI6FbItemEE[_ZTVN11QQmlPrivate11QQmlElementI6FbItemEE]+0xbc): undefined reference to `QQuickFramebufferObject::releaseResources()'
+  .obj/moc_fbitem.o: In function `FbItem::qt_metacast(char const*)':
+  moc_fbitem.cpp:(.text+0x70): undefined reference to `QQuickFramebufferObject::qt_metacast(char const*)'
+  .obj/moc_fbitem.o: In function `FbItem::qt_metacall(QMetaObject::Call, int, void**)':
+  moc_fbitem.cpp:(.text+0x80): undefined reference to `QQuickFramebufferObject::qt_metacall(QMetaObject::Call, int, void**)'
+  .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
+  moc_fbitem.cpp:(.text._ZN6FbItemD2Ev[_ZN6FbItemD5Ev]+0x38): undefined reference to `vtable for QQuickFramebufferObject'
+  .obj/moc_fbitem.o: In function `FbItem::~FbItem()':
+  moc_fbitem.cpp:(.text._ZN6FbItemD0Ev[_ZN6FbItemD0Ev]+0x40): undefined reference to `vtable for QQuickFramebufferObject'
+  .obj/moc_fbitem.o:(.data.rel.ro+0x8): undefined reference to `typeinfo for QQuickFramebufferObject'
+  .obj/moc_fbitem.o:(.data.rel.ro+0x58): undefined reference to `QQuickFramebufferObject::isTextureProvider() const'
+  .obj/moc_fbitem.o:(.data.rel.ro+0x5c): undefined reference to `QQuickFramebufferObject::textureProvider() const'
+  .obj/moc_fbitem.o:(.data.rel.ro+0xc4): undefined reference to `QQuickFramebufferObject::geometryChanged(QRectF const&, QRectF const&)'
+  .obj/moc_fbitem.o:(.data.rel.ro+0xc8): undefined reference to `QQuickFramebufferObject::updatePaintNode(QSGNode*, QQuickItem::UpdatePaintNodeData*)'
+  .obj/moc_fbitem.o:(.data.rel.ro+0xcc): undefined reference to `QQuickFramebufferObject::releaseResources()'
+  .obj/moc_fbitem.o:(.data.rel.ro+0xf0): undefined reference to `QQuickFramebufferObject::staticMetaObject'
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ examples/quick/quick.pro | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
+index 445dfb0fa..26ca0138e 100644
+--- a/examples/quick/quick.pro
++++ b/examples/quick/quick.pro
+@@ -36,7 +36,10 @@ qtConfig(opengl(es1|es2)?) {
+ # Widget dependent examples
+ qtHaveModule(widgets) {
+     SUBDIRS += embeddedinwidgets
+-    qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
++    # OpenGL Support Required
++    qtConfig(opengl(es1|es2)?) {
++        qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
++    }
+ }
+ 
+ EXAMPLE_FILES = \
+-- 
+2.11.0
+
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 4ae870a..c9915af 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -32,4 +32,6 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', '
 
 SRCREV = "32218c3243fb4f0da83293c5bd6a663d8e3660ee"
 
+SRC_URI += "file://0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch"
+
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.7.4


