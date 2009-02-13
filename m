Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LXrwN-0000Nh-FJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 07:54:23 +0100
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <roman@khimov.ru> authenticated with rik@osrc.info
	message id 1LXrv1-000HT7-1i
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 09:52:59 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2009 09:52:46 +0300
User-Agent: KMail/1.9.9
References: <200902121727.21796.roman@khimov.ru>
	<c384c5ea0902120728n459671f4y32957b212a8af0ed@mail.gmail.com>
	<gn1j5m$qc5$2@ger.gmane.org>
In-Reply-To: <gn1j5m$qc5$2@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200902130952.52664.roman@khimov.ru>
Subject: Re: [PATCH] icecc: base fix for cross and native builds
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
X-List-Received-Date: Fri, 13 Feb 2009 06:54:23 -0000
X-Groupsio-MsgNum: 7684
Content-Type: multipart/signed; boundary="nextPart11332146.Ecd4POZu3C";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart11332146.Ecd4POZu3C
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Koen Kooi:
> On 12-02-09 16:28, Leon Woestenberg wrote:
> > On Thu, Feb 12, 2009 at 3:27 PM, Roman I Khimov<roman@khimov.ru>  wrote:
> >> There are severe problems with icecc builds currently in OE.
> >> Cross-compiler tarball created wrong, PATH set incorrectly, etc.
> >
> > Excellent!
> >
> > It's probably a little-used class, but if we get it to work more
> > robustly, we can make more noise about it.
> >
> > I will try to do some tests here over the next few weeks with your
> > patch, time permitting.
>
> Once icecc works we should have a chat with the suse buildservice
> people. PARALLEL_MAKE =3D "-j256", here we come :)

I'm running it with "-j14" there and combined with bitbake parallel task=20
execution it just rocks, the only slowdowns are blacklisted packages like=20
gcc and glibc.

So, if anyone cares enough to commit? ;)

The most severe problem left after this patch is parallel tarball creation,=
=20
which I'm not sure how to fix better. An obvious solution is some kind of=20
file lock but from what I see, the best way to do it is via pathutils=20
module which is not standard.

Another approach could be just reducing the race window, fixing=20
create-icecc-env.sh to write to temporary file and then move it to its=20
place. Maybe that would be enough.

Another approach could be some kind of IPC locks between running threads,=20
but I don't know enough on how bitbake runs its parallel tasks and whether=
=20
it's possible or not.

Another approach could be moving tarball creation to packages and then use=
=20
standard dependency features of bitbake, making native things depend on=20
native tarball and cross on cross. Not sure how to do it in details.

=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart11332146.Ecd4POZu3C
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmVGL8ACgkQXJ70z+XgVcOONACgkax0cToTsFKV75/FAxLALGKJ
DikAnjg/GLx1A8VaB2gNK0cYm2YO6kzn
=ZOtm
-----END PGP SIGNATURE-----

--nextPart11332146.Ecd4POZu3C--
