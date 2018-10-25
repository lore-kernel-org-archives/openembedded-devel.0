Return-Path: <johannes.pointner@br-automation.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Oct 2018 09:22:03 UTC
Received: from mail2.br-automation.com (mail2.br-automation.com
	[213.33.116.61])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA3579870
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 09:22:03 +0000 (UTC)
X-AuditID: c0a80110-d25ff70000001097-ca-5bd187b5ac9a
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id D5.1C.04247.5B781DB5;
	Thu, 25 Oct 2018 11:07:02 +0200 (CEST)
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2018 11:07:00 +0200
Message-Id: <20181025090700.8293-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 25/10/2018 11:07:01,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 25/10/2018 11:07:01,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 25.10.2018 11:07:01
X-TNEFEvaluated: 1
X-Disclaimed: 5355
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgluLIzCtJLcpLzFFi42I5sILRRndb+8VogyvT2S0uHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujGUfSgqmc1W0N95haWCcztnFyMkhIWAi8fnDQ+YuRi4OIYHN
	jBJTVvxmAUmwCdhKHJnwFcwWEdCV+PhhLiOIzSxgLfF++QJWEFtYwEbixryJYDaLgKrE8tfH
	wWxeAXeJiY9uM0PUa0ssW/iaGWKZvETDrs3sEDWCEidnPmEBWSwhcI9Joun8YiaIIiGJ04vP
	MsPZv+4zT2Dkm4Vk1iwk/QsYmVYxiucmZuYY6SUV6SaWluTnJpZk5ufpJefnbmKEhI/ADsbd
	b7QPMQpwMCrx8Gq2XowWYk0sK67MPcQowcGsJMLrHAcU4k1JrKxKLcqPLyrNSS0+xCjNwaIk
	zrvRdE+0kEB6YklqdmpqQWoRTJaJg1OqgVGbRfWZrXqZ5LKLzG83K4hdZ5ujxCW7pfvUz5VW
	WxSle0R+6+teefL15Um7dO+ik7Ks84+Ja+dwnfm6IDNJt+bo/k5jr05PW1+H02em3rt1ZI5M
	jWi0vP3F12WPF026Nz/MlqGGXez5VoMDtVHNmYtMihyC75Qv/PE5/CP/+pWXdavZzghrZSqx
	FGckGmoxFxUnAgCxUSQrGwIAAA==
Subject: [meta-networking][PATCH] mbedtls: upgrade to 2.13.0
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
X-List-Received-Date: Thu, 25 Oct 2018 09:22:04 -0000
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../mbedtls/{mbedtls=5F2.12.0.bb =3D> mbedtls=5F2.13.0.bb}          | 4 ++=
--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls=5F2.12.0.bb =
=3D> mbedtls=5F2.13.0.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.12.0.=
bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.13.0.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.12.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.13.0.bb
index 71380ba19..ff3f7f0c1 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.12.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.13.0.bb
@@ -24,8 +24,8 @@ SECTION =3D "libs"
=20
 SRC=5FURI =3D "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
=20
-SRC=5FURI[md5sum] =3D "90b55ca8c726f6612de8a31a2a090e94"
-SRC=5FURI[sha256sum] =3D "a2bed048f41a19ec7b4dd2e96649145bbd68a6955c3b51ae=
b7ccbf8908c3ce97"
+SRC=5FURI[md5sum] =3D "659d96bb03012ca6db414a9137fcdbd6"
+SRC=5FURI[sha256sum] =3D "593b4e4d2e1629fc407ab4750d69fa309a0ddb66565dc3de=
b5b60eddbdeb06da"
=20
 inherit cmake
=20
--=20
2.19.1



