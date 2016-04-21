Return-Path: <samuli.piippo@qt.io>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0142.outbound.protection.outlook.com [157.55.234.142])
	by mail.openembedded.org (Postfix) with ESMTP id B6182605FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=B8YBxbRD6whwfbp7aUvbqicnE6AOHSW/JWRApG2BkDc=;
	b=oZsykWOZz9R0zrKYjRRMIr3xNHCtfAdEBpdPfXAq7o0rFkO2zVf49G+nRK5/UcqzqkvMnjCNUdFs6FygJ2L8wm950uuihczH4uVv9H08w72qd0JxerM3Nf3H/UnbpvR+TVKxXdRtX6L47eeHi8S4XTGQoig3INEtRF25e3IDkqc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=qt.io;
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB0567.eurprd02.prod.outlook.com (2a01:111:e400:883a::21) with
	Microsoft SMTP Server (TLS) id 15.1.453.26;
	Thu, 21 Apr 2016 07:39:34 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Apr 2016 10:39:48 +0300
Message-ID: <1461224388-24980-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0020.eurprd08.prod.outlook.com
	(2a01:111:e400:8840::30) To AM3PR02MB0567.eurprd02.prod.outlook.com
	(2a01:111:e400:883a::21)
X-MS-Office365-Filtering-Correlation-Id: df572b59-371b-434c-6fda-08d369b81585
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB0567;
	2:V1xk6pTJ0s9medCVL9rIfvPlFsxyU5zjdW5zK4+f1E8X04+Iisj2iqYnXOH1xK/1huspDLwtu6ykTFrFHn+EDWjscHPUrD23Lmr/7PuBTcR3fHfHUsKWB1moKtYEG0zKJ0F+WviF15Rk3E1s7DMfk+5JivYZqqZHlWu89FJhNHlzUaWUQ6CvEWJrX3ZzQ3BH;
	3:M9AAMRaYo9JgJKVubaFQHEAZ8Lhaz8vBQ3Mttd1bTzYaR1YBEPVim6+ILo1A5S2PSDU6ST83kmTIklkF/Bv30G+C9tiWcjmUWcJLhAgbJkMNCo8RBvVezI6FqwHFlbnF;
	25:mnHY6hZ17SQgH3EN3Z7BG8bWaF/22Xg6rvq8laKPTMb2f1Lirrb6Ard5GMbz8MlSvvzFmTvvC5brcfj7BCmbhKsHeqUobxIHkfFJSkfIwjBcRpSm7Xmj1UUvNmsT3qxl/7dYEDgKcqD7HAzklAOWgyyRnZy+zk/ZKjh0BQ0zoyCm2RTpcA3VI47IQ/YXh3yta+NIxscS9/OMHAiJFqdPSs74z72zdKtvxNBoGoCbvtcXXLj2Zexbq8o5CKJq4CfCrtbLs2SohYD5RGYWqtya4lHtpR45Bbgb4pWuthXHOsLvaywK0B0WQw+Fi863f0tFmJQuEIouTWGmBox0vmd8I5tHdfgE22hXspBtZoFukwkl/UhmbsT4DG+nyzkhFskaot0N2/A2OpaIeyCUDg4phsskjaGQm+aU10pS9DqXbFXRfkKL2SQX7Uw0YEKNCz9nSn2mi4XbMfo9RhGu+tssUeJvw04ci+C/UNawTJBD5YmzWk1+psRN0e1K6mhUjpUfhtCHmev9CofymtPVdRc+3tdu77PPu3rYaNMUGAV1VO3gY4s3jeShIQBihJ3kiFvJntNWixhwiNbC3xUUqxmDeyp4I43oYCP7te7laIVuXqcCXSKBSW2F46n/hvkQGYWV
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB0567;
X-Microsoft-Antispam-PRVS: <AM3PR02MB05675A2FB75F7BB51BA16B35E96E0@AM3PR02MB0567.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(9101521026)(6040130)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6041072)(6043046);
	SRVR:AM3PR02MB0567; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB0567; 
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB0567;
	4:unxMa4F3tHfwwByOwaI8HjEAE/CIJ7VZs1pQu2FGBjERQ9zitvLbO/Xd4Kowa8JyMZQspEH5KLpc5ql00f90AmLN2DnBOZbsXrVnfghwEkTudjCNWB6YAGNrAasxn1KSqu6xn7HzinTw067QH5fksDOLa2a28rnBrwnEXXvRLZtkdiM3plf6pNVrZclPbTqcSFWnPQlcKUUkVSUht7dbvuGrnBRQpnu2GCI5Tlu4l/ehaWKvgk9wfh4mnF9vrVLzL/RyJbMd/FMRT31fAnx4uVoe3pRWpeNQpaihgMwvPQrCVqcDYmLUvfJ19T5nXKk57SV4RtC4SRHoOvNWIVYZ4Sni8tO+UUBUAgxXfRpK/D+3Ri3m4VPyyj/f/Qstat4BTmWuq2KbmgMWDDm6l1n3Nmivoa2JgtgVRl9nGj5DKM4meRlIuK2PdH2PS7iSgEmsqRyDkw9eDJIZaPfzr64y5A==
X-Forefront-PRVS: 091949432C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(50986999)(48376002)(50466002)(86362001)(110136002)(107886002)(189998001)(36756003)(47776003)(33646002)(2351001)(229853001)(5003940100001)(74482002)(42186005)(50226001)(66066001)(1096002)(81166005)(450100001)(19580395003)(19580405001)(5008740100001)(5004730100002)(3846002)(6116002)(586003)(92566002)(2906002)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB0567; H:piippo.it.local;
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB0567;
	23:koPqWhaea5PdPjpGFc/iMBUXmYWtqHh8AL4yHolsInT9BBjNf18gMZLDkGmqy9dbqd7Hovk9+y++frkXZhpPriZSsLglyQYUOGbEN3kurR83B3AGF1Gi5byAauaoM0N6XjuZbdDCWItHKcpmTRMckwWA64/qA9C/DA95FFd2WGKPzatdQnDQ9xw9tjJVyyP6CsEly/nLGtNasChSEl7Z2u5iuzRNCccEumhgtYZ69jGgNgT0JyVScFACy1EL4OHBlagaq6CYRdfTulaKrbDK3d1Fn1vmdK0iONiT2PNUxapk+DtMN+8FlR6f9u/THEpXWcV1cMoial4Bf4u/G3voa+0y3uHLfblfKcAFNNo36Rd/E21iiVX9301eU0QuVV9vd/MBEZcggkzURTpKQ97hHCdMLY3/CDa0JaR5rxF1uZ+q4xk3JClTOHKYMdYE7TokoEFHwOher48wHoM4w/ZTe7fW2xyFvQ2OaVfs6LvAeALBPJSLyK0my7ADQESho1yWIU0xpmCE1mano1BJegkcm00Arvc2qwAeqahYZ9dFBLCq4R8gVp52s/ra35qAAu8dkIesLnQTUQtkZwXm9aGh6PQufh7qyUAWZg4ru6g/R9sb9jdIARD4hp3NGp2yitE+hejsiQd1GUwSY5uJ7godn2QKQeD4Dx6IoTvWfhalXZ0ucxWwR/kjgdtxrYb2itolL90lLpjju3cs0bYIal+aYgFdMC8z624JBMbLOJu/jiq8QEEHxcDHhmqCMgMKQir4nt7/8Wm1VMlzomqE9mZ638DOZBFvDY9FQeHeMMMh6Hdl1vUs/hdKCcDzLnGeYh7zbbpW0s5gLbOkiQSjW6Lm0Zckvih4v1TefL8nB1ZfVy8qXohKVj2tS7b0GnvSGxxJ
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB0567;
	5:2AqRyAiWlRjkW8ob3CIfkHNzAlf5y3UIKJqBd6xJpihHVr9FVxYfk2dTW0FXL1SBnzEP13zgZIXep0NaVT8w++4KFcIRMTRDXJZgfinBvel8D/P8/tbX6MW0KtxqUCzA+1dKcMN6m9mOJVa936MHkg==;
	24:8dHsEIGPdZyHkpyXv0nhNogUAG1SXpK8qdrlFc1vgMh4VBe0r4OYPTPpSCHsKVeOljxT8cC2bdkBUKnw/BRCyQJghCzglPANIZ62rmQV++M=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2016 07:39:34.3772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB0567
Subject: [meta-qt5][PATCH] qt5: add one more subfolder for ${PN}-qmldesigner
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
X-List-Received-Date: Thu, 21 Apr 2016 07:54:15 -0000
Content-Type: text/plain

QtQuickControls2 has deeper folder structure, make sure that files
go to correct packages.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 recipes-qt/qt5/qt5.inc                 | 1 +
 recipes-qt/qt5/qtquickcontrols2_git.bb | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 85d7d89..d3dc5f1 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -92,6 +92,7 @@ FILES_${PN}-plugins-dbg = " \
 FILES_${PN}-qmldesigner += " \
     ${OE_QMAKE_PATH_QML}/*/designer \
     ${OE_QMAKE_PATH_QML}/*/*/designer \
+    ${OE_QMAKE_PATH_QML}/*/*/*/designer \
 "
 
 # qmlplugins 1-4 levels of subdirs qmldir + *{.so,*.qmltypes,*.qml,*js}
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 41c781e..269ffac 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,6 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-FILES_${PN}-qmlplugins += "${libdir}/qt5/qml/Qt"
-
 SRCREV = "7fc567eda8a187e365f4c29c6e8f08440bf31218"
-- 
1.9.1


