Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7819276E3F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 17:59:45 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so10272190wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 10:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=p/YNfwaqHzGNXqP3ZiJ38kah7dp1BoQcPmaKYrgcdbE=;
	b=dbtFggiHiyHiRKiNYjLehzRGvcxwGuKAvuOKzwNH+Jiwz2uqtQzDnRP32G5kExiP9m
	1JI9S/StUmUh+BAr5hTLHM0nn31mxIDSrlUk3JuXvKhEm3Fc4QadjSBKEw8yt9AlvKAP
	8oYUDwk1VB2MTLwoYvbVyXEG9e5d/3swykiPJ3XeoTwwmz8hGnWJGOEl5VO6hqLWPTBP
	fGumMqufcagtvee4WU1jtcgKhMNgswvgGtTKnC8uwTrSwaR43rswP0ji0lldhcUv9DDo
	neEGumiamDyV/78sUx2R1WhtQj9yZT5nIx9TodOdKtva7YkbVweca/7U91z5STHTV6r5
	vw+A==
X-Received: by 10.28.140.213 with SMTP id o204mr2309895wmd.12.1446055185807;
	Wed, 28 Oct 2015 10:59:45 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id 71sm5141644wmt.15.2015.10.28.10.59.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Oct 2015 10:59:45 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <BED47F2F-ED38-4918-AADC-E9CA500B6BA5@gmail.com>
Date: Wed, 28 Oct 2015 18:59:44 +0100
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
X-List-Received-Date: Wed, 28 Oct 2015 17:59:46 -0000
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


