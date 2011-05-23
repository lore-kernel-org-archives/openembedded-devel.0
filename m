Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOa7P-0001Q0-Tn
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 20:44:44 +0200
Received: by ewy5 with SMTP id 5so1929416ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 11:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=AiueKtns8zlM/0wfaBUN3NZqITAGKpTH/VaSrL+m8hY=;
	b=m24ekjA5oVQ7qNVi/pYXGI5uKIy4ej9668vB7ycskUwVBqWWk1Y9q6sHw21Nzc+CJv
	vByhc2WXv75gL5OQQ81m7pncaRmqjn1H4+9IKVi2fCX6PcNnFETQDzh9zTdVNNoPMebR
	67QVY9vL2d3UQiwuuEpp1dIQvQL/e8hIhiSCU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=FHhm9Z1d3xeWRJgmLgRIMdSzuR8rWbYBSmhv1L7BS8RJK6hki+JhiZR4W6O8SjSObw
	OeoSibHCZHuZuMnME2tfMay9MB1Tu456Z/pNlZb/tsG9b/3krjevbgfHxvTlrlOuXdlS
	M093aCuw5JVj2PtFf7NXPUS7GDisKkWKfwLhQ=
Received: by 10.14.119.1 with SMTP id m1mr937157eeh.44.1306176103202; Mon, 23
	May 2011 11:41:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Mon, 23 May 2011 11:41:12 -0700 (PDT)
In-Reply-To: <ire54d$f35$1@dough.gmane.org>
References: <1306170935-13946-1-git-send-email-raj.khem@gmail.com>
	<ire54d$f35$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 May 2011 11:41:12 -0700
Message-ID: <BANLkTi=ghQTeQVZ6NJaYmMPcmZ=gLP-3UQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] uclibc: Recipes are moved to openembedde-core layer
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
X-List-Received-Date: Mon, 23 May 2011 18:44:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2011 at 10:22 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 23-05-11 19:15, raj.khem@gmail.com wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta-oe/recipes-core/uclibc/site_config/funcs =C2=A0 =C2=A0 =C2=A0=
| =C2=A0474 --
>> =C2=A0meta-oe/recipes-core/uclibc/site_config/headers =C2=A0 =C2=A0| =C2=
=A0156 -
>> =C2=A0meta-oe/recipes-core/uclibc/site_config/types =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 21 -
>> =C2=A0meta-oe/recipes-core/uclibc/uClibc.distro =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0157 -
>> =C2=A0meta-oe/recipes-core/uclibc/uclibc-config.inc =C2=A0 =C2=A0 =C2=A0=
| =C2=A0116 -
>> =C2=A0.../uclibc/uclibc-git/argp-headers.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0581 ---
>> =C2=A0.../uclibc/uclibc-git/argp-support.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 5189 --------------------
>> =C2=A0.../uclibc/uclibc-git/arm/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 69 -
>> =C2=A0.../uclibc/uclibc-git/armeb/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 53 -
>> =C2=A0.../uclibc/uclibc-git/armv5te/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 76 -
>> =C2=A0.../uclibc/uclibc-git/detect-bx-availibility.patch | =C2=A0 75 -
>> =C2=A0.../uclibc/uclibc-git/efika/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 45 -
>> =C2=A0.../uclibc/uclibc-git/i386/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 59 -
>> =C2=A0.../uclibc/uclibc-git/i486/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 62 -
>> =C2=A0.../uclibc/uclibc-git/i586/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 62 -
>> =C2=A0.../uclibc/uclibc-git/i686/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 59 -
>> =C2=A0.../uclibc/uclibc-git/include-arm-asm.h.patch =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 65 -
>> =C2=A0...so_use_arm_dl_linux_resolve_in_thumb_mode.patch | =C2=A0 21 -
>> =C2=A0.../uclibc/uclibc-git/mips64/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 63 -
>> =C2=A0.../uclibc/uclibc-git/mipsel/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 63 -
>> =C2=A0.../uclibc/uclibc-git/nslu2be/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 73 -
>> =C2=A0.../uclibc/uclibc-git/powerpc/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 46 -
>> =C2=A0.../uclibc/uclibc-git/powerpc_copysignl.patch =C2=A0 =C2=A0 =C2=A0=
| =C2=A0107 -
>> =C2=A0.../uclibc/uclibc-git/qemuarm/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 76 -
>> =C2=A0.../uclibc/uclibc-git/qemumips/uClibc.machine =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 63 -
>> =C2=A0.../uclibc/uclibc-git/qemux86/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 59 -
>> =C2=A0.../uclibc-git/remove-eabi-oabi-selection.patch =C2=A0 =C2=A0| =C2=
=A0 91 -
>> =C2=A0.../uclibc-git/remove-sub-arch-variants.patch =C2=A0 =C2=A0 =C2=A0=
| =C2=A0215 -
>> =C2=A0.../uclibc-git/remove_attribute_optimize_Os.patch =C2=A0| =C2=A018=
6 -
>> =C2=A0.../uclibc/uclibc-git/reorder-use-BX.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 72 -
>> =C2=A0.../uclibc/uclibc-git/select-force-thumb.patch =C2=A0 =C2=A0 | =C2=
=A0172 -
>> =C2=A0.../uclibc/uclibc-git/sh4/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 48 -
>> =C2=A0.../uclibc-git/transform-eabi-oabi-choice.patch =C2=A0 =C2=A0| =C2=
=A0 71 -
>> =C2=A0.../recipes-core/uclibc/uclibc-git/uClibc.distro =C2=A0 | =C2=A016=
0 -
>> =C2=A0.../uclibc/uclibc-git/uclibc-arm-ftruncate64.patch | =C2=A0 13 -
>> =C2=A0.../uclibc-git/uclibc_enable_log2_test.patch =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 30 -
>> =C2=A0.../uclibc/uclibc-git/x86_64/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 42 -
>> =C2=A0meta-oe/recipes-core/uclibc/uclibc-initial_git.bb =C2=A0| =C2=A0 3=
9 -
>> =C2=A0meta-oe/recipes-core/uclibc/uclibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0215 -
>> =C2=A0meta-oe/recipes-core/uclibc/uclibc_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 31 -
>> =C2=A040 files changed, 0 insertions(+), 9275 deletions(-)
>
> Do you really want to delete them, or do you want keep them to provide a
> staging area for changes flowing into oe-core?

I think having same version in two places can create confusion thats
why I was removing them from meta-oe


> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFN2pfNMkyGM64RGpERAiO9AKCa3F4M6BQczpV6JNiUv8nrSPPIJwCfbXDc
> O9LVvVLwgWHEGvedp8X5A3c=3D
> =3Ds3ms
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


