Return-Path: <johannes.pointner@br-automation.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 Aug 2018 11:19:59 UTC
Received: from mail2.br-automation.com (mail2.br-automation.com
	[213.33.116.61])
	by mail.openembedded.org (Postfix) with ESMTP id 0B78A762B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 11:19:59 +0000 (UTC)
X-AuditID: c0a80110-71dff70000000f26-a6-5b7e94db5c09
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id CF.BE.03878.BD49E7B5;
	Thu, 23 Aug 2018 13:04:59 +0200 (CEST)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 13:04:57 +0200
Message-Id: <20180823110457.13293-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.18.0
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 23/08/2018 13:05:02,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 23/08/2018 13:05:02,
	Serialize complete at 23/08/2018 13:05:02,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 23.08.2018 13:04:58
X-TNEFEvaluated: 1
X-Disclaimed: 55583
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnluLIzCtJLcpLzFFi42I5sILRRvf2lLpog3mHeC0uHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujG8/9rEWTOeq6Pxzh62BcTpnFyMHh4SAicSNs2JdjFwcQgKb
	GSUudDezdDFycvAKCEqcnPkEzGYTsJU4MuErmC0ioCvx8cNcRhCbWcBa4v3yBawgtrCAjcTa
	vXfB4iwCqhL3FvxkBZnPK+AhsXEHJ0S5tsSyha+ZQWwJAXmJh8fbGUH2Sgh0MEt83jAHKiEk
	cXrxWShbWGLqk5PsExj5ZiE5aRaSWQsYmVYxiucmZuYY6SUV6SaWluTnJpZk5ufpJefnbmKE
	BI/ADsbdb7QPMQpwMCrx8O7Lq4sWYk0sK67MPcQowcGsJML7fHNNtBBvSmJlVWpRfnxRaU5q
	8SFGaQ4WJXHepOjQaCGB9MSS1OzU1ILUIpgsEwenVAMj69aVT+98N7L03urY2sYuVH+yqPOx
	jZa1n+ZBnyr1osdxWR/nvo7WnrNk0p1DrcfnLPRfmHG1PHNBpHcEf3PWKZ76GCZ74+ajV3gv
	XLCeqpq4ULC/av3G+/XXlfapnszukVmyKtpd0rE24J3mrfWnmh9Osmm9mr/q5Y+Nj1Yt+WLj
	XqxybO4TJZbijERDLeai4kQAktBUxRoCAAA=
Subject: [meta-networking][PATCH] mbedtls: upgrade to 2.12.0
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
X-List-Received-Date: Thu, 23 Aug 2018 11:20:00 -0000
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../mbedtls/{mbedtls=5F2.11.0.bb =3D> mbedtls=5F2.12.0.bb}          | 4 ++=
--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls=5F2.11.0.bb =
=3D> mbedtls=5F2.12.0.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.11.0.=
bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.12.0.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.11.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.12.0.bb
index 71b1f8023..71380ba19 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.11.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.12.0.bb
@@ -24,8 +24,8 @@ SECTION =3D "libs"
=20
 SRC=5FURI =3D "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
=20
-SRC=5FURI[md5sum] =3D "3b133b9b4cf0ccf3ac1c91436771bfa5"
-SRC=5FURI[sha256sum] =3D "2a87061ad770e6d019b3b9cd27ea42a58bd0affccc4c6bfe=
4f5f0eee9ebf8aa8"
+SRC=5FURI[md5sum] =3D "90b55ca8c726f6612de8a31a2a090e94"
+SRC=5FURI[sha256sum] =3D "a2bed048f41a19ec7b4dd2e96649145bbd68a6955c3b51ae=
b7ccbf8908c3ce97"
=20
 inherit cmake
=20
--=20
2.18.0



