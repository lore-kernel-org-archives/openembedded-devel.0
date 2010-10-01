Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P1aBY-0005eR-CC
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 09:37:42 +0200
Received: by wwc33 with SMTP id 33so478421wwc.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Oct 2010 00:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=JKMaOhBwPXanlrniOUbjy/msMkaeV0GdWXLLeot8QnA=;
	b=TKIUNR4QFmwqJy1WPPghlWfetPJW1/BUT89Mc6hK8Mmvf0cEx9HbOG9sASC3RKZTX+
	2sqcWmrb5GlRMzdCWdm6uympaYI0g/8XxdPXZ3ezSLBwbMkReo1xtQc3FH4AOlKHWz9k
	zpd57x9iaIGOWXeonweJE4nT4BwkMJd3amzz0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=RgS5bhW2mW50npM2QYNuP0B8j/iI9WB55NIX3yUAhZ0+Inyi726Pd8qVx4GD4f51tA
	X4/rVsy0IMfUGD/DEceP2BVw+Xb0jQ0ssOtI9s0/5qD6/CGwskyY8K/dW6kYpQiexzgX
	oVqKqPDxIndGNMjVx0Vjhhp1UspUL7tfkIT7M=
MIME-Version: 1.0
Received: by 10.227.69.10 with SMTP id x10mr4073052wbi.155.1285918644741; Fri,
	01 Oct 2010 00:37:24 -0700 (PDT)
Received: by 10.227.144.69 with HTTP; Fri, 1 Oct 2010 00:37:24 -0700 (PDT)
In-Reply-To: <E1P1Paa-0003e0-Fl@melo.openembedded.org>
References: <E1P1Paa-0003e0-Fl@melo.openembedded.org>
Date: Fri, 1 Oct 2010 09:37:24 +0200
Message-ID: <AANLkTikGOqbz0xgxJKUcScM=JUTzzt1gwA+NSaJT_7rC@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Noor Ahsan : tcl: Run oe-stylize. py script and modify the recipe accordingly
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
X-List-Received-Date: Fri, 01 Oct 2010 07:37:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2010 at 10:18 PM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: master
> Commit: 6c21af6a85996ed5891925ca2221c4615048a331
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3D6c21af6a85996ed5891925ca2221c4615048a331
>
> Author: Noor Ahsan <noor_ahsan@mentor.com>
> Date: =A0 Mon Aug 30 23:50:54 2010 +0000
>
> tcl: Run oe-stylize.py script and modify the recipe accordingly
>
> * Run the oe-stylize.py script on the recipe and modify the recipe accord=
ing to the output of the script.
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> ---
>
> =A0recipes/tcltk/tcl_8.5.8.bb | =A0 45 ++++++++++++++++++++--------------=
---------
> =A01 files changed, 21 insertions(+), 24 deletions(-)
>
> diff --git a/recipes/tcltk/tcl_8.5.8.bb b/recipes/tcltk/tcl_8.5.8.bb
> index 9d030b9..e8905f0 100644
> --- a/recipes/tcltk/tcl_8.5.8.bb
> +++ b/recipes/tcltk/tcl_8.5.8.bb
> @@ -1,8 +1,7 @@
> =A0DESCRIPTION =3D "Tool Command Language"
> -LICENSE =3D "tcl"
> -SECTION =3D "devel/tcltk"
> =A0HOMEPAGE =3D "http://tcl.sourceforge.net"
> -
> +SECTION =3D "devel/tcltk"
> +LICENSE =3D "tcl"
> =A0PR =3D "r7"
>
> =A0SRC_URI =3D "\
> @@ -16,43 +15,41 @@ SRC_URI =3D "\
> =A0 file://tclprivate.diff;striplevel=3D2 \
> =A0 file://mips-tclstrtod.patch;striplevel=3D0 \
> =A0"
> -
> =A0SRC_URI[md5sum] =3D "7f123e53b3daaaba2478d3af5a0752e3"
> =A0SRC_URI[sha256sum] =3D "6b090c1024038d0381e1ccfbd6d5c0f0e6ef205269ceb9=
d28bd7bd7ac5bbf4a7"
>
> =A0S =3D "${WORKDIR}/tcl${PV}/unix"
> +SYSROOT_PREPROCESS_FUNCS =3D+ "tcl_sysroot"
>
> =A0inherit autotools binconfig
>
> =A0EXTRA_OECONF =3D "--enable-threads"
>
> =A0do_compile_prepend() {
> - =A0 =A0 =A0 echo > ../compat/fixstrtod.c
> - =A0 =A0 =A0 sed -i -e 's:./tclsh :tclsh :g' Makefile
> + =A0 =A0 =A0 =A0echo > ../compat/fixstrtod.c
> + =A0 =A0 =A0 =A0sed -i -e 's:./tclsh :tclsh :g' Makefile


^^ this looks like something which should be called only on non-native buil=
d

here is log what happens when it's called also on native build
http://tinderbox.openembedded.org/packages/803704/

when you don't have tclsh installed on buildhost, you have to use the
tclsh version just generated in current dir

I know it's old issue, maybe only more exposed by your patches, but
can you please fix it too? Thanks

Regards,


