Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oz35C-0007m0-7s for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 09:52:39 +0200
Received: from f053038003.adsl.alicedsl.de ([78.53.38.3] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oz356-00044a-KB for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 07:52:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinzRQGe9CLG_n5g0sFG0NDdZBdU2RSL9KjgzokP@mail.gmail.com>
References: <AANLkTinzRQGe9CLG_n5g0sFG0NDdZBdU2RSL9KjgzokP@mail.gmail.com>
Date: Fri, 24 Sep 2010 09:52:30 +0200
Message-ID: <1285314751.3715.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: git error ?
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
X-List-Received-Date: Fri, 24 Sep 2010 07:52:39 -0000
X-Groupsio-MsgNum: 23922
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0ClVzcNwQapRUzBugFJj"

--=-0ClVzcNwQapRUzBugFJj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 23.09.2010, 22:11 +0200 schrieb Frans Meulenbroeks:
> Hm,
>=20
> On my latest git push I got:
>=20
> frans@linux-suse:~/oe/openembedded> git push
> Counting objects: 13, done.
> Delta compression using up to 2 threads.
> Compressing objects: 100% (7/7), done.
> Writing objects: 100% (8/8), 649 bytes, done.
> Total 8 (delta 6), reused 0 (delta 0)
> error: unable to create temporary sha1 filename : Read-only file system
>=20
> fatal: failed to write object
> error: unpack failed: unpack-objects abnormal exit
> To git@git.openembedded.org:openembedded
>  ! [remote rejected] org.openembedded.dev -> org.openembedded.dev (n/a
> (unpacker error))
> error: failed to push some refs to 'git@git.openembedded.org:openembedded=
'
>=20
>=20
> No idea what is going on here, guess it is at the git side. My fs is not =
r/o

I just wanted confirm, that you are not alone with this Git server
problem. I am getting the same error as some weeks ago [1].

        $ git remote update
        Fetching origin
        git.openembedded.org[0: 140.211.169.165]: errno=3DConnection refuse=
d
        fatal: unable to connect a socket (Connection refused)
        error: Could not fetch origin


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-September/=
023730.html

--=-0ClVzcNwQapRUzBugFJj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkycWLMACgkQPX1aK2wOHVgC1wCfVARhQbrnsd6MbIFCbbWqQguL
1MgAmwTISdmi+enaQgE1sXsSi0c+W6HZ
=DJUR
-----END PGP SIGNATURE-----

--=-0ClVzcNwQapRUzBugFJj--
