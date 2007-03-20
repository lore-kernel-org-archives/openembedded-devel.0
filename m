Received: from [65.254.253.40] (helo=mailout05.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.63) (envelope-from
	<SRS0=L1Ds5l=IY=thegnar.org=markgross@yourhostingaccount.com>)
	id 1HTV4M-0002mc-1N for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2007 04:31:31 +0100
Received: from mailscan49.yourhostingaccount.com ([10.1.15.49]
	helo=mailscan49.yourhostingaccount.com)
	by mailout05.yourhostingaccount.com with esmtp (Exim)
	id 1HTV4K-0003AU-Uk for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2007 23:31:28 -0400
Received: from authsmtp08.yourhostingaccount.com ([10.1.18.8] ident=exim)
	by mailscan49.yourhostingaccount.com with spamscanlookuphost (Exim)
	id 1HTV4L-00034I-31 for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2007 23:31:29 -0400
Received: from authsmtp08.yourhostingaccount.com ([10.1.18.8]
	helo=authsmtp08.yourhostingaccount.com)
	by mailscan49.yourhostingaccount.com with esmtp (Exim)
	id 1HTV4K-00034F-Q7 for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2007 23:31:28 -0400
Received: from pool-71-117-247-154.ptldor.fios.verizon.net ([71.117.247.154]
	helo=mgross-desktop)
	by authsmtp08.yourhostingaccount.com with esmtpa (Exim)
	id 1HTV4K-0004Fk-CH for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2007 22:31:28 -0500
Received: by mgross-desktop (Postfix, from userid 1000)
	id 85869C2E59; Mon, 19 Mar 2007 20:31:20 -0700 (PDT)
Date: Mon, 19 Mar 2007 20:31:20 -0700
From: Mark Gross <markgross@thegnar.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070320033120.GA8678@thegnar.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.11
X-EN-UserInfo: 797c2c580f2f40de3d8825fee4eaf462:2545611f8b0606d1227160eb92fd62ea
X-EN-AuthUser: markgross
Sender: Mark Gross <markgross@thegnar.org>
X-EN-OrigIP: 71.117.247.154
X-EN-OrigHost: pool-71-117-247-154.ptldor.fios.verizon.net
Subject: bitbake and OE opperation
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
X-List-Received-Date: Tue, 20 Mar 2007 03:31:36 -0000
X-Groupsio-MsgNum: 1649
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm trying to wrap my head around bit bake and the open embedded recipe
files design and structure.

Also, I'm a relative newbie WRT Python.

I'm trying to understand the way bit bake builds the dependency trees
and works at a low level.   Trying to reverse engineer it from the
python code is difficult.  Does anyone recommend any browser tools for
navigating a large python code base like bit bake?

I've read the documentation pages I could find but I haven't found any
"theory of operation" types of documents.  Are there any such things?

The questions I have are:
How does a simple command line "bitbake slogos-image" translate into
building all the components? =20

How does bitbake push in the ./configure command line options?

Are there tools for doing analysis on the open embedded bb library? =20

Thanks,

--mgross

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFF/1WIhK5OsmQOmSARAnrtAJ9DpeVjh1SQ0QGZEfnzhGzlCJyxrQCfSyfh
DH1DyvTymVnbQR+8/n50QJk=
=ZHbX
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
