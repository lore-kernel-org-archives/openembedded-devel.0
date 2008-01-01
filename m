Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <oe@hentges.net>) id 1J9nWj-0001x0-DW
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jan 2008 21:15:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 744D8308010;
	Tue,  1 Jan 2008 21:09:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at hentges.net
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563.serverkompetenz.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id E1HknROVHeUj; Tue,  1 Jan 2008 21:09:26 +0100 (CET)
Received: from [192.168.5.10] (xdsl-87-79-213-37.netcologne.de [87.79.213.37])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id A0AC8308004;
	Tue,  1 Jan 2008 21:09:26 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <202073967.20080101214225@gmail.com>
References: <E1J9k05-00006v-OV@linuxtogo.org>
	<1067194706.20080101190354@gmail.com>
	<1199213397.8062.62.camel@localhost.localdomain>
	<202073967.20080101214225@gmail.com>
Date: Tue, 01 Jan 2008 21:09:25 +0100
Message-Id: <1199218165.8062.77.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.2 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev gpsd: Provide working	default configuration and init-script for fic-gta01. This makes gpsd	device-specific for gta01, please check the feeds.
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
X-List-Received-Date: Tue, 01 Jan 2008 20:15:55 -0000
X-Groupsio-MsgNum: 3779
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-YLSdm6AB2F5NIQzncrBN"

--=-YLSdm6AB2F5NIQzncrBN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Am Dienstag, den 01.01.2008, 21:42 +0200 schrieb Paul Sokolovsky:
> Hello Matthias,
>=20
> Tuesday, January 1, 2008, 8:49:57 PM, you wrote:
>=20
> > Hey there.=20
>=20
> > Am Dienstag, den 01.01.2008, 19:03 +0200 schrieb Paul Sokolovsky:
> >> Hello,
> >>=20
> >>       Working default configuration should go to ${PN}-conf or
> >> something, like most of OE does, and few remaining uncomplying package=
s are
> >> being converted. This helps with build, QA, and release management. Th=
anks.
> >>=20
>=20
> > could you please point me to a sample package with acceptable
> > integration of -conf? I'd rather _not_ do this a third time.
>=20
>   mplayer & mplayer-common by you are good examples. mplayer-common so
> far is not machine-specific, but if we'll *really* find it beneficial
> to make it so, we're all set for that. keylaunch & keylaunch-conf are
> another recent refactor, by me, with keylaunch-conf being actually
> per-machine.
>=20
>   I see where current problem lies with the code you committed - in
> snippet like this:
>=20
> +# gpsd This shell script starts and stops gpsd.
> []
> +       if test -e /home/root/gllin/gllin
> +       then
> +               /home/root/gllin/gllin >/var/log/gllin.log 2>&1 &
> +       else
> +               echo -e "\n\ngllin GPS driver for Neo1973 not found,"
> +               echo "please install the gllin package from"
> +               echo "http://3rdparty.downloads.openmoko.org/gllin/"
> +               echo ""
> +               exit 1
> +       fi
>=20
>   So, one thing is device-specific conf, another way is generic gpsd's
> device-specific service init. But that's why it would be nice if we
> adopted soft vs soft-conf split as consistent best practice - then
> snippets like above would seem to us as anomaly right away, and we'd
> think how to solve it.
>=20
>   The issue here that /etc/init.d/gpsd tries to init both gpsd and
> gps hardware. Why not separate them. Say, have /etc/init.d/gllin with
> that snippet.=20

Difficult. /e/i/gllin should, if at all, be provided by the gllin
package. It is a hand-crafted ipkg containing a binary-only driver. It
will be an interesting task to find someone at OM willing to change it.
Maybe if I annoy mickey enough... ;)

> But wait, there're different GPS hardware exists, why
> don't we make it polymorphic? So, we'd have /etc/init.d/gps-hardware,
> and that's for should would be device-specific. Then, /etc/init.d/gpsd
> could do sth like:
>=20
> [ -x /etc/init.d/gps-hardware ] && /etc/init.d/gps-hardware start
>=20
> to make sure that it ups entire GPS system.
>=20
>   How does that sound?

That sounds like a very good idea, I like the generic approach better
than a hard-coded init-script. I will try to get the gllin ipk changed,
but that may take a few days.

What do you think about installing /etc/default/gpsd via
update-alternatives so a driver could install proper defaults w/o
resorting to a -conf at all?

Not that many drivers are going to do this. Neo1973 is probably a very
special case in this regard.
--=20
Matthias 'CoreDump' Hentges=20
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice



--=-YLSdm6AB2F5NIQzncrBN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHep31PXyoPq8wMNkRAlLDAKDW0JfQ+aTi3bxTAU7XN5ixQEs9JQCfUjJt
ls8Lknk1B4LyesM0WLcocZc=
=m/1U
-----END PGP SIGNATURE-----

--=-YLSdm6AB2F5NIQzncrBN--
