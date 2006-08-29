Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GHsHg-0007wb-Fm
	for openembedded-devel@openembedded.org; Tue, 29 Aug 2006 03:20:57 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 90BB8AD945
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 11:18:54 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18714-05 for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 11:18:52 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id DAB10AD92C
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 11:18:52 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id D2949F35147; Tue, 29 Aug 2006 11:18:52 +1000 (EST)
Date: Tue, 29 Aug 2006 11:18:52 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@openembedded.org
Message-ID: <20060829011852.GC31668@twibble.org>
References: <E1GGZOX-0002WU-1s@linuxtogo.org>
	<20060827233927.GA9807@twibble.org>
	<200608281147.01329.openembedded@hrw.one.pl>
	<20060829011415.GA31668@twibble.org>
Mime-Version: 1.0
In-Reply-To: <20060829011415.GA31668@twibble.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: Section list
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Aug 2006 01:20:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This time I'll send this to the list...

On Mon, Aug 28, 2006 at 11:47:00AM +0200, Marcin Juszkiewicz wrote:
> Dnia poniedzia=C5=82ek, 28 sierpnia 2006 01:39, Jamie Lenehan napisa=C5=
=82:
[...]
> >     * console/shells
>=20
> base/shell and console/shells? I would choose one.

base/shell is the most common, only fush uses console/shells, so make
this one base/shell.

[...]
> >     * kernel
> >     * kernel/module		-> REPALCE with kernel/modules
> >     * kernel/modules
>=20
> virtual/kernel modules -> kernel, out-of-tree modules -> kernel/modules=
=20
>=20
> What do you think?

I don't think that makes much sense. I would go to section "kernel"
to find a new kernel and to "kernel/modules" to find modules for the
kernel. I don't think it matters to the end user where those modules
were from.

[...]
> >     * x11/gnome
> >     * x11/gnome/libs
>=20
> How does those two differ from other "gnome" ones? Can we move x11/gnom=
e=20
> to x11/* and x11/gnome/libs -> x11/libs?

Hmm, yeah there are a few gnomes:

    * gnome/libs
    * gnome/multimedia
    * x11/gnome
    * x11/gnome/libs

The gnome core puts itself in x11/gnome/* while apps/libraries from other
people seem to put themselves in gnome/*. So you think this is the best w=
ay
to handle this?:

    * gnome/libs		-> x11/libs
    * gnome/multimedia		-> x11/multimedia
    * x11/gnome			-> x11
    * x11/gnome/libs		-> x11/libs

--=20
 Jamie Lenehan <lenehan@twibble.org>


