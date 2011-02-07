Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PmVsp-00058L-4M
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 19:32:19 +0100
Received: by gyd8 with SMTP id 8so1863031gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Feb 2011 10:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=yFcFFf/n5v44pAGeW4xfZ+Awug2k7ybpf2uNr2fgsak=;
	b=UxsOGxImDRIw7gy8SM/QIr7UPZttGc8+6idUd9OTpbXSZrDXybol+ZkkFZRlGt3zEF
	u02A3a+x/p9xWCu2DmLBu91lbEQGbAUe4DjhuZjqC17qLGM34R9ZSgSSzo1ez60zAzWD
	m72Pcbm9tjGFGFsAlwznRZcGF9XASy15Mzbeo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=OtFXrVXovtImHn7xABeJFwcLF7UbYWDx/GwX1G0udZDN+ExT+jBuwW3lyaHM5s/df5
	OX0f0Fbxtd8uYk7BX6qCtpPr6unO2ONsXApZxBQYi47qVE5Lv+XImUgx3ozUSq1p9MuX
	71+YdtPwPQopvOxe69bcuuxWXtJ0Inh8BmA04=
Received: by 10.90.84.2 with SMTP id h2mr9689919agb.7.1297103476763; Mon, 07
	Feb 2011 10:31:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Mon, 7 Feb 2011 10:30:56 -0800 (PST)
In-Reply-To: <1297099538-25968-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1297093986-24331-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1297099538-25968-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Feb 2011 10:30:56 -0800
Message-ID: <AANLkTimQXzRuD7EYUHdCbRwaxM97HODsxXhGQ=QXZadg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH, v2] gcc-4.5: added thumb2 build patch
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
X-List-Received-Date: Mon, 07 Feb 2011 18:32:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2011 at 9:25 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Fix for http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D43999 and is
> required to build gcc for Thumb2 only architectures (e.g. Cortex-M3).
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
> =C2=A0recipes/gcc/gcc-4.5.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A03 ++-
> =C2=A0recipes/gcc/gcc-4.5/thumb2-build.patch | =C2=A0 16 ++++++++++++++++
> =C2=A02 files changed, 18 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5/thumb2-build.patch
>
> diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
> index b630528..9ba2e22 100644
> --- a/recipes/gcc/gcc-4.5.inc
> +++ b/recipes/gcc/gcc-4.5.inc
> @@ -8,7 +8,7 @@ DEPENDS =3D "mpfr gmp libmpc libelf"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native"
>
>
> -INC_PR =3D "r31"
> +INC_PR =3D "r32"
>
> =C2=A0SRCREV =3D "168622"
> =C2=A0PV =3D "4.5"
> @@ -166,6 +166,7 @@ SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;modul=
e=3D${BRANCH} \
> =C2=A0# =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99457.p=
atch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-scalar-widening-pr45847.pat=
ch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-arm-volatile-bitfield-fix.p=
atch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://thumb2-build.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> =C2=A0SRC_URI_append_mips64 =3D " file://mips64-nomultilib.patch "
> diff --git a/recipes/gcc/gcc-4.5/thumb2-build.patch b/recipes/gcc/gcc-4.5=
/thumb2-build.patch
> new file mode 100644
> index 0000000..75e765e
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/thumb2-build.patch
> @@ -0,0 +1,16 @@
> +Fix for http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D43999
> +
> +Patch was taken from comment #3 (Jing Yu) there; the patch attached
> +to the named bugreport is wrong.
> +
> +Index: gcc/config/arm/lib1funcs.asm
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- a/gcc/config/arm/lib1funcs.asm =C2=A0 =C2=A0 (revision 163231)
> ++++ b/gcc/config/arm/lib1funcs.asm =C2=A0 =C2=A0 (working copy)
> +@@ -642,5 +642,5 @@
> + =C2=A0 =C2=A0 =C2=A0 cmp =C2=A0 =C2=A0 \dividend, #0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ Early termination?
> +- =C2=A0 =C2=A0 =C2=A0do_it =C2=A0 hs, t
> ++ =C2=A0 =C2=A0 =C2=A0do_it =C2=A0 ne, t

This needs to be tested on all arms before being taken in. I would
suggest test it
on beagleboard and qemuarm that will cover other two case arm/thumb1
if gcc testsuites
show no new regressions then we can consider it.

> + =C2=A0 =C2=A0 =C2=A0 movnes =C2=A0\curbit, =C2=A0 \curbit, =C2=A0lsr #4=
 =C2=A0 =C2=A0 @ No, any more bits to do?
> + =C2=A0 =C2=A0 =C2=A0 movne =C2=A0 \divisor, =C2=A0\divisor, lsr #4
> + =C2=A0 =C2=A0 =C2=A0 bne =C2=A0 =C2=A0 1b
> --
> 1.7.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


