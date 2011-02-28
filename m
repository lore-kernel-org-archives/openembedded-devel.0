Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuBq8-0000al-9V
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 23:45:16 +0100
Received: by fxm8 with SMTP id 8so4051716fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 14:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Onqz91TulIBETKZtBPC6pcHuGiB7kuQWJn6WrCx88dg=;
	b=Q+xYvbVWw0SNhjtar99U4QrLuysMcSw4qnekk5KzpdNyCyvR5oLSzMUkqjCbVCJPsM
	X49ghRNY698gHXuNxgJ0imG+28Nn++tvMi1s1gyOOVJ9ndQUAJerB379Yw7z2DAn9e+1
	IoRXtO7bGX5g59UxUUuw+zVfLnfcKsRgr0fOU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=m5mXa+00cVgZYSk0v/I3U5TZEm+zNgyZNgx5SPuAF+9XNV+Opeh0ZKpV57myv5DmQL
	KZ/dPUbY0IfGUYaV3qnO5gVnIy5uhAxEOAKlCkuV5YImfEwVf4d1qKJ17d3IsaeEwo8f
	HWpfKEm48SzzBHu6PTR5HldQmMaScXHyQQHts=
Received: by 10.223.100.2 with SMTP id w2mr7124579fan.115.1298933031084; Mon,
	28 Feb 2011 14:43:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Mon, 28 Feb 2011 14:43:31 -0800 (PST)
In-Reply-To: <AANLkTin2MszEwNwiNQuZ+uWBFE5Gd_Coq08AfRLF1dqc@mail.gmail.com>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
	<1298664057.3818.0.camel@lenovo.internal.reciva.com>
	<AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
	<1298666406.3818.4.camel@lenovo.internal.reciva.com>
	<AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
	<1298669695.3818.5.camel@lenovo.internal.reciva.com>
	<AANLkTi=afktV1HC4Jdq_ammNdA+h4iMAWdJT809s+LMv@mail.gmail.com>
	<1298905700.23547.6.camel@phil-desktop>
	<AANLkTimyU4bSm9tM2LO5bMoqiFQqZXxt5Js7fg0B_HhJ@mail.gmail.com>
	<1298913422.23547.20.camel@phil-desktop>
	<AANLkTimomznky1rBn5QTqzS16O6Lk3VxHUx1pG+ULe3v@mail.gmail.com>
	<AANLkTikRm=aL7sgc2wNftMGhNsOiXbSyoaht4Yk_2uqZ@mail.gmail.com>
	<AANLkTin2MszEwNwiNQuZ+uWBFE5Gd_Coq08AfRLF1dqc@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2011 14:43:31 -0800
Message-ID: <AANLkTin+kSSQr8FHwGHA0znzWDxUfQoY-=-0K8Fv0PKj@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Mon, 28 Feb 2011 22:45:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 2:27 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Feb 28, 2011 at 22:19, Khem Raj <raj.khem@gmail.com> wrote:
> ...
>> Does -pthread get passed to linking step too or not. if it does then
>> it might the order at which libpthread appears and linker picks the
>> symbols from.
>
> It is done as suggested by gcc docs. It is passed on CFLAGS and
> supposely gcc ought to take care of adding it to linking flags
> automatically. No?

gcc could be used for linking too and then it should consider the LDFLAGS
CFLAGS are for compiling.

>
> --
> Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=C2=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0http://projetos.ossystems.com.br
>


