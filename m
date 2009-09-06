Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MkMAI-00072o-8w
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 20:08:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id A6A061422AA8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2009 19:42:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTdZQo0pYI5d
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2009 19:42:29 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 3BA321416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2009 19:42:28 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1252240430.4490.160.camel@lenovo.internal.reciva.com>
References: <1252239576.4136.10.camel@utx.utx.cz>
	<1252240297.4490.158.camel@lenovo.internal.reciva.com>
	<1252240430.4490.160.camel@lenovo.internal.reciva.com>
Date: Sun, 06 Sep 2009 19:49:24 +0200
Message-Id: <1252259364.4021.12.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: very obscure race: access to a just-populated binary
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
X-List-Received-Date: Sun, 06 Sep 2009 18:08:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Phil Blundell wrote:
> On Sun, 2009-09-06 at 13:31 +0100, Phil Blundell wrote:

> > > =EF=BB=BF- extending of DEPENDS/RDEPENDS of native packages
>=20
> I'm not quite sure how this would help, but possibly I don't understand
> exactly what you're suggesting.

If intltool-native would contain DEPENDS =3D "grep-native", than intltool
build will probably wait for finishing of grep-native build or rebuild.

But it may be couter-productive to catch all of these dependencies (and
cause dependency loops) - coreutils-native, grep=EF=BB=BF-native, sed=EF=BB=
=BF-native
are dependencies of nearly all recipes.

> > > - do_unpack should respect dependencies, otherwise it can happen wi=
th
> > >   unzip-native
>=20
> As far as I know, do_unpack should already respect dependencies (i.e.
> "do_unpack[depends] +=3D ...".  Is that not working for you?

i did not know it. recipes/jpeg/jasper_1.900.1.bb and other recipes
contain DEPENDS =3D "unzip-native", and it does not work.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



