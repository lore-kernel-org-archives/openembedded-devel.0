Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PnQ6D-00044n-QN
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 07:33:53 +0100
Received: by iyj8 with SMTP id 8so978673iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 22:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=8o+sLaLCIq9lJiCzND8Fp8CL4Cj4c+5yf/TSwBkaRMs=;
	b=ufOKY0oxIj8nhnWyaeCFmEvLiJKwy5507quALSHq+sL9iLLKAlXhqhn+pcCqtm3cdu
	pR6+KBJqb+8YgikmtCLtymPB8vfPVxdOj8wO1FeImVQK2iwdwA7BnnQXdHIGkEbF+8hJ
	XZH5srDhhaR+aYSd/kPYtAq0/lOxnEeSkeqEU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PD5PYYj5RwgZ+0cRxrv7CTI1pyReYGrDHgt9okKjo8XpV9nIm+Ff83/QaPVLCmyoR5
	dbkAEYLFZGzyvVea1g9xNMec4fsm6yyfyIhEtPARtsO0EWiK/42jPdC9ujwXdAlsZbR5
	ILbZ5K44jQ2rtl3+oFnqqLy+lKKG4zE/czILQ=
MIME-Version: 1.0
Received: by 10.231.39.201 with SMTP id h9mr6952845ibe.147.1297319568929; Wed,
	09 Feb 2011 22:32:48 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Wed, 9 Feb 2011 22:32:48 -0800 (PST)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F08032A3023F0@dlee06.ent.ti.com>
References: <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
	<20110204081659.GQ4580@excalibur.local>
	<AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>
	<20110204090348.GR4580@excalibur.local>
	<AANLkTik5RVEsxh_jtXTjQRM3sKBrmwmOaWbqs2eKKop=@mail.gmail.com>
	<4D4C1464.4030609@mentor.com>
	<AANLkTi=o+QW-K2VG7WBFFTrshxhD1TDMbqx=EbTxDj5h@mail.gmail.com>
	<AANLkTimO7SQU7k=3ACn4K4wSOwRWkvoV-Tnvn2FFVW63@mail.gmail.com>
	<AANLkTikXULU=UyfomMr_GVx5o1GieZrRxDZET3QF30px@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F08032A3023F0@dlee06.ent.ti.com>
Date: Thu, 10 Feb 2011 07:32:48 +0100
Message-ID: <AANLkTikvbVnY9GgE4UBF=nDWY88F2sjnHTPW1A2yt=Z7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Thu, 10 Feb 2011 06:33:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/9 Maupin, Chase <chase.maupin@ti.com>:
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Frans Meulenbroeks
>> Sent: Saturday, February 05, 2011 7:35 AM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] bitbake does not fail when QA issues encountered
>>
>> 2011/2/4 Otavio Salvador <otavio@ossystems.com.br>:
>> > On Fri, Feb 4, 2011 at 15:26, Frans Meulenbroeks
>> > <fransmeulenbroeks@gmail.com> wrote:
>> >> The recipes at hand are:
>> > ...
>> >> cups: there is someone bitching about that this is 1.2, but he
>> >> apparently prefers bitching upon resolving the issue. Probably the
>> >> best solution is to drop the DP =3D -1 from the 1.4.4 recipe
>> > ...
>> >
>> > I can work on cups next week (I am on VAC right now).
>>
>> Actually the cups thing is the one I would feel fairly comfortable with.
>> The question here is mainly when/how to drop the DP =3D -1.
>> A pinning of 1.4.4 is already in my local.conf for quite a while.
>
> In fact, as a quick fix applying something like http://bugs.gentoo.org/at=
tachment.cgi?id=3D164569 should work for version 1.2.12. =A0I ran desktop-f=
ile-validate against the cups.desktop file in version 1.4.4 of cups and it =
has a whole different set of errors:
>
> desktop/cups.desktop: error: (will be fatal in the future): value "Printi=
ng" in key "Categories" in group "Desktop Entry" requires another category =
to be present among the following categories: HardwareSettings;Settings
> desktop/cups.desktop: error: (will be fatal in the future): value "Hardwa=
reSettings" in key "Categories" in group "Desktop Entry" requires another c=
ategory to be present among the following categories: Settings
>

This would probably be ok as a quick fix (also saw your patch for it).
In the end I feel moving to a newer cups would be the preferred solution
Otavio wrote last week he had a better recipe and would post it this
week. Guess that might be a better solution.
Personally I have 1.4.4 in my local.conf for several weeks.

Frans


