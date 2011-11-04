Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RMKj9-0001YN-Tu
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 15:26:40 +0100
Received: by eyd9 with SMTP id 9so2047170eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 07:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9v5tQzrX7zXYcCqp4QmuSHn5yJoJvUxlr+eiB7W/fio=;
	b=yHRHwtlC7ZpvpNAHoo67ZHeTgRA4xki1H55tnlUXSmoYA/uqKndbSlmdi+z1a+7YfH
	aCI8IfLJrcKbzmL++H/ld6HZobyQtoFKSyqASzTqj6xBaKsGaqs90cZOWm9s/v4oPWfL
	QWsmbYvE46u8Xe0kQMZAwOAUnfdJdYZCrmWuc=
Received: by 10.213.108.133 with SMTP id f5mr1607722ebp.39.1320416430473;
	Fri, 04 Nov 2011 07:20:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm25614880eea.6.2011.11.04.07.20.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 07:20:29 -0700 (PDT)
Date: Fri, 4 Nov 2011 15:20:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111104142028.GV9949@jama.jama.net>
References: <20111104141806.GU9949@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111104141806.GU9949@jama.jama.net>
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
X-List-Received-Date: Fri, 04 Nov 2011 14:26:40 -0000
X-Groupsio-MsgNum: 35213
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z0wTxTCd2IDq3u/i"
Content-Disposition: inline

--Z0wTxTCd2IDq3u/i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2011 at 03:18:06PM +0100, Martin Jansa wrote:
> Hi, with latest gcc-4.6 from meta-oe I get this ICE:
>=20
> OE @ ~/shr-core/tmp/work/x86_64-oe-linux/libvpx-0.9.5-r0.0/libvpx-v0.9.5 =
$ x86_64-oe-linux-gcc    -m64 --sysroot=3D/OE/shr-core/tmp/sysroots/qemux86=
-64 -O2 -pipe -g -feliminate-unused-debug-types -fPIC -O3 -Wall -Wdeclarati=
on-after-statement -Wdisabled-optimization -Wpointer-arith -Wtype-limits -W=
cast-qual -Wno-unused -I. -I"/OE/shr-core/tmp/work/x86_64-oe-linux/libvpx-0=
=2E9.5-r0.0/libvpx-v0.9.5" -I/OE/shr-core/tmp/work/x86_64-oe-linux/libvpx-0=
=2E9.5-r0.0/libvpx-v0.9.5/vp8 -I/OE/shr-core/tmp/work/x86_64-oe-linux/libvp=
x-0.9.5-r0.0/libvpx-v0.9.5/vp8 -c -o md5_utils.c.o md5_utils.c
> md5_utils.c: In function 'byteSwap':
> md5_utils.c:30:1: internal compiler error: Segmentation fault
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://gcc.gnu.org/bugs.html> for instructions.

And dropping -O3 is enough to make it compile again.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Z0wTxTCd2IDq3u/i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6z9KwACgkQN1Ujt2V2gBxw4gCgui+6nbUdgm8bEZp4CPw5jyXW
81wAnj8I69iJqlQkvzcbaH5olq2yk7ns
=j0z8
-----END PGP SIGNATURE-----

--Z0wTxTCd2IDq3u/i--
