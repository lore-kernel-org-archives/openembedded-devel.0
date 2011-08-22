Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QvZ9d-0005jO-Un for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 20:23:21 +0200
Received: from f053036249.adsl.alicedsl.de ([78.53.36.249]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QvZ57-0006EV-4V for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 18:18:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 20:18:38 +0200
In-Reply-To: <CA+M6bXkBsGBX-AXAgWdjue=ZhPVrobExJDXJ9yijwb=QQw71FA@mail.gmail.com>
References: <1314023559-15827-1-git-send-email-noor_ahsan@mentor.com>
	<1314033226.12202.25.camel@mattotaupa>
	<CA+M6bXkBsGBX-AXAgWdjue=ZhPVrobExJDXJ9yijwb=QQw71FA@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314037119.12202.27.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH][meta-oe] lmbench: Added 3.0-a9 version recipe files
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
X-List-Received-Date: Mon, 22 Aug 2011 18:23:22 -0000
X-Groupsio-MsgNum: 33762
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-4hy5VysvfjjO4Z0pOZQN"

--=-4hy5VysvfjjO4Z0pOZQN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Noor,


Am Montag, den 22.08.2011, 12:17 -0500 schrieb Tom Rini:
> On Mon, Aug 22, 2011 at 12:13 PM, Paul Menzel wrote:

> > please try to incorporate the following comments when sending the next
> > version.
> >
> > Am Montag, den 22.08.2011, 19:32 +0500 schrieb Noor, Ahsan:
> >> From: Noor Ahsan <noor_ahsan@mentor.com>
> >>
> >> * Added recipe file to build 3.0-a9 version.
> >
> > Please do not duplicate the commit summary in the commit message body
> > and please use present tense.
> >
> >        lmbench: Add version 3.0-a9 (initial recipe)
> >
> >        =E2=80=A2 imported from oe.dev (rev goes here)

please take a look at oe.dev [1]. I did some clean up there.

> > What build configuration do you use?
> >
> >> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> >> ---
> >>  .../lmbench-3.0-a9/update-results-script.patch     |  155 +++++++++++=
+++++++++
> >>  meta-oe/recipes-support/lmbench/lmbench_3.0-a9.bb  |   75 ++++++++++
> >>  2 files changed, 230 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-support/lmbench/lmbench-3.0-a9/update-res=
ults-script.patch b/meta-oe/recipes-support/lmbench/lmbench-3.0-a9/update-r=
esults-script.patch
> >> new file mode 100644
> >> index 0000000..3feb657
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-support/lmbench/lmbench-3.0-a9/update-results-sc=
ript.patch
> >> @@ -0,0 +1,155 @@
> >> +Now that we have our binaries in /usr/bin rather than the normal
> >> +lmbench hierarchy we need to update the scripts as well to bave well =
here.
> >
> > s/bave/behave/
> >
> > Did you send that patch upstream?
>=20
> This is related to the OE-specific behavior of installing into
> /usr/bin, etc, rather than dumping everything into /usr/share/lmbench
> or similar.  For the Upstream-Status line :)

I see. Upstream seems to be dead otherwise they could have adapted that
patch. Noor, I did not update that comment in oe.dev.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/log/recipes/lmbench/

--=-4hy5VysvfjjO4Z0pOZQN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5SnX4ACgkQPX1aK2wOHVi52ACcDcaFSh8firmN3+vSqTSLwy72
onsAoIbXp9NE4O0v4Y5YCm8s8DEdDzMe
=w2ol
-----END PGP SIGNATURE-----

--=-4hy5VysvfjjO4Z0pOZQN--
