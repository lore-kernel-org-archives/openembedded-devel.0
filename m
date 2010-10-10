Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P51vV-0005Y0-JU for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 21:51:22 +0200
Received: from f053041069.adsl.alicedsl.de ([78.53.41.69]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P51v9-0002YD-3a for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 19:50:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimhsRw9ooC=zQqrfSgtRhCV0C=_O_gqsd=7N2kF@mail.gmail.com>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
	<AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
	<AANLkTinQ4uW=o43O5Bv6FijfoicU2CL5j3Zn8zWf5Snm@mail.gmail.com>
	<1286664909.15886.13.camel@saphir> <1286698831.3808.2.camel@mattotaupa>
	<AANLkTimXU=NzmwqCpnho5ukCVoXnF5qR_4D6XWN4RaWr@mail.gmail.com>
	<1286703485.3808.10.camel@mattotaupa>
	<AANLkTimhsRw9ooC=zQqrfSgtRhCV0C=_O_gqsd=7N2kF@mail.gmail.com>
Date: Sun, 10 Oct 2010 21:50:57 +0200
Message-ID: <1286740257.3808.127.camel@mattotaupa>
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
Subject: commit messages (was: testing branch 2010-10-08)
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
X-List-Received-Date: Sun, 10 Oct 2010 19:51:22 -0000
X-Groupsio-MsgNum: 24627
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-UQCYxEOJKz0zkx2CxjVG"

--=-UQCYxEOJKz0zkx2CxjVG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 10.10.2010, 12:29 -0700 schrieb Khem Raj:
> On Sun, Oct 10, 2010 at 2:38 AM, Paul Menzel wrote:
> > Am Sonntag, den 10.10.2010, 02:13 -0700 schrieb Khem Raj:
> >> On Sun, Oct 10, 2010 at 1:20 AM, Paul Menzel wrote:
> >> > Am Sonntag, den 10.10.2010, 00:55 +0200 schrieb Michael 'Mickey' Lau=
er:
> >> >> Am Samstag, den 09.10.2010, 22:58 +0200 schrieb Frans Meulenbroeks:
> >> >> > libgee-native configure is failing:
> >> >> > http://tinderbox.openembedded.net/public/logs/task/8568667.txt
> >> >>
> >> >> Does it contain 72c2ac940065948cb688fde821e51efac6b71b4b, which was
> >> >> supposed to fix that?
> >> >
> >> > That is the exact same issues I reported 12 hours earlier [1].
> >>
> >> I fixed it by not reautoconfing for now I think it should be
> >> good enough.
> >
> > Thank you for doing that. This is commit 88cb82 [2].
> >
> >        libgee_0.5.2.bb/libgee_0.6.0.bb: Fix native recipe build
> >
> > Could you please at least add a link to the list thread describing the
> > problem to the commit message next time, so people know what is being
> > fixed.
>=20
> while the details are in the mail and I notified the mail thread soon aft=
er
> the fix was pushed isnt that enough of a notice for a trivial problem.

I was more looking from the perspective of people going through the
commit history and not the people reading the list.

I came across several cases where the commit message says to fix a
build, but there was no indication what the error was in the first
place. It is even more important when going through the changes after
time.

So I would be grateful if everyone could adhere to the commit policy [1]
as documentation is in my opinion one of the most important things when
more people are involved.

I would even require that everyone has to build test a change at least
once in a clean environment and document what distribution and what
machine it was built for.

[=E2=80=A6]


[1] http://wiki.openembedded.net/index.php/Commit_Policy

--=-UQCYxEOJKz0zkx2CxjVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyyGSEACgkQPX1aK2wOHVjfVACfT4m/GcrRFUfHg/r5XbinqlYt
wI0Ani1hqWUguT8t27dmeiGy6vqP7w/T
=agUP
-----END PGP SIGNATURE-----

--=-UQCYxEOJKz0zkx2CxjVG--
