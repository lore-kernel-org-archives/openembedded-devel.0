Received: from [209.85.219.166] (helo=mail-ew0-f166.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Li97A-00087o-54
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 16:16:00 +0100
Received: by ewy10 with SMTP id 10so2796279ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 08:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AiaDdXOpxb2fl3YtsnxreDQFSmAg6wSX11JltFlNUA4=;
	b=o0Bu+qq+RnHHTUiD2IhnQj7LtZnrc12ZaXwfKGuU/xBHdGuWTyEaoksrFCu4xvte9u
	SYWNGy8jsVSsPdHV1nlwEMoKz6Sof+Fqm7vj/NiI5fM5UZTXalDJa2kGOW7MaiEfGVY5
	S9Gq1oaaYxWn3/yejVa/F3bsV/xchPmBQQ0x0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BtLjw5pzQafYzU9JspEL9Uo6iyGvW5CaFXqKCGnj+LBXtqYe3arTrkUvQ0HAJ4h64B
	A4t6XdttskZEeOnHQzq4efGTfyD1FzczRi5TIJgc45XImqjzxxlRl3w4pNN2M3pfxyOH
	34zkI5XHwdUSlcW7BCWQim/oUvjaHS+n8R5JE=
MIME-Version: 1.0
Received: by 10.210.29.17 with SMTP id c17mr858844ebc.34.1236957338383; Fri, 
	13 Mar 2009 08:15:38 -0700 (PDT)
In-Reply-To: <19c1b8a90903121458ufac02e7p878b6badfe29878@mail.gmail.com>
References: <ac9c93b10903120252x292ff544gca18ac8684ce0f2f@mail.gmail.com>
	<19c1b8a90903121037g5726bf99qadca1e5d95dcae7@mail.gmail.com>
	<ac9c93b10903121334j3a6cfad8u8e4591ddecf80394@mail.gmail.com>
	<19c1b8a90903121458ufac02e7p878b6badfe29878@mail.gmail.com>
Date: Fri, 13 Mar 2009 16:15:38 +0100
Message-ID: <ac9c93b10903130815t10265676ld8e464ab460689dd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: g++ lib problem
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
X-List-Received-Date: Fri, 13 Mar 2009 15:16:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/3/12 Khem Raj <raj.khem@gmail.com>:
[...]
>
> I see it gets it from libm but g++ specifiies -lm for you where as gcc
> does not. I think the problem is that ARM have same precision for
> double and long double so glibc defines __NO_LONG_DOUBLE_MATH for ARM
> as a result the prototypes for the *l functions are not emitted into
> math.h. Although in glibc they are aliases for the corresponding
[...]

Khem,

Thanks for the explanation.
Should we change the glibc package to resolve this?

Frans


