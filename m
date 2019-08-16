Return-Path: <bradleyb@fuzziesquirrel.com>
X-Greylist: delayed 412 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Aug 2019 22:19:25 UTC
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id 503DB762B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 22:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Aug 2019 18:11:55 -0400
Message-Id: <20190816221155.26098-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Cc: v2cib530@us.ibm.com
Subject: [meta-oe][PATCH] cli11: Remove dev pkg dep to main pkg
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
X-List-Received-Date: Fri, 16 Aug 2019 22:19:25 -0000
Content-Transfer-Encoding: quoted-printable

cli11 is header-only and the main package is empty.  Remove the
dependency to cli11 from cli11-dev so cli11-dev can be included in an
SDK via IMAGE_INSTALL, RDEPENDS, and the like.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-oe/recipes-support/cli11/cli11_1.8.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/cli11/cli11_1.8.0.bb b/meta-oe/recip=
es-support/cli11/cli11_1.8.0.bb
index b6a4341595..404545d5e7 100644
--- a/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
+++ b/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
@@ -17,3 +17,6 @@ inherit ptest
=20
 EXTRA_OECMAKE +=3D "-DCLANG_TIDY=3DOFF"
 DEPENDS +=3D "boost"
+
+# cli11 is a header only C++ library, so the main package will be empty.
+RDEPENDS_${PN}-dev =3D ""
--=20
2.21.0

