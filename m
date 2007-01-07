Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1H3de6-000280-Qr
	for openembedded-devel@openembedded.org; Sun, 07 Jan 2007 20:25:30 +0100
Received: (qmail 31649 invoked by uid 813007); 7 Jan 2007 19:23:56 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 7 Jan 2007 19:23:56 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 7 Jan 2007 20:23:52 +0100
User-Agent: KMail/1.9.5
References: <1168195833.5610.46.camel@localhost.localdomain>
	<45A141DF.40409@dominion.kabel.utwente.nl>
In-Reply-To: <45A141DF.40409@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200701072023.53886.openembedded@hrw.one.pl>
Cc: bitbake-dev@lists.berlios.de
Subject: Re: Bitbake task dependency stamp handling
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
X-List-Received-Date: Sun, 07 Jan 2007 19:25:31 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 7 stycznia 2007 19:54, Koen Kooi napisa=B3:

> > If we move away from the digraph which isn't really needed anymore,
> > taskData has the complete dependency tree available to it and the
> > option of rebuilding the whole system if you recompile gtk becomes
> > possible.
> >
> > At face value this sounds really useful. I'd guess that almost every
> > OE developer would find it insanely annoying in practise though?
>
> Annoying, maybe, correct behaviour, yes. Option for local.conf?

It will be good thing. But I think that there must be kind of option to=20
tell which exactly package force other to be rebuilt. I would like to be=20
able to ignore situation where gcc packaging change introduce rebuild of=20
everything. But if gcc change and gtk+ will be also changed then I want=20
to do build which will rebuild all gtk+ dependend recipes.

Having option in local.conf probably will be easier for bitbake parser=20
then providing list of recipes which force 'own childs' to be rebuilt.

I think that this is a place where we need some kind of UI which will be=20
able to request action from us (but rather on start of build then during=20
build - many of our builds goes without any interactive usage (nightly=20
runs etc).

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

    42? 7 and a half million years and all you can come up with is 42?!




