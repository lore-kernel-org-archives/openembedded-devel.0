Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RhIBn-0004fW-Gt for openembedded-devel@lists.openembedded.org;
	Sun, 01 Jan 2012 10:58:51 +0100
Received: from f053044090.adsl.alicedsl.de ([78.53.44.90]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RhI4z-0007l4-VN for openembedded-devel@lists.openembedded.org;
	Sun, 01 Jan 2012 09:51:50 +0000
Message-ID: <1325411493.3742.92.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 01 Jan 2012 10:51:33 +0100
In-Reply-To: <CAHucTJvY8BJsrpSDunZz_Rh703n=rpCps6idW7fYaH8diZr7nw@mail.gmail.com>
References: <1325331840-23575-1-git-send-email-adriano.pallavicino@gmail.com>
	<CACW_hTa+hpihvndWS-a7NZQme=+stZvUKxgtsxov3tdaqMj-xg@mail.gmail.com>
	<CAHucTJvY8BJsrpSDunZz_Rh703n=rpCps6idW7fYaH8diZr7nw@mail.gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCHv2][2011.03-maintenance] binutils_2.20.1 fixed md5 and sha256 sum
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
X-List-Received-Date: Sun, 01 Jan 2012 09:58:51 -0000
X-Groupsio-MsgNum: 36340
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-0r5oIxkDQnZve+Dqeai6"

--=-0r5oIxkDQnZve+Dqeai6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Adriano,


Am Samstag, den 31.12.2011, 15:25 +0100 schrieb Adriano Pallavicino:
> I can correctly download it from here
> ftp://ftp.gnu.org/gnu/binutils/binutils-2.20.1.tar.bz2 (as indicated insi=
de
> bb file). The problem is only in sha256 and md5 sum. I'm using
> 2011.03-maintenance. I can desume that this branch is only for maintainin=
g
> 2011.03 release. If someone decided to use binutils 2.20.1 why should I
> introduce the new 2.20.1a from master? All the things are tested with
> 2.20.1 and imho the branch 2011.03-maintenance must continue to utilize
> them.

please read the commit messages and the included links in the commit
messages for `binutils` in OpenEmbedded master branch. The link you
posted is [1] is just a symlink to 2.20.1a [2]. Try it out with `wget`.

The problem as mentioned in some commit messages was that some source
files were not included in 2.20.1 and therefore upstream had to update
that.

> Of course, if maintainers consider this patch useless, I'll remove it fro=
m
> here.


Thanks,

Paul


[1] ftp://ftp.gnu.org/gnu/binutils/binutils-2.20.1.tar.bz2
[2] ftp://ftp.gnu.org/gnu/binutils/binutils-2.20.1a.tar.bz2

--=-0r5oIxkDQnZve+Dqeai6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk8ALKYACgkQPX1aK2wOHVgkEgCcDrmF/NN45zTAwIIkB2pS+hzA
JxgAn27Amg9OYO+3UsyEEXTOzcNxy1nv
=/PM0
-----END PGP SIGNATURE-----

--=-0r5oIxkDQnZve+Dqeai6--
