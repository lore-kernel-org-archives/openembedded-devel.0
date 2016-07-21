Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3AFA16FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 14:56:08 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id l69so5688044lfg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 07:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JaP8hy++QTnFEg3xAOnoC7YyEJHojvuJNwt5ONb6/H4=;
	b=X3X7h0gRtyjAvYq3r+ML+LvO/Wn37T2pQdx9OnFn6n0wNJqtO8ZA+dNjrUQUrPHTTn
	Ix1Cla+kfzOS6ALe5GHkqv0RqE+otK06U3WJ7Bp8LWpE8Scvun3llJpV+AzYeFPQt9a3
	sboIanDSzZfALWgR7XgqODKkP9xAv787JcgrNPq6cc7XzmGrKEU3hw6cInrgJei22OOW
	F51YiV3h+WCXNqy1qk6Q92S2xnZ0+O4eSx8ZA9KQxAGwoC6pywQf1TJhJYHLkZeJ9uvJ
	b3Dx8ZD+lrz+GzgakzDnr2ZSVIajeIXiLw6HRQ/O6xkqfNBCUZt9J8c+hhk/AgFOs7FI
	jC4g==
X-Gm-Message-State: ALyK8tLa4/stj27PZdSPPdaBctWY3HQ7Ia3zD5mO6EsvJanJksAiTgzGxnpITuANsJPl/A==
X-Received: by 10.25.44.71 with SMTP id s68mr15122615lfs.197.1469112968571;
	Thu, 21 Jul 2016 07:56:08 -0700 (PDT)
Received: from localhost ([185.46.212.65]) by smtp.gmail.com with ESMTPSA id
	e79sm1923848lji.42.2016.07.21.07.56.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Jul 2016 07:56:07 -0700 (PDT)
Message-ID: <1469112965.6229.37.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jul 2016 15:56:05 +0100
In-Reply-To: <68B4CABC-D2D5-46F3-817C-6C7462E3E5A2@gmail.com>
References: <1468828968-19388-1-git-send-email-git@andred.net>
	<1468828968-19388-2-git-send-email-git@andred.net>
	<CAMKF1spStNbUubBvO1DLq86wdHRVbGvOVB7LRUVa2be0Mdes3Q@mail.gmail.com>
	<CAJ86T=XnuktZ1DB6_Cco+0NnjFOAaa6F4+=dCW8+Pw1t_Yo4nA@mail.gmail.com>
	<1468835203.4658.12.camel@andred.net>
	<68B4CABC-D2D5-46F3-817C-6C7462E3E5A2@gmail.com>
X-Mailer: Evolution 3.20.4-1 
Mime-Version: 1.0
Subject: Re: [meta-networking][PATCH v2 2/2] meta-networking: override SECURITY_CFLAGS for c-ares
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2016 14:56:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mo, 2016-07-18 at 02:52 -0700, Khem Raj wrote:
> > 
> > On Jul 18, 2016, at 2:46 AM, André Draszik <git@andred.net> wrote:
> > 
> > On Mo, 2016-07-18 at 01:37 -0700, Andre McCurdy wrote:
> > > 
> > > On Mon, Jul 18, 2016 at 1:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > > > 
> > > > 
> > > > On Mon, Jul 18, 2016 at 1:03 AM <git@andred.net> wrote:
> > > > 
> > > > > 
> > > > > 
> > > > > From: André Draszik <adraszik@tycoint.com>
> > > > > 
> > > > > c-ares doesn't build if the distro has enabled usage of the
> > > > > security_flags.inc file as it is picky about what is placed
> > > > > into CPPFLAGS and CFLAGS. It complains and errors out if any
> > > > > preprocessor options appear in CFLAGS.
> > > 
> > > Curl (on which c-ares's configure files seem to be based) used to have
> > > the same problem but was fixed upstream by:
> > > 
> > > 
> > > https://github.com/curl/curl/commit/5d3cbde72ece7d83c280492957a26e26ab
> > > 4e5c
> > > ca
> > 
> > I must say I agree with c-ares' error here, and this really highlights a
> > bug
> > in how OE handles the security flags. By convention, preprocessor flags
> > belong into CPPFLAGS, not CFLAGS.
> > 
> > The real solution hence should be to have OE place -D flags (including
> > ${lcl_maybe_fortify} into CPPFLAGS, not CFLAGS in the first place.
> 
> right. Would you might sending a patch for OE-core
> 
> > 
> > 
> > But that'd be a change I am not in a position to test, as it would touch
> > everything. E.g. there might be build-environments that (silently)
> > ignore
> > user-supplied CPPFLAGS completely (cmake being one of those [1]).
> 
> Auto builders can help. Do whatever testing you can do. On minimum add the
> flags
> to CPPFLAGS

Looking around a little bit, I don't think this is feasible.

meta/conf/bitbake.conf unconditionally adds TARGET_CPPFLAGS to
TARGET_CFLAGS. So adding the flag to CPPFLAGS alone isn't going to do much,
we'd just have it in the compiler command line thrice.

Moving the flag from CFLAGS to CPPFLAGS by default is not going to be
feasible either.
I was under the impression that any recipe that inherits autotools*.bbclass
would continue to work fine, but various projects use hand-crafted
Makefile.in which again don't respect CPPFLAGS.

I could split out CPPFLAGS from SECURITY_CFLAGS in oe-core:

SECURITY_CFLAGS_NO_CPPFLAGS ?= "-fstack-protector-strong -pie -fpie ${SECURITY_STRINGFORMAT}"
SECURITY_CFLAGS ?= "${SECURITY_CFLAGS_NO_CPPFLAGS} ${lcl_maybe_fortify}"

Then I could in meta-openembedded:

lcl_maybe_fortify ?= ""
SECURITY_CFLAGS_pn-c-ares = "${SECURITY_CFLAGS_NO_CPPFLAGS}"
TARGET_CPPFLAGS_append_pn-c-ares = "${lcl_maybe_fortify}"

(but I'd also have to
TARGET_CFLAGS_remove = "${TARGET_CPPFLAGS}"
in c-ares.bb due to bitbake.conf)


This all looks like lots of churn and I don't think that's much better than
what I proposed originally. What do you think?


Cheers,
Andre'


