Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QvQUK-0006TS-7t for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 11:08:08 +0200
Received: from f053036249.adsl.alicedsl.de ([78.53.36.249]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QvQPm-0004c0-BJ for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 09:03:26 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 11:03:24 +0200
In-Reply-To: <989A078976CDAD4CB2DC976EEF70E2A5068A53EB@eu2-mail.mgc.mentorg.com>
References: <201101310012.51498.schnitzeltony@gmx.de>
	<1296461709.3922.4.camel@mattotaupa> <20110131090826.149890@gmx.net>
	<989A078976CDAD4CB2DC976EEF70E2A5068A53EB@eu2-mail.mgc.mentorg.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314003805.12202.14.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [meta-oe] need to add some verfication package recipes
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
X-List-Received-Date: Mon, 22 Aug 2011 09:08:08 -0000
X-Groupsio-MsgNum: 33755
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-f2mFTi9LQKavIgEPbNdX"

--=-f2mFTi9LQKavIgEPbNdX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Noor,


Am Montag, den 22.08.2011, 09:53 +0200 schrieb Ahsan, Noor:

> I need to add some packages in meta-oe which are related to verification =
and benchmark. The packages are as follows. I just need to know in which di=
rectories the recipes of these package should go.
>=20
> 1. lmbench (Tools for performance analysis)
> 2. netperf (benchmark the performance of different type of networks)
> 3. iperf (measure maximum TCP and UDP bandwitdth)
> 4. bonie++ (filesystem benchmark tool)
> 5. izone3 (filesystem and disk benchmar)
> 6. dbench (used to stress the filesystem or a server to see which workloa=
d it become stuarated)
> 7. tbench (filesystem benchmark which generates load patterns)
> 8. toibench (multithreaded I.O benchmark)

there are some typos in the names above.

> Kindly suggest me to which recipes dir the recipes for these package shou=
ld go thanks.

I could not find a category specifically for performance tools. Just put
them into `meta-oe/recipes-support/` and submit the patches. The
developers will tell you then, if they have objections. I think you will
always get more responses when sending in ready-to-be-applied patch.
Although it might be more time for you. :(

It would be nice if the oe-core folks can comment too in case these
recipes should go into oe-core some day.


Thanks,

Paul

--=-f2mFTi9LQKavIgEPbNdX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5SG1wACgkQPX1aK2wOHVjtfgCdEIWPWYEZ4lDdVRLzQaBQiSBe
vUMAniCorY7vXYGRBQC8fMrhLtLa6vdw
=z9he
-----END PGP SIGNATURE-----

--=-f2mFTi9LQKavIgEPbNdX--
