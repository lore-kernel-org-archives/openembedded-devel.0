Return-Path: <krussell7711@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id B6E657BFF5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2019 02:42:14 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id t17so5801553vsc.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Feb 2019 18:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gWbMiveR4tEe51wcQBxg2HyfHaQrD0y75siEdzAUSqI=;
	b=jaTZePwn/a9l30i0jeFqA8viQydmn762Hk5wCThxWB2j5nmEPL+CQttePAv0VxPQ1Y
	/flGQq9/VCBK/gdu44L4kvlOp2QeuY+rKtAvx8LnYXpEfBNtefUiKnjpRfD2gm7bDN6Y
	IXAP0OqUztoPxZaCSw6SB+WOWV7Ei2dbg75VmvUPeJ9H3CrWKHoYsevS6sHusWMr1e5k
	CY7t7s1Sa/BP8BEjkQhYIwP7oauCmXx0TrWIiQoUydRrvOR5X6XwHYc+IGyTXR1TYC0i
	Mrf25htRurH8yQUDkRlKluXSlfHjq/EWRxoGk7uhxQGXXJP07vBgY+3iDMQoFPz3zMQe
	jy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gWbMiveR4tEe51wcQBxg2HyfHaQrD0y75siEdzAUSqI=;
	b=ba25AUwa7lJc3EeLFAneCj7g55S6sg2RACNO9jOOM6AqIRtQ5C5tw38M4YEPSSf2nu
	egFD23wSL1S62/+TtWtMtTcNRRfxU/DTPbI+jR7sreDub5nYyFcBNXPkv5rOMSkVaH19
	aez4TJW4RIyS78AHhi2aTd4+98NchF1bUhktioQl8ErrchAXue2uJV4Xgp2Gvz2RgcuB
	Jzi8iIzrC6il6/buncmYWFt6EXx74c458SbY+YN4eVP74dk6PWVBGjqATN3/YfipoYI2
	kjhZM7Oo7n0mv1/aHC3TGE7t3GS3wstFCaR3t/loUY3gtuQh87PsgWAUrGXXhowuAnMN
	NK9g==
X-Gm-Message-State: AHQUAuY7+5yMuO7BN+45318H3BsJDFyw0G+1pq6Tz0WFyFiqjrt3QNKq
	F9mQO1n1DzKwvwml4xuzDAcs9lEFW/5/ltbXsuMq/Q==
X-Google-Smtp-Source: AHgI3IbV4rHq2gMt6rYAWAEfsWWZyrl26Q+ecI2N7raAa/kFzxRCjyd2IEC2JY7nKdXK0A27+dOUxy/3RDDmXC9+l3U=
X-Received: by 2002:a67:d804:: with SMTP id e4mr5931995vsj.7.1549507335359;
	Wed, 06 Feb 2019 18:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20190205155325.7493-1-bkylerussell@gmail.com>
	<90ad3a48bf6811135ebf4893757d3254c95b44e0.camel@andred.net>
In-Reply-To: <90ad3a48bf6811135ebf4893757d3254c95b44e0.camel@andred.net>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Wed, 6 Feb 2019 21:42:02 -0500
Message-ID: <CAFrQVPNb2U3GUaSbhuOzCdHofpdxL+kA+iGUq3bWMGVQx5kFDw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/2] RFC: Support building Java recipes with openjdk-8-native
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
X-List-Received-Date: Thu, 07 Feb 2019 02:42:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It seems like a question of how many JDK versions meta-java plans on
providing, and for how long.  To me the number of different per-version
providers feels like a maintenance point that could quickly get out of
hand.  I guess my assumption has been that all of the embedded Java code
for the distribution would compile with the same JDK (either the latest JDK
provided by meta-java, or perhaps one behind the latest version; similar to
how oe-core handles gcc upgrades, for example), and that compile would pass
in the appropriate -target or -bootclasspath parameters for the preferred
JVM.

I hope I understand what you're saying, because I'd like to work together
toward a solution.

Does your distribution require specifying different providers per runtime
version?

On Wed, Feb 6, 2019 at 8:38 AM Andr=C3=A9 Draszik <git@andred.net> wrote:

> Hi,
>
> First, I agree the current state isn't great at all.
>
> It does appear to me though that Java world seems to be a bit different, =
in
> that even today there are big Java projects out there that still only
> compile using Java 8, which others do compile fine using more recent
> versions.
>
> With your suggested approach it becomes impossible to properly support
> that,
> you still have to pick the lowest denominator globally.
>
> Other distributions, Debian based ones in particular are taking a differe=
nt
> approach:
> Each Java compiler/runtime provides virtual properties, and recipes can
> depend on the required version easily, something like e.g.
> virtual/java8-sdk virtual/java9-sdk virtual/java10-sdk etc.
>
> I'had posted a patch series trying to mimic that before, but not really h=
ad
> time to work on that any more:
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/1956=
41.html
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/1956=
42.html
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/1956=
43.html
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/1956=
44.html
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/1956=
45.html
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/1956=
46.html
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/1956=
47.html
>
> What do you think?
>
> Cheers,
> Andre'
>
> On Tue, 2019-02-05 at 10:53 -0500, Kyle Russell wrote:
> > This series spun out of a request on the mailing list last October on
> > configuring meta-java for using openjdk-8-native to compile other Java
> > recipes that might require modern API features not provided by the
> > bootstrap VM classes.
> >
> >
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-October/1=
97186.html
> > [oe] meta-java configuration
> >
> > I've been running with this series on sumo, but I wanted to send it out
> > to get other thoughts on the approach.
> >
> > It seems like there's already precedent for this format with perlnative
> > and pythonnative.  That was more or less how I expected java-native to
> > behave initially until I understood more about the bootstrap process.
> >
> > If I've missed a valid use case of java-native and this change would
> > cause breakage to someone else's layer, I'd be fine with introducing
> > javanative.bbclass as a new class that provides the same functionality
> > as the following patch to java-native.bbclass.  (Its name would be more
> > closely aligned to perlnative and pythonnative without the dash.)
> > However, it appeared that java-native was essentially unused, and I
> > thought having both a java-native and javanative class would be
> > confusing.
> >
> > Kyle Russell (2):
> >   Add support for building Java recipes using java-native
> >   ant-native: only use classpath tools if no JDK
> >
> >  README                                          |  7 +++++++
> >  classes/java-native.bbclass                     | 17 ++++++++++-------
> >  .../ant-contrib/ant-contrib-native_1.0b3.bb     |  2 +-
> >  recipes-core/ant/ant-native_1.8.1.bb            |  4 ++--
> >  recipes-core/ant/files/ant                      |  9 +++++++++
> >  recipes-core/openjdk/openjdk-8-native.inc       |  2 ++
> >  6 files changed, 31 insertions(+), 10 deletions(-)
> >
> > --
> > 2.20.1
> >
>
>

