Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NIapq-0006EJ-Of
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 05:41:06 +0100
Received: by iwn32 with SMTP id 32so5019163iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2009 20:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ndxULoahYNUdwIV/u5FICSGB7+zFWXSNkh5h4q1xBu0=;
	b=DT1i0Ww/fRPD9nyV5NX8OXsxmdIgDFQdwiwXDfH2VTfLc7QTvqEy1ARhALeECgMfDA
	DtY3SIRR/iYXWDoiemnK6fH4QoSbNnu4uys0CAhKYxJfr5JjQXfK/Ly+PtcXfkSbaUia
	bcT47BV9KAZphrsclQoyD+v29SBOaGIYw0LZs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Es/TWX7NxPruxq0cR4s2fBjLARuvUJpavWyhDXcyoF1zxMEQeF0Wi7mL+JsmhRsbYm
	3FExHMtRg4fMEsrYmLCNEbAUnXHz3nYyxMG3I6F8thiGsfvj5ac751n63qZY5Nsfa8k3
	XmMnWc0T7rSIkzg0yN0r+kI99mkvLDzpS3+Q8=
MIME-Version: 1.0
Received: by 10.231.125.19 with SMTP id w19mr180562ibr.8.1260419960279; Wed, 
	09 Dec 2009 20:39:20 -0800 (PST)
In-Reply-To: <1260393869-8231-1-git-send-email-rep.dot.nop@gmail.com>
References: <1260393869-8231-1-git-send-email-rep.dot.nop@gmail.com>
Date: Wed, 9 Dec 2009 20:39:20 -0800
Message-ID: <19c1b8a90912092039w592aed8btf658721b77f8e646@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] binutils-2.20: remove unneeded/unwanted patches
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
X-List-Received-Date: Thu, 10 Dec 2009 04:41:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 9, 2009 at 1:24 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> Hi khem,
>
> In 33630af91d1027a91b43f697c86e809a770668e1 you (AFAICS) added
> binutils-2.20 support, yet the hunks mentioned below were already
> applied or are unneeded in that release?! How did you patch/compile
> this, perhaps i'm missing some crucial part in the setup?
> Thanks for clarification/fixing this up,

out of these three only patch which is applied right now is
binutils-arm-pr7093.patch and by nature of the patch it adds a check
and returns if true. Now that the patch it applied twice the check is done =
twice
making one redundant but not incorrect. Just existence of patch does not ap=
ply
them automatically you have to add the patches to SRC_URI in order to inclu=
de
them.

I will remove these patches from repo as they are not applied.

Thanks for it

-Khem

> Bernhard
>
> Already applied to 2.20 or unnecessary nowadays
>
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
> =C2=A0...tils-2.16.91.0.6-objcopy-rename-errorcode.patch | =C2=A0 39 ----=
----------------
> =C2=A0.../binutils-2.20/binutils-arm-pr7093.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 19 ----------
> =C2=A0.../binutils/binutils-2.20/uclibc-segfault.patch =C2=A0 | =C2=A0 23=
 ------------
> =C2=A03 files changed, 0 insertions(+), 81 deletions(-)
> =C2=A0delete mode 100644 recipes/binutils/binutils-2.20/binutils-2.16.91.=
0.6-objcopy-rename-errorcode.patch
> =C2=A0delete mode 100644 recipes/binutils/binutils-2.20/binutils-arm-pr70=
93.patch
> =C2=A0delete mode 100644 recipes/binutils/binutils-2.20/uclibc-segfault.p=
atch
>
> diff --git a/recipes/binutils/binutils-2.20/binutils-2.16.91.0.6-objcopy-=
rename-errorcode.patch b/recipes/binutils/binutils-2.20/binutils-2.16.91.0.=
6-objcopy-rename-errorcode.patch
> deleted file mode 100644
> index 8df5b1f..0000000
> --- a/recipes/binutils/binutils-2.20/binutils-2.16.91.0.6-objcopy-rename-=
errorcode.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -# strip (and objcopy) fail to set the error code if there is no
> -# output file name and the rename of the stripped (or copied) file
> -# fails, yet the command fails to do anything. =C2=A0This fixes both
> -# objcopy and strip.
> -#
> -# modification by bero: Ported to 2.16.91.0.6
> -#
> -#Signed-off-by: John Bowler <jbowler@acm.org>
> -#Signed-off-by: Bernhard Rosenkraenzer <bero@arklinux.org>
> ----
> -# binutils/objcopy.c | =C2=A0 =C2=A08 +++++---
> -# 1 file changed, 5 insertions(+), 3 deletions(-)
> -#
> -Index: src/binutils/objcopy.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- src.orig/binutils/objcopy.c =C2=A0 =C2=A0 =C2=A0 =C2=A02007-08-09 13=
:26:03.000000000 +0100
> -+++ src/binutils/objcopy.c =C2=A0 =C2=A0 2007-08-09 16:36:12.000000000 +=
0100
> -@@ -2787,8 +2787,9 @@ strip_main (int argc, char *argv[])
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (preserve_dates)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_times (tmpname, &statbuf);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (output_file !=3D tmpname)
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0smart_rename (tmpname, output_file ?=
 output_file : argv[i],
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0preserve_dates);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (smart_rename (tmpname, output_fi=
le ? output_file : argv[i],
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0preserve_dates))
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hold_status =3D 1;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D hold_status;
> - =C2=A0 =C2=A0 =C2=A0 }
> - =C2=A0 =C2=A0 =C2=A0 else
> -@@ -3411,7 +3412,8 @@ copy_main (int argc, char *argv[])
> - =C2=A0 =C2=A0 =C2=A0 if (preserve_dates)
> - =C2=A0 =C2=A0 =C2=A0 set_times (tmpname, &statbuf);
> - =C2=A0 =C2=A0 =C2=A0 if (tmpname !=3D output_filename)
> -- =C2=A0 =C2=A0 =C2=A0smart_rename (tmpname, input_filename, preserve_da=
tes);
> -+ =C2=A0 =C2=A0 =C2=A0if (smart_rename (tmpname, input_filename, preserv=
e_dates))
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D 1;
> - =C2=A0 =C2=A0 }
> - =C2=A0 else
> - =C2=A0 =C2=A0 unlink_if_ordinary (tmpname);
> diff --git a/recipes/binutils/binutils-2.20/binutils-arm-pr7093.patch b/r=
ecipes/binutils/binutils-2.20/binutils-arm-pr7093.patch
> deleted file mode 100644
> index ad4a556..0000000
> --- a/recipes/binutils/binutils-2.20/binutils-arm-pr7093.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Index: binutils/bfd/elf32-arm.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -RCS file: /cvs/src/src/bfd/elf32-arm.c,v
> -retrieving revision 1.162
> -retrieving revision 1.163
> -diff -u -r1.162 -r1.163
> ---- binutils/bfd/elf32-arm.c =C2=A0 23 Dec 2008 09:01:45 -0000 =C2=A0 =
=C2=A0 =C2=A01.162
> -+++ binutils/bfd/elf32-arm.c =C2=A0 23 Dec 2008 11:46:17 -0000 =C2=A0 =
=C2=A0 =C2=A01.163
> -@@ -4608,6 +4608,10 @@
> - =C2=A0 Elf_Internal_Shdr *hdr;
> - =C2=A0 unsigned int i, localsyms;
> -
> -+ =C2=A0/* PR 7093: Make sure that we are dealing with an arm elf binary=
. =C2=A0*/
> -+ =C2=A0if (! is_arm_elf (abfd))
> -+ =C2=A0 =C2=A0return;
> -+
> - =C2=A0 if ((abfd->flags & DYNAMIC) !=3D 0)
> - =C2=A0 =C2=A0 return;
> -
> diff --git a/recipes/binutils/binutils-2.20/uclibc-segfault.patch b/recip=
es/binutils/binutils-2.20/uclibc-segfault.patch
> deleted file mode 100644
> index 16a875f..0000000
> --- a/recipes/binutils/binutils-2.20/uclibc-segfault.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -upstream: already committed
> -
> ---- clean/binutils-2.19.51/bfd/elf32-arm.c =C2=A0 =C2=A0 2009-05-22 12:5=
8:44.000000000 +0100
> -+++ binutils-2.19.51/bfd/elf32-arm.c =C2=A0 2009-06-08 21:29:49.00000000=
0 +0100
> -@@ -8960,7 +8964,7 @@ elf32_arm_fix_exidx_coverage (asection *
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct bfd_elf_section_data *elf_sec =3D el=
f_section_data (sec);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 Elf_Internal_Shdr *hdr =3D &elf_sec->this_h=
dr;
> -
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr->sh_type !=3D SHT_ARM_EXIDX)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!hdr || hdr->sh_type !=3D SHT_ARM_EXIDX=
)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (elf_sec->linked_to)
> ---- clean/binutils-2.19.51/ld/emultempl/armelf.em =C2=A0 =C2=A0 =C2=A020=
09-05-22 12:58:45.000000000 +0100
> -+++ binutils-2.19.51/ld/emultempl/armelf.em =C2=A0 =C2=A02009-06-08 21:2=
6:34.000000000 +0100
> -@@ -309,6 +309,7 @@ gld${EMULATION_NAME}_finish (void)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asection *out_sec =3D sec->ou=
tput_section;
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (out_sec
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& elf_section_=
data (sec)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 && elf_section_=
type (sec) =3D=3D SHT_PROGBITS
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 && (elf_section=
_flags (sec) & SHF_EXECINSTR) !=3D 0
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 && (sec->flags =
& SEC_EXCLUDE) =3D=3D 0
> --
> 1.6.5.2
>
>


