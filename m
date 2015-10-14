Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 27A04770B5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:54:09 +0000 (UTC)
Received: by wijq8 with SMTP id q8so95469673wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 11:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=7FVU3gNHw2TXaSduCVSYJ4WB3T/f6VTFpNMmmQP4jsQ=;
	b=gkBwo/W2e3ENv3KNV7AbAJv0q10HuPXSHHaAOKx8z8IZU07jmobuDiWUqlqCq7w1m/
	xPIqYLf0y90BMyzk+n0++GCEN+hWHX6ai6CI6+QFkpURdfp0sIEa8y7yp/RVRGxWQKiQ
	feVmWZAWM54nR4hN7fGlBuOCsjv4fnPugp6nRgiXiH2XzN4FR24ycvJCIxmfL4H5ZKx6
	Jm2nI1TBeaTYd8f2lYwlg05AUaEtXn3TfQijd1Vplkk3eAe343GlUleKD+OmCUuhcY7p
	yv2kdmk3ywhwD/tOUq8ZkhHHFp7qWgIOOCMJ6/eCjiyDFaCV5ylX8hUjDtDC0GJqB8ch
	849g==
X-Received: by 10.180.189.179 with SMTP id gj19mr5986262wic.47.1444848847943; 
	Wed, 14 Oct 2015 11:54:07 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id mu9sm8228885wib.6.2015.10.14.11.54.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Oct 2015 11:54:07 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <3EA4FB29-8B2D-4F5F-A18C-520E899198BF@gmail.com>
Date: Wed, 14 Oct 2015 20:54:06 +0200
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-networking][PATCH 6/6] nftables: update nftables userland tools from 0.4 to 0.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Oct 2015 18:54:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Update nftables tools from 0.4 to 0.5, for ChangeLog see
http://git.netfilter.org/nftables/log/

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../recipes-filter/nftables/{nftables_0.4.bb =3D> nftables_0.5.bb}      =
| 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.4.bb =3D> =
nftables_0.5.bb} (74%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.4.bb =
b/meta-networking/recipes-filter/nftables/nftables_0.5.bb
similarity index 74%
rename from meta-networking/recipes-filter/nftables/nftables_0.4.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.5.bb
index 741b330..11b5e5a 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.4.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.5.bb
@@ -11,7 +11,7 @@ SRC_URI =3D =
"http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
            file://fix-to-generate-ntf.8.patch \
           "
=20
-SRC_URI[md5sum] =3D "09b686c489ff10db670ca60dbed7ff43"
-SRC_URI[sha256sum] =3D =
"f6ca69b75c68915f9f3a3972274ec68354dfbbcfc0b9fc55c813a0525c351d3c"
+SRC_URI[md5sum] =3D "94bfe1c54bcb9f6ed974835f2fca8069"
+SRC_URI[sha256sum] =3D =
"1fb6dff333d8a4fc347cbbe273bf905a2634b27a8c39df0d3a45d5a3fde10ad6"
=20
 inherit autotools pkgconfig
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


