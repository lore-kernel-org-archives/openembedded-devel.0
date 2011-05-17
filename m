Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMToa-0000gm-CT
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 May 2011 01:36:36 +0200
Received: by eye27 with SMTP id 27so308620eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 16:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=StInA6nE0Fp1W7bz26lby2KWn9rKAz9ttKQpbDK3QFo=;
	b=Rx7z3MFmI1SqidwcFAYw4uAMMVOoGVsdtlEkZgnveYXiW/yDP6g56TgMcjqjpwCRty
	W9S+lZi28WKz2RqVzfMyT8GycPmlkDlCovch5ZJqyJhU40RT+I2m9mhiFQKzTI5VsPcb
	1I68O6Qqy9zkPCw3mMwiniVgdfDvfW5sTDUcI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Zxrz+ncBmG4FMw0Avj6+O9+gRTssFwVE0uYBy4VKohDD6aWyUwhKS9iD1snomORSaO
	zajFxFc9BishEv4LXykqesKpYsQrHrfaKrX7Sa2JjzZHMdzWzkgVBwIXmM8emkHz+rEP
	XAP0Qe6iUKEM8FfVvdSSbNC1OdQVfzkyt9xWk=
Received: by 10.14.119.1 with SMTP id m1mr407830eeh.44.1305675222106; Tue, 17
	May 2011 16:33:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Tue, 17 May 2011 16:33:12 -0700 (PDT)
In-Reply-To: <BANLkTi=KDUTnmP8aL-PVA1p-Q5ND+QvGQA@mail.gmail.com>
References: <1305663890-20372-1-git-send-email-raj.khem@gmail.com>
	<BANLkTinDjxwtBSQkQ-fbAKxR7JzNiaAo+A@mail.gmail.com>
	<BANLkTik+RLj1jUVOdAXQ8LLpRRqiZXzTtQ@mail.gmail.com>
	<BANLkTi=KDUTnmP8aL-PVA1p-Q5ND+QvGQA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 May 2011 16:33:12 -0700
Message-ID: <BANLkTi=cb4EVQH+b4vFQWATCw8m+Ghne6g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] uclibc_git.bb: inherit gitpkgv to get PV
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
X-List-Received-Date: Tue, 17 May 2011 23:36:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 2:37 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, May 17, 2011 at 18:25, Khem Raj <raj.khem@gmail.com> wrote:
>>> Is it working for you? here, with freerdp, it doesn't.xi
>>
>> hmmm it works fine when I have existing git repo but moment I use a diff=
erent
>> SRCREV I start getting 0.0.0
>
> It used to work quite well with OE (dev) but with OE-core it is
> failing; I think it might be related to changes on bitbake.
>

and FILESPATHPKG need porting over to oe as well

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


