Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PfaDj-0004mD-HD
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 16:45:15 +0100
Received: by iyj18 with SMTP id 18so957523iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 07:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=W0OPRyAKnb0XnBxTCRbnCNXUCHmQ7/cNDgjWv0vEAls=;
	b=ckdSxDBWVaKil7kCIah9wIvKsxWNRQevg83jsdMpW6ogXrL4fVzxel9v4ZUmlclQ9N
	N5NglF4sa29LY7ew8IMU4sqbxgejaaOeRMxVg7JSI04HD63VEOy/yp4PVVQvFljbs6F/
	VYYncMlivxB9iQIHfwcunYgDzsxYeEKhqzOao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=h9eWHCgjbqqiD0JAFYjDQnWdsUbKqkGhs+PZfgci1v9VFVkdA0UM4ltLuDy21Fhj7B
	IACDP94iJhIyHj2M7uTaz40g3RLulpcKYLEDTF+7YAAp65VA0vKuQa60P6Aq24ux4Uv+
	GgKfANfnEYUmVlXsYNgozOZg557uPoupFvsaE=
MIME-Version: 1.0
Received: by 10.231.200.138 with SMTP id ew10mr1018944ibb.59.1295451875317;
	Wed, 19 Jan 2011 07:44:35 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Wed, 19 Jan 2011 07:44:35 -0800 (PST)
In-Reply-To: <4D36FE98.3070606@mwester.net>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com>
	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
	<4D36A64E.9060804@xora.org.uk>
	<AANLkTi=8uKvujKLqG2cw3h3gLmmcU=KNfdmSwB5imfsH@mail.gmail.com>
	<1295436662.2540.14.camel@scimitar>
	<AANLkTik9-k_euvDGZd+CFfQ9LyxD_7mubpVxPqyEsEVU@mail.gmail.com>
	<4D36FE98.3070606@mwester.net>
Date: Wed, 19 Jan 2011 16:44:35 +0100
Message-ID: <AANLkTikkZ4dJ=L5x807wLySf=tu=f04LPM6Vf6scdRdX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 15:45:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/19 Mike Westerhof <mike@mwester.net>:
> As I read this thread, I find that as a distro maintainer, I'm a bit
> unclear on a few points. =A0Pardon me if I've just failed to read/follow
> this thread...
>
> - So if I wish (or am forced) to use "layers", where do they come from?
> =A0Am I then responsible for finding a git hosting service, arranging for
> CIA commit messages, etc? =A0Or will each layer be hosted alongside the
> main OE repo? =A0Or have we not yet considered the added administrative
> burden of multiple repos?

I hope the latter, but this is not fully ironed out.

>
> - Does this not "silo" things even more? =A0For example, I have found lif=
e
> has gotten much easier now that other autobuilders are building SlugOS

You're welcome! Glad you like it (that reminds me that I still have to
add last weeks result to the table)

> -- but what incentive do people have if they have to deal with adding
> layers and all that, especially if the "SlugOS layer" ends up with a
> conflict in some fashion with the "Angstrom layer"? =A0And
> correspondingly, if I am struggling with some issue, would it not be
> less likely that I could get assistance and guidance from #OE if I'm
> using some layer?

My impression would be that the slugos layer would only contain the
slugos distro specific stuff.
E.g. things like conf/distro/slugos.conf and what is included by it,
and slugos specific recipes (probably things like upslug2, although
technically they are nslu2 specific not slugos specific, so they could
also go into an nslu2 machine layer).
But this has not really been discussed as far as i recall.
>
> - And unless I'm not missing something with the layers proposal (and I
> hope I am), is it not most likely that we'll end up with the following
> scenario:
>
> =A0a) Larger distros eventually fork OE-core and go off on their own as
> they find that their "layer" becomes more and more substantial compared
> to OE-core, especially when "people-originated conflicts" occur rather
> than "technically-originated conflicts" (a single repo tends to force
> resolution of the former).

I hope not. Actually as OE-core has also the yocto momentum behind it
I guess that forks will probably die because the additional effort is
not available or does not pay off well.
Preferably we should keep it one repo.
Having a good maintainer/integrator also helps (with authority and
good judgement).
The process for OE-core would probably be similar to what u-boot and
the kernel do.
>
> =A0b) Small distros are forced to comply with nothing but OE-core, or
> perish -- the cost of maintaining the extra infrastructure (git, cgit,
> CIA, etc, etc) along with the added complexity of teaching new distro
> developers about this new layer of stuff) is simply too high, not to
> mention that creating a layer for distro-specific stuff might be an
> instant killer in terms of autobuilder and assistance from the OE
> community at large (I ask myself -- do *I* intend to pull the Angstrom
> layer and build it? =A0I've done so in the past, but only because it was
> trivial to kick off such a build... but with layers, it seems it will be
> far harder to do so -- unless I'm missing something).

This is definitely  an issue we need to address.
>
> =A0c) Obscure/experimental distros simply die off, or find an alternative
> to OE. =A0The learning curve is quite steep already, and without access t=
o
> shared knowledge, shared recipes, and the assistance of the community,
> what is there to encourage a newcomer to use OE?

I'd hope there is lots of sharing and little effort needed to create a
new layer.

>
>
> I'm putting on my asbestos skivvies, since I expect this must have
> already been discussed :)

:-)

Enjoy, Frans.


