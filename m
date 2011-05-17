Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMRpN-0005W0-Nz
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 23:29:17 +0200
Received: by eye27 with SMTP id 27so282860eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 14:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=nGbr042gCzV6vwQSH5hreegwQYdKPFPbdUsQSFdGHqs=;
	b=rdcb19z5fAQZXyRNENPArNLzUoJQ6hOdAt/fyy9RWSO7Lh9bYLCkKnU+9h0+4BE06I
	99Gz6yxUgEcNZZOsvtIFojotQAVpNz9+m6g1MUFw+uCbZfFgBEEXkixpLoMKApO5U3fS
	dC4Adr2by6bfpl7mqcbAjlUv+5b3dPJ/tQC2A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=KHQxTCVofB/5lphSCzjYnN6Zpz2N+woICz7mk6kILf5Ld3ErE9OrUAbZZizzx3YZ0g
	KgmdoU30A8fB6h9P1VvlOD1r1fyLGwrqADkpSWtuEXX0GVldVNUlIOp9mmr9z/c/b+Mq
	CXje2Lwio6uRGMf/tY5+Cm2feqF74BfrbGWKo=
Received: by 10.14.49.210 with SMTP id x58mr378976eeb.12.1305667584105; Tue,
	17 May 2011 14:26:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Tue, 17 May 2011 14:25:54 -0700 (PDT)
In-Reply-To: <BANLkTinDjxwtBSQkQ-fbAKxR7JzNiaAo+A@mail.gmail.com>
References: <1305663890-20372-1-git-send-email-raj.khem@gmail.com>
	<BANLkTinDjxwtBSQkQ-fbAKxR7JzNiaAo+A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 May 2011 14:25:54 -0700
Message-ID: <BANLkTik+RLj1jUVOdAXQ8LLpRRqiZXzTtQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 May 2011 21:29:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 1:35 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, May 17, 2011 at 17:24, =C2=A0<raj.khem@gmail.com> wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> use GITPKGVTAG for PV
>> Cleanup unused UCLIBC_BASE
>
> Is it working for you? here, with freerdp, it doesn't.xi

hmmm it works fine when I have existing git repo but moment I use a differe=
nt
SRCREV I start getting 0.0.0
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


