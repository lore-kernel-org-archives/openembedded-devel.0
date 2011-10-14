Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REjmH-0000Pl-QG
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 17:34:29 +0200
Received: by qadc1 with SMTP id c1so946894qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2011 08:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ByBiamvfD743YK7pMYGp7vsLHUBKmfXtzKI4fOjrQQA=;
	b=gIkPv0mCixnbucF7GvFJH0jSythLWLOpUMPRczP/uHDRt3wPrJcLU2FrKSia3YRQmq
	jTpz2J03cVfsZfb2PEngIvc79iTdVKDz1eIDMzmeQ6Pwys0Kw8OXTUK8VMstvOZ/5+iB
	AyVBwKfcqk1hZl+OvKbrxGnSj0+oNssbOc19E=
Received: by 10.68.32.162 with SMTP id k2mr17326675pbi.132.1318606123667; Fri,
	14 Oct 2011 08:28:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 14 Oct 2011 08:28:13 -0700 (PDT)
In-Reply-To: <4E980D6D.7090307@mlbassoc.com>
References: <4E96E9FE.1060005@mlbassoc.com>
	<CAMKF1sp9HPM8DzxTSuhUKY7-q4QuDPNkDQ2TAQPwoGkZ+Gu4eg@mail.gmail.com>
	<4E974E38.5050807@mlbassoc.com>
	<201110132258.27380.schnitzeltony@gmx.de>
	<4E975444.3050507@mlbassoc.com>
	<CA+T6QPkOQgFSmSsNaaeCOM5zNtzaNcCzgVaXr=t_5jj902w11Q@mail.gmail.com>
	<CAMKF1srDzFzjkoWAs2k8wP45xskCuwhyLb_dCpiT2GMarC_s5w@mail.gmail.com>
	<4E980D6D.7090307@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Oct 2011 08:28:13 -0700
Message-ID: <CAMKF1srhvhNhf5DAsGeuzWYvuhsExE_y92PjvSaQRoDixtMiDQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Can't build libcgroup
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
X-List-Received-Date: Fri, 14 Oct 2011 15:34:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Indeed, I did a rebuild from scratch with BB_NUMBER_THREADS=3D1 and
> PARALLEL_MAKE=3D"-j1" and it worked fine. =C2=A0When I set both to 2 I ha=
d
> failures, but of a different sort (openssl failed to build).
>
> Seems to be some real gremlins in the parallel builds :-(
>
> Odd that I've never seen this when building Poky (I _always_ use
> BB_NUMBER_THREADS=3D4 and PARALLEL_MAKE=3D"-j4")
>

It could be that the runqueue of poky is constructed such that this
does not happen
or it could be really a problem in gcc 4.5 packaging (which I doubt)
you could select
gcc 4.6 in angstrom and see if you still hit it. Since gcc 4.6 in
angstrom is just bbappended
on top of oe-core unlike gcc 4.5 which is completely hosted in meta-oe


