Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PCpHI-0004US-Fm
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 08:58:05 +0100
Received: by iwn42 with SMTP id 42so6202800iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 00:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=6vtlxEAdKlnR2+eMzVEe/tjuIBzxTIgFLyIC8Mdrq8M=;
	b=nbMOw4wuKaL9RF0y57odQN67+gjcpTJ+4Y2tKOdkLCvItSwlMQMvBOVsRA+ZyTummm
	kjKUV1oEGd0j2sA4HTaCDfZiUrfDIBWitIn8sAeto9lFHZkkrUJ6nkWyo4FbF54b4i/5
	zZ32vg4xXPAZNGC9dzf+kuo0FwRpUGqa5PrpM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wPnjSuQQ55RR8b+t/pQXvezyUDrVkXCE457coSfMG539pC+ShDKIwRyERq30jpa+L7
	qoFRzXX8iwpfvt1YA9GfvL92N5t3mqlVLDzqZEhA1YMxYXgU1EN7T6dje8i77ByEHiCt
	RHpqEeEgTC33QxpZpLR/HH8ZOSDvrJBS+gsjk=
MIME-Version: 1.0
Received: by 10.231.15.4 with SMTP id i4mr8005197iba.73.1288598236606; Mon, 01
	Nov 2010 00:57:16 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 00:57:16 -0700 (PDT)
In-Reply-To: <AANLkTinfxX_E3L30uK_nvm2hO5f0h-tDOu21mdXC2VGG@mail.gmail.com>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTinfxX_E3L30uK_nvm2hO5f0h-tDOu21mdXC2VGG@mail.gmail.com>
Date: Mon, 1 Nov 2010 08:57:16 +0100
Message-ID: <AANLkTin2CFC04W7jirzz9Tr7jv9w+mpQqpYRTs=4LLG=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 07:58:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/31 Yuri Bushmelev <jay4mail@gmail.com>:
> Hello!
>
>>> Every build will be started with clean $TMPDIR for now at least
>>
>> I mentioned this at OEDEM as well, only doing clean builds hides upgrade
>> path type of bugs (e.g. libcdio5 -> libcdio). It would be nice if an
>> incremental build going from testing-prev to testing-next would be done
>> as well before tagging.
>
> I need a lot of HDD space then.

:-)
Anyway if you are planning doing incremental builds, better have
INHERIT += "rm_work" in your local.conf to save space

> Should I do builds twice - clean and incremental?

That is upon you. Currently the agreement for the testing branch is to
start with a clean slate.
>
> Second question - is there any sense to clean/restore $TMPDIR between
> building of different images (x11-image/opie-image) but same machine &
> distro?

Not really. This has been discussed on the list and it was felt ok
build different testing recipes/images for the same machine/distro
without cleaning.
Inbetween cleaning will not help too much and takes quite some time.
it seems a good plan to mention that you did not clean inbetween (e.g.
by saying in same target-image cell that you did x11-image and
opie-image)

Actually you might want to do a bitbake x11-image opie-image as one command.
>
> I mean following workflow
>
> clean $TMPDIR/restore $TMPDIR from previous build of x11-image for
> this machine/distro
> build x11-image
> clean $TMPDIR/restore $TMPDIR from previous build of opie-image for
> this machine/distro
> build opie-image
> save $TMPDIR for next testing-next build
>
> VS
>
> clean $TMPDIR/restore $TMPDIR from previous build of this machine/distro
> build x11-image
> build opie-image
> save $TMPDIR for next testing-next build

As said before you can combine the build.

Wrt saving TMPDIR: if you want to do that a good solution is to define
TMPDIR as something like tmp-${DISTRO}-${MACHINE} or something like
that. No need to copy the tmp dir

An alternate solution is to use packaged staging to repopulate TMPDIR.

And thanks for your participation in the testing effort!
Frans


