Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0073.outbound.protection.outlook.com [157.55.234.73])
	by mail.openembedded.org (Postfix) with ESMTP id BDAD76E666
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 19:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tWfC+zGxhCC/IJwXfJ39qF+2KbqT4evwpcjpQVzOBbA=;
	b=lvOlMJ2ahuHYaO50H5mGMjSwOMSNdNfiVLZubuuxhBmMoAUQFdhbQhBb8CEkZwpmjnq8Z5AJBZvrt2Y8wnsINDlpyUBDe8nBZwrjBeATudbZAjkDsNvUlgV9zzTw6knASCkhEihi5MtkdY5N9EEsBYey7qbnYWjR43qHdJpuETI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from change-01.am.freescale.net (192.88.168.50) by
	VI1PR04MB1582.eurprd04.prod.outlook.com (10.164.84.140) with Microsoft
	SMTP Server (TLS) id 15.1.492.11; Wed, 11 May 2016 19:43:51 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 May 2016 14:41:49 -0500
Message-ID: <1462995709-6171-2-git-send-email-neenareddy.busireddy@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462995709-6171-1-git-send-email-neenareddy.busireddy@nxp.com>
References: <1462995709-6171-1-git-send-email-neenareddy.busireddy@nxp.com>
MIME-Version: 1.0
X-Originating-IP: [192.88.168.50]
X-ClientProxiedBy: BLUPR0401CA0024.namprd04.prod.outlook.com (10.162.114.162)
	To VI1PR04MB1582.eurprd04.prod.outlook.com (10.164.84.140)
X-MS-Office365-Filtering-Correlation-Id: b8c7491e-249c-4a95-92e3-08d379d49434
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1582;
	2:dFRBnIzvm25TvH6+HDiHX35V1gkm5WMR4T0lBYigMa1gr9E9BSyG4ZWRDUGUPi3Qj+fCb2RIvt8Ges5uXWph1/Wwwyr2dSEpnwSg1VAKUr5rzbOtXPMYkIpYdu05mnTqEW5mnSvHdU1qrakUKV074qtDfUIeF/gm4UTqWLqU0krjW6OANsTLjAs/6R718z6U;
	3:Hhfoa2hXGxlvvJNBUmTf1ETIDnyHMrg8wRg2ngxuzynSnCPYPSShPIj++kZ6uQKqD023WCkdSv1XNJm1QiW3kJW00mQoxo0iO76izOFOTUtpTmV4cYQCvuAaiNCSgu7t;
	25:2IWKBguPmF5fLER4FYMHoNqwk5SRJyA5tS/d+dN0joQwbeqRi+e6RvD4cMIVYbdd2t0ss985kxr69RTbiEjtwHkmrvmfyDu0tevWDdEjr5u8MMp5lpLa/KtdSHQCG1MYGpn0k2mr17UJBY03mZZUiqmt7ShSZ13ErWO8TQyEhKPsBoCLqVqXzG/U//cUpMptYM1HtdErVA8ZSrWap/5OcDMXfzyJsiAXbbJ4yzLKXf3Dq7433LsWXj6Mllr01qEDUjN8Pgzbtwc8dMEWklnt2wleko1i+19xxnP2Yv0Br01GOqOPMvwLb90SFApWBsuibzPixs5q81jCJzH86H5OGd0E1x1C6DE4stNrbY5ElEigrcy1GPWqrz/vxF6WOSoO9cOl83nwam5Uawj5XxgQFbHDRyrvQ7QlRtrQs+6sa60=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB1582;
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1582;
	20:IUUiYIe71rVNlsfelN1T5Eqxs4S7G9y/pWBcftos5trtnnyvyMSDnus9ZWehBB5Dhd615F72lpVFBWx13uRchz0msGgqTXH7cXKPqnusdRXn4RmKIvLYOcrqF00iwjlx2nLspz5anng9wYm0iI4sDtYL+F8mMk7qN9xjZqu1e6rmvjyprtBSq6CMtts400XdfYgFTWiBtlGFQNW7LbzuzS3aPakUA0LiEhe1tCcALPn/FiCGLgOifCyQJIH62yxzsRzmFiOVs9ts+z2Z6i6U/N8Qh3VHgWwjIjnSmvCTGFauegAItOuFKGQh2XBssDEng1A+Z9kJ3rGp6uq9nx5LqppcQxXWjm7XAhldCPwsSFKQZdMNdsUmQ8KK+0cnYK3Q0/As/7XRe8om4hVVCjY85cXIarXoA1+Sqb9Wg5fqgQiUvU3dca1QdBWyldkS3Oc3Sb5bXIuRVqBcGPNsJzlF800VOc2u2O6Asaz8zZDMWxHiZ7QJ23wNuRWxb3XM2znz;
	4:zxmpciORCH10OMG3AOwng9WwHIGkhQf0iLZNrguZG5j/jcilI1n4ayGFe+6L5Cktp5acYe2c5yhEZ/Tv9ppMy6+0pPubEYf2L6A1Suj5/AOPGsiX/1xT44nXFYKLj2z8tPhv8l4JuY803mr9nzkdI43nJR2dJqoun6Q2O6vW/spfQO3lsbtIuLWVDBTd/Co/HLrpYHdOWTZgnXq8ODjh0nkkBmblUbQoMsF4/e+bTBhPBr5uyT/Ixf1LeKlCc568AbRTW+U2FlSs4Fb8LqtU/JAxLuqiv32q0iUNeU5sg8JLtnkQC6yLhu+5clwpnbHQLN6xe/2+Ly+8vfYw3DndFRfDO+uqVnje6040QEoWi6yAqK5Ho5bFFeFNpADSkLiJilUYnGdZBX+/FlWhS9o5rQ==
X-Microsoft-Antispam-PRVS: <VI1PR04MB1582BD96516B20BC7C4FAB9E91720@VI1PR04MB1582.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:VI1PR04MB1582; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB1582; 
X-Forefront-PRVS: 0939529DE2
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(5003940100001)(6116002)(3846002)(2906002)(4326007)(50226002)(586003)(86362001)(47776003)(575784001)(450100001)(19580395003)(19580405001)(81166006)(92566002)(36756003)(66066001)(110136002)(2950100001)(50466002)(42186005)(5008740100001)(5004730100002)(77096005)(229853001)(189998001)(33646002)(15975445007)(76176999)(2351001)(50986999)(48376002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB1582;
	H:change-01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1582;
	23:N4PXB2Ry+tla1/yAAFVdnoMOqkED2dY55VMPLyhf5QHyOREiop9TNyX5vceC9eu07bYTmciJtY4PM2cmtpvZopetU3T5596iSvd9PTyc2gSMV8+KYO5kKj9GHXQ7VF0EFWIVbQcIWXX1wtnai/yTrJVXf7/KzX5WHjb4bx/eeUoP1i+De5/DU2Hcphz0m6fRwmPQ67MNfxZTFwR7TORuXvcUkWjbUh8j9sQ3YofR4z6WWHLH4WIeYRNDEwFLemSnvzHex8ffnu/pp/7OMJO6XtDmNrPfeuW/Xs7YcCRCp047WAt068Uvmh2kGS7tIoDTzcY3meR7QwvEehzv62udbY6SkZBk4rmUIUZrZn1oIKWub/N0DNaEEa/gUcZg1bG+mtEUgI5TzG2HcWm5KMqFA9NjuN/m6xhkQJ/qHH/0g8z9DXFMrwWMQNFj3SkxNCFEXjb1R72rVb+Bq8bvXWV4CMZdJ6tbG+NAtUcppGABpPhT2Mw1eGoghiAsTUzs3Ht59EFCBMTeCuaTb0q16f7wewiRyMJbUR7fgLT3UHAkN36HoX0uTYeId9kw37H5S6/3qepSvXn6fzTtM8mGSkI2RX6BM69J2Z7JGCUjCqHwBGSppRABzQGdCe3H00G/EGlHfxFNMAz1tyD89pTExePPwJ0sZbyQkFi3xczeL5AlMRXNA0LLXIUW1q1Rgcah1a0UsqkN2iYDbo5gDAhOdea4phmsxPyvuXn07/Hhx3R2lVFZEFFFdbLF95mw4+KATTy/PFRlhHHePGCbpYlhkr6mjfUPjZmM+kTA3/XLRflqWwrINubxuYisTDcbnoIRA5W+zC6eYrHmzPTMcFDc+6X/bnwkwNP03P7vZ6/iiKll7t84xuJxmSLRdS+Q3+wV8La5IifZHdjw5paXPX1VZynMqqOayILiH8h/Pj9K0ByIYsy38TKx/cDoRndATFlztNKz
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1582;
	5:s6JDm5U4kSof4lXjCEnEEWJzre/CDnQ6IY4Lt7Aef5R4QR93mmMUo1n7lh5Ep7m1muJ6lPuRW6j7VeWT9QS70lfjHofqOMJffOScpWoNTdCEbIgk9Y6c1i2kfVGETabzUKeEinNv7VMWy0+yaZ9B9g==;
	24:jd1gjKlu+TfR8lNk9JOvJP3SDUV/+nLHJLCymVGsVX1ea7wZMKXk4kNI87GYYRzcE1P0+6+irCxBPgZp9oASQg/6QF6NoawzFpOzpiOxucM=;
	7:Rqi4KB+yWa1YkqxRk4nPgZNCefVSQR8nRLryc7FTZrS3xXO8kOTjz2zNI0PzlASoeOfriwXxxb465Z15CGi3FcvF48dFuJEyIu7rq1d80L16Iy1AQyioexPmyJ7T9lItF1BkzGydkkkbIEmTBKPaPEGjnv7OeCbZbVTDqmUapsFuqkpDzFfng7wMdyM5M52E
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2016 19:43:51.0404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB1582
Subject: [meta-oe][PATCH 2/2] freeglut: Add a recipe freeglut to replace mesa-glut
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
X-List-Received-Date: Wed, 11 May 2016 19:43:53 -0000
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
index 0000000..7671e75
--- /dev/null
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "FreeGLUT is a free-software/open-source alternative to the OpenGL \
+               Utility Toolkit (GLUT) library"
+LICENSE = "X-Consortium"
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


