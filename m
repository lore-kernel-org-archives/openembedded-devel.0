Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PlNyI-0000ao-Nq
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 16:53:18 +0100
Received: by bwz10 with SMTP id 10so2659576bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 07:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Uda1ZjHgp5xEwCLwAwAr/hLfaSMPvrpeKv//DzkS7do=;
	b=FJwpOkA1Zqa5AnHyvMNekhs69RTgPx3zTzxL2/rFcQ6J8ZolfG1CU9oNkJqwNBDZaF
	e4xBonQFpcR4D2Q59IieN5prQBAegqf3YkpcCQcu5HCyNnPwQ4tzudCjXJrhEYArQEPZ
	tdMT5U2IarPHUGiSz0oEHNMOBl4Fas5roNtzk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=lTVO8Sv6vKDyw4AiRr5rnKao1twxmQPqlIFYocsEPKAcyGQ6OYBxyu5/5+AwVVshns
	GD4AAiY61tfFLJ8ymbpPrUIrp5e1FjLUEGH8xiMcNJkvw734rwtDTDpUbi/fgRXZxoVE
	5eKuChtTFMyir8lbB7aohkEt3whZ6xk0Rvs10=
MIME-Version: 1.0
Received: by 10.204.103.132 with SMTP id k4mr11673780bko.28.1296834740039;
	Fri, 04 Feb 2011 07:52:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.56.135 with HTTP; Fri, 4 Feb 2011 07:52:19 -0800 (PST)
In-Reply-To: <AANLkTi=o+QW-K2VG7WBFFTrshxhD1TDMbqx=EbTxDj5h@mail.gmail.com>
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
Date: Fri, 4 Feb 2011 15:52:19 +0000
X-Google-Sender-Auth: JigWE4frcyBncNH3XqY4pYLhZFA
Message-ID: <AANLkTimO7SQU7k=3ACn4K4wSOwRWkvoV-Tnvn2FFVW63@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 04 Feb 2011 15:53:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 4, 2011 at 15:26, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> The recipes at hand are:
...
> cups: there is someone bitching about that this is 1.2, but he
> apparently prefers bitching upon resolving the issue. Probably the
> best solution is to drop the DP =3D -1 from the 1.4.4 recipe
...

I can work on cups next week (I am on VAC right now).

> And yes, I could try to fix these myself. I used to work on everything
> and tried to fix things that were left dangling, but some people in
> the community are so unforgiving and negative if you make a mistake
> (which can happen if you work on something new to you), so I basically
> gave up doing that.
...

Frans, please refrain from repeat it. I understand your feeling and I
also got this unpleasant kind of response sometimes but the better is
just ignore it and keep doing the work.

If you can help fixing issues (whatever it is) it helps more people
then the ones that claims so it still helps more then it hurts.

Cheers,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


