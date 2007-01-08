Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H3i5m-0002GI-EX
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 01:10:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0808hAO028954;
	Mon, 8 Jan 2007 00:08:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28727-02; Mon,  8 Jan 2007 00:08:41 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0808dKa028947
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 8 Jan 2007 00:08:39 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
In-Reply-To: <200701072023.53886.openembedded@hrw.one.pl>
References: <1168195833.5610.46.camel@localhost.localdomain>
	<45A141DF.40409@dominion.kabel.utwente.nl>
	<200701072023.53886.openembedded@hrw.one.pl>
Date: Mon, 08 Jan 2007 00:08:42 +0000
Message-Id: <1168214922.5610.64.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	l0808hAO028954
Cc: openembedded-devel@openembedded.org, bitbake-dev@lists.berlios.de
Subject: Re: [Bitbake-dev] Bitbake task dependency stamp handling
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
X-List-Received-Date: Mon, 08 Jan 2007 00:10:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 2007-01-07 at 20:23 +0100, Marcin Juszkiewicz wrote:
> Dnia niedziela, 7 stycznia 2007 19:54, Koen Kooi napisa=C5=82:
>=20
> > > If we move away from the digraph which isn't really needed anymore,
> > > taskData has the complete dependency tree available to it and the
> > > option of rebuilding the whole system if you recompile gtk becomes
> > > possible.
> > >
> > > At face value this sounds really useful. I'd guess that almost ever=
y
> > > OE developer would find it insanely annoying in practise though?
> >
> > Annoying, maybe, correct behaviour, yes. Option for local.conf?
>=20
> It will be good thing. But I think that there must be kind of option to=
=20
> tell which exactly package force other to be rebuilt. I would like to b=
e=20
> able to ignore situation where gcc packaging change introduce rebuild o=
f=20
> everything. But if gcc change and gtk+ will be also changed then I want=
=20
> to do build which will rebuild all gtk+ dependend recipes.

As an illustration, changing gcc packaging can affect gtk+ due to shlibs
and package renaming. Its likely at the very least gtk+ would repackage
as would almost everything.=20

> Having option in local.conf probably will be easier for bitbake parser=20
> then providing list of recipes which force 'own childs' to be rebuilt.

Bitbake would work out the list of recipes itself, in fact it already
knows this (have a look at the output from bitbake trunk's -g option).=20

I guess you mean defining the criteria for when to rebuild or not to
rebuild and this is hard :-/.

> I think that this is a place where we need some kind of UI which will b=
e=20
> able to request action from us (but rather on start of build then durin=
g=20
> build - many of our builds goes without any interactive usage (nightly=20
> runs etc).

Agreed and I'm trying to keep this in mind with the new UIs...

Cheers,

Richard



