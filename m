Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0100.outbound.protection.outlook.com [157.55.234.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6176FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 16:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=h5FlVkE24ImQrlokDyBnmA+EJxxwevxBWnxAcJLAg/Y=;
	b=ey4MUgq3C3VhHR9Do+vXxfo4/bnu+qxXhRBXRItkektEm1GONJXJCXDf5N5/7+O3ZPILz3EZxZWg1kkyTyaH8ddIzrPeeS/xVgPjvj+YX736aa9Sp+23+RMm/N5c8sdSOM8bPDkmxfIScq2skddALWeC3kWUn3MtMmmXaXfHG0M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from change-01.am.freescale.net (192.88.168.50) by
	VI1PR04MB1581.eurprd04.prod.outlook.com (10.164.84.139) with Microsoft
	SMTP Server (TLS) id 15.1.497.12; Wed, 18 May 2016 16:03:15 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 May 2016 11:01:25 -0500
Message-ID: <1463587285-24214-1-git-send-email-neenareddy.busireddy@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.50]
X-ClientProxiedBy: BY1PR14CA0026.namprd14.prod.outlook.com (10.161.91.36) To
	VI1PR04MB1581.eurprd04.prod.outlook.com (10.164.84.139)
X-MS-Office365-Filtering-Correlation-Id: 758f8ac8-e955-4d69-c519-08d37f35ec55
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1581;
	2:Imo9xnXxv/j9G9QnXOnuOvHMytNWAaIUnaysu/4Wge3mdsZhxy/sAlbK68KdsWIEDYGyO6YXc3u9GSr/0ql+KrFdBqFlcy11C8scVDWytnMqcTMMfRaj1Pj/gRXNrikAyNW2nyNesbWVn1JCPb0MvFqm+Kx/RJw3H4FFRgNmtpoxyY6nVx56thnZFRR8cDYF;
	3:WbY+uDzH2E6MCkIeLikdHesn7BRF22BaimYVcycb2s7Jrm9p0O+5MIJPIVGkRnZ0oE66Bf2xHUemHvHCd8sQOWA+QWlfosYEKugksKLIeJ2iIv7g3zN1pfxgltM/P0ul
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB1581;
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1581;
	25:ceF79SBIUedghhSlI+Hka6/K8ES1AOqN60mo2a1By/O7uSOtGdashHMxVQGCd2t2lpp5TfO5D15k4Zs/ADHDfstd7n5eFlq2FPsLTtzb7AbJryEPGiPAuUd+HDmZaYhghzu6vSQOFTqDPkbXjlZaO4iKQpzCuKgejy2iE1DEeL+cPzVWDBsS75K0ypgUKJ2nPKr99H46ZmD/PkGqNrhZSpaQkKcxN/r55JaP2EEnHUYZ31kG2al43PdhMKwPH/YGNJQguS8IiMO18vARY3pH4tvFprriUEJmUULKl13yQ1R46u8gd/Mdd5mIfZyqjLC7n8mTlURz4qTwSguw+RPIIrcjBkSKDKtyJZ4FNRk202ngv8aTuQsPHiCNkTbddcwM2TrdqQ6cF/0HRvFla07+eEsPcLFCCeiWLQV/pj8PFEx9KBtw3o58MedWhxJdFsB87wpLEbdknvr8/4UNC5Fd78JutTSscuFR+jc1UjYf6qdhW2m9UrfQ0NyEDLie/8hP2aPIAMIADkjc0aFff4dTHJsQSFMRPNSZDsAGuq6+kmuyTaKc3buUs5HdxWoiiJMdEUKlRo8Lwno8uH7IwfuOdDla4LWRbiwd2cXCRT9pgg8TkSvPraY6v4umhkhf8t2J4oQZ+HgSNgzVt49sdA6sk6mxQycPbedNMt774MoLGvI4RWnS6iVUU81B2K2ICySVi/kLXAafqgABj9ij7ROTvfQfvFG6+lIEe4TvMTdZa1awZrDfb9koRkRC9eTmGIlMNd6LbaKwiO2NWJsiHUwQ48hfheAKmRgCIHDIpk+aRno=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1581;
	20:x1C1JwC1TgkCWmIw9JvHxXcuso4JuFOsajsoy0YCRDm7qeZCLoN25T8yWiLnbYnrVuppl3BC+8dshpo5Sl2jxWOEM7aYsclfyYyIVYgpaqz6GAAsTjcZ4iDyZWSHzB1bdx0mAZMpCaA/Iz1fQMT5g5tVZ0mDakUGBlcEWM2zbLd5N3ZhEx+A8n8TuttGiTKxIErvCd2SD5oQSdFaVDn00ECJ2qaR1UzmiOVfwPhoU6MnZwlNgAlH4YptfalbllhKcim8rrYwSdphYgTC3BUjrRhGexuSSAmM4XbgNAtp6tEICy5PGGzyUEZXFrOGn8rrBZniQaFtBY6eRGxINVZUsuYmuf5sA9V128hm2kw2YeV4PIZkhpJAm5aU7uYresama6XLhikx2f0LIZ4G5tHoNr3fwLbTW7EmpJ2zn6+ccpCU6TuUG26vtghUvcgtPoZGWN7GA613i6O/EEWfU0lIoIsWlm+PZgnyuun+oyHrd5fpy8zrLKusLGnQjzwcKMxN;
	4:Xb8flbkzZPZZv++GX7i8OLi8ASF5u12l+TnKuOcidd5Pkti/4HM2PEeDPK6A0sM2G6/QVdNho0QXRn1hODDRoTP5ByhTYxom0PAfS7sS+Y76Q4ULCmQ0KevedA55PPmLJbthruQnLbEPJrNlPVKP3jENqFOnPiK/GF9P+bSC7rkh6naqrwLMUP2MyTOTJ4DkNggWYXbpn17JE3TmdYvMJH/zOvUUlmpJTqiK/bsqtf9HNI0AHmY3MhbwvTBhE9r+ES4ZMsJLpnTzN1JVJU/8ntoTxa14LH3vk4YxgOuyU2zAmlpi53EJjxybnhIOXuKmzOiF/wmNz8/iFwHRcWGVFacimTCLYQkqhb2O7xbLYv2aCYxQPs/iiu4rjaXEEcn5
X-Microsoft-Antispam-PRVS: <VI1PR04MB1581031409A6F6C56FC1DAEA91490@VI1PR04MB1581.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:VI1PR04MB1581; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB1581; 
X-Forefront-PRVS: 0946DC87A1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(586003)(92566002)(50986999)(47776003)(50466002)(6116002)(81166006)(48376002)(50226002)(5004730100002)(8676002)(2351001)(229853001)(66066001)(33646002)(36756003)(19580395003)(2906002)(15395725005)(450100001)(5008740100001)(4326007)(42186005)(110136002)(19580405001)(189998001)(15975445007)(86362001)(8558605004)(77096005)(19623455009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB1581;
	H:change-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1581;
	23:gCMFTkjFFZH1FI0Dvzf9RCLCRi6aXrBqP0lFjefE+oob01Hmh+jNzm5377ZICawSsHCoPsD80bNkgFr/JRssBgLh9Y1UXnNWiS8Ga2dcYJWQt8ftkCLzUWFZmjylgq8j7ysfFQ8NrGELeYk2+pk13Zl8xN8lCXtIxzaMfc7TMUzsKRfO8Xc/r5Atb8RiX8oh+1ypxuWuxD2ONta/m7F0lnF8Zyh6G1X+hPvVfE6ocG/PbAVJtrmfTgitehnhrLW9PrC1UF/ZRBIN2v1myxKuxGwhrS3R0UBumLxFZYYl+Jz2eTDWkUDyy356FUQS2ECSeFQwrFdecf4lGz+tQSzfcMWOVeOvQv4Y4AfwnrU73pW7oFnpiQ2tgArHKVUpg1CppiQz+3TSFBeSlA6O1wH1xcUqjoubr+UZUonZ0eH1g5Nu5/rh6l+xeqH9L19Au6njJjgrvcu+q9a4kcZsxIyC1F9pgj+nakkjcDKQiTfIMeZqyEQTUrdQJjAAHRccr+WFT+kpw3ykHlaDMJX7XHyF5VxSesWg8iTHiyfESxnNdYpVEg2YxC5kc4YNzNGuiKtSfgEby6iKZNToyuminzuS+GWRZ8XtAiuQdUywjWrq+c3Ck34hp9oT+pwyeiuIrLWgCFALFLXLDGO9Smlh3Y79ERQTAf6g3COkWQiGYTb4BHOqysdIYL0MNJ819TsYv3yD6RkgRGzPpnjYa0oI2qF25OCKCndoMdENj/Ckx8w5/Orykrf05+6GCI7JGMpzDmcXGSklGXn8EchAgnmDGd1bLO8qJ9Uw/h4lOZOZdmFIN0bHbsPN4maYqCe6TQ/MAZSo/Lucr4pXahhWw7jJ7sZPqPKFTIzBgAUKg3ZanVB0JcFg61fG4y6p6vXyWvmUBiXXMBgBEhzDuJszu7Cw6D4M7wzZBaT76jFneLU5PRa1FH4=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1581;
	5:bZ8jQbPYYW99F7RaGmBOhdyBAWC1rekVPap2dYzCiD/ubQZtsNrA5crcUatyoTZpiGc0XB8PrhSDs9fdXtxP4P5iY0ZOUJd0ofSHzUDj4U0RXbyrzBdPJXfQ4ToD8XTeRK1xOuZfkf39UE9C2GOl0Q==;
	24:uKEKWWeXQe+h2YucQlXxzebWKI/qAEnGBPzu+qNORlC1IuJwkI9OE9NQXc6WhJrlG3LwXTk5WZTTFvuFATR9bzFkxbrXCqQOlfNCWfMw0j8=;
	7:zXSeZHhGxIDyvR1rzhvXQKeFdSXP3UiMCqHEaF+NnokuTLYvn481meMGwhpi5SWZeE/btQuaY7fU7HRQhJyNOtiyEehSjbEoqLDnUA3DaHtRpmMGoZMCf6B5FNs4wUKinCxwkJX7Br604otey0HlV3SqNax20tdtysw1/bxYYve2922pnB5jhWpx62mai1/c
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2016 16:03:15.6128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB1581
Subject: [meta-oe][PATCH v3] assimp: Add recipe for Open Asset Import Library
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
X-List-Received-Date: Wed, 18 May 2016 16:19:07 -0000
Content-Type: text/plain

Open Asset Import Library (short name: Assimp) is a portable Open Source
library to import various well-known 3D model formats in a uniform manner.

Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
---
 meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb

diff --git a/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb b/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
new file mode 100644
index 0000000..5ffa5c2
--- /dev/null
+++ b/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Open Asset Import Library is a portable Open Source library to import \
+               various well-known 3D model formats in a uniform manner."
+HOMEPAGE = "http://www.assimp.org/"
+SECTION = "devel"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bc4231a2268da8fc55525ad119638a87"
+
+DEPENDS = "boost"
+
+SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}-3.1/${BPN}-${PV}_no_test_models.zip"
+SRC_URI[md5sum] = "ccd4788204509da58a3a53c7aeda7a8b"
+SRC_URI[sha256sum] = "da9827876f10a8b447270368753392cfd502e70a2e9d1361554e5dfcb1fede9e"
+
+inherit cmake
+
+FILES_${PN}-dev += "${libdir}/cmake"
-- 
1.9.1


