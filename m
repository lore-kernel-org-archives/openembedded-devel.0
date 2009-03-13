Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LiFJ1-0006ZA-JN
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 22:52:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 249F41416BC6;
	Fri, 13 Mar 2009 22:52:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FIkpnBVEr53X; Fri, 13 Mar 2009 22:52:33 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id B34FD1416BA5;
	Fri, 13 Mar 2009 22:52:32 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090313192008.GA20581@mercury.localdomain>
References: <49B5E3B9.70409@gmail.com>
	<1236709292.28500.27.camel@hammer.suse.cz> <49B73DC1.5000902@gmail.com>
	<74d0deb30903110117m2de9bd4cvd7bc88501e9c719b@mail.gmail.com>
	<1236760668.4955.5.camel@utx.utx.cz>
	<20090313192008.GA20581@mercury.localdomain>
Date: Fri, 13 Mar 2009 22:52:17 +0100
Message-Id: <1236981137.4355.28.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Cc: beagleboard@googlegroups.com,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] Avahi recipe & Openmoko
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
X-List-Received-Date: Fri, 13 Mar 2009 21:52:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ben Gamari wrote in Fri 03/13 2009 at 15:20 -0400:
> On Wed, Mar 11, 2009 at 09:37:48AM +0100, Stanislav Brabec wrote:
> > Ben, what will happen, it you remove avahi_0.6.21.bb from the tree?
> > Maybe it poisons the dependency checker?
>=20
> Indeed, after removing all of the avahi recipes other than _0.6.24.bb

It sounds like a bug of dependency checker.

> things work roughly as expected (i.e. no gtk+). Still 2000 packages wit=
h
> a few Xorg packages (libsm required by gstreamer, etc), but I probably
> just have high expectations.

It's almost surely fixable. Only few modules need X libraries. You
should just exclude these.

> Would it be possible to remove avahi
> versions prior to 0.6.24 from the repository?

Ask maintainers of distros with:

PREFERRED_VERSION_avahi-python ?=3D "0.6.21"

=EF=BB=BFNote: Preferring different versions of particular avahi sub-pack=
ages is
almost surely incorrect.

It's Openmoko. I guess that upgrade of avahi is sane. There is just one
important issue to check or fix (bug in libdaemon which triggers dead
loop in avahi):
https://bugzilla.novell.com/show_bug.cgi?id=3D469342


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



