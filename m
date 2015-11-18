Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0143.outbound.protection.outlook.com [157.56.112.143])
	by mail.openembedded.org (Postfix) with ESMTP id B1D6362132
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 11:52:26 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1173.eurprd02.prod.outlook.com (10.162.163.19) with Microsoft
	SMTP Server (TLS) id 15.1.325.17; Wed, 18 Nov 2015 11:52:24 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Nov 2015 13:52:12 +0200
Message-ID: <1447847532-30741-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: HE1PR02CA0054.eurprd02.prod.outlook.com (25.163.170.22) To
	DB5PR02MB1173.eurprd02.prod.outlook.com (25.162.163.19)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1173;
	2:0BC/ULXymv2FDO42h9mr1K79wMWfSf48zJ4LkJoU9J3+ACFsYs6wGQeajZcr4ZJbJrJG6JmeibDIf7L/e7nfWsdH/dm/qP6+ia0yomRbiCAA52u+Qfaf1/6bwfDbzj+Fp1jaJgn5UZc6PN+X9i6MePtrjkYMVXNDRbS2v68fslw=;
	3:K9aconT0rL7J/gAksdaKLutXSJv0VonpT3cBMaalfWG0TkNjASjoAOMnVgII2ZnFKISfOQn2+i4uqeXk1goIWWfqo5EccobfDzHD1ooCs3t5wNuF1RnzGJLGfCoj6QKuLU73n0jEGjpGNRinQw7kmA==;
	25:trmKjEyZVCPNmlJDmwl0VJRkWc3i3W2ldT0RSuwlMI8TYrWtJWRBlJBh1P5xmwbcgIdGIuFqTZk9o+2T2SVO7SIQorq3ewElnfCYmnKg88PPp1YC5w4aPIwWieXl7M6BqwfmS7c6i+9xxoPBUUoONoq/rZcwgUTcice3OeKAwEac5MQA6xIks2Vd44/EXsrLQgF5q1oUeD597lpEFbp4N9ar9Pqq8XhJRkBUFZLeemXhbuWAtv0tsdAGDTGZYxiYq4Wm5OaoZ8x6h+fTWrTM+g==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1173;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1173;
	20:KPSgLppmMP1aZfELJNlAUZFyGrStXcJ3zK94jQ+KwTIXQ0ws1u9q4CM/LfxBr3Wilu0fI5oePWwijmdOHdRfJgsnQNVsk+Q19PMilGU4IXynU4Yz4edCjgDsVBpRXOuWms0IHLXssWnUITo8F7jbpUk81g9od1bdw5mjJgPmpd0hAX/hRDT+fVtiLi/9n3/pVIDKoAhSFVo3jX3rp55j2ZNtvnSBxG9QTzqaLI4Vbtdi//dXfMatJVq52/vvEmyAYJb1dY8/5W8Ee6H48Ibg62YdOtITceov35DlzlXaIebiSMFnOjh0taiQqBkBhvZ5pZ+SVMRB1Jr2gaLDQa/16za6XGTogF+3U5n8eq+ZW9h+05V0d4MaOAecHQZwlOS2KjqsldiqOXNOERQ10G1AK4teMika2Uu3o+fyOnrUqYFPt7rPv+idulDnh9Tb/BDVsavRX78tKU+8gDZL9rxh1Vk61YailVc0AqyUOxuL5boG9rD8rjTaHWDr2VW0I9/q;
	4:j+mplDDNgaN0dfnYXz6EB/Z1uoRvfXLWBiYHYP0xSfv5BOWnlkCs3xusjE2b+YIblN2Z2UCpowVRaXlHq0MEUiS+iXTUfFveUud6shu8ksmlvb1dCUIkD6hP7qQuU2J+YlEKMPeDaSgHLawfTO/DkM/WPIPD9YJkG4IYWr1OVAFFtLu08Sq/PZuKiMHMBSxXsMbtygKmi42go2P9f5l1SgoNrNxjBT4llczvX01DANysrdLyYZ0sGqnC+b5jfSSQlIwfhMne/H/0y7CM7vkkZXrjkaHkXXXDKIZthZmp1Dhn5KO6XilhqjnH4M+tfeHLkD9PpL/Tp7OGjge0adbN9NvwpsxN8CrsyYK4DPuc2wQrBbe9lAOAj3oLtnM7Eumm
X-Microsoft-Antispam-PRVS: <DB5PR02MB1173C1E3B338500CEF0B04A9901C0@DB5PR02MB1173.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226695750432114);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(3002001)(10201501046);
	SRVR:DB5PR02MB1173; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1173; 
X-Forefront-PRVS: 0764C4A8CD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(86362001)(48376002)(66066001)(47776003)(586003)(36756003)(87976001)(97736004)(81156007)(40100003)(5003940100001)(110136002)(77096005)(189998001)(4001430100002)(450100001)(19580395003)(5004730100002)(5001960100002)(19580405001)(42186005)(50986999)(122386002)(105586002)(106356001)(33646002)(5007970100001)(107886002)(2351001)(101416001)(50226001)(50466002)(5008740100001)(229853001)(92566002)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1173; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1173;
	23:WHtGadpN2x3q7dAu9Q/aF7KKJ7r2SjMcXNOqXHyIz?=
	=?us-ascii?Q?lqi6o1z+04wXgTAXrvPJUyOW8ly0bxHvYMM2IsIUiLcaWxB39hqGauLCMlP8?=
	=?us-ascii?Q?Ax6dyslDZ8lHUtq6loNyiymN/XVAClYOlmljcBmT5ZGVMi7RsRil8TSUrvOT?=
	=?us-ascii?Q?LpiKZivcrF2R+tickJze1JJmtWkW6pI2RqdusFggQswPy9T4R/d2vtn79EoS?=
	=?us-ascii?Q?W9b1G4KBZUWPhRSUuhPw3TZxb6iwLTha2ZIWpHa1XUsiLPhgLezOSoaUsbrD?=
	=?us-ascii?Q?L0BxMETjXOkcwaUD5gCuPe1Ia8/biQ/le8OTIVr8L3v8nFd7Ki97aulKMXT5?=
	=?us-ascii?Q?yaxygkMHq+mtoRJf6+GqKSG6BEFc/Z6x1m3HKqJq9HTgYzDGmZmZV8gMwC1S?=
	=?us-ascii?Q?1tMu89raeDaX97NzfBGloXmcmZW6+x/ps2u3XYzSyzExdI95PHQiQRL/PYQO?=
	=?us-ascii?Q?US5aYsCMOgQdqSCjUkQ6FkeCAjc2v+D628hpk0absSa1BGI6WGB052xvyB9M?=
	=?us-ascii?Q?Vpu+0vi9oVz5DoZ3ZlfhkqBx6U6p13ZCGGjdg8/XqQEFebTFmH+S59QaAAk7?=
	=?us-ascii?Q?vQKZfwEbJGuu5Vm9mRhHOgBaZKXjw6gzuyEbgoDEDFpZY1JkeJnO2IrRjvwO?=
	=?us-ascii?Q?VGftmqdnZVYpxAyJ0/RbG1fLictRN3vah/BWhG+MJorYxhWXk6YR2CubeAiL?=
	=?us-ascii?Q?4wQeNOUeyo3olPgvsfNqMedFIZKqxGjBV4YpKJFq9hZ210b09Rn4R6CJlmlf?=
	=?us-ascii?Q?s2gQQRtZGYEETn3qajxzndEwx00eSu28AjIGzIV3HhWXYb+sBSi1yoOp3QGC?=
	=?us-ascii?Q?7DFI+pEUesmdL6Nc1okKDLJam5NKgPznNoYVk+m4b80svXCoYo5AL8GAxRVf?=
	=?us-ascii?Q?52xCig6gCgHPV9lGmhj2lP7TBI6pLM+8VO3H8ZUTU3mNJVOJsQ/50Pu7RG9V?=
	=?us-ascii?Q?Ct6ji6F0fVWZ62Ng0d1ywx1WAj3DpL3fQg9Izp0kZQz++F4wiUfIPCMPqSwo?=
	=?us-ascii?Q?TSKKkTCb2EprY9iiibzP6RMfnkcntQNjAjF5FqN1v1WlpuzzgQmN23119dOf?=
	=?us-ascii?Q?6Xu2f9sPKox28T3bTm61j1FkdCx?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1173;
	5:jHG5jIoaHvhGT/FkHn+IQEBe7rfujZsDfAUoKqvbGTCTO21G5nJeD7xGa18MDzW7cJRDJW2REFPVNcv5u/jVb3B8oXVyhcOYpHDU2GU/IbvIVICcPwIJoAJGBABQ3hFjUrw4Yd1g+HScNENk+Hytog==;
	24:pteDmSksPlpVCZqpUR4D4Msi5SI1S9NlV2wtNST9UvTpqjXxu++Z6Ca+mod+T+uL3Q2niSLDvwga3+uoVFy2V5IJDieOFJcCCJYY0kwQqho=;
	20:a7OTtHCNAjNKhKjsfUxrgd3y/xUUcw/EJT6KhisaViPd+lcCh9RH8dG1cESFe6co64rib713Q2nAo9K5C8UAaQ==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2015 11:52:24.7226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1173
Subject: [meta-qt5][PATCH] qtbase: add PACKAGECONFIG for xkbcommon-evdev
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
X-List-Received-Date: Wed, 18 Nov 2015 11:52:27 -0000
Content-Type: text/plain

Add PACKAGECONFIG for xkbcommon-evdev to fix QA Issue:
qtbase rdepends on libxkbcommon, but it isn't a build dependency? [build-deps]

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtbase_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index fdc73e1..e504ab7 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -107,6 +107,7 @@ PACKAGECONFIG[xvideo] = "-xvideo,-no-xvideo"
 PACKAGECONFIG[openvg] = "-openvg,-no-openvg"
 PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
 PACKAGECONFIG[xkb] = "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
+PACKAGECONFIG[xkbcommon-evdev] = "-xkbcommon-evdev,-no-xkbcommon-evdev,libxkbcommon"
 PACKAGECONFIG[evdev] = "-evdev,-no-evdev"
 PACKAGECONFIG[mtdev] = "-mtdev,-no-mtdev,mtdev"
 # depends on glib
-- 
1.9.1


