Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUymp-0005qK-Sd
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 10:45:40 +0100
Received: by gyh20 with SMTP id 20so1643217gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 01:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=yxR5aJ9aIXvVgnDw1FYfNJOjWlcV4HEEXVN/mq/fgZw=;
	b=oWjHp6f46LiFLLWG/+oIqAG3wtpr9p7u5RelXu+9XUncckxo3kO7H3drXYCIGD408G
	+whQIEfuJ14BiRqozrRc/y4BnHKMP6Y5gM+r6VGHxfqFexXK2Fpg296/qTNv1ye2tK/A
	maLPQoI3n2XVtd9bkMBYkTn01yf7M/XK2LVaY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=RTZGZAQBKqO3VT50tebT27qd9lwzBby95n9QG7MDCb7HWjDrcu/9FR5coNw6nBQlKP
	zThIGIgrM/HvHqV+wL5CCmZyCS00PCPV3aVkzhJJ9NiAp0MLVCu3wweNENMWDPXU4bXj
	lB5QORBK2m1BW/O4lr1ozEdEJL0xwtAZ6KvkI=
Received: by 10.90.98.11 with SMTP id v11mr6760078agb.58.1292924732097; Tue,
	21 Dec 2010 01:45:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 21 Dec 2010 01:45:09 -0800 (PST)
In-Reply-To: <ienu66$5gf$1@dough.gmane.org>
References: <ienu66$5gf$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Dec 2010 01:45:09 -0800
Message-ID: <AANLkTimSZHSb23N1opQc=zQ4cNgsEzA_jaO_rn0=pV3o@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] meta-openembedded layer for yocto hosted on oe.org
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
X-List-Received-Date: Tue, 21 Dec 2010 09:45:40 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 20, 2010 at 7:53 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I've locally split
> http://gitorious.org/angstrom/angstrom-layers/commits/master into 3
> seperate git repos with git-filter-branch. I would like to move the
> meta-openembedded layer to the OE git server to make it easier for
> others to help in cleaning it up and getting more use to layers. The
> beagle and angstrom layers could move there as well, but those will need
> a more restricted set of committers.
>
> In essence I would like this to be the "official" OE layer for yocto
> while the board is dealing with the yocto negotiations.
>

yes this is something what we should do. We need to setup gitolite on
the git server
first which will give us finer control on access types. Cliff has been
working on it.


> This would be a good chance to try out things like 'maintainers' and
> 'pull requests' if we wanted to :)
>

yes this would be the intended model thereafter.

> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFND3wGMkyGM64RGpERAspRAKCQS+ZtZqw/my9oTZ8l+O4KqD+WDQCcDeij
> 7XzhyxcmFBpGtwWwGZC7QT0=
> =EH9g
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


