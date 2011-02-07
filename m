Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PmYls-0004QE-8u
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 22:37:20 +0100
Received: by gwaa12 with SMTP id a12so1943377gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Feb 2011 13:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=Q5QSud6vTkdu4chEUaa08MKSG18KL+Bi7VMU4vubHWE=;
	b=jPBW5evF3k+Oi7ceG5xopxneLZB5PydRd+A1g1/95pr1fh4g+/UkSD4GgjKv3L0gDk
	9WfKh/Wy5SdLNgdT/EpJHfgZaPsmtyoupDJOurxoATtBo/enhSaCWh5At12HdLfVXKbc
	QoguSTd2So+Lcu3zjP1VhXutIOPkXPwzmuljs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=FexSlTopAipnPLFpUbq2YD+ld2zToYtHLV0vziI/4f19Axp19lmxYOtnZDX5tr6YZ7
	F0QVWQjJQegoXqXuhW+ug4lpMOdXnnaF2/6sjWtEIoE2Zk2VhQrawm1bHtjS1m0bhl5L
	YDIvjB4N0YMiYsnWEg8ZpaaGWV1K+wJSsLv44=
Received: by 10.90.84.2 with SMTP id h2mr9913800agb.7.1297114578107; Mon, 07
	Feb 2011 13:36:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Mon, 7 Feb 2011 13:35:57 -0800 (PST)
In-Reply-To: <ly39nzk1bs.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1297093986-24331-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<AANLkTinsSoak9h=B+TQEzoUvWSP+MVELZQkTFRu3PTOQ@mail.gmail.com>
	<ly39nzk1bs.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Feb 2011 13:35:57 -0800
Message-ID: <AANLkTinM02m9A04F+UrNY_E_HauTHD=SgS6=CeSkH_8V@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] cortex-m3: adjusted target cflags
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
X-List-Received-Date: Mon, 07 Feb 2011 21:37:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2011 at 12:59 PM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Khem Raj <raj.khem@gmail.com> writes:
>
>>> The '-mcpu=3Dcortex-m3' is shorter than '-march=3Darmv7-m -mtune=3Dcort=
ex-m3'
>>> and enables workarounds like '-mfix-cortex-m3-ldrd'.
>>
>> Does -mcpu=3Dcortex-m3 also cause gcc to tune for cortex-m3 ?
>
> Yes; logic in gcc/config/arm/arm.c is:
>
> | =C2=A0 =C2=A0if (i =3D=3D ARM_OPT_SET_CPU || i =3D=3D ARM_OPT_SET_TUNE)
> | =C2=A0 =C2=A0 =C2=A0arm_tune =3D (enum processor_type) (sel - ptr->proc=
essors);
> |
> | =C2=A0 =C2=A0if (i =3D=3D ARM_OPT_SET_ARCH)
> | =C2=A0 =C2=A0 =C2=A0target_arch_cpu =3D sel->core;
> |
> | =C2=A0 =C2=A0if (i =3D=3D ARM_OPT_SET_CPU)
> | =C2=A0 =C2=A0 =C2=A0selected_cpu =3D (enum processor_type) (sel - ptr->=
processors);
>
> '-mcpu' causes the highest optimization level (both for the used instruct=
ion
> set (--> '-march') and the "soft" optimizations (--> '-mcpu')).

OK that seems better. Can you check what does gcc emits in an assembly file
when using -mcpu=3Dcortex-m3 in your case. If it emits sdiv instruction or =
not

int foo (long a, long b)
{
        return a/b;
}


Acked-by: Khem Raj <raj.khem@gmail.com>

>
>
>
> Enrico
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


