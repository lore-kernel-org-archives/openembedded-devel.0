Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f68.google.com (mail-wg0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 662D66F301
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:30:01 +0000 (UTC)
Received: by mail-wg0-f68.google.com with SMTP id a1so1101689wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IEiGYur5PxGPxRLLnmHtRro22B5jj220f3p8YeyH5ws=;
	b=rak1SbGv7abxrJhbuUBDf+9LsOGq0VzXK11D1hZKuzeKfbPZ+07RXAZzQviJN1oeHn
	5wPdu2dujMMP7vMcfelbUOZmkGlGbTcBTWWru4P89RiqiP2cPtOM9X95V3BLs492/y6I
	Yrig8MuxxHGRA3q5vVXnWKRYIMOTwvs3+TA5DTYj13+pMjM/xZvXJGuc4rH/MYnB+QWV
	HhOhdFGE+B/8pGFezFdqizVDd61GJ4kfdoXyTE2FgJhP5PetxYb2Cve9CV+677FSx8Us
	QKKhwozG87glgDTEWM6d7J/ChoVVD3y6wGERqOKF8RVlLTPX5cOnXNNw0Oy/RX6W6HtL
	/7dA==
MIME-Version: 1.0
X-Received: by 10.194.104.39 with SMTP id gb7mr4529512wjb.69.1393540202214;
	Thu, 27 Feb 2014 14:30:02 -0800 (PST)
Received: by 10.194.59.228 with HTTP; Thu, 27 Feb 2014 14:30:02 -0800 (PST)
In-Reply-To: <CAOLEWZVWNDNTTggnOEinOYtKZDuse5T_v=JOhRvyi-L9z5oUZQ@mail.gmail.com>
References: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
	<CALbNGRS6kRODsVKPVunWQzVSBwkKn8cXdSWwpmWTXhJ_chfeSA@mail.gmail.com>
	<CAFeBWL78jHPU1XUvo6PC4=Qy2RFKCphNbq4mH6Y_R0bbTyGMyg@mail.gmail.com>
	<CALbNGRTPPhRdLmyJAD2d3-Lmt=K-EQo-dSKwzt0a=Vcaq7rpMA@mail.gmail.com>
	<CAFeBWL7u1yEHLFoe_=TYH17-e+jJ-Jrq-S63h-UsvdniNw6U=g@mail.gmail.com>
	<CAOLEWZXkxbWSqWvJwHP4V+iMLOJ9OeHrht_S9eQj1qBc05xH3w@mail.gmail.com>
	<CAFeBWL45oks2uq5RLaPrCCbfMaBrA9-yb0DYOLd9jTuey+qC9w@mail.gmail.com>
	<CAOLEWZVWNDNTTggnOEinOYtKZDuse5T_v=JOhRvyi-L9z5oUZQ@mail.gmail.com>
Date: Thu, 27 Feb 2014 14:30:02 -0800
Message-ID: <CAOLEWZWObt3GLNL5WeSjb9vC4un73V9QWV0uU98FbCAn06x8cQ@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: GDM alternative?
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
X-List-Received-Date: Thu, 27 Feb 2014 22:30:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

And I think I just convinced myself I need to get slim working...


On Thu, Feb 27, 2014 at 2:29 PM, Stephen Arnold
<stephen.arnold42@gmail.com>wrote:

> It's a bit more subtle than just "obvious advantage" since the deps are
> different, config options are different, etc.  Slim is probably "lighter"
> than lxdm, in both features and dependency bloat.  The former pretty
> depends only on X11 libs and png (with optional pam and dbus/consolekit
> integration).  OTOH, lxdm has about the same pam/consolekit features, but
> depends on gtk[2|3].  So, a bit fancier and a little more bloat.  Which o=
ne
> do you think is easier to theme?  ;)
>
>
> On Wed, Feb 26, 2014 at 3:28 PM, Adam Lee <adam@gumstix.com> wrote:
>
>> Are there any obvious advantages over one another between LXDM and Slim?
>> I love how LXDM doesn't require complicated authentication framework lik=
e
>> GDM.
>>
>> Adam
>>
>>
>> On Tue, Feb 25, 2014 at 7:49 PM, Stephen Arnold
>> <stephen.arnold42@gmail.com>wrote:
>>
>> > Is there any interest in reviving slim?  I'm using it on gentoo-arm on
>> > several devices; works just like x86.  Since I haven't tried it or
>> > otherwise looked at it in oe yet, I have no idea why it's in a
>> non-working
>> > state.  That said, it was on my todo list until I noticed lxdm, so I'l=
l
>> > probably check it out at some point; never a bad idea to have another
>> > lightweight alternative...
>> >
>> > Steve
>> >
>> >
>> > On Thu, Feb 20, 2014 at 1:36 PM, Adam Lee <adam.yh.lee@gmail.com>
>> wrote:
>> >
>> > > Andreas, LXDM from meta-oe works well with minimal configuration on =
my
>> > part
>> > > :)
>> > > I didn't have to add another layer to satisfy dependencies. Thanks :=
)
>> > >
>> > > Adam
>> > >
>> > >
>> > > On Wed, Feb 19, 2014 at 11:36 PM, Andreas M=FCller <
>> > > schnitzeltony@googlemail.com> wrote:
>> > >
>> > > > On Wed, Feb 19, 2014 at 5:15 PM, Adam Lee <adam.yh.lee@gmail.com>
>> > wrote:
>> > > > > Thank you Koen and Andreas. That has been really helped in
>> clearing
>> > up
>> > > my
>> > > > > confusion and setting the path forward.
>> > > > >
>> > > > > I think I will try LXDM in meta-misc in meta-oe. Is there any
>> special
>> > > > > configuration that I should be aware of (other then setting it a=
s
>> the
>> > > > > graphical init manager)?
>> > > >
>> > > > meta-misc is my personal playground - it might have dependencies t=
o
>> > > > other layers and some things might not work as expected...
>> > > >
>> > > > Andreas
>> > > > _______________________________________________
>> > > > Openembedded-devel mailing list
>> > > > Openembedded-devel@lists.openembedded.org
>> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > > >
>> > > _______________________________________________
>> > > Openembedded-devel mailing list
>> > > Openembedded-devel@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

