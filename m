Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhOfN-0004ks-KY
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 16:49:18 +0100
Received: by iwn8 with SMTP id 8so4601035iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 07:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Cy8hzpP055gURaJFmy+RvlP7kP1tTph5dh8cbdh6BS4=;
	b=im403KnWy8Yp69WMfeFYa+qovrnKolVQdmSCHachR/vhLZg7Czzsngl9ZLoYsfqCaD
	++Ow8Gn7FXW0WzWLJ8j2tK2TNT1OxpIxM2WbaE9mkN1Waw9HYAlDK/hhU36YkqbmPz9g
	JDdiA+pbkSeRF7GKDk5Rn3yNgcEgfdhVk0CxA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=H3FqOQtMDQrTurx9tCL+NC8YTfbj86MjLUNEznA0VzCF0QczcjzbXeXpQzukpD2Ij3
	JmG7k3/NO1Wdzl/QUWG34IMIGZG0vSyWTR/ldOcIuZmAge9hjJobCS4/qBAAHhwbSfJW
	rW1FZKE+NklnGxk6DX5UENDOo/Y4ufx/5ZLkc=
Received: by 10.42.176.129 with SMTP id be1mr5005304icb.139.1295884109345;
	Mon, 24 Jan 2011 07:48:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Mon, 24 Jan 2011 07:48:09 -0800 (PST)
In-Reply-To: <d51a8cfd5ef81f649c82d490a2b9359c47735250.1295880053.git.vjaquez@igalia.com>
References: <cover.1295880053.git.vjaquez@igalia.com>
	<d51a8cfd5ef81f649c82d490a2b9359c47735250.1295880053.git.vjaquez@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jan 2011 07:48:09 -0800
Message-ID: <AANLkTinMDTBOJD6WE09HaqXedWau8r_PURYUMxhNM5WN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@openembedded.org>, Koen Kooi <k-kooi@ti.com>
Subject: Re: [PATCH 2/2] linux-omap4: fix break caused by the new binutils
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
X-List-Received-Date: Mon, 24 Jan 2011 15:49:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2011/1/24 V=C3=ADctor Manuel J=C3=A1quez Leal <vjaquez@igalia.com>:
> According to this discussion [1], a couple patches where required by the
> kernel using the latest binutils (2.21).
>
> This patch add those patches, which were posted in the Ubuntu's kernel
> repository.
>
> 1. http://comments.gmane.org/gmane.comp.handhelds.openembedded/40650
>
> Signed-off-by: V=C3=ADctor Manuel J=C3=A1quez Leal <vjaquez@igalia.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0...TU-Config-Fix-FTBS-caused-by-new-binutils.patch | =C2=A0 38 ++++=
++++++++++++++++
> =C2=A0...0002-Add-AFLAGS-for-sleep44xx-to-fix-FTBS.patch | =C2=A0 26 ++++=
+++++++++
> =C2=A0recipes/linux/linux-omap4_2.6.35.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A03 files changed, 66 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/linux/linux-omap4/0001-UBUNTU-Config-Fix=
-FTBS-caused-by-new-binutils.patch
> =C2=A0create mode 100644 recipes/linux/linux-omap4/0002-Add-AFLAGS-for-sl=
eep44xx-to-fix-FTBS.patch
>
> diff --git a/recipes/linux/linux-omap4/0001-UBUNTU-Config-Fix-FTBS-caused=
-by-new-binutils.patch b/recipes/linux/linux-omap4/0001-UBUNTU-Config-Fix-F=
TBS-caused-by-new-binutils.patch
> new file mode 100644
> index 0000000..e83a3e2
> --- /dev/null
> +++ b/recipes/linux/linux-omap4/0001-UBUNTU-Config-Fix-FTBS-caused-by-new=
-binutils.patch
> @@ -0,0 +1,38 @@
> +From 7699704e011db864c56f333bce9936a36522fb79 Mon Sep 17 00:00:00 2001
> +From: Tim Gardner <tim.gardner@canonical.com>
> +Date: Thu, 9 Dec 2010 08:16:52 -0700
> +Subject: [PATCH 1/2] UBUNTU: [Config] Fix FTBS caused by new binutils
> +
> +New assemblers need -march=3Darmv7-a+sec on command line or
> +.arch_extension sec inline to enable use of the smc instruction.
> +
> +This patch uses as-instr to check the latter to conditionally
> +enable the former in AFLAGS for files that use smc.
> +
> +Checked on both old and new binutils to verify that it does
> +not break old versions.
> +
> +Signed-off-by: John Rigby <john.rigby@linaro.org>
> +Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
> +---
> + arch/arm/mach-omap2/Makefile | =C2=A0 =C2=A04 +++-
> + 1 files changed, 3 insertions(+), 1 deletions(-)
> +
> +diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
> +index 75251b4..0241b4d 100644
> +--- a/arch/arm/mach-omap2/Makefile
> ++++ b/arch/arm/mach-omap2/Makefile
> +@@ -29,7 +29,9 @@ obj-$(CONFIG_HOTPLUG_CPU) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0+=3D omap-hotplug.o
> + obj-$(CONFIG_ARCH_OMAP4) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0+=3D omap44xx-smc.o omap4-common.o \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0omap4-wakeupgen.o
> +
> +-AFLAGS_omap44xx-smc.o =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 :=3D-Wa,-march=3Darmv7-a
> ++plus_sec :=3D $(call as-instr,.arch_extension sec,+sec)
> ++AFLAGS_omap-headsmp.o =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0:=3D-Wa,-march=3Darmv7-a$(plus_sec)
> ++AFLAGS_omap44xx-smc.o =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0:=3D-Wa,-march=3Darmv7-a$(plus_sec)
> +
> + # Functions loaded to SRAM
> + obj-$(CONFIG_ARCH_OMAP2420) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D sra=
m242x.o
> +--
> +1.7.0.2
> +
> diff --git a/recipes/linux/linux-omap4/0002-Add-AFLAGS-for-sleep44xx-to-f=
ix-FTBS.patch b/recipes/linux/linux-omap4/0002-Add-AFLAGS-for-sleep44xx-to-=
fix-FTBS.patch
> new file mode 100644
> index 0000000..ea16ab1
> --- /dev/null
> +++ b/recipes/linux/linux-omap4/0002-Add-AFLAGS-for-sleep44xx-to-fix-FTBS=
.patch
> @@ -0,0 +1,26 @@
> +From da58d36fb6b13899249bf1efbf25f7385d048bb3 Mon Sep 17 00:00:00 2001
> +From: Tim Gardner <tim.gardner@canonical.com>
> +Date: Tue, 14 Dec 2010 06:56:34 -0700
> +Subject: [PATCH 2/2] Add AFLAGS for sleep44xx to fix FTBS
> +
> +Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
> +---
> + arch/arm/mach-omap2/Makefile | =C2=A0 =C2=A02 ++
> + 1 files changed, 2 insertions(+), 0 deletions(-)
> +
> +diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
> +index 0241b4d..865a3e2 100644
> +--- a/arch/arm/mach-omap2/Makefile
> ++++ b/arch/arm/mach-omap2/Makefile
> +@@ -59,6 +59,8 @@ obj-$(CONFIG_ARCH_OMAP4) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 +=3D pm44xx.o pm_bus.o cpuidle44xx.o \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0omap4-mpuss-lowpower.o sleep44xx.o \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0voltage.o opp44xx_data.o
> +
> ++AFLAGS_sleep44xx.o =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0:=3D-Wa,-march=3Darmv7-a$(plus_sec)
> ++
> + obj-$(CONFIG_PM_DEBUG) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D pm-debug.o
> + obj-$(CONFIG_OMAP_SMARTREFLEX) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D s=
r_device.o smartreflex.o
> + obj-$(CONFIG_OMAP_SMARTREFLEX_CLASS3) +=3D smartreflex-class3.o
> +--
> +1.7.0.2
> +
> diff --git a/recipes/linux/linux-omap4_2.6.35.3.bb b/recipes/linux/linux-=
omap4_2.6.35.3.bb
> index 4db0b28..f5a11f4 100644
> --- a/recipes/linux/linux-omap4_2.6.35.3.bb
> +++ b/recipes/linux/linux-omap4_2.6.35.3.bb
> @@ -15,6 +15,8 @@ SRC_URI =3D "git://dev.omapzoom.org/pub/scm/integration=
/kernel-ubuntu.git;protocol
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-ARM-Add-option-to-al=
low-userspace-access-to-performa.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-OMAP4-do-not-force-s=
elect-options-which-are-not-requ.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-omap4-pandaboard-add=
-support-for-DVI-output.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-UBUNTU-Config-Fix-FTBS-ca=
used-by-new-binutils.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Add-AFLAGS-for-sleep44xx-=
to-fix-FTBS.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defconfig"
>
> =C2=A0S =3D "${WORKDIR}/git"
> --
> 1.7.0.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


