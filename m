Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QzQHx-00045D-Ot for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 11:43:53 +0200
Received: from f053042120.adsl.alicedsl.de ([78.53.42.120]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QzQDM-0003jU-Pw for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 09:39:09 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 02 Sep 2011 11:38:57 +0200
In-Reply-To: <CAJR9bDK9z_vSNAON2VMkPebsyWGD6vAcrKkCkcSQvU8bRZt4Ww@mail.gmail.com>
References: <CAJR9bDJehg1CPqTBDyn12nFa048Vb1JwfPF7W96pj6ZfA-aHQQ@mail.gmail.com>
	<1314949058.3526.17.camel@mattotaupa>
	<CAJR9bDK9z_vSNAON2VMkPebsyWGD6vAcrKkCkcSQvU8bRZt4Ww@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314956338.3526.23.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: package trying to link to /usr/lib/.lib instead of /usr/lib during staging
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
X-List-Received-Date: Fri, 02 Sep 2011 09:43:53 -0000
X-Groupsio-MsgNum: 34012
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-ofRY6zCZEGSA1b0QrJpq"

--=-ofRY6zCZEGSA1b0QrJpq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Wei,


Am Freitag, den 02.09.2011, 17:58 +1000 schrieb Wei Kong:

> Apologies, but I am not sure how to proceed as I am new to posting on
> mailing lists.

please read the netiquette [1], for example please use interleaved style
when replying.

> I don't really want to commit this change,

In my opinion it is always good to contribute and try to get things
upstream. We are always looking forward to contributions.

> I was just seeing if anyone knows how to make openembedded look into
> the correct staging library folder, and the recipe was there just for
> reference.

I am not sure, but you are overwriting the tasks configure and compile.
Why do you have to do that? Is your package using autotools? Anyway, you
have to make sure that the correct paths are used when you call
`configure` and `make`. Normally OpenEmbedded uses `oe_runconf` and
`oe_runmake` and makes sure to path the correct things.

> But if I need to submit a patch to get some insight, please let me know.

I cannot promise anything but it would make helping easier.


Thanks,

Paul


[1] http://en.opensuse.org/openSUSE:Mailing_list_netiquette

--=-ofRY6zCZEGSA1b0QrJpq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5gpDEACgkQPX1aK2wOHViczACfT0rKKuqO+HR9GydfrrTce9IH
tf4An2PMHQ+LQ4eySdtAx7/vmD7JBN9/
=3aU7
-----END PGP SIGNATURE-----

--=-ofRY6zCZEGSA1b0QrJpq--
