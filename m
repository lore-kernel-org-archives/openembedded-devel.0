Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1Hv6fD-0008FA-6z
	for openembedded-devel@openembedded.org; Mon, 04 Jun 2007 09:07:39 +0200
Received: (qmail 30058 invoked by uid 813007); 4 Jun 2007 07:05:30 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 4 Jun 2007 07:05:30 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 4 Jun 2007 09:05:30 +0200
User-Agent: KMail/1.9.7
References: <bdb0025f0705301542s7e64e43cjb5b737e7f1958806@mail.gmail.com>
	<1180717608.6390.200.camel@localhost.localdomain>
	<bdb0025f0706011055g6e50927j97439ee462db7921@mail.gmail.com>
In-Reply-To: <bdb0025f0706011055g6e50927j97439ee462db7921@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200706040905.31450.openembedded@hrw.one.pl>
Subject: Re: strange error: missing depends...
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
X-List-Received-Date: Mon, 04 Jun 2007 07:07:39 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=B1tek, 1 czerwca 2007, Rodrigo Vivi napisa=B3:
> I believe that sometimes you just need the packageA without their
> rdepends, but it will be pretty useful it bitbake provided an easy
> option to build every depends... something like:
> bitbake packageA --build-rdepends

All DEPENDS and RDEPENDS are built during build of packageA - so no need=20
for "--build-rdepends" flag.

> Another idea that I have for the case that you want to build
> everything is an option --dontstop that makes bitbake don't stop when
> a rdepends build fail.

bitbake --help:
  -k, --continue        continue as much as possible after an error. While =
=20
                        the target that failed, and those that depend on
                        it, cannot be remade, the other dependencies of
                        these targets can be processed all the same.

Thats what you want?

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

               Avoid strange women and temporary variables.




