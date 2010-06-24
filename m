Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1ORqjj-0007c9-DH
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 20:01:16 +0200
Received: by vws19 with SMTP id 19so1649587vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 10:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=hh6iWLqk7IM266KoskxWHdHAd4MEKD55tByKPsQXs/g=;
	b=OxvMvr7OQnpoc5LocR0R+Yhw1GACKTvzjXBVirZnu+ak3R21PVqbVPQEQ923it4xjP
	5qYp7+5cLn2Xwi9L5uTJnp79KL1sqFCymFOxOq5dSLiH8UvPuufG5NBlXuINPHmCqsQi
	5SH3vCo89hkHz7clI2dNcdKtHuWmrS5innct0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=kdRCjnm8rZZm2ebE5OBgqecuQogWR+CAoVn0oh95zmMwoQ844KXX2pElTE0yOrCcNi
	pd9TABIgpDItBhs13PAQYbUus712x+51MguSs+PEa3Vusyynf9setQ7MdD0YhBQrlxe9
	X5ENmtESFKvs/q6qR12oqFVYPxmxdAIcVizqs=
Received: by 10.224.63.138 with SMTP id b10mr6560800qai.222.1277402196901; 
	Thu, 24 Jun 2010 10:56:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.241.204 with HTTP; Thu, 24 Jun 2010 10:56:15 -0700 (PDT)
In-Reply-To: <AANLkTims9fPo1xmCwBFmiHQJ6nrTgJDKVFJkjeThIvt9@mail.gmail.com>
References: <AANLkTinA_A7Ja4Go6H7MlOxFM4uLsfiQCyJnRodHHCpo@mail.gmail.com> 
	<AANLkTikmIaqai1TRdoU2SlybGF4JmdS57AJnA6sngrSS@mail.gmail.com> 
	<AANLkTims9fPo1xmCwBFmiHQJ6nrTgJDKVFJkjeThIvt9@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 24 Jun 2010 10:56:15 -0700
X-Google-Sender-Auth: 59wTJxKvxgCbH3oiTHQPncTc--4
Message-ID: <AANLkTimwgmCfFhJrQ-I5uwEVsBBjc5JVKMLL72ZLWXKm@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: additional bitbake test
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
X-List-Received-Date: Thu, 24 Jun 2010 18:01:16 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, May 29, 2010 at 2:36 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/5/28 Chris Larson <clarson@kergoth.com>:
> > On Thu, May 27, 2010 at 11:36 PM, Frans Meulenbroeks <
> > fransmeulenbroeks@gmail.com> wrote:
> >
> >> Hi,
> >>
> >> I'd like to propose to add a test in bitbake to see if an overlay dir
> >> exists when specifying overlays.
> >>
> >> In the past I bumped into a problem where BBFILE_PATTERN_local =
> >> "^${OE_TOPDIR}/myoverlay/recipes" was not processed properly because
> >> OE_TOPDIR was not passed using BB_ENV_EXTRAWHITE, resulting in the
> >> regexp match with the dir always returning false due to OE_TOPDIR not
> >> being expanded.
> >> A simple test could warn users against errors like this one.
> >>
> >
> > Hmm, I'm not sure how best to implement the warning.  I'd rather not
> grep,
> > and we don't currently have a way to determine what variables a given
> value
> > references.  I guess we could notice if a given pattern didn't match any
> > files in BBFILES, and warn on that.  Does that sound reasonable?
>
> That sounds quite good to me.
>

Okay, sorry for the delay, but this is in master now.  Example:

kergoth@auron ~/C/o/bitbake> bitbake nano
NOTE: Handling BitBake files: - (8453/8453) [100 %]
Parsing of 8453 .bb files complete (7978 cached, 475 parsed). 8485 targets,
319 skipped, 1 masked, 0 errors.
WARNING: No bb files matched BBFILE_PATTERN_foo
'^/home/kergoth/Code/oe/foo/'
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue


> > Aside: the fact that a nonexistant var is left as is, to be expanded in
> > shell, is horrible, imo.  They should expand to the empty string when
> unset,
> > or error, or something.
>


> I'm inclined to say error. If a default it wanted an assignment can be
> done somewhere.
> Better make the problem explicit
>

Agreed.  I'll add this to the bitbake TODO for long term.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

