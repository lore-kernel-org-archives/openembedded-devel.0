Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PjUcJ-0000b8-V3 for openembedded-devel@lists.openembedded.org;
	Sun, 30 Jan 2011 11:34:47 +0100
Received: from f053034124.adsl.alicedsl.de ([78.53.34.124]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PjUbW-0001Pb-3q for openembedded-devel@lists.openembedded.org;
	Sun, 30 Jan 2011 10:33:58 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D44773D.5010103@opendreambox.org>
References: <1296316693.5925.10.camel@mattotaupa>
	<4D44773D.5010103@opendreambox.org>
Date: Sun, 30 Jan 2011 11:33:56 +0100
Message-ID: <1296383636.4757.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [solved][REGRESSION] omap3-sgx-modules: `NOTE: Runtime target 'kernel-' is unbuildable, removing...`
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
X-List-Received-Date: Sun, 30 Jan 2011 10:34:48 -0000
X-Groupsio-MsgNum: 28625
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-jEObvGZQMRzugfwDQP0B"

--=-jEObvGZQMRzugfwDQP0B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andreas,


Am Samstag, den 29.01.2011, 21:23 +0100 schrieb Andreas Oberritter:
> On 01/29/2011 04:58 PM, Paul Menzel wrote:

> >         commit 2dac84b9a7b820466ed626420fec120093b56e16
> >         Author: Andreas Oberritter <obi@opendreambox.org>
> >         Date:   Sat Jan 29 00:51:25 2011 +0000
> >        =20
> >             module.bbclass: depend on kernel-${KERNEL_VERSION} instead =
of kernel (=3D ${KERNEL_VERSION})
> >            =20
> >             * As a special case, kernel modules must depend on
> >               kernel-${KERNEL_VERSION}, which gets runtime provided by =
the kernel
> >               package. The reason is, that the package version can be d=
ifferent
> >               from ${KERNEL_VERSION}, because the latter depends on the=
 kernel
> >               configuration, e.g. CONFIG_LOCALVERSION.
> >            =20
> >             Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> >=20
> > [1] seems to have broken `omap3-sgx-modules`.

> thanks! It's a known bug. Can you please test this patch, while I'm
> waiting for an ack or nack for it?
>=20
> http://patches.openembedded.org/patch/402/

Unfortunately I am having delivery problems with my SourceForge.net
address, so I have not yet received the patch to the list and have to
respond to this message.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
Tested-by: Paul Menzel <paulepanter@users.sourceforge.net>=20
	for `omap3-sgx-modules` with `angstrom-2008.1`

> Is there a maintainer for kernel.bbclass?
>=20
> If there's no feedback, and if nobody's faster, I'll revert the commits
> tomorrow.


Thanks,

Paul

--=-jEObvGZQMRzugfwDQP0B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1FPpQACgkQPX1aK2wOHVjWjwCfYhxPDQ+KuYwoujHu5EJ2BXhz
0sEAn25/YBr/Ye2A8LjiGPC10z5yi4HK
=CDgT
-----END PGP SIGNATURE-----

--=-jEObvGZQMRzugfwDQP0B--
