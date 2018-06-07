Return-Path: <johannes.pointner@br-automation.com>
Received: from mail2.br-automation.com (mail.br-automation.com [213.33.116.60])
	by mail.openembedded.org (Postfix) with ESMTP id BEB7477081
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 10:11:11 +0000 (UTC)
X-AuditID: c0a80110-8a5ff70000000f28-50-5b1904bfd9ae
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id 40.6D.03880.FB4091B5;
	Thu,  7 Jun 2018 12:11:11 +0200 (CEST)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 7 Jun 2018 12:11:09 +0200
Message-Id: <20180607101109.7971-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.17.1
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 07/06/2018 12:11:11,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 07/06/2018 12:11:11,
	Serialize complete at 07/06/2018 12:11:11,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 07.06.2018 12:11:10
X-TNEFEvaluated: 1
X-Disclaimed: 28195
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkluLIzCtJLcpLzFFi42I5sILRRnc/i2S0wYythhYXDy9ldmD0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxpOH69gKNvBUrDkxi6mBsZm7i5GTQ0LAROLdsYssXYxcHEIC
	mxkl5r17zQSS4BUQlDg58wkLiM0mYCtxZMJXMFtEQFfi44e5jCA2s4C1xPvlC1hBbGEBK4nT
	H6+D2SwCKhIH591mg5jjLtF+/RNUvbbEsoWvmSEWy0us3nCAGWSxhEAHs0THmW9MEAkhidOL
	z0IVCUs0n3zAPIGRbxaSm2YhmbWAkWkVo3huYmaOkV5SkW5iaUl+bmJJZn6eXnJ+7iZGSAAJ
	7GDc/Ub7EKMAB6MSD2/4HYloIdbEsuLK3EOMEhzMSiK8iZfEooV4UxIrq1KL8uOLSnNSiw8x
	SnOwKInzBq9ljxYSSE8sSc1OTS1ILYLJMnFwSjUw+k6/tEZqV7Xl5UC5/siDlasupF0SVqmI
	Oui23l41hPH0XlF+ASX+478un3fXS84VDl184u8KtuIkY65Xv8/Z5QsZx969/PLu8puZSa9S
	l9Rdbluyo/vb941ci2SiPnUrazY9ue4sN42/yWiLl8y/Ur2IK2eOLPRXS98uGFoqV7BsBrfa
	isvvlFiKMxINtZiLihMBeVmPyxwCAAA=
Subject: [meta-networking][PATCH] mbedtls: update to 2.9.0
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
X-List-Received-Date: Thu, 07 Jun 2018 10:11:12 -0000
Content-Transfer-Encoding: quoted-printable

Mbed TLS 2.9.0 maintains source code and binary compatibility with the last
minor version, Mbed TLS 2.8.0, but extends the interface with additional
capabilities.

* Detail release note:
  - https://tls.mbed.org/tech-updates/releases/mbedtls-2.9.0-2.7.3-and-2.1.=
12-released

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../mbedtls/{mbedtls=5F2.8.0.bb =3D> mbedtls=5F2.9.0.bb}            | 4 ++=
--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls=5F2.8.0.bb =
=3D> mbedtls=5F2.9.0.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.8.0.b=
b b/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.9.0.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.8.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.9.0.bb
index 736cce1b0..ee4f164a4 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.8.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.9.0.bb
@@ -24,8 +24,8 @@ SECTION =3D "libdevel"
=20
 SRC=5FURI =3D "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
=20
-SRC=5FURI[md5sum] =3D "2d4b0e2cb844efde1e73d3bcd9731fef"
-SRC=5FURI[sha256sum] =3D "ab8b62b995781bcf22e87a265ed06267f87c3041198e996b=
44441223d19fa9c3"
+SRC=5FURI[md5sum] =3D "31dcf56cb92da5d7ec2dbb7a3cc5dff3"
+SRC=5FURI[sha256sum] =3D "a06a9b43e583b7e6707becfeeb13d88ed00f25fee31a5386=
cb3a3014c454bad8"
=20
 inherit cmake
=20
--=20
2.17.1



