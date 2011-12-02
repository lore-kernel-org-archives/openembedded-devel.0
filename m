Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RWUaf-0001of-3U
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 15:59:53 +0100
Received: by wgbds11 with SMTP id ds11so1142980wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 06:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wa+ceF2iEBkqYI5wibMx+zOq0NBly1rKRwqXFbImNa8=;
	b=wj1+OdDyvtcty72CosYUraZEnDRjREOErFOkZrc8aM9Mj8fTNI2TpsD5eGREbtg93n
	cqgZEgr37SoLG8FnUtgzHVCcuNZgpVkWG3ME96mqDe3Mid8FasdqHzQcpw/owwD4Zh6F
	VzZo4NzvUBWTG7XuSy1G/nmwKVDrMEgm166wc=
Received: by 10.227.200.69 with SMTP id ev5mr6264327wbb.19.1322837590258;
	Fri, 02 Dec 2011 06:53:10 -0800 (PST)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	fw16sm10492393wbb.13.2011.12.02.06.53.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 06:53:08 -0800 (PST)
Date: Fri, 2 Dec 2011 15:52:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111202145256.GD3770@jama.jama.net>
References: <4ED8307F.2060306@googlemail.com>
	<201112021120.17762.GNUtoo@no-log.org>
	<4ED8DBC7.6080708@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <4ED8DBC7.6080708@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Fri, 02 Dec 2011 14:59:53 -0000
X-Groupsio-MsgNum: 35819
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline

--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2011 at 02:08:07PM +0000, Mr Dash Four wrote:
>=20
>=20
> Denis 'GNUtoo' Carikli wrote:
> > What are you using?
> > SHR-core or openembedded classic?
> >  =20
> Don't know if I am honest - there is a (very good) wiki page I have been=
=20
> following to build this ->=20
> http://www.openembedded.org/wiki/Getting_started. I presume it is=20
> openembedded classic since I downloaded all the stuff from that page=20
> (git://github.com/openembedded/openembedded.git is the repository used).

So yes this is OE-classic.

For building SHR you should follow SHR instructions:
http://wiki.shr-project.org/trac/wiki/Building%20SHR

Where are instructions for building from OE-classic as well as new
layers, but with htcdream there is problem in oe-core, see this thread:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/010993.=
html
 =20
> As I indicated earlier, I successfully built the shr-image (GUI-based) -=
=20
> it boots up OK on my smartphone, but I have no luck whatsoever with the=
=20
> console (i.e. just cli) images - I tried two: "console-image" and=20
> "fso-console-image", both unsuccessful (they do build, but my smartphone=
=20
> is having problems booting up properly with these).

I'm not familiar with htcdream, but this looks like some problem with kerne=
l fb=20
driver, you can try to boot shr-image, setup ssh access and then
shutdown xserver (with /etc/init.d/xserver-nodm stop) to see if you get
console login (check inittab if it's starting getty there) and also try
other vts with chvt.

If it works you can prepare console-image with right
/etc/network/interfaces to be able to ssh in as soon as it boots and
then debug those stripes over ssh too.

Well if you can get serial console to htcdream then it would be even
easier.

> > If you are using shr-core you need to fix that file:
> > openembedded-core/meta/conf/machine/include/arm/arch-armv6.inc
> > to include support for armv6-novfp and add a tune file for the CPU of t=
he=20
> > htcdream and then require that cpu tune file in the htcdream machine re=
cipe.
> >  =20
> I don't know whether I would need this. I also discovered yesterday that=
=20
> there is another openembedded git repository on freesmartphone.org=20
> (git://git.freesmartphone.org/openembedded.git), but not sure whether=20
> this is the same as the one I have been using...

This is usually used only by FSO people without R/W access to OE git to
prepare some changes.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Y5kgACgkQN1Ujt2V2gBxFfwCfWw4+OW58pFBgt/Z8lbzUR2VU
oVsAoKtp5OSNtQgWmKbXHbtCiOtx7AXb
=Zs2v
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--
