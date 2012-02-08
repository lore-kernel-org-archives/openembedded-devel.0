Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvEGn-00008C-18
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 21:37:37 +0100
Received: by lbol12 with SMTP id l12so483998lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 12:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+MFr3sN8wkJjOWobpcAPaff0abvNCkCnUNsRZFN7Iq4=;
	b=ur7ArA7VGjac3klz3WhGJqWOJuxO6uvbeMg/eLcD1xQWN8p1gWMaYNoasYNz4XtQIx
	iymkT3DohXN9UU/f/bgJ0Ia55jZZmCcr7nIEfcz225j0X4QKKhCfswlGhLZLqbVNxsDD
	CfVAwzz4moD/pOgSIcPwA6jNFciawGLg5XK4c=
Received: by 10.152.114.169 with SMTP id jh9mr16477471lab.20.1328732973246;
	Wed, 08 Feb 2012 12:29:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 8 Feb 2012 12:29:03 -0800 (PST)
In-Reply-To: <CAC1BbcSLYNNTstF8LJoAoGd+J5+-Tba0jhTtmPpm+u+6tNrJFg@mail.gmail.com>
References: <20111117223303.96550@gmx.net>
	<CAMKF1spxE8kXQwsX3WYnazpGZDDmZoafvmvxLBRBvfZxdfbgdQ@mail.gmail.com>
	<20111118200047.GD2101@mx.loc>
	<CAC1BbcTp=fd=wSW6rTs4g4RdSSGJLPtTw1wCw8fy1dy9POVu2A@mail.gmail.com>
	<CAMKF1spxWumvNh5sCG8wgectH2HvcNjoDoo6VBYzBTKqwuyQaQ@mail.gmail.com>
	<20120202143311.112290@gmx.net>
	<CAMKF1sr423aR2GnJ6LQy6pdf8nfB_M+wjae5E_xi7ZUsc-cfQw@mail.gmail.com>
	<20120202160604.78480@gmx.net>
	<CAC1BbcTnVS4oqpcbDDbxOuBCDQPcb8cQDznJk58=neVOuC695w@mail.gmail.com>
	<20120202213801.8530@gmx.net>
	<CAMKF1srQcXyjwv2e9=gtKo_T+Q4uC6YXivmROCnnFM3aS5xxWg@mail.gmail.com>
	<4F2BDE2A.3000201@st.com>
	<CAMKF1srDugybTEsusbc0XG1NM5BGVQEHxTBSw3_1aFCFunsCPw@mail.gmail.com>
	<CAC1BbcTEmnZFWrS2PKwt1nnM0h1w+UAun37D4Ep7YyYSbaJXaA@mail.gmail.com>
	<CAMKF1sr8EKC1tzDTHNEb0k4x_oN1bU6aCz_aJjDVPYEOho799Q@mail.gmail.com>
	<CAC1BbcTHi_rKU7yjBVYpRBv9V_1vdvHE-qFrs+TG4taxg85Tog@mail.gmail.com>
	<CAMKF1soUL2p=ymicjq6UtiGWvM2_BBMU1JLNR4H+Db+YXOOimw@mail.gmail.com>
	<CAC1BbcSLYNNTstF8LJoAoGd+J5+-Tba0jhTtmPpm+u+6tNrJFg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Feb 2012 12:29:03 -0800
Message-ID: <CAMKF1soj8DnpXcEDJg0vogUCgL9C_SF37q2oFv66W7pXQ2ZH-g@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: uclibc@uclibc.org, Peter Mazinger <ps.m@gmx.net>,
	openembedded-devel@lists.openembedded.org,
	Carmelo AMOROSO <carmelo.amoroso@st.com>
Subject: Re: future branch
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
X-List-Received-Date: Wed, 08 Feb 2012 20:37:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2012 at 12:17 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> Fcntl{,64} is a nightmare, yes. But your hunk does not strike me as
> immediately helpful.
> arm/ioperm hidden def removal is OK, I think, without having sources at
> hand.
> The socketcall hunk is nonsense, see my previous reply to Peter in this
> thread.
>
> +-# provided via pthreads builddir +-CSRC-y := $(filter-out $(libc_a_CSRC)
> $(notdir $(libpthread_libc_OBJS:.o=.c)),$(CSRC-y)) +-SSRC := $(filter-out
> $(libc_a_SSRC) $(notdir $(libpthread_libc_OBJS:.o=.S)),$(SSRC))
> Huh? Sounds inappropriate to me.
> Oh, filtering later on makes sense, so OK, good catch!
>
> +-ifeq ($(IS_EABI),y) ++ifeq ($(CONFIG_ARM_EABI),y)
> But _that_ is a step backwards, NACK.

yes most of my patches are cobbled up on top to get to a compiling
state so it could be
a garbage to hide another garbage


