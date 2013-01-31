Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0ygg-00071I-RA
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 19:17:02 +0100
Received: by mail-pb0-f47.google.com with SMTP id rp8so1724427pbb.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 10:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qcIHiag1QoRjdLfgkbRA5l9wt8j1vSuOquwlfm5PRKs=;
	b=dg5ClCfT1S0ryTgWLLwjJSplYdzxkUZbWmVKvyOiSiTe40PzSFcv3eL4y4xea8nHG8
	bS/ohSNR1lh3G1NZDXSIp84eQjaSpvgeOE7QVw21Dp1AEQbBsKnbMU7ErOPzITcnGByi
	SeQqAqo4USNE0U7sDG2IFLFOslhjA6xkJ0B2c95uEFPojnHMJ7TGgMUS1sldutKcCsk2
	pwp7EfkkH21RmnzvwHwFTpBIgfHBhCwZU2waEQc33QrsoeIxUVYo2zWIJeZ6S+0R3viX
	tvikSHa/eyUtBwx8Scll+2k//8mEK6sr1oLZFzXKehyOgqylxOI81aa6/dGdxdHOdbOK
	k7Hw==
X-Received: by 10.68.137.167 with SMTP id qj7mr24089139pbb.148.1359655254997; 
	Thu, 31 Jan 2013 10:00:54 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ux4sm5639617pbc.25.2013.01.31.10.00.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 10:00:53 -0800 (PST)
Date: Thu, 31 Jan 2013 19:00:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130131180051.GG2102@jama.dyndns-home.com>
References: <1359532955-16954-1-git-send-email-koen@dominion.thruhere.net>
	<20130131165633.GF2102@jama.dyndns-home.com>
	<21F2D8CF-6E10-41F8-9A55-99949E2CEB79@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <21F2D8CF-6E10-41F8-9A55-99949E2CEB79@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][[RFC][PATCH] nodejs: add 0.8.18
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
X-List-Received-Date: Thu, 31 Jan 2013 18:17:06 -0000
X-Groupsio-MsgNum: 42945
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qoTlaiD+Y2fIM3Ll"
Content-Disposition: inline

--qoTlaiD+Y2fIM3Ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2013 at 06:07:37PM +0100, Koen Kooi wrote:
>=20
> Op 31 jan. 2013, om 17:56 heeft Martin Jansa <martin.jansa@gmail.com> het=
 volgende geschreven:
>=20
> > On Wed, Jan 30, 2013 at 09:02:35AM +0100, Koen Kooi wrote:
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> .../nodejs/nodejs/0002-Enable-NEON.patch           | 27 ++++++++++
> >> ...0003-Resolve-bad-rpath-issue-when-linking.patch | 29 ++++++++++
> >> meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb   | 61 ++++++++++++++=
++++++++
> >> 3 files changed, 117 insertions(+)
> >> create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-=
NEON.patch
> >> create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve=
-bad-rpath-issue-when-linking.patch
> >> create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> >=20
> > FWIW: 0.6.21 fails exactly the same as 0.6.20 but I've merged it as it's
> > not worse.
> >=20
> > I've tried 0.8.18 today and it fails:
> > ERROR: Function failed: do_configure (see /home/jenkins/oe/shr-core-bra=
nches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/temp/lo=
g.do_configure.30923 for further information)
> > ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches=
/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/temp/log.do_=
configure.30923
> > Log data follows:
> > | DEBUG: Executing python function sysroot_cleansstate
> > | DEBUG: Python function sysroot_cleansstate finished
> > | DEBUG: Executing shell function do_configure
> > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-li=
nux/nodejs-native/0.8.18-r0/gcc: 2: /home/jenkins/oe/shr-core-branches/shr-=
core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/gcc: Cannot fork
> > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-li=
nux/nodejs-native/0.8.18-r0/gcc: 2: /home/jenkins/oe/shr-core-branches/shr-=
core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/gcc: Cannot fork
> > | Traceback (most recent call last):
> > |   File "./configure", line 473, in <module>
> > |     configure_node(output)
> > |   File "./configure", line 371, in configure_node
> > |     cc_version, is_clang =3D compiler_version()
> > |   File "./configure", line 331, in compiler_version
> > |     version =3D tuple(map(int, proc.communicate()[0].split('.')))
> > | ValueError: invalid literal for int() with base 10: ''
> > | ERROR: Function failed: do_configure (see /home/jenkins/oe/shr-core-b=
ranches/shr-core/tmp-eglibc/work/x86_64-linux/nodejs-native/0.8.18-r0/temp/=
log.do_configure.30923 for further information)
> > NOTE: recipe nodejs-native-0.8.18-r0: task do_configure: Failed
> > ERROR: Task 22884 (virtual:native:/home/jenkins/oe/shr-core-branches/sh=
r-core/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb, =
do_configure) failed with exit code '1'
> >=20
> > Any idea?
>=20
> That's likely the gcc wrapper script I added maybe it doesn't like your n=
ative gcc. FWIW I only tested it on fedora 18

Here it's on Ubuntu 12.04

but wrapper is in $WORKDIR and PATH contains WORKDIR, so I guess that
those wrappers are fork bombing poor jenkins.. (at least here because
CC/CXX variables are just gcc/g++)

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qoTlaiD+Y2fIM3Ll
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEKsVMACgkQN1Ujt2V2gBx5bQCfVa5upFE/8r90N+MhQ7a+sj7q
aNUAoJboFeuK2NNBD5iAAzkOL/IzX3Go
=V2wt
-----END PGP SIGNATURE-----

--qoTlaiD+Y2fIM3Ll--
