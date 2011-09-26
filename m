Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R8ItY-0007W0-VE for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 23:39:25 +0200
Received: from f053036041.adsl.alicedsl.de ([78.53.36.41]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R8IoO-0008C3-6N for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 21:34:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2011 23:34:00 +0200
In-Reply-To: <20110926195736.GB24402@denix.org>
References: <BAY168-W73BC4907A15BF1630143379D0F0@phx.gbl>
	<BAY168-W1105B78F9D2BC795FE21E909DF30@phx.gbl>
	<20110926195736.GB24402@denix.org>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1317072842.8065.38.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: do_patch failure ltp_20101031.bb as file not uncompressed propely
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
X-List-Received-Date: Mon, 26 Sep 2011 21:39:25 -0000
X-Groupsio-MsgNum: 34489
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-d4n6uLc1S03x0BMbNzrg"

--=-d4n6uLc1S03x0BMbNzrg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ali, dear Denys,


Am Montag, den 26.09.2011, 15:57 -0400 schrieb Denys Dmytriyenko:
> On Tue, Sep 27, 2011 at 12:39:23AM +0500, ali anwar wrote:
> >=20
> > > From: ali_3k1@hotmail.com
> > > To: openembedded-devel@lists.openembedded.org
> > > Date: Fri, 23 Sep 2011 18:36:55 +0500
> > > Subject: Re: [oe] do_patch failure ltp_20101031.bb as file not uncomp=
ressed propely
> > >=20
> > >=20
> > > To elaborate manually "tar -xf" untar as well as uncompressd the=20
> > > tp-full-20101031.bz2 file. Where as OE only uncompressed it and did N=
OT=20
> > > untar so I recieved following:
> > > ERROR: Error executing a python function in=20
> > > /home/qatools/ali/trunk/meta-oe/meta-oe/recipes-benchmark/ltp/ltp_201=
01031.bb:OSError:=20
> > > [Errno 20] Not a directory: '/home/qatools/ali/trunk/build_release_lt=
p/work/ppce500mc-linux/ltp-20101031-r0/ltp-full-20101031'

> Please contact upstream and request they fix their filename - the way the=
y=20
> named it clearly indicates it's bz2 compressed, but not a tar archive. It=
=20
> should be either .tar.bz2 or at least .tbz2 extension and not just .bz2

That would indeed be the best solution.

I still could not figure out though what has changed since
decompressing/unpacking the archive must have worked some time back. I
tried BitBake 1.8 but it also failed with the same error.

Is there a way to specify the file name the downloaded file should be
saved as?


Thanks,

Paul


PS: Ali, please adhere to the netiquette [1].


[1] http://en.opensuse.org/openSUSE:Mailing_list_netiquette

--=-d4n6uLc1S03x0BMbNzrg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6A78kACgkQPX1aK2wOHVgLzACeJsL0nGLoq/q5xV4vKDGhcbmb
vAUAnilBmcMzCOuuzn/XLzbrUM4q1bOw
=IyMB
-----END PGP SIGNATURE-----

--=-d4n6uLc1S03x0BMbNzrg--
