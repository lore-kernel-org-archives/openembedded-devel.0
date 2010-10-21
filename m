Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P93Ln-0005HU-Tu
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 00:11:09 +0200
Received: by gwaa11 with SMTP id a11so468922gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 15:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=EDyjPl+w32/YiAQhnXN3q0u2wYt5dQlj+GAEr87CeSU=;
	b=ftHREjdf2Tfb1rZgfi/w5ga+XI/HOlyt3nKu69Ba38KG62990R0YkUcxInk9rJ8iVv
	oTRvZ2jLdZRc8UAnTWFlADVnnOLAZwARdK3s1xFZFfDgpGgkiOujwpE6/3Gi9iJlt5VK
	yExP625gmxH1tbKwn0TkKIC0ajHZdt04bwHoI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=oOLa77sQNmauRc0iACztFeTsGC4ycbIbL/q6mXZU3PA0XhHxgItEx6MOoVudUxcGFK
	qUrzI5s+HsdizCGpqJ3Qz6PAoaohvRcBqlZvAg6mndbg3fpAkTMn4lklcDRvtMlRiZNy
	UKwlS6wtfwQA/dhv7Si7aI11uBEsR/2jsWr10=
Received: by 10.90.56.19 with SMTP id e19mr1694147aga.200.1287699024873; Thu,
	21 Oct 2010 15:10:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Thu, 21 Oct 2010 15:10:04 -0700 (PDT)
In-Reply-To: <1287696121-28307-1-git-send-email-msmith@cbnco.com>
References: <1287696121-28307-1-git-send-email-msmith@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Oct 2010 15:10:04 -0700
Message-ID: <AANLkTimPZR6ucLv06N4Y-oN_YxwMkGSrcufmDSjJmQje@mail.gmail.com>
To: Michael Smith <msmith@cbnco.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] gcc 4.3.3: backport -print-sysroot for libtool
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
X-List-Received-Date: Thu, 21 Oct 2010 22:11:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2010 at 2:22 PM, Michael Smith <msmith@cbnco.com> wrote:
> libtoolized configure scripts need this in order to autodetect sysroot
> path when --with-sysroot is passed.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> Cc: Khem Raj <raj.khem@gmail.com>

this looks ok too

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
> =C2=A0recipes/gcc/gcc-4.3.3.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +-
> =C2=A0.../gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch | =C2=A0 69 ++++=
++++++++++++++++
> =C2=A02 files changed, 71 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/gcc/gcc-4.3.3/gcc-4.3-backport-print-sys=
root.patch
>
> diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
> index 7bee4af..7239f82 100644
> --- a/recipes/gcc/gcc-4.3.3.inc
> +++ b/recipes/gcc/gcc-4.3.3.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv3"
> =C2=A0DEPENDS =3D "mpfr gmp"
> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native"
>
> -INC_PR =3D "r18"
> +INC_PR =3D "r19"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=3Da=
rchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fedora/gcc43-c++-builtin-redecl.patch;s=
triplevel=3D0 \
> @@ -65,6 +65,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://arm-gcc-objective.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefile.in.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefile.in.parallel.patch \
> + =C2=A0 =C2=A0 =C2=A0 file://gcc-4.3-backport-print-sysroot.patch \
> =C2=A0"
>
> =C2=A0SRC_URI_append_sh3 =C2=A0=3D " file://sh3-installfix-fixheaders.pat=
ch "
> diff --git a/recipes/gcc/gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch b=
/recipes/gcc/gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch
> new file mode 100644
> index 0000000..c44d050
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.3.3/gcc-4.3-backport-print-sysroot.patch
> @@ -0,0 +1,69 @@
> +Backport "gcc -print-sysroot" from 4.4.x, required by some tools
> +that auto-detect sysroot (e.g. libtool configured with --with-sysroot).
> +
> +Source: http://gcc.gnu.org/viewcvs/trunk/gcc/gcc.c?r1=3D137548&r2=3D1375=
84&view=3Dpatch
> +
> +--- trunk/gcc/gcc.c =C2=A0 =C2=A02008/07/07 00:48:55 =C2=A0 =C2=A0 13754=
8
> ++++ trunk/gcc/gcc.c =C2=A0 =C2=A02008/07/07 18:20:06 =C2=A0 =C2=A0 13758=
4
> +@@ -155,6 +155,8 @@
> +
> + static int print_multi_directory;
> +
> ++static int print_sysroot;
> ++
> + /* Flag saying to print the relative path we'd use to
> + =C2=A0 =C2=A0find OS libraries given the current compiler flags. =C2=A0=
*/
> +
> +@@ -1162,6 +1164,7 @@
> + =C2=A0 =C2=A0{"--print-multi-directory", "-print-multi-directory", 0},
> + =C2=A0 =C2=A0{"--print-multi-os-directory", "-print-multi-os-directory"=
, 0},
> + =C2=A0 =C2=A0{"--print-prog-name", "-print-prog-name=3D", "aj"},
> ++ =C2=A0 {"--print-sysroot", "-print-sysroot", 0},
> + =C2=A0 =C2=A0{"--print-sysroot-headers-suffix", "-print-sysroot-headers=
-suffix", 0},
> + =C2=A0 =C2=A0{"--profile", "-p", 0},
> + =C2=A0 =C2=A0{"--profile-blocks", "-a", 0},
> +@@ -3244,6 +3247,7 @@
> + =C2=A0 -print-multi-lib =C2=A0 =C2=A0 =C2=A0 =C2=A0 Display the mapping=
 between command line options and\n\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0multiple library search directories\n"), stdout)=
;
> + =C2=A0 fputs (_(" =C2=A0-print-multi-os-directory Display the relative =
path to OS libraries\n"), stdout);
> ++ =C2=A0fputs (_(" =C2=A0-print-sysroot =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Display the target libraries directory\n"), stdout);
> + =C2=A0 fputs (_(" =C2=A0-print-sysroot-headers-suffix Display the sysro=
ot suffix used to find headers\n"), stdout);
> + =C2=A0 fputs (_(" =C2=A0-Wa,<options> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Pass comma-separated <options> on to the assembler\n"), stdout);
> + =C2=A0 fputs (_(" =C2=A0-Wp,<options> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Pass comma-separated <options> on to the preprocessor\n"), stdout=
);
> +@@ -3686,6 +3690,8 @@
> + =C2=A0 =C2=A0 =C2=A0 print_multi_lib =3D 1;
> + =C2=A0 =C2=A0 =C2=A0 else if (! strcmp (argv[i], "-print-multi-director=
y"))
> + =C2=A0 =C2=A0 =C2=A0 print_multi_directory =3D 1;
> ++ =C2=A0 =C2=A0 =C2=A0else if (! strcmp (argv[i], "-print-sysroot"))
> ++ =C2=A0 =C2=A0 =C2=A0print_sysroot =3D 1;
> + =C2=A0 =C2=A0 =C2=A0 else if (! strcmp (argv[i], "-print-multi-os-direc=
tory"))
> + =C2=A0 =C2=A0 =C2=A0 print_multi_os_directory =3D 1;
> + =C2=A0 =C2=A0 =C2=A0 else if (! strcmp (argv[i], "-print-sysroot-header=
s-suffix"))
> +@@ -4126,6 +4132,8 @@
> + =C2=A0 =C2=A0 =C2=A0 ;
> + =C2=A0 =C2=A0 =C2=A0 else if (! strcmp (argv[i], "-print-multi-director=
y"))
> + =C2=A0 =C2=A0 =C2=A0 ;
> ++ =C2=A0 =C2=A0 =C2=A0else if (! strcmp (argv[i], "-print-sysroot"))
> ++ =C2=A0 =C2=A0 =C2=A0;
> + =C2=A0 =C2=A0 =C2=A0 else if (! strcmp (argv[i], "-print-multi-os-direc=
tory"))
> + =C2=A0 =C2=A0 =C2=A0 ;
> + =C2=A0 =C2=A0 =C2=A0 else if (! strcmp (argv[i], "-print-sysroot-header=
s-suffix"))
> +@@ -6529,6 +6537,18 @@
> + =C2=A0 =C2=A0 =C2=A0 return (0);
> + =C2=A0 =C2=A0 }
> +
> ++ =C2=A0if (print_sysroot)
> ++ =C2=A0 =C2=A0{
> ++ =C2=A0 =C2=A0 =C2=A0if (target_system_root)
> ++ =C2=A0 =C2=A0 =C2=A0{
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (target_sysroot_suffix)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf ("%s%s\n", target_system_root=
, target_sysroot_suffix);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf ("%s\n", target_system_root);
> ++ =C2=A0 =C2=A0 =C2=A0}
> ++ =C2=A0 =C2=A0 =C2=A0return (0);
> ++ =C2=A0 =C2=A0}
> ++
> + =C2=A0 if (print_multi_os_directory)
> + =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 if (multilib_os_dir =3D=3D NULL)
> --
> 1.7.0.4
>
>


