Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0085.outbound.protection.outlook.com [157.56.112.85])
	by mail.openembedded.org (Postfix) with ESMTP id 21AFB6FFED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2016 19:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=T1aMvlyF3le01eEWPyxPrRwz5VAlvGecGP7aupLfS9E=;
	b=NVqaxL0ac6ZQLe0hNMXbXI5vv0IVLnflxaYQeKHczhWVRFRIk+YpwwQPDJWHGAjasxI9JNPWkWkLij+XfmXqGIeAaYpiQVnP516XKVh4D+t3r1BirvQwdFtEq/sYtdkxgSAW0qJTYNX70e2sy4DBAjKGlgn1Z6y7E0Uq4UknK3U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from change-01.am.freescale.net (192.88.168.50) by
	HE1PR04MB1577.eurprd04.prod.outlook.com (10.164.48.139) with Microsoft
	SMTP Server (TLS) id 15.1.492.11; Thu, 12 May 2016 19:27:49 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 May 2016 14:25:58 -0500
Message-ID: <1463081158-10495-2-git-send-email-neenareddy.busireddy@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463081158-10495-1-git-send-email-neenareddy.busireddy@nxp.com>
References: <1463081158-10495-1-git-send-email-neenareddy.busireddy@nxp.com>
MIME-Version: 1.0
X-Originating-IP: [192.88.168.50]
X-ClientProxiedBy: BY2PR21CA0026.namprd21.prod.outlook.com (10.162.74.164) To
	HE1PR04MB1577.eurprd04.prod.outlook.com (10.164.48.139)
X-MS-Office365-Filtering-Correlation-Id: db4ef543-384e-46c8-a144-08d37a9b81f0
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1577;
	2:OLNH1VMXHu/4uY3VwPp/HyIbJSKgfznr9y4NqicM11I62B4zSiQ5s3TSB1IxHq5z36+S7Jg6x62FuaAF9xP9tDJV/KNPP8ldmtMtIcJRkEDss/QJJoh7sMwrtzh4kXROD+u+6g1hLLOky1pCfeOnavIOmuXrLuQJ5tHSrqW+6w201YOnxa+Jgk0HiS2b/b0E;
	3:dVh07DV/hP1lVsSoJp7w56Fz5/Rwo+i+g3r+OLhMnpLcQCRqV9epjDXY/cBWzsAwcf3+pPmoYu/ZYF9GreEE3B4IeWmfxOqmMok3+Ii9wr5RPFoYJBge97kGnOXI3sSp
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR04MB1577;
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1577;
	25:1XOr361L4swrIBoLDbFyhiOx7BoI5Wc6KY4/5L5zGl4GMvAXDcoSxgJw+KecFJB4hhvb+BfvfDiAbEKwhOHE7A31GDTYHQoNyyarF1TE+r9RkDxB68fB3t7owpsX16P4fnTFhQOJ+dMHDXSSw67Ilk2ClyXA5edX2KrYQOzH1CMf/ZS7oMbQzFVzoZeeUva/TELDsDC3vlx/BHEtBIXhv83/n6SC+0nT0Oz4tCMstMPk61frGCWCxbcqMGKzG5DKi3BZ4pQtZlPU7xEYca2vlsJ4TUzJNUe2VeD4OAGqZTI6KTX0U0GiioymcfN8MmHdWXvE0taQ3VzM9O2MgJNRefqE3l846mDj/P5dkU/ffHHaFGBq00cj8o/DQ0FJy+Y87f1t8yODswU4TZeeYVlkXlxPY5+PQxVUmZZ/EjLOSAu0wIXIVg3hKrDcF2adHYbJqHJT/Ol5ezQA0WuXuFmHwZXSIY3nDeYIKftuyTcnGTU36TIqlIXCeGV8xhKp+FxyC4GqDXsf/pw8DeM7IdoWi1DN9dowNpIZ/mgQhMr3oBuJLKGinZsrk/Q6a1WiisxExzYg16FvXJjGGXG9dlvPJ10RDQ00iShO+REJrGHfGWc8Ylo31GxxmKsYQ+kOHvF9eAqWH6ELLjcPFoB4pfFPdfYTySm/EaFL8AKAAh7SdUup/d17DgDkGJgXRxCRwnJc83fW3kpbIlnnniHWXR6+DkHr8A9wttbS3nkKH6eaS4rD25VFyq/oDcwc9IhUCc7CCsswHQgVgf0B+B8rOmHAr2UH69AtBgj+MC98PVYz8uqghodF8MoP0vsxqEC1rBnvFgNVFnR7aJDt7pdqeZZs/Q==
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1577;
	20:I14sWa1RHqrdgWsAJGtPzOiVa8WR8JqTUNevTh6OZ0BYww4P8ZhNPGuo8D5iCc4i+zu8rH7rjbBEDtmMb6VeuSBx8+ce907F/zupFt/KpWpcss1MxJxXpmTi0kV79lcRHbGkMeZNZF8Y5PgLBP0VAsQHfF1BM/Adb6LUiHtqUiD2dgJYwp+e8AGG9lAk68MVLIDatVijuvtrikgVLY/m6z+zuOghh3FYzJP9xZbqVDDddPEePTh1yHjYpvjJ7BHu/qj8Iu2djSnH+XdS8VWQ/gQ4zrkDSrPbLTXubQ12Uj0L/j4FWJxMjPOc/Eg2CWMAzc/JIUSp7DFeL6VeDjm3Z6h7kKF4OqJaPLa1q01+BeyYCEkqbCH8a1mNKDRnzdgV0atPhIcsGf1a94vdxgKtG4pbd0yDQxxrDikRQIFUDFY9I5hFs5zfEAt6XptuYYJ5KFMmjJ0Qcd/zl/OxY3z+1yJDZrEiKmd4YetKCjpC+/MhQLbbZeApSUoYvQHxlGGx;
	4:Ku4D2KqgnP2xBC4NUg/sPp0L4MiUSmd174RXB5G4d6dtO54o+e6bjTEb+EY3YJ5ROWH+8NpVSM9Qgmdv+uhyZwmKSEOG0HTvZI2X82PVydiuRpNBO09ygo4ztMokw+1TaqMNVYNhd/hqw75QRNAztxnz5+mvwHtgQPF8mfpxs8aU2OXDyXkME96tfsR3lAQSqJkiv24n81Fjkw0cagnm2wK+tLaMle9yshZ0s+GOcYdCL9li4EdutcsM2fL1h4PyEdjOSoZzcFxhTEzEKTzK2fl1YAAc/NC7rKI2OAlpeRKwdlvl89cjba2mVOJ2g3CcFcExzPT6jwgQN+Kov/q4tuL22NvWLDQHfKejGA9vMa+J3RJxxMk8i3+s/9eNXW0q8QF+glDSM4l9a2dH+Oh/dA==
X-Microsoft-Antispam-PRVS: <HE1PR04MB1577F098ED92589CAED183F991730@HE1PR04MB1577.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:HE1PR04MB1577; BCL:0; PCL:0; RULEID:; SRVR:HE1PR04MB1577; 
X-Forefront-PRVS: 0940A19703
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(50986999)(76176999)(4326007)(189998001)(36756003)(110136002)(5003940100001)(5004730100002)(2950100001)(42186005)(66066001)(47776003)(229853001)(33646002)(2351001)(92566002)(86362001)(81166006)(2906002)(5008740100001)(50466002)(19580405001)(575784001)(19580395003)(15975445007)(48376002)(6116002)(77096005)(50226002)(3846002)(586003)(450100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR04MB1577;
	H:change-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1577;
	23:a4i0c0V1hvMpxK3wK2/y+6NAS32tZFNh8oP+o3Q6O91ri2mvZDxDnvranxISPMpiS/sqffpB1/Iuc0du/5Rygs0e+3EvynR+gvWNTkBrsy8R2Ra4pKKPSwFsoO8DtL+a0TvoDbmUUfpFYXuVPQDJ/cfes8wUhd91VdL2KG+JpHzEFagOhkBMKsIhq0H0IiaAY/e1dDwGfP4tzwsLNG95QzhYVrUTGz1wbth9CvnuNdwYvqXKgpP7marmGTBgsmZAb3YTqvntNrgIbR525PGfHGa5oCtTjQw/ESaiQrQ3GaHQB3gTZJkVmmpFiba7Q4I2f/tUqyDADvonsJh3Rm7kCDfYkPtjXMltDdpMHbDx6d8dzTaX2Bxq0pDmA8YxF0yhrmh18Q5bsCZMUNFWDORbl1QQLzXHhs7Wk0rHqWaPLOtUdKgWo3/C/PHyKCeTe3CUGzpcTEw8EmKuF8JDuY3w0BJH9qZKrrw9poJGapxZ3Gq5Xw39lopNbboR/4SzLdsZTD/6ty3YiAPvu/xPsmkgn1mKi3xwC0uuIxtPXO82OP2DByVH7Rm7vO1oF5NqYQxO37ucaYK8GCC4lhgU1topa7ZRqR6pqwRuZkQsqBv1HIPo/nmPrs6VILr1aic38r5sz3iJZQjDaYBYXWbwmZ0Om0MSQ15DRDY3stSim7Uo2h8w3+NqJ97H9wwQGgEOHtSzvBg8hxltsS1QheRfcKZlYCksv34/qubWTTEGYbW1ZYFZRl36RfLWnPyhgttxYJSDsUdEsn5G82ejfIcTzGH+MAPrlJ5Mc3D3tdFQr5Ew+R1B8Pf1atL1RVW41Glb9avqDzk4rGKf5cxEPbRqxdStB3Uli02E4C3eIwHihBvAnghzfRu2OU0QlMYTpLtLh9SGnFbS5zy+ozwakpT1vGOGEtnbLgVI09NxtVST6mHjAvBV0zhXzd3fsED5ppR9hLNK
X-Microsoft-Exchange-Diagnostics: 1; HE1PR04MB1577;
	5:K+6CU0qmNbaebYjdue/rA6J7hbBJP7VzUio5Ol0xp64K/19KXNMYb5uVEnuTItj2nnsWPmEfnddD4I6zd4hRYKchnydDSsGP1DxBlxMkhLHTi09YED5+u6FrMM/4IVBWm69T1OFxx2Lgc7a5KlZgKw==;
	24:NxlHiwAqEEjCt8S161Un6pLKrqQy/VJSeTbfV32n+5pbshKXjDfAFDiflzP3X6MlCSAqWEIvC77mhn/HR2RM196VdjGanBiDDoliHAfjBKg=;
	7:hp8h3ZCPF1YUpOXgetmKpgCcFN/VRwOBmy/UxmxFlnKDhYHQV3ehk+o1xyXyRFLaA7ugy7Wdz5z4kpeicpG3VpUUgC+btyItNRYanLGrtXylDGiVr/Lxi8f6t3gByXg5VDOZY3BfEcNJo1+D25zYVJQOwuGfz/Wtf6ajNJnzCNBqFNEBCQVcTjkUpAJ8VPXE
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2016 19:27:49.9015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB1577
Subject: [meta-oe][PATCH v2 2/2] freeglut: Add a recipe freeglut to replace mesa-glut
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
X-List-Received-Date: Thu, 12 May 2016 19:27:51 -0000
Content-Type: text/plain

FreeGLUT is a free-software/open-source alternative to the OpenGL
Utility Toolkit (GLUT) library.
More information about this library can be found in
http://freeglut.sourceforge.net/

Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
new file mode 100644
index 0000000..a98b289
--- /dev/null
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "FreeGLUT is a free-software/open-source alternative to the OpenGL \
+               Utility Toolkit (GLUT) library"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=89c0b58a3e01ce3d8254c9f59e78adfb"
+
+SRC_URI = "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "90c3ca4dd9d51cf32276bc5344ec9754"
+SRC_URI[sha256sum] = "2a43be8515b01ea82bcfa17d29ae0d40bd128342f0930cd1f375f1ff999f76a2"
+
+inherit cmake
+
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+PROVIDES += "mesa-glut"
+
+DEPENDS = "virtual/libx11 libxmu libxi virtual/libgl libglu libxrandr"
-- 
1.9.1


