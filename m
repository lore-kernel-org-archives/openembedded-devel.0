Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuBSi-00083U-J6
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 23:21:04 +0100
Received: by fxm8 with SMTP id 8so4031706fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 14:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=XE554riPHUiZrvedxvQZ9c6RRspNPpY7jZmhDfu6nEw=;
	b=bfv2uy36Gw7Rri8SP38lQNCtwZgV7OeS3r7tYyOVskWKW5vVs6aAPPsffyFSMctD3+
	MbPObM8PLXM+/YK4maUOMYg8kRpqVFv8YZ7sx7FjrhKKTkgpSVMfOfhdfdiXLdmaD5hT
	pXT2myE5bktFvV8lhVqTblMF/H5M83q8nBRJE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=GddKfyW6teesRmFIn8KSQOi9SpW2RYCmXuXQRRi9RzbrpTJh0iYWyQjS0rC/c6nGcV
	VMAYTOXJ/xiEEMnvP0Go0kdIJ2lpOd09FFIJU9ontQHE7qc8Rkgd9ZfkN3vBExiEb0fu
	JIy8aSilV+kMD7lMrojuRY8EQLHKzcFOLD2F8=
Received: by 10.223.101.206 with SMTP id d14mr7175043fao.134.1298931578094;
	Mon, 28 Feb 2011 14:19:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Mon, 28 Feb 2011 14:19:18 -0800 (PST)
In-Reply-To: <AANLkTimomznky1rBn5QTqzS16O6Lk3VxHUx1pG+ULe3v@mail.gmail.com>
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
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2011 14:19:18 -0800
Message-ID: <AANLkTikRm=aL7sgc2wNftMGhNsOiXbSyoaht4Yk_2uqZ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Mon, 28 Feb 2011 22:21:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 11:33 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Feb 28, 2011 at 17:17, Phil Blundell <philb@gnu.org> wrote:
> ...
>> That's definitely not a patch that you ought to check in, though. =C2=A0=
For
>> wider consumption I guess there ought to be some kind of knob that
>> DISTROs can tweak to select the linker of their choice. =C2=A0As far as =
I
>> know there isn't any such mechanism at present.
>
> One interesting way to "fix" the issue is to explicitly link against
> -lpthread however it seems *wrong*.
>
> It seems to be a gcc bug since -pthread is suppose to handle all the
> needed background for it to work and seems to be doing it wrong.
>

Does -pthread get passed to linking step too or not. if it does then
it might the order at which libpthread appears and linker picks the
symbols from.

> --
> Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=C2=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


