Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OzCmd-0007Tj-E7
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 20:14:11 +0200
Received: by wyb35 with SMTP id 35so211208wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 11:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=IEAhCGnsKS52CsSssLYpIy2rEJ28mwkyiMntDGwmRUs=;
	b=hHj+YXLg4xLAaNSMvn0xw46qacMLfir2kQa7PfZpCtB63Kx++jPB1JtCK0fd/nXdWl
	nLiIL/b0Bex0NZ36xGivU+MyIEfYE+Cc5lvhZq7LpW6UDp7Ha272eUiE1PGt0U4P3cYQ
	56qW0GU94NSIlbZzusNsPVSyLmu5z+3ePCfd8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=AdXzKAkIFuVpdK4JcIE+ETPjGgnl6uPkeI/bGMqFntcDrePxlwAcV5CJyas0yc5ipk
	4ozXpeVt4iRHKP37ZYZvmIDuqKTkVkmVUpPkXcPTwZtIxlsR6TzI/ts2VwP8eiB48G4x
	VgYTOhZNqUc1fasieqigZ9g+9PL/xzN1qqk+Y=
MIME-Version: 1.0
Received: by 10.227.157.13 with SMTP id z13mr3059544wbw.184.1285352038680;
	Fri, 24 Sep 2010 11:13:58 -0700 (PDT)
Received: by 10.227.144.69 with HTTP; Fri, 24 Sep 2010 11:13:58 -0700 (PDT)
In-Reply-To: <E1OzA6d-00044S-Vd@melo.openembedded.org>
References: <E1OzA6d-00044S-Vd@melo.openembedded.org>
Date: Fri, 24 Sep 2010 20:13:58 +0200
Message-ID: <AANLkTinLsQ+3ffLMOBfLjPH7Ma9QvkToNruEN6q_mru-@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Koen Kooi : speex: make float and asm settings more intelligent
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
X-List-Received-Date: Fri, 24 Sep 2010 18:14:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2010 at 5:22 PM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: e06553979d23531397af3dd71870abb80718c681
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3De06553979d23531397af3dd71870abb80718c681
>
> Author: Koen Kooi <koen@openembedded.org>
> Date: =A0 Fri Sep 24 17:20:54 2010 +0200
>
> speex: make float and asm settings more intelligent
>
> ---
>
> =A0recipes/speex/speex-fpu.inc | =A0 =A05 +++++
> =A0recipes/speex/speex_1.2.bb =A0| =A0 14 ++++++++------
> =A02 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/recipes/speex/speex-fpu.inc b/recipes/speex/speex-fpu.inc
> new file mode 100644
> index 0000000..4c63920
> --- /dev/null
> +++ b/recipes/speex/speex-fpu.inc
> @@ -0,0 +1,5 @@
> +def get_speex_fpu_setting(bb, d):
> + =A0 =A0 =A0 if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return "--enable-fixed-point --disable-floa=
t-api --disable-vbr"
> + =A0 =A0 =A0 return ""
> +
> diff --git a/recipes/speex/speex_1.2.bb b/recipes/speex/speex_1.2.bb
> index f498731..049b472 100644
> --- a/recipes/speex/speex_1.2.bb
> +++ b/recipes/speex/speex_1.2.bb
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://www.speex.org"
> =A0DEPENDS =3D "libogg"
> =A0BETA =3D "1.2rc1"
> =A0PV =3D "1.1+${BETA}"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://downloads.us.xiph.org/releases/speex/speex-${BETA}=
.tar.gz"
> =A0S =3D "${WORKDIR}/speex-${BETA}"
> @@ -25,13 +25,15 @@ LEAD_SONAME =3D "libspeex.so"
> =A0# =A0 =A0 =A0 --disable-float-api --disable-vbr (must disable-vbr if d=
isable-float-api)
> =A0#
>
> -EXTRA_OECONF_append_openmn =3D " --enable-arm5e-asm --enable-fixed-point=
 --disable-float-api --disable-vbr "
> -EXTRA_OECONF_append_amsdelta =3D " --enable-arm4-asm --enable-fixed-poin=
t --disable-float-api --disable-vbr "
> -EXTRA_OECONF_append_bfin =3D " --enable-blackfin-asm --enable-fixed-poin=
t --disable-float-api --disable-vbr "
> -EXTRA_OECONF_append_arm =3D " --enable-fixed-point --disable-float-api -=
-disable-vbr "
> -EXTRA_OECONF_append_dht-walnut =3D " --enable-fixed-point --disable-floa=
t-api --disable-vbr "
> +#check for TARGET_FPU=3Dsoft and inform configure of the result so it ca=
n disable some floating points
> +require speex-fpu.inc
> +EXTRA_OECONF +=3D "${@get_speex_fpu_setting(bb, d)}"
>
> +ARMASM_armv4t =3D "--enable-arm4-asm"

Hi,

for some reason it fails on armv4t (om-gta02) with --enable-arm4-asm

http://tinderbox.openembedded.net/packages/779499/

> +ARMASM_armv5te =3D "--enable-arm5e-asm"

and this breaks armv5te (spitz)

http://tinderbox.openembedded.net/packages/779550/

pity :/

Regards,
> +ARMASM ?=3D ""
>
> +EXTRA_OECONF +=3D "${ARMASM}"
>
> =A0do_configure_append() {
> =A0 =A0 =A0 =A0sed -i s/"^OGG_CFLAGS.*$"/"OGG_CFLAGS =3D "/g Makefile */M=
akefile */*/Makefile
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


