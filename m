Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 516896B819
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 18:41:42 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id lg15so2903372vcb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 11:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0oo7pLau+nxIHAzJ7zfQFa6bIIk/7AnX/7MherWhJGI=;
	b=WMoAiokfIu0B8WJqU85i2ZsjuSdoMrw3+5yBtwd0hizTTxlJY0HzXTt96NfaAuxgAr
	5POY/rSJqa/zoALWnhNETyRAW7td68p2wFHw/1bzoN9r0Dxqvwi4rwtjP0Ha0LEaJQlZ
	YKR97LUeI3FNBCg32NGzbviGMSe6Lekryb1vMf8hVW3kX0KN4kBuPX3MXJEymQ8XUTGG
	5iVTA0/CnDwmMlD26nEOgT9YFODmCFMXGkoTzsh9kyw+4jaoL8teg7H4xpcT3izP2rjo
	rJBI5C6WFwQ6bTWsdrSUArNQfuxmamN2nPgnafu9Twvaa7PKLpT7Rxogwj+WzlsHNrO0
	QgWg==
MIME-Version: 1.0
X-Received: by 10.220.109.1 with SMTP id h1mr16341820vcp.20.1395859303620;
	Wed, 26 Mar 2014 11:41:43 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Wed, 26 Mar 2014 11:41:43 -0700 (PDT)
In-Reply-To: <20140326182821.GG3709@jama>
References: <CAFeBWL73bvbfgZdNxHJshfLcGrQ647diP24Oy-vHjkCFX6XG+w@mail.gmail.com>
	<20140326182821.GG3709@jama>
Date: Wed, 26 Mar 2014 11:41:43 -0700
Message-ID: <CAFeBWL69O+4K4sP6jX1uFhPJ+K78Lh1DQLjwZrixRKK-wrYVRQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Warnings during build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Mar 2014 18:41:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

I see! I trust bitbake to link against the right one (newer one that is).

Thanks for ur response JaMa.

Adam


On Wed, Mar 26, 2014 at 11:28 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Mar 26, 2014 at 11:12:28AM -0700, Adam Lee wrote:
> > Hope I am not spamming the list with pesky questions.
> > I am getting build warnings similar to below:
> >
> > WARNING: gtk-immodule-ipa-2.24.22 was registered as shlib provider for
> > im-ipa.so, changing it to gtk3-immodule-ipa-3.10.7 because it was built
> > later
> >
> >
> > The full list of warnings can be found at - http://pastebin.com/quqwCPEq
> .
> >
> > I am not sure what these warnings are. They are definitely new in 1.6. I
> am
> > trying to figure out if there is something I can do, or if this will be
> > sorted out as we get closer to the 1.6 release date.
>
> See
> http://comments.gmane.org/gmane.comp.handhelds.openembedded/62213
>
> as long as nothing tries to link against im-ipa.so it's safe and you
> should just list them in PRIVATE_LIBS.
>
> The warning means that if something links with im-ipa.so then it's not
> known if it will get runtime dependency on gtk-immodule-ipa-2.24.22 or
> gtk3-immodule-ipa-3.10.7 (it will always be the one built later in the
> same sysroot).
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

