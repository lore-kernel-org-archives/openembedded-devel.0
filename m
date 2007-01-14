Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1H6E8b-0004Aw-1E
	for openembedded-devel@openembedded.org; Sun, 14 Jan 2007 23:47:41 +0100
Received: (qmail 4674 invoked by uid 813007); 14 Jan 2007 22:45:24 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO c3-24.icpnet.pl)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 14 Jan 2007 22:45:24 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Jan 2007 23:45:20 +0100
User-Agent: KMail/1.9.5
References: <eoe96g$1aj$1@sea.gmane.org>
In-Reply-To: <eoe96g$1aj$1@sea.gmane.org>
MIME-Version: 1.0
Message-Id: <200701142345.21112.openembedded@hrw.one.pl>
Subject: Re: RFC: move m4 up to version 1.4.4
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
X-List-Received-Date: Sun, 14 Jan 2007 22:47:41 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 14 stycznia 2007 23:00, Rolf Leggewie napisa=B3:
> I would like to propose moving m4 up to version 1.4.4.
>
> It seems 1.4.2 that we are using now is causing problems at times ->
> bug 837. =A0The latest version is even 1.4.8 but anything past 1.4.4
> depends on autoconf >=3D 2.60.
>
> I have seen that there is a bb file in OE for 2.61 but with preference
> of -1 so I suspect something is not working. =A0Therefore I propose to go
> up to the latest version which works with the autoconf we have. =A0I
> prepared the bb files (same as 1.4.2 but SRC_URI without the patch
> file) and verified that m4 and m4-native do compile.

Build of gpe-image would be better test (as there will be some stuff which=
=20
will use m4). I started such build and it can be tracked on OE tinderbox:

http://ewi546.ewi.utwente.nl/tinderbox/showbuilds.pl?tree=3DAngstrom

It's "hrw-test-m4-1.4.4 Linux 2.6.9-34.0.1.EL Dep" one.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

  I don't know what your problem is, but I'll bet it's hard to pronounce.




