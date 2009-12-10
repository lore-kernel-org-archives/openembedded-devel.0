Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NIn5U-0008G1-88
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 18:46:03 +0100
Received: by iwn32 with SMTP id 32so7966iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2009 09:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=73BvKxVwDrgVqEciykRg7b1S5JkiEmxYoMt9x3Tf7+4=;
	b=mq6vl0YeB/6p2hhl+EYWcYSniIo0LN02q7yc/Zx00VMMQXsg/h7lRXntHEgbF4N2ao
	9xn90iGFEdhk9jkeqa8igqd2iAnsZPxz8nOVsjiqqPnrJ0pS/1/q45xPzrdQBreucNXu
	FpasSyEW3nrwrD5s17SkHAorptVt27EAiHx4A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hQ1wGFwWOuuWu+Lk02BV7fpZpFCtdyktIRKjY0MAZGgEMseUvX+oeTgyVS7FdJze2Y
	7V7YGN1b4NHuRVKWRvxzUIX1ALag+F/02+ALgd7WHw2wujSLQ5ePP2QJnWUY8XLHKqOG
	0sWR9bYuGEfKp0jWC55TmmoMnKtt8XpAEFn8M=
MIME-Version: 1.0
Received: by 10.231.4.75 with SMTP id 11mr140593ibq.25.1260467057396; Thu, 10 
	Dec 2009 09:44:17 -0800 (PST)
In-Reply-To: <ec1f3d400912100300l42da9902wee299ca7bd27e6bb@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90911301042t6ed432b2m1189c619772edf9c@mail.gmail.com>
	<ec1f3d400912072024u2ab3a98bg96665cd8457efcd9@mail.gmail.com>
	<19c1b8a90912081214u9abe04fm774bd7f54e7bf70a@mail.gmail.com>
	<ec1f3d400912090347w217d39d2jd64c9801f95e96e4@mail.gmail.com>
	<19c1b8a90912092118o54903eb4v4044e2c1191617c8@mail.gmail.com>
	<ec1f3d400912100300l42da9902wee299ca7bd27e6bb@mail.gmail.com>
Date: Thu, 10 Dec 2009 09:44:17 -0800
Message-ID: <19c1b8a90912100944g4b405319v6e121ebf03449f0b@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Thu, 10 Dec 2009 17:46:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2009 at 3:00 AM, RK Raggit <rk.raggit@gmail.com> wrote:
>> What version are you using for binutils ? I could not reproduce the
>> issue with 2.20
>>
>
> I was using 2.18.50.0.7. I have just started a fresh build with the
> following line-up -
>
> ***********
> PREFERRED_VERSION_binutils =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D "2.20"
> PREFERRED_VERSION_binutils-cross =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "2.20"
> PREFERRED_VERSION_binutils-cross-sdk =C2=A0 =C2=A0 =3D "2.20"
> PREFERRED_VERSION_gcc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D "4.4.1"
> PREFERRED_VERSION_gcc-cross =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D "4.4.1"
> PREFERRED_VERSION_gcc-cross-initial =C2=A0 =C2=A0 =C2=A0=3D "4.4.1"
> PREFERRED_VERSION_gcc-cross-intermediate =3D "4.4.1"
> PREFERRED_VERSION_glibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D "2.6.1"
> PREFERRED_VERSION_glibc-initial =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "2.6.1"
> **********

As I see you are targetting cortex-a9 I would suggest that you use
later version of
glibc or even better use eglibc 2.10 or 2.11

>
> Will let you know about my progress.
>
> Thanks
>
> --RK
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


