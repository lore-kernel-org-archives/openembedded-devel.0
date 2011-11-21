Received: from mail-dy0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RSacI-0008NF-Ik
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 21:37:26 +0100
Received: by dye2 with SMTP id 2so355698dye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 12:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uWk9JbJB6v8ZJZBnw28fWD5Z4hT1hK+St/t/CmXQPI0=;
	b=J7riXa3bxC5aBFt3Jcuc2WK9AK+J2kbmC8nbXLlbNAf2blWxQBpkLwWc2xnArD3kNR
	yShyIWbfS/rRC4v2ziQzk0nzxsgb/dBHSqme7Y6qeZaFgGTyehajN5T3z3rY5WUpQRBe
	BhyoukSNmc2Lg8n7wwp5WpxGSlBUtJ7lJQVSM=
Received: by 10.152.144.202 with SMTP id so10mr10197138lab.9.1321907454349;
	Mon, 21 Nov 2011 12:30:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id jb5sm10501415lab.15.2011.11.21.12.30.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 12:30:52 -0800 (PST)
Date: Mon, 21 Nov 2011 21:30:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111121203039.GM3565@jama.jama.net>
References: <20111104141806.GU9949@jama.jama.net>
	<20111104142028.GV9949@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111104142028.GV9949@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: libvpx causing gcc ICE when building for qemux86-64
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
X-List-Received-Date: Mon, 21 Nov 2011 20:37:26 -0000
X-Groupsio-MsgNum: 35507
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IoFIGPN1N3g1Ryqz"
Content-Disposition: inline

--IoFIGPN1N3g1Ryqz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2011 at 03:20:28PM +0100, Martin Jansa wrote:
> On Fri, Nov 04, 2011 at 03:18:06PM +0100, Martin Jansa wrote:
> > Hi, with latest gcc-4.6 from meta-oe I get this ICE:
> >=20
> > OE @ ~/shr-core/tmp/work/x86_64-oe-linux/libvpx-0.9.5-r0.0/libvpx-v0.9.=
5 $ x86_64-oe-linux-gcc    -m64 --sysroot=3D/OE/shr-core/tmp/sysroots/qemux=
86-64 -O2 -pipe -g -feliminate-unused-debug-types -fPIC -O3 -Wall -Wdeclara=
tion-after-statement -Wdisabled-optimization -Wpointer-arith -Wtype-limits =
-Wcast-qual -Wno-unused -I. -I"/OE/shr-core/tmp/work/x86_64-oe-linux/libvpx=
-0.9.5-r0.0/libvpx-v0.9.5" -I/OE/shr-core/tmp/work/x86_64-oe-linux/libvpx-0=
=2E9.5-r0.0/libvpx-v0.9.5/vp8 -I/OE/shr-core/tmp/work/x86_64-oe-linux/libvp=
x-0.9.5-r0.0/libvpx-v0.9.5/vp8 -c -o md5_utils.c.o md5_utils.c
> > md5_utils.c: In function 'byteSwap':
> > md5_utils.c:30:1: internal compiler error: Segmentation fault
> > Please submit a full bug report,
> > with preprocessed source if appropriate.
> > See <http://gcc.gnu.org/bugs.html> for instructions.
>=20
> And dropping -O3 is enough to make it compile again.

FWIW: Just tested with newer gcc from oe-core and the problem is still ther=
e.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IoFIGPN1N3g1Ryqz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7KtO8ACgkQN1Ujt2V2gBxc3ACfbIRp7TpNDjImQ8mDvQtzoOBo
fqUAnA047vq1MnVQysNlUAP9mUjrl15b
=4uZx
-----END PGP SIGNATURE-----

--IoFIGPN1N3g1Ryqz--
