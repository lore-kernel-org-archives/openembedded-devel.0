Return-Path: <johannes.pointner@br-automation.com>
Received: from mail2.br-automation.com (mail.automotion.info [213.33.116.60])
	by mail.openembedded.org (Postfix) with ESMTP id CCB5C78954
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:56:58 +0000 (UTC)
X-AuditID: c0a80110-665ff70000000e9e-4f-5ab2104a9503
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id 1C.ED.03742.A4012BA5;
	Wed, 21 Mar 2018 08:56:58 +0100 (CET)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 08:55:26 +0100
Message-Id: <20180321075526.25825-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.16.2
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 21/03/2018 08:56:59,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 21/03/2018 08:56:59,
	Serialize complete at 21/03/2018 08:56:59,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 21.03.2018 08:56:57
X-TNEFEvaluated: 1
X-Disclaimed: 36895
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgluLIzCtJLcpLzFFi42I5sILRRtdLYFOUwf1F6hYXDy9ldmD0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxpLtExkL/vNUrGpxaGDcwd3FyMkhIWAicXD6beYuRi4OIYFN
	jBIr7jaxgCR4BQQlTs58AmazCdhKHJnwFcwWEdCV+PhhLiOIzSxgLfF++QJWEFtYwELi8cbD
	zCA2i4CqxPO3c1kh5nhI/Ni3jQmiXlti2cLXzBCL5SUWnr0KtlhCoINZ4unaE0wQCSGJ04vP
	QhUJS3TuWcE0gZFvFpKbZiGZtYCRaRWjeG5iZo6RXlKRbmJpSX5uYklmfp5ecn7uJkZI+Ajs
	YNz9RvsQowAHoxIP79L/G6OEWBPLiitzDzFKcDArifBu+wwU4k1JrKxKLcqPLyrNSS0+xCjN
	waIkzhvWtj5KSCA9sSQ1OzW1ILUIJsvEwSnVwOh1KKlvI19PoPvakjt7jmfWSjzbwPPXN/me
	YeSldr+6kvKXNjIR/1K1DfnsTfRXnDRueXJvb9WBloaDUY9vlijyMWvwr/5x4tzabw7i3+5f
	9002mK9puenqEUWGViZ59cerq+8ct6oXSvj3LSTJ0K+5ujfE4TTj59t1R/aJ/daMT1tlaLG6
	RImlOCPRUIu5qDgRAIdlLU8bAgAA
Subject: [meta-networking][PATCH] samba: update to 4.7.6
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
X-List-Received-Date: Wed, 21 Mar 2018 07:56:59 -0000
Content-Transfer-Encoding: quoted-printable

This includes security fixes that adresses the following defects:
CVE-2018-1050 (Denial of Service Attack on external print server.)
CVE-2018-1057 (Authenticated users can change other users' password.)

* Detail release note:
  - https://www.samba.org/samba/history/samba-4.7.6.html

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../recipes-connectivity/samba/{samba=5F4.7.5.bb =3D> samba=5F4.7.6.bb}   =
  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba=5F4.7.5.bb =3D> s=
amba=5F4.7.6.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba=5F4.7.5.bb b/=
meta-networking/recipes-connectivity/samba/samba=5F4.7.6.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba=5F4.7.5.bb
rename to meta-networking/recipes-connectivity/samba/samba=5F4.7.6.bb
index 87f404900..a8517c541 100644
--- a/meta-networking/recipes-connectivity/samba/samba=5F4.7.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba=5F4.7.6.bb
@@ -30,8 +30,8 @@ SRC=5FURI=5Fappend=5Flibc-musl =3D " \
            file://samba-4.3.9-remove-getpwent=5Fr.patch \
           "
=20
-SRC=5FURI[md5sum] =3D "3629a134253d6a4a16ebd23a508b0d5b"
-SRC=5FURI[sha256sum] =3D "316d04fa9fbabad6f2739fe68e1928778af4866265409119=
aba6ef3435c8fe8d"
+SRC=5FURI[md5sum] =3D "0253021a45c479cec1e135b004a0177a"
+SRC=5FURI[sha256sum] =3D "1eede30fc8ef6504e24602fb72b00baa0a7b73b59f16d25c=
b0771dc8c7c57d6e"
=20
 inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
--=20
2.16.2



