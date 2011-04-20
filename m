Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCU2Y-0005wG-2Z for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 11:49:53 +0200
Received: from f053033014.adsl.alicedsl.de ([78.53.33.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCU0n-00035x-JD for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 09:47:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201104201007.04378.sgh@sgh.dk>
References: <201104201007.04378.sgh@sgh.dk>
Date: Wed, 20 Apr 2011 11:47:20 +0200
Message-ID: <1303292840.3979.20.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: Please pull 'to-upstream' of http://sgh.dk/~sgh/oe.git
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
X-List-Received-Date: Wed, 20 Apr 2011 09:49:55 -0000
X-Groupsio-MsgNum: 31354
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-slhG1WWoIXQ+7n1iW3C4"

--=-slhG1WWoIXQ+7n1iW3C4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear S=C3=B8ren,


thank you for your patch.

Unfortunately

        $ git remote add wvstream http://sgh.dk/~sgh/oe.git
        $ git fetch wvstream # lasts forever/times out

does not work.

Naming the branch descriptively, for example =C2=BBwvstream-fix=C2=AB would=
 also
help in my opinion.

Am Mittwoch, den 20.04.2011, 10:07 +0200 schrieb S=C3=B8ren Holm:
> commit 59c811aaebd84424451058f019aaa32c257e4fc1
> Author: S=C3=B8ren Holm <soeren.holm@mikrofyn.com>
> Date:   Wed Apr 20 09:48:43 2011 +0200
>=20
>     wvstreams: Added patch to fix compilation.

Please add an excerpt from the error message to the commit message.

| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() const':
| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointer wil=
l break strict-aliasing rules
| ipstreams/wvunixdgsocket.cc: In constructor 'WvUnixDGSocket::WvUnixDGSock=
et(const WvFastString&, bool, int)':
| ipstreams/wvunixdgsocket.cc:50:32: error: 'chmod' was not declared in thi=
s scope
| make: *** [ipstreams/wvunixdgsocket.o] Error 1

>  .../files/0001-Fixed-missing-header-includes.patch |   37=20
> ++++++++++++++++++++

please turn off line wrapping for pasted sections.

>  recipes/wvstreams/wvstreams_4.6.bb                 |    1 +
>  2 files changed, 38 insertions(+), 0 deletions(-)

Could next time, please also send the patches to the list. This way, our
patch queue Patchwork [1] can keep track of it. There should be some
kind of option.


Thanks,

Paul


[1] http://patches.openembedded.org/project/oe/list/

--=-slhG1WWoIXQ+7n1iW3C4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2uq6gACgkQPX1aK2wOHVhY6ACcChBKpDixA6SM/dyWIRWfqbqo
GpQAn1hVAtCl0fEbksh9yJFHwOnyLD6D
=+SQn
-----END PGP SIGNATURE-----

--=-slhG1WWoIXQ+7n1iW3C4--
