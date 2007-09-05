Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1ISypz-0005Au-LV
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2007 19:38:47 +0200
Received: by wa-out-1112.google.com with SMTP id l24so2828647waf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2007 10:36:18 -0700 (PDT)
Received: by 10.114.192.1 with SMTP id p1mr5024320waf.1189013777322;
	Wed, 05 Sep 2007 10:36:17 -0700 (PDT)
Received: by 10.114.145.19 with HTTP; Wed, 5 Sep 2007 10:36:14 -0700 (PDT)
Message-ID: <432beae0709051036r64d5d8aaj425f7846780c67c@mail.gmail.com>
Date: Wed, 5 Sep 2007 10:36:14 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46DE979B.2070405@kernelconcepts.de>
MIME-Version: 1.0
References: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
	<46DE979B.2070405@kernelconcepts.de>
Subject: Re: [RFC] How to handle external kernel patches in oe the right way?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2007 17:38:47 -0000
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 9/5/07, Nils Faerber <nils.faerber@kernelconcepts.de> wrote:
> Stefan Schmidt schrieb:
> > Hello.
> Hi!
>
> > Due to my work on OpenEZX (http://www.openezx.org) I'm in touch with
> > external kernel patches used in OE to build working kernels for
> > different Motorola mobile phones.
> >
> > Talking with Koen about the best way to handle this we have some
> > slightly different opinions on this. So we like to get some more
> > opinions on this before pinning to a strategy.
> >
> > Koen like to pull the patches from a known-good rev into oe to have
> > them all at one place for less fragile building and tweaking.
> >
> > I prefer OE to use our svn server with a fixed SRCREV which gets
> > updated once a newer version is known good. I'm not a fan of
> > duplicating the patches in OE if some small tweaking patches can also
> > handle it.
>
> To add my 0.02=80 ;)
> I also see both points, for good and for bad.
> I have the same situation here currently, I am doing the integration of
> a third party board (which will be committed to OE...). The board
> manufacturer does it's own kernel port and maintains own patches. But
> the manufacturer does not do the OE maintenance.
> Including the patch in OE would mean that the patch is stale and once
> the kernel maintainer creates a new patch (against the same kernel
> version) they would have to send the patch to me so that I can get it
> into OE.
> So I decided for now to directly pull the patch from their external
> source. If they do updates they would be automatically included in a
> next build.
>

That's not really true. OE won't rebuild the kernel unless the PR has
been changed. When they update their patch they still need to tell you
so that you can update the PR in OE.

--=20
Justin Patrin


