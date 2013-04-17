Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USS3e-0000eK-Bo
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 15:05:59 +0200
Received: by mail-da0-f45.google.com with SMTP id v40so771789dad.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 05:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OBGxpxRoKnOzYslqjF9JMoZI49aYkDu7F1xMRvMtskY=;
	b=oTB/RWK+2UVoq1j8A9ngDsVD4HnVRfo7AS5fo4qI+W0P+112a60bI5w4Dke76DO7+p
	NNyySdETQd40cz6b/5H9hVE7UFbG78j+9Gaq5c+VEHnpc12obv8/azbSOHKNWpQSkpro
	ZCmriWT39KmFl2yBFACZkITBVGTyXnfYkyFE//k7iCDwKoHpdUkN1KndHrJFCs5crzpV
	CKLvBCO09RQkZvJi3lFEdiK6PjnUb+c8wsdyDKtzf4gB7lQe1xHO3bqO49N0327Qait5
	cBhXBKzdBD6VyvUq4gyuojI3I+DdHrnVS1HuAQPZFT4Kx+nQ9rjFzs12cvt9y6to2ETX
	K6BQ==
X-Received: by 10.68.100.164 with SMTP id ez4mr8987210pbb.109.1366202901605;
	Wed, 17 Apr 2013 05:48:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id be10sm6201230pbd.30.2013.04.17.05.48.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 05:48:20 -0700 (PDT)
Date: Wed, 17 Apr 2013 14:48:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130417124813.GH26007@jama>
References: <1366200081-12326-1-git-send-email-ml@communistcode.co.uk>
	<516E9198.1090607@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <516E9198.1090607@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCHv3 1/3] net-snmp: fix failure when starting on system without pci bus
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
X-List-Received-Date: Wed, 17 Apr 2013 13:06:00 -0000
X-Groupsio-MsgNum: 44286
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KscVNZbUup0vZz0f"
Content-Disposition: inline

--KscVNZbUup0vZz0f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 01:12:08PM +0100, Jack Mitchell wrote:
> On 17/04/13 13:01, Jack Mitchell wrote:
> > From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> >
> > The snmpd daemon cannot start on platforms without a pci bus:
> >
> > snmpd[15460]: pcilib: Cannot open /proc/bus/pci
> > snmpd[15460]: pcilib: Cannot find any working access method.
> >
> > snmpd should not depend on a PCI bus and should simply move on.
> >
> > Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> > ---
> >   .../recipes-extended/net-snmp/files/ifmib.patch    | 66 +++++++++++++=
+++++++++
> >   .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |  1 +
> >   2 files changed, 67 insertions(+)
> >   create mode 100644 meta-oe/recipes-extended/net-snmp/files/ifmib.patch
>=20
> I've pushed to my github here to try solve the patches failing.
>=20
> git://github.com/CommunistCode/meta-oe.git

2/3 and 3/3 are in wrong order (3/3 causes PR going backwards), but I'm
willing to accept this - broken upgrade path while bisecting git repo is
kind of expected.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KscVNZbUup0vZz0f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFumg0ACgkQN1Ujt2V2gBxqPACdEChnSJh+IPf7dBAyw6muQg+l
HmoAmwREm51FODS5SAu6gvyvL0Vqp7k1
=3SBP
-----END PGP SIGNATURE-----

--KscVNZbUup0vZz0f--
