Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PgjT4-0005Tv-Gy
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 20:49:51 +0100
Received: by yie16 with SMTP id 16so984954yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 11:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=iOCqqm7DGeJrHSqg8TnwO0BIZAwmwsrEcgjUwdKyHBg=;
	b=gnCh2cdALjS62eMTRQrUk4Red6L3RyVh37j7vKUaAyFKl34beJAxfdXavpJM9Odl6e
	QTRJesT1D8Z/n23Rduc1in2jYdnuHu8DItsqxYHbEArJb42O93cqgMS2dozQ/I+OkjcZ
	DfRGJxtmabCdbn37hAND8llVSIerAxnSFnoi8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=rLKLvfCwtd6fTcfTY8T5igL4ps1eDa6UNyFJZkB68rbuZLr6fGAt3fa02dXw12V2+m
	we3sVrH+mMeWiyB2q/rXkc9kA3ZjRpI0cYAX7SmZyVk/Ma0vrA3oqA3b4Hr1P5wLV9ul
	FN0ej8eMhm1s2/HFfNc7UviEYYdmGqmzfN4y8=
Received: by 10.90.80.18 with SMTP id d18mr2714760agb.31.1295725746550; Sat,
	22 Jan 2011 11:49:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Sat, 22 Jan 2011 11:48:45 -0800 (PST)
In-Reply-To: <1295720592.3850.290.camel@mattotaupa>
References: <1295608972.12720.47.camel@mattotaupa>
	<AANLkTinbMr38A4-yGjyLkNL+ydrwS+R6r_OWZo2fh7KP@mail.gmail.com>
	<1295653195.4105.56.camel@mattotaupa>
	<1295684244.4098.2.camel@mattotaupa>
	<1295720592.3850.290.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Jan 2011 11:48:45 -0800
Message-ID: <AANLkTin86VuRC4KSVfY=zAqnV+EXEmVh37mwiJ0X4BRU@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: vdr: minimal-uclibc: task `compile` fails with `undefined reference to `_nl_msg_cat_cntr'`
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
X-List-Received-Date: Sat, 22 Jan 2011 19:49:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 22, 2011 at 10:23 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> The commit since when building fails is a88aca1d [6].
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0commit a88aca1d7dfa3a08957dd49cb61bac850f19710=
6
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Author: Bernhard Reutner-Fischer <rep.dot.nop@=
gmail.com>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Date: =C2=A0 Wed Jan 12 20:34:55 2011 +0100
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools.bbclass: pass distro_i=
mposed_configure_flags
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Acked-by: Khem Raj <raj.khem@gma=
il.com>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Acked-by: Tom Rini <tom_rini@men=
tor.com>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Bernhard Reutner-=
Fischer <rep.dot.nop@gmail.com>
>
> Any idea?
>

I see. I think its to do with enable-ipv6 or somesuch. Can you run
do_configure for vdr before and after this commit and port
the contents of line invoking configure.

>
>


