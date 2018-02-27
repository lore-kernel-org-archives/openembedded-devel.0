Return-Path: <johannes.pointner@br-automation.com>
Received: from mail2.br-automation.com (mail.automotion.info [213.33.116.60])
	by mail.openembedded.org (Postfix) with ESMTP id 817DB787E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 07:35:26 +0000 (UTC)
X-AuditID: c0a80110-ee5ff70000000ea0-0f-5a9506a914f2
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id 72.F0.03744.9A6059A5;
	Tue, 27 Feb 2018 08:20:09 +0100 (CET)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Feb 2018 08:18:44 +0100
Message-Id: <20180227071844.23571-4-johannes.pointner@br-automation.com>
In-Reply-To: <20180227071844.23571-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.16.2
References: <20180227071844.23571-1-johannes.pointner@br-automation.com>
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 27/02/2018 08:20:05,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 27/02/2018 08:20:10,
	Serialize complete at 27/02/2018 08:20:10,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 27.02.2018 08:20:08
X-TNEFEvaluated: 1
X-Disclaimed: 46771
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrALMWRmVeSWpSXmKPExsVyYAWjje5KtqlRBjvXKFlcPLyU2YHR49zG
	FYwBjFFcNimpOZllqUX6dglcGbs3v2Av2MFXsXHNVsYGxkc8XYycHBICJhKP206wgdhCApsY
	Je69FgGxeQUEJU7OfMICYrMJ2EocmfAVzBYR0JX4+GEuI4jNLGAt8X75AlYQW1jARmLn6Zlg
	cRYBVYmNzz6xQMzxkLi9eRU7iM0p4Clxd8YvVohebYllC18zQ9wgL7Hw7FVmiBs8JOZvagC6
	hwso3sEssW3lNFaIIiGJ04vPQjUISzRNms02gVFgFpJbZyGZu4CRaRWjeG5iZo6RXlKRbmJp
	SX5uYklmfp5ecn7uJkZIuAnsYNz9RvsQowAHoxIPbw7D1Cgh1sSy4srcQ4wSHMxKIrwrF0+O
	EuJNSaysSi3Kjy8qzUktPsQozcGiJM6bk2QcJSSQnliSmp2aWpBaBJNl4uCUamBMsSjX6Oc6
	7yO2ScXPqV3JQcnJ68nG2tnzuxr7A9kTmmfOKKhXihGtrmtRni3GmLmfs3zLgV3aJz5O75u7
	prxuj/azj1ou89TZn2t/2ypcLm1x+d2hvw1umxncX/pscr/8vih3jsueaW7ydlay+pwnvOx5
	2vmNZdOYGFZZ/muawPE5nVVTUImlOCPRUIu5qDgRAEClMrEzAgAA
Subject: [meta-networking][PATCH 3/3] samba: update to 4.7.5
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
X-List-Received-Date: Tue, 27 Feb 2018 07:35:27 -0000
Content-Transfer-Encoding: quoted-printable

This includes security fixes that adresses the following defects:
CVE-2017-14746: s3: smbd: Fix SMB1 use-after-free crash bug.
CVE-2017-15275: s3: smbd: Chain code can return uninitialized memory when
talloc buffer is grown.

* Detail release note:
  - https://www.samba.org/samba/history/samba-4.7.5.html

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../recipes-connectivity/samba/{samba=5F4.7.0.bb =3D> samba=5F4.7.5.bb}  |=
 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba=5F4.7.0.bb =3D> s=
amba=5F4.7.5.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/samba/samba=5F4.7.0.bb b/=
meta-networking/recipes-connectivity/samba/samba=5F4.7.5.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/samba/samba=5F4.7.0.bb
rename to meta-networking/recipes-connectivity/samba/samba=5F4.7.5.bb
index a50b24de5..87f404900 100644
--- a/meta-networking/recipes-connectivity/samba/samba=5F4.7.0.bb
+++ b/meta-networking/recipes-connectivity/samba/samba=5F4.7.5.bb
@@ -30,11 +30,8 @@ SRC=5FURI=5Fappend=5Flibc-musl =3D " \
            file://samba-4.3.9-remove-getpwent=5Fr.patch \
           "
=20
-SRC=5FURI[md5sum] =3D "cf5eaf34f510e3d5643c0dcfd49fcc40"
-SRC=5FURI[sha256sum] =3D "bd16d169988eb513e685a87e9964a5210482498fa9b3a22a=
aa8287a061e3c936"
-
-#SRC=5FURI[md5sum] =3D "c6ee5c766016d59908c8fb672fbbd445"
-#SRC=5FURI[sha256sum] =3D "9ef24393de08390f236cabccd6a420b5cea304e959cbf1a=
99ff317325db3ddfa"
+SRC=5FURI[md5sum] =3D "3629a134253d6a4a16ebd23a508b0d5b"
+SRC=5FURI[sha256sum] =3D "316d04fa9fbabad6f2739fe68e1928778af4866265409119=
aba6ef3435c8fe8d"
=20
 inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
--=20
2.16.2



