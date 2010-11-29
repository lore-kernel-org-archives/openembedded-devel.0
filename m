Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <a.sappia@gmail.com>) id 1PMsvK-0003E4-Ic
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 02:52:59 +0100
Received: by qwg5 with SMTP id 5so2570453qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Nov 2010 17:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=4c9BAM1+VyiihkpGB9mP+ovOdI3RmPDnFLf7Wib1cZ0=;
	b=o8tPx/PNJ08oNYknfROw/C/HDjVZPEw2n3SY2Ev6fKJQnut6FZQdng30IcU3DMl5Lq
	Da84xBVlmHZKaZ5hgvEAjGkTB3uA6SI59aVgv5X6bRx5n/vLdE85JKYILRxfaJurQA5+
	ZJTTHXrNKMY75XGf77x+FKQgwrOgjtdDgxBOQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=A4Gvmpgal9YGB0nbhTZF2JTQhizvSQiIWXvf1H2LcZ+v3TqsjIiMK3XSLrU1mwkPLL
	kcaUOrU3/c9pJISSxJNnK8yaeeshgamzt01HEDNRmRB+b2a8AmyGF5LABh3CybNqyYdy
	9qtGuenQ8l6pHUvEniliN3FOCiw90Qt7c/AMQ=
Received: by 10.229.85.213 with SMTP id p21mr4398297qcl.127.1290995498881;
	Sun, 28 Nov 2010 17:51:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.10.201 with HTTP; Sun, 28 Nov 2010 17:51:18 -0800 (PST)
From: Alessandro Sappia <a.sappia@gmail.com>
Date: Mon, 29 Nov 2010 02:51:18 +0100
Message-ID: <AANLkTinNZPKsoML=dAyuXOQ=o_hH=memq8t2eq1P8WD=@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: a.sappia@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: psplash customization
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Nov 2010 01:52:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi all,
I'm fighting against psplash image customization. docs confuses me, as
I don't want to change anything in the original oe repository.
I configured enviroment to have a local overlay where I put my own
psplash-winecooler_svn.bb and created with
make-image-header.sh (both HAND and BAR) the .h needed in files/foo
subdirectory of the same recipe. the image recipe I use is:
winecooler-image.bb
------------------
IMAGE_PREPROCESS_COMMAND =3D "create_etc_timestamp"

DEPENDS =3D=C2=A0 "task-base-extended \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 psplash-=
winecooler \
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 esekeyd u-boot-utils tslib \
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 i2c-tools i2c screen rsync nfs-utils =
\
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 directfb gdbserver directfb mtd-utils=
 \
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 "
PREFERRED_PROVIDER_virtual/psplash =3D "psplash-winecooler"

IMAGE_INSTALL =3D "task-base-extended \
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 psplash-winecooler \
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 qt4-embedded qwinecooler qt4-embedded=
-plugin-gfxdriver-gfxtransformed \
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 qt4-embedded-plugin-sqldriver-sqlite =
\
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qt4-embedded-plugin-imageformat-=
jpeg \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qt4-embedded-plugin-imageformat-=
gif \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qt4-embedded-plugin-imageformat-=
mng \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qt4-embedded-fonts-ttf-vera \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qt4-embedded-fonts \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qt4-embedded-plugin-mousedriver-=
tslib \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qt4-embedded-fonts-ttf-dejavu \
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 esekeyd u-boot-utils tslib-calibrate =
tslib-tests \
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 i2c-tools i2c screen \
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 directfb mtd-utils \
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 "

export IMAGE_BASENAME =3D "winecooler-image"
IMAGE_LINGUAS =3D ""

inherit image
------------------

psplash-vinecooler.bb
------------------
require psplash.inc
require psplash-ua.inc

ALTERNATIVE_PRIORITY =3D "20"

# You can create your own pslash-poky-img.h by doing
# ./make-image-header.sh <file>.png POKY
# and rename the resulting .h to pslash-poky-img.h (for the logo)
# respectively psplash-bar-img.h (BAR) for the bar.
# You might also want to patch the colors (see patch)

SRC_URI =3D "svn://svn.o-hand.com/repos/misc/trunk;module=3Dpsplash;proto=
=3Dhttp \
          file://psplash-18bpp.patch \
          file://logo-math.patch \
          file://psplash-poky-img.h \
          file://psplash-bar-img.h \
          file://psplash-default \
          file://splashfuncs \
          file://psplash-init"
S =3D "${WORKDIR}/psplash"
------------------
bitbake winecooler-image builds psplash-angstrom and I obtain the base
angstrom boot image. :(
the psplash-winecooler.bb compiles fine.

another issue is that bitbake winecooler-image complain me about
psplash-angstrom and psplash-winecooler providing both virtual/psplash

I'm quite new to OE, I know I'm doing it wrong, but may someone show
me the way ?

Regards,

Alessandro

--
Alessandro Sappia
a.sappia@gmail.com


