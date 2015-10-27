Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 967C975CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:30:39 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so179478764wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=p/YNfwaqHzGNXqP3ZiJ38kah7dp1BoQcPmaKYrgcdbE=;
	b=Eu/UqFTRsdeaubkvbNwFSc9A9TLxjr/t2WTtSTPbbyfreQ8bMJ8MlqG2fBvJW/hFjO
	kio9O91gLRCUY4PrHvaH4QCJYsvcHy/21vDFfUXsq2PzKpa44RWQgtCPrM75GQTF3/v2
	jPz2rDIeO+LjoN+3JPkC/YXob9WH9P6hQyjnWFoTSa5F7N3JJr7PPYGWh9nNZIDOts0P
	z7cmxNMm8q9gzNFB3ICNQFXp0uvD4gY2MA6Ril58o6e7zoD6ymmc9wi/jX4RdFaO22jJ
	A5iZhfQ2AW6cNPAV2KtgFa3tAP2Fite5N52V2BuCpczkKqcI0Mmgc5GfCjypaUUzUR/w
	X3AA==
X-Received: by 10.180.107.67 with SMTP id ha3mr27376864wib.61.1445977839366;
	Tue, 27 Oct 2015 13:30:39 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id 5sm2858819wmg.14.2015.10.27.13.30.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Oct 2015 13:30:38 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <A3D1D71D-FA15-43FB-B5D9-AAA1B4D06C86@gmail.com>
Date: Tue, 27 Oct 2015 21:30:38 +0100
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-java][PATCH 3/4] cacao: fix broken build with existing workdir
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
X-List-Received-Date: Tue, 27 Oct 2015 20:30:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Cacao hast some weird configure script which fails heavily when run =
twice
in same build/work directory. Ensure clean rebuilds ...

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 recipes-core/cacao/cacao_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb =
b/recipes-core/cacao/cacao_1.6.1.bb
index 6e2fb99..ae06b50 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -17,7 +17,7 @@ SRC_URI =3D =
"http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-
 SRC_URI[md5sum] =3D "2c18478404afd1cffdd15ad1e9d85a57"
 SRC_URI[sha256sum] =3D =
"eecc8bd1b528a028f43d9d1d0c06b97855bbf1d40e03826d911ebbc0b6971e12"
=20
-inherit java autotools-brokensep update-alternatives pkgconfig =
distro_features_check
+inherit java autotools-brokensep update-alternatives pkgconfig =
distro_features_check rm_work
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
 REQUIRED_DISTRO_FEATURES_class-native :=3D ""
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


