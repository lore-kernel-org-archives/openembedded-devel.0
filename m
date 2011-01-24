Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhOeM-0004im-Lr
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 16:48:14 +0100
Received: by yxd5 with SMTP id 5so1470125yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=SWk9Er0b8vST1e1yWcq/GvTdfP0P69B/Fvity5/0Bkk=;
	b=ZAlysIYUFQ4/1rnvcKeeGHgCSRS9RyXmbfEC6A8iLt5Z4Pbc/40myqaKtAQq+H20OJ
	PWReb1ZhMDw189e4+iSudegOUjzCamXRh+fGOYNq5EK2kimN7SAkgPIQDlzS6s3Ubo/A
	cRYUqMc5xa5ZFEiEVcrUp+d9DvsxZryEZ15fg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=DeQAMSHhX0qnfT/FvErJHqwDkIxb7S7xYL0O9l7aAZ0mxly/QADphiLLBjtcl49C7F
	/gzeFD4c7AY0bcGD+r0p2Q2ijvrSw04YZLiyR7VENviiE/1D8Q8xEW5YFC1ATaC+zEeU
	tZR11IQcgOrMtsEJpHn/YivXmNXCH7kSYrBbM=
Received: by 10.42.173.198 with SMTP id s6mr4996246icz.206.1295884047904; Mon,
	24 Jan 2011 07:47:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Mon, 24 Jan 2011 07:47:07 -0800 (PST)
In-Reply-To: <97b6dd6720dcdcdbd27616740b3707bc108a4927.1295880053.git.vjaquez@igalia.com>
References: <cover.1295880053.git.vjaquez@igalia.com>
	<97b6dd6720dcdcdbd27616740b3707bc108a4927.1295880053.git.vjaquez@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jan 2011 07:47:07 -0800
Message-ID: <AANLkTi=RgH9E_BoebNBxTqfB4AktF1M1npuAqfxz8To4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@openembedded.org>, Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH 1/2] u-boot-sakoman: fix break caused by the new binutils
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
X-List-Received-Date: Mon, 24 Jan 2011 15:48:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2011/1/24 V=C3=ADctor Manuel J=C3=A1quez Leal <vjaquez@igalia.com>:
> New assemblers need -march=3Darmv7-a+sec on command line or .arch_extensi=
on sec
> inline to enable use of the smc instruction.
>
> This patch adds as-instr to check the latter to conditionally enable the
> former in AFLAGS for files that use smc.
>
> Signed-off-by: V=C3=ADctor Manuel J=C3=A1quez Leal <vjaquez@igalia.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../fix-break-caused-by-new-binutils.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 31 ++++++++++++++++++++
> =C2=A0recipes/u-boot/u-boot-sakoman_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A02 files changed, 32 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/u-boot/u-boot-sakoman/fix-break-caused-b=
y-new-binutils.patch
>
> diff --git a/recipes/u-boot/u-boot-sakoman/fix-break-caused-by-new-binuti=
ls.patch b/recipes/u-boot/u-boot-sakoman/fix-break-caused-by-new-binutils.p=
atch
> new file mode 100644
> index 0000000..16bc980
> --- /dev/null
> +++ b/recipes/u-boot/u-boot-sakoman/fix-break-caused-by-new-binutils.patc=
h
> @@ -0,0 +1,31 @@
> +Index: git/arch/arm/cpu/armv7/omap4/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/arch/arm/cpu/armv7/omap4/Makefile
> ++++ git/arch/arm/cpu/armv7/omap4/Makefile
> +@@ -26,6 +26,8 @@ include $(TOPDIR)/config.mk
> + LIB =C2=A0 =3D =C2=A0$(obj)lib$(SOC).o
> +
> + SOBJS +=3D lowlevel_init.o
> ++plus_sec :=3D $(call as-instr,.arch_extension sec,+sec)
> ++lowlevel_init.o: AFLAGS +=3D -Wa,-march=3Darmv7-a$(plus_sec)
> +
> + COBJS +=3D board.o
> + COBJS +=3D mem.o
> +Index: git/config.mk
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/config.mk
> ++++ git/config.mk
> +@@ -266,3 +266,13 @@ cmd_link_o_target =3D $(if $(strip $1),\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
m -f $@; $(AR) rcs $@ )
> +
> + #######################################################################=
##
> ++
> ++# Tries to compile an assembly instruction
> ++as-instr =3D $(shell if echo -e "$(1)" | \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(AFLAGS) -c -xassemble=
r - \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -o $(TMPOUT)astest$$$$.out >=
 /dev/null 2>&1; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 then rm $(TMPOUT)astest$$$$.out; echo "$(2=
)"; \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 else echo "$(3)"; fi)
> ++
> ++#######################################################################=
##
> ++
> diff --git a/recipes/u-boot/u-boot-sakoman_git.bb b/recipes/u-boot/u-boot=
-sakoman_git.bb
> index 5b9ff11..8dfe713 100644
> --- a/recipes/u-boot/u-boot-sakoman_git.bb
> +++ b/recipes/u-boot/u-boot-sakoman_git.bb
> @@ -7,6 +7,7 @@ SRCREV =3D "261733408a27d14590cf3ec6b596461808050e32"
> =C2=A0PV =3D "2010.12+${PR}+git${SRCREV}"
>
> =C2=A0SRC_URI =3D "git://www.sakoman.com/git/u-boot.git;branch=3Domap4-ex=
p;protocol=3Dgit \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-break-caused-by-new-binuti=
ls.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> =C2=A0S =3D "${WORKDIR}/git"
>
> --
> 1.7.0.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


