Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1Jy0kJ-0000uB-1u
	for openembedded-devel@openembedded.org; Mon, 19 May 2008 10:29:27 +0200
Received: (qmail 9320 invoked by uid 813007); 19 May 2008 08:27:09 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 May 2008 08:27:09 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 May 2008 10:26:10 +0200
User-Agent: KMail/1.9.9
References: <c384c5ea0805141505r451510dar128090c7fc3d270@mail.gmail.com>
	<200805182355.25777.mickey@vanille-media.de>
In-Reply-To: <200805182355.25777.mickey@vanille-media.de>
MIME-Version: 1.0
Message-Id: <200805191026.10545.openembedded@haerwu.biz>
Subject: Re: Who is the wrt54oe maintainer?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 19 May 2008 08:29:27 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 18 maja 2008, Michael 'Mickey' Lauer napisa=B3:
> On Thursday 15 May 2008 00:05:25 Leon Woestenberg wrote:
> > who is the wrt54oe distro maintainer?
>
> Unfortunately, there's no one. I always had the hope we could get one
> of the openwrt-fork-maintainers on board. Marcin and me once did some
> work towards having this popular device in OE, but we both could not
> find enough time to keep it up.

wrt54 + wrt54oe was working combo to build packages for OpenWRT=20
installation. Today we also have distro config to build such ones with=20
OpenWRT provided toolchain.

> > It needs love in conf/distro/wrt54oe.conf, as it  isn't up to date
> > with our external toolchain opt-in, binutils-cross is not locked
> > down, and the c library was not chosen, nor its version.
>
> Indeed. Could I talk you into adding the necessary bits?=20

It should be uclibc 0.9.27 (or newer if binary compatible), binutils 2.18,=
=20
gcc 3.4.4.

> If not, feel free to move it to nonworking/conf/machine/.

You mean conf/distro/ dir? I would rather remove it at all if no one is=20
going to use it.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

           Could you please speak more slowly? I'm a masochist
           and I want to prolong the agony of this conversation.




