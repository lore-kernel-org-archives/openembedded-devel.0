Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0110.outbound.protection.outlook.com [157.55.234.110])
	by mail.openembedded.org (Postfix) with ESMTP id AA5CA75EE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:20:30 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1170.eurprd02.prod.outlook.com (10.163.183.148) with Microsoft
	SMTP Server (TLS) id 15.1.318.15; Fri, 6 Nov 2015 13:20:28 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Nov 2015 15:20:09 +0200
Message-ID: <1446816009-14836-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: VI1PR06CA0031.eurprd06.prod.outlook.com (25.162.116.169) To
	AM3PR02MB1170.eurprd02.prod.outlook.com (25.163.183.148)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1170;
	2:SvHdTjrsRbicPqG7pV34LAwrR/xDpLZTy/tfKjwcHk9zWUTT5g07vZEWmNVfT3EO+gBoo7zBU1HKGDvaFy34HvpyTSl0Es/W/6/OM7JDhnHBVPUCQqZLxXnv8g1JXVmpsVd7x7dP7qKMNRW/qEEsZUi4hoyHiG7ZXMc+KhGvuHo=;
	3:kqecAKq6gZIuI1arSGDGpCpgSkjYFpvhl3tEYQrCmP0ASf6dUMIqUZjL091eUwAbchlo7EFWAW46DwgCPjcVUXgfZYiLcQtQBZfC5diV3bHiYDj7x3jsa4koVIeiyO55mmK6Ge9061Q0+NuRxhgqdQ==;
	25:/GNk18o9bcBKG+KFm8hg0haKuixtpbPiKTs2BlXsXSpoSMbJPKKIbmKUxTyucnR/Sp0vrLFBu3omfMvhPBEDncTOg/Rld8cd4MaT4etCowSHm69DSeD9gx6QZ1QkMVDrmicB3bA08swMll7HOTxQkqt1msML6aI0FLe/qS5EDAJlgxVtTHLl72KJjixXlINzq9gQ185oD+3Ohhpi17B/nUSTzbiT3xB6/0ZS+KpltdSxjf/fXt2iu751FVKNbpHHPBwfYqJaPZ8RbYE+OsewtQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1170;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1170;
	20:1v2Rv2pON3qLGyg3UETJ5WLqXAMRrj6fNYxr/cxMDSOI5JN19RSrQsQ9+KH1PzJUWtZdVye4q0hTIwA5MUDEmpZ1zfRcvl4Ore1tU2AKs65sGGiPPQdCSABpmKU06WgvKivA/6NW0CYF7Pv4+VnuO7vcf8jAc/wO63xejD+cdqPGQ1beyzNw0cALfpj0nruRSHIEmvFq7USx44bduL0f5a23fuoKfO8OW5PqsmSvcZQqbgTFIjvtXGh25JSdzphTdN7bHvi+B968KCwZxNKzuMZA5mfu4C2iryvxymZKbqUZe8cX7tG3llyRUxepMLNHNleTPfOeipJCdBwsCxq3J1MZvRbxlG9KfowQPCJwuXtvJn62vMJ69adjpx6sMMe2qgeO6jsgycLGa5zXDFYM95DklXUlnQA0/TGKlYlcLCr8lu68o360bB+/pGce6RhYhfgJB/6/XJoJ5/+4Ey36pwqfVzwG4E+atBtGqmCmFRd7vNr3SrjICOzj8+PBSqOa;
	4:kfknT2tQkZC5Zolm5B+D8xE0HDB7xJtF6qsadc49A8yeu0Lq2YXYpCYxZ2ZS1SDQv2k4VZ76lDVS2/8ss5+EucVxnAj+r6DJCKZPN1teZaLFimuIWy97hHI8pHceHsKAp8Qg3XeTFF+WoDGspduHkupFGbbvhlWhAoiR3XLSzqBarXBRjcz7H2rlduKLPePRBtG96ogRjVpNUwZo3uMVhbDDptmV0/WinMT8S9JS46kZNyiXJnjexogBCG8Vv5HcBDkVaH0N/0OoBY8MNlskHk+52CtJyFW6HWFnkX76O8wDgljMPt/m9Lqdfe4A3fAGBjLx5Z/yOENMWCyrz3O62TsqZl5ESWddtItnT/kXTy4dpH8gTTr6kgwHU7alioSQ
X-Microsoft-Antispam-PRVS: <AM3PR02MB11701728B2B3A46D939DCFEE90280@AM3PR02MB1170.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226695750432114);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(3002001)(10201501046);
	SRVR:AM3PR02MB1170; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1170; 
X-Forefront-PRVS: 07521929C1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(47776003)(40100003)(19580395003)(4001430100002)(92566002)(19580405001)(77096005)(97736004)(81156007)(42186005)(36756003)(86362001)(450100001)(50226001)(48376002)(33646002)(5007970100001)(110136002)(66066001)(575784001)(105586002)(87976001)(5003940100001)(5008740100001)(50986999)(50466002)(230783001)(5004730100002)(101416001)(107886002)(122386002)(106356001)(229853001)(5001960100002)(2351001)(189998001)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1170; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1170;
	23:BVyyrU1CLyk+ioEQ7nDqVYjxrX3Vdeflm3xd2HXUA?=
	=?us-ascii?Q?aQ9uhRFxQHl/ciFtxrrRYRRfgCsMMk8Q0OC0dwUzQIPv/VyKJQQv1PHq4SLL?=
	=?us-ascii?Q?pMQDQQVQDVJk7ygoWjGAEbAACsbS50G1zcT3zyh8TmQhzIDaD+vwUHNLualF?=
	=?us-ascii?Q?aZhyuFaS5qem7bHagCWrNHS9Sd02KTHH3PAiNMaSHU546ct7HNjfaV8V9O7P?=
	=?us-ascii?Q?Tu3wMKzHBhrWB+z59X+dkTed99+gBHr9NOiEB1vz9PHtMMYJc8TicHIeCM5h?=
	=?us-ascii?Q?Ifr1I5bZWPIqgU4lhGxF0OVb1agw7FFbngHEt7vEZZ03zQAHa8hqSBY1PYYe?=
	=?us-ascii?Q?0+W6Rbtfvxt6afnXFZireV3MYgWE7qF/QNPTAhrIn3Cu4mWyVXbLxq4LkVNt?=
	=?us-ascii?Q?PtgKlUcWgPOIm+T+tlyceQyQUrn2XNdwZwlx93ZvUmTxTqfRnd55F5Ps+q8N?=
	=?us-ascii?Q?3ZuMhQNVttu10sphxxlO7n80x3nxKQK0LVWvYQobR15/ks60xEra7NNLvep/?=
	=?us-ascii?Q?CdmvE0gbkv8scmnWoToZK9orzptVy810gWlw585TgadH1P6upc91UFh7owYn?=
	=?us-ascii?Q?lhZ4tE23zSVFYoBIjXA+SSEv4qLcuJFEZDT3o9g6M1kHPnbTG+SUACddeZC1?=
	=?us-ascii?Q?0AZotGbJX/kl7XUBg+GS8vNiFwxtupV+UU0DHJ84pJibZr9jECHtcBRyUy61?=
	=?us-ascii?Q?oHka1ZWkz5KAQmP2nCDQnYUeOTT4eSnP1/MK4lKVGih9ey/XlebAvESpCxHW?=
	=?us-ascii?Q?ToGbAXmYpBljxoaAt55U9VMnC7xKBxyCAjzuOp/8oFxbBiacI7KoOOk4ETGk?=
	=?us-ascii?Q?UIASvaZ0+lRYYHqiMJWj0yP7vQNCglKFKWNrnNZ1WgmbC7xU26XtKQhUlfC5?=
	=?us-ascii?Q?lfhBwYvHS6Jv40GqCP0LKbQtoBO5iowi7x1HBFDnIR/RBkgvsge67E1dS5Pu?=
	=?us-ascii?Q?f7NUilasWyzyIcBxJrIfP9RUBhdS1SM3muLFMe3HEzYzKpJUWWtApd2l2nrK?=
	=?us-ascii?Q?WfbJVZDzCETN83JEdQCmmq+x1F/G0Wm70ZGe7KuvQqXL6bnONeEGh2pnJAXN?=
	=?us-ascii?Q?wumDh7leUs8BoRLUTgUhNGZj9TnLCscT+TdyOPGSHk/7RDW8g=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1170;
	5:YdufMfvzH1V5X+eAxcxKhMwmX2X3MZAjYGdsgar+A8YbsfehozP6q5n/aI2BfRzqJYpYqWCaeVTE+FsLq5MMAxdCAq9ltlJUc7cVgRzVsADF0UEnkPKx3RgjNdCRi9M3j7aJ2yNYeNwmdss4ZRYUwQ==;
	24:5m0wKZMi88LR6gUti7oMekE6XCnAtypdh43CVYUwLxEJ7ZJS39/jn9/xjdksrp36GDwJrqF3xOK/GROBrf9rmEHJn1Zx3/iIN0Bifv3b52k=;
	20:wb1+V2BT7JWfBGCTOVWTyxzpoDaHTI3kOX4Ixi9WrsAvxtOXjMQr9f3J5Zysu8iXZPjc2v0GFIwR/IXTyFB4vw==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2015 13:20:28.4487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1170
Subject: [meta-qt5][PATCHv2] qtbase: support oe-device-extra.pri in configure
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
X-List-Received-Date: Fri, 06 Nov 2015 13:20:34 -0000
Content-Type: text/plain

configure parses through the mkspec, but does not handle conditions
at all, so oe-device-extra.pri was not included at configure phase.
For example QT_QPA_DEFAULT_PLATFORM had no effect for configure.
With include() on a separate line, oe-device-extra.pri is correctly
included also in configure.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index a9c448d..0826ba1 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -45,9 +45,9 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  configure                            |  70 +++++++++++++++---------
  mkspecs/features/configure.prf       |   4 +-
- mkspecs/linux-oe-g++/qmake.conf      |  42 +++++++++++++++
+ mkspecs/linux-oe-g++/qmake.conf      |  44 +++++++++++++++
  mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
- 4 files changed, 188 insertions(+), 28 deletions(-)
+ 4 files changed, 190 insertions(+), 28 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
@@ -200,7 +200,7 @@ new file mode 100644
 index 0000000..d0a4166
 --- /dev/null
 +++ b/mkspecs/linux-oe-g++/qmake.conf
-@@ -0,0 +1,42 @@
+@@ -0,0 +1,44 @@
 +#
 +# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
 +#
@@ -240,7 +240,9 @@ index 0000000..d0a4166
 +# for the SDK
 +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
 +
-+exists(../oe-device-extra.pri):include(../oe-device-extra.pri)
++exists(../oe-device-extra.pri) {
++  include(../oe-device-extra.pri)
++}
 +
 +load(qt_config)
 diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
-- 
1.9.1


