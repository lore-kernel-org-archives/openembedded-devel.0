Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PbI14-0008HN-Sj
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 20:30:27 +0100
Received: by yie16 with SMTP id 16so4861563yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 11:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=X6qvLB+sPSYdS8aE6qvkk7bWBSlUYhEpIi7sZqs3Fh0=;
	b=ll0rkvvSwwAgZVVRetiycIE0VbdmqCByH1H9J4cIEuBa9QOD1B3vi5+KnW/192rH5l
	iSMxFM52YvEcCt3ygokvcH5GdI6/Z0p7XNVcG0NF9ipGgZPved7u3ligeepoVJrFqbwT
	4TlbYV8Z7D4fayhpi154XBarXN77WKLg5DF6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ns9p8JdEdBVmVgNC0ZN+wWXg1Y80C0WG31pHYCjpqU0cwRCNI9njABNXzdCBHeED4z
	MlpJNZw9E7GBk4VtWdRz4y6eYcG/NIR/6gF0hyWodXwkBDHFGqFFZHk9gSJLh36i+X3u
	Z9NeWjMMefCLK5TsRAlBNqHWzKtMLKTAzBT5I=
Received: by 10.90.10.21 with SMTP id 21mr3688150agj.112.1294428600114; Fri,
	07 Jan 2011 11:30:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 7 Jan 2011 11:29:39 -0800 (PST)
In-Reply-To: <AANLkTi=SAg9i3VVH4Ac81ap0EtjXuMhs918uPyEsCknv@mail.gmail.com>
References: <1294392497-24747-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=UUDxkTNDoWBoOxaCPDyupG8BazYtt6nGs3-7E@mail.gmail.com>
	<4D272079.5000402@opendreambox.org>
	<AANLkTikTFe9ytvKcD1T=_L8GFiPo5bqBQ2o29McmzYU4@mail.gmail.com>
	<AANLkTi=SAg9i3VVH4Ac81ap0EtjXuMhs918uPyEsCknv@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jan 2011 11:29:39 -0800
Message-ID: <AANLkTimTMhbbVskXqkdejGREQFhZe8aayNY8S2D_8L6C@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Make it configurable by tuning eglibc options
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
X-List-Received-Date: Fri, 07 Jan 2011 19:30:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 7, 2011 at 10:15 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Jan 7, 2011 at 15:30, Khem Raj <raj.khem@gmail.com> wrote:
>>> Maybe it would be better to introduce EGLIBC_FEATURES and
>>> BUSYBOX_FEATURES, possibly presetting some values with options already
>>> present in DISTRO_FEATURES.
>>>
>>
>> I think it can get to many knobs and confusion in settings. With
>> system library any feature en|disable
>> is system =C2=A0wide so having it as a distro policy is right way to go =
imo.
>
> We can use DISTRO_EGLIBC_FEATURES or DISTRO_LIBC_FEATURES (so we can
> add to uclibc support for it too). Spliting it from DISTRO_FEATURES
> makes sense IMO since we'd use the same concept to recipes (as
> busybox) that are ofthen customized.

so what would be difference between DISTRO_FEATURES and DISTRO_EGLIBC_FEATU=
RES
and what will be their relation

>
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


