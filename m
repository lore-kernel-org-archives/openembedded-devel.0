Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QDZui-00012A-9L for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 12:18:08 +0200
Received: from f053045164.adsl.alicedsl.de ([78.53.45.164]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QDZt0-0000NE-T5 for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 10:16:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <loom.20110423T113131-855@post.gmane.org>
References: <1302979061.3780.6.camel@mattotaupa>
	<1303062425.23572.31.camel@mattotaupa> <4DACB16C.6050303@eric-weiss.de>
	<loom.20110423T113131-855@post.gmane.org>
Date: Sat, 23 Apr 2011 12:15:42 +0200
Message-ID: <1303553742.4551.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [RFC] [PATCH] schroedinger: add version 1.0.10
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
X-List-Received-Date: Sat, 23 Apr 2011 10:18:08 -0000
X-Groupsio-MsgNum: 31411
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-h575E178HUBYksMSYplO"

--=-h575E178HUBYksMSYplO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear DmitryZ,


Am Samstag, den 23.04.2011, 09:33 +0000 schrieb DmitryZ:
> eric weiss <eric <at> eric-weiss.de> writes:

> > Try to compile schroedinger_1.0.9 with orc_0.4.10  instead of orc_0.4.1=
2
> > seems that the int[8,16,32]_t definitions are gone int orc_0.4.12.

> As being newbie to the OpenEmbedded and facing the same problem would you=
 please=20
> instruct me how I can change the orc version and rebuild the package ?

please update to latest master and make a new build from scratch, i. e.,
remove your build directory beforehand.

You could also use `bitbake -c clean yourprogramname` before the upgrade
to try to get rid of the wrong versions.


Thanks,

Paul

--=-h575E178HUBYksMSYplO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2ypskACgkQPX1aK2wOHViLawCgiKIN4JxngqMuudVoDeQeJ2N1
c00AmQGW8t7awQmegz6+vSPDwA/Ud+yq
=qFzp
-----END PGP SIGNATURE-----

--=-h575E178HUBYksMSYplO--
