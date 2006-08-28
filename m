Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <openembedded@hrw.one.pl>) id 1GHdjZ-0002tG-SD
	for openembedded-devel@openembedded.org; Mon, 28 Aug 2006 11:48:46 +0200
Received: (qmail 6609 invoked by uid 813007); 28 Aug 2006 09:46:46 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 28 Aug 2006 09:46:46 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Aug 2006 11:47:00 +0200
User-Agent: KMail/1.9.4
References: <E1GGZOX-0002WU-1s@linuxtogo.org>
	<20060827233927.GA9807@twibble.org>
In-Reply-To: <20060827233927.GA9807@twibble.org>
MIME-Version: 1.0
Message-Id: <200608281147.01329.openembedded@hrw.one.pl>
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
X-List-Received-Date: Mon, 28 Aug 2006 09:48:46 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=C5=82ek, 28 sierpnia 2006 01:39, Jamie Lenehan napisa=C5=82:

> Ah, good. I went through the sections used by all the recipes a while
> back and generated a list and some suggested renames. I'll include it
> here, along with the suggested renaming for some of the existing
> sections.

> I'll add this to the user manual once everyone is happy with it.=20

> I also think it would be a good idea might to emit a warning if someone
> tries to use a section name which is not definied in the list, so I
> might code that up as well.

Look at classes/sanity.bbclass


>     * applications		-> Really should find some other section?
>     * apps			-> REPLACE with applications

I would drop both rather as not describing anything.

>     * bootloader

bootloaders (as 'utils', 'editors', 'applications')

>     * console/shells

base/shell and console/shells? I would choose one.

>     * devel/libs

devel/perl

>     * devel/python
>     * devel/rexx
>     * devel/ruby

devel/scheme - we already has it (guile)

>     * devel/tcltk
[..]
>     * e/utils

fonts - TrueType fonts are currently in x11/fonts but can be used also by=20
OPIE and other not X11 applications

>     * gui

another not describing anything section...

>     * kde/dev

kde/devel rather

>     * kernel
>     * kernel/module		-> REPALCE with kernel/modules
>     * kernel/modules

virtual/kernel modules -> kernel, out-of-tree modules -> kernel/modules=20

What do you think?

>     * media-gfx			-> Find an existing category?
>     * multimedia

both need to be removed

>     * x11/gnome
>     * x11/gnome/libs

How does those two differ from other "gnome" ones? Can we move x11/gnome=20
to x11/* and x11/gnome/libs -> x11/libs?

=2D-=20
JID: hrw-jabber.org
Palmtop: Sharp Zaurus C760
OpenEmbedded/OpenZaurus developer

               Beware of Programmers who carry screwdrivers.
               		-- Leonard Brandwein


