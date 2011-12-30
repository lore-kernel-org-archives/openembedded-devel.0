Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rgefj-00041A-0B
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 16:47:07 +0100
Received: by eeit10 with SMTP id t10so8751334eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 07:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2sS4iuX1kQYIkN7RoNKLP8TuQlfRcRsaqBpnEzJky3Q=;
	b=NWhdOmNYT7X7CRHfc4fqHt4T0sW7zoHePWp46oGggUdqZ29VKwr6ytLWDWBPBdgq1R
	iwH+7+ADpFxFd93qzxTFQ2tLhLeENJgr8pVzt+MgHKPtjdWxgfGuu5gnD2WISvkZHxZc
	ocegtgxWIgwT+uViASvu/JObdBwPtaKMQ2DHQ=
Received: by 10.14.127.68 with SMTP id c44mr16363756eei.47.1325259587628;
	Fri, 30 Dec 2011 07:39:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm149212602eeh.5.2011.12.30.07.39.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 07:39:46 -0800 (PST)
Date: Fri, 30 Dec 2011 16:39:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111230153935.GI16885@jama.jama.net>
References: <012301ccc707$664a36e0$32dea4a0$@gmail.com>
MIME-Version: 1.0
In-Reply-To: <012301ccc707$664a36e0$32dea4a0$@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Including python libs
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
X-List-Received-Date: Fri, 30 Dec 2011 15:47:07 -0000
X-Groupsio-MsgNum: 36316
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rmUrFcWP4LYae1gV"
Content-Disposition: inline

--rmUrFcWP4LYae1gV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 30, 2011 at 08:26:25AM -0700, itodroid wrote:
> Greetings all!
>=20
> I'm having a little trouble figuring out the "right" way to include some
> extra python libraries into a recipe, and for the life of me, I cannot
> figure it out.  I'm using Python2.6 and I have a few python scripts that
> depend on httplib.  I've found that httplib.py is contained within
> "python-2.6.6-ml12.2". =20
>=20
> In my recipe, I've tried "include python-2.6.6ml12.2" and also "DEPEND +=
=3D
> python-2.6.6ml12.2", neither of which actually include the
> /usr/lib/python2.6/<python libs> into my rootfs.
>=20
> I believe that httplib is part of python-netclient which appears to be
> provided by python-2.6-manifest.inc.  I've also tried including this
> manifest file into my recipe, but still, I cannot get the libraries into =
my
> rootfs.
>=20
> Can anyone provide some insight as to what I'm doing wrong?  Thanks in
> advance.

If it's part of python itself then
RDEPENDS_${PN} +=3D "python"
if it's in python-netclient then
RDEPENDS_${PN} +=3D "python-netclient"

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rmUrFcWP4LYae1gV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk792zcACgkQN1Ujt2V2gBziUACfbX9+babqpd10FnBbPcJSqfOM
zYwAoKCbX+ezE5mV/1u3IpBdIYAAkrjG
=rUgM
-----END PGP SIGNATURE-----

--rmUrFcWP4LYae1gV--
