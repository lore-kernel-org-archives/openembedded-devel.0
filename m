Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GeTgi-00010i-Lg
	for openembedded-devel@openembedded.org; Mon, 30 Oct 2006 10:44:12 +0100
Received: (qmail 16627 invoked by uid 813007); 30 Oct 2006 09:43:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 30 Oct 2006 09:43:33 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Oct 2006 11:43:31 +0200
User-Agent: KMail/1.9.5
References: <200610292344.10844.openembedded@hrw.one.pl>
In-Reply-To: <200610292344.10844.openembedded@hrw.one.pl>
Organization: OpenEmbedded
MIME-Version: 1.0
Message-Id: <200610301043.32043.openembedded@hrw.one.pl>
Subject: Re: Debian and RPM packages for easier start with OpenEmbedded
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
X-List-Received-Date: Mon, 30 Oct 2006 09:44:12 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 29 pa=BCdziernika 2006 23:44, Marcin Juszkiewicz napisa=B3:
> For one of my customers I prepared packages which have to make starting
> with OpenEmbedded easier. The idea is to install one metapackage which
> will depend on all required tools.
>
> There are two formats provided:
>
> - deb for Debian and Debian based distros

> Debian ones will be provided as APT repository so users will be able to
> just 'apt-get install openembedded-essential'.=20

Add this line to APT sources:

deb http://www.openembedded.org/dl/ packages/

(you can add it into /etc/apt/sources.list file or =20
in /etc/apt/sources.list.d/ directory as oe.list)

Then do "apt-get update; apt-get install openembedded-essential" to get it=
=20
installed.

Let me know if any problems appear or if you have suggestions what to=20
change.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

               Beware of Programmers who carry screwdrivers.
               		-- Leonard Brandwein




