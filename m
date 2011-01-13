Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PdHfP-0003TP-O6
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 08:32:19 +0100
Received: by bwz10 with SMTP id 10so1252024bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 23:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=DJgYcVbmiTLJ7hkDWPK6F8bqqrotcFy3iVI7l6SKIBU=;
	b=sQPS00Uwq+7Jck+34WpFKNDkPVrssULSRSylPkdqbhp7f0vVzJ1ZflZWvFAre59fME
	PKNQ79zO+nKYSW9hEx7dE4KkD7qGhM5rulyH6LFATkb8QAPJWRxcCxQ1PqeSoT6LI3Mx
	l9but92zSE48v6GITVj7s2vaVP1zH4CH3sOdI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wSZh5YawTcf6ujeyw/mIatoZE4FiUHX+smNjuotFIoHpuNts6puugFVEaGJuZwudjI
	+vVPW08t9ledwkb+KCdhK+91qdp7H6yI7c91+AXpbuJ6W7Um6h27wgtZE30ircHDBA2W
	L2Ql9Bdi2bhaCUAkgqakxqIDnXqEeV7vn+Tmg=
Received: by 10.204.62.73 with SMTP id w9mr1517841bkh.11.1294903903979;
	Wed, 12 Jan 2011 23:31:43 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id x38sm464739bkj.13.2011.01.12.23.31.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 23:31:43 -0800 (PST)
Date: Thu, 13 Jan 2011 08:31:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110113073157.GO3244@jama>
References: <1294832897-3343-1-git-send-email-Martin.Jansa@gmail.com>
	<4D2DF2BA.6040000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4D2DF2BA.6040000@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libvpx: force arm mode to be able to link with ffmpeg where arm mode already is forced
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
X-List-Received-Date: Thu, 13 Jan 2011 07:32:19 -0000
X-Groupsio-MsgNum: 27985
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPOl6LAGMgeiWDic"
Content-Disposition: inline

--GPOl6LAGMgeiWDic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2011 at 10:28:10AM -0800, Khem Raj wrote:
> On 1/12/2011 3:48 AM, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>=20
> hmmm what issues do u see if you build it with thumb mode.

+# ffmpeg links with this and fails
+# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text=
+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIB=
C_2.4'

and full log is here
http://tinderbox.openembedded.org/packages/1398033/

> > ---
> >   recipes/webm/libvpx.inc |    6 +++++-
> >   1 files changed, 5 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes/webm/libvpx.inc b/recipes/webm/libvpx.inc
> > index 9913d5b..9d40945 100644
> > --- a/recipes/webm/libvpx.inc
> > +++ b/recipes/webm/libvpx.inc
> > @@ -1,11 +1,15 @@
> >   DESCRIPTION =3D "vpx Multi-Format Codec SDK"
> >   LICENSE =3D "BSD"
> >
> > -INC_PR =3D "r5"
> > +INC_PR =3D "r6"
> >
> >   SRC_URI =3D "git://review.webmproject.org/libvpx.git;protocol=3Dgit;t=
ag=3Dv${PV}"
> >   S =3D "${WORKDIR}/git"
> >
> > +# ffmpeg links with this and fails
> > +# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.=
text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@=
GLIBC_2.4'
> > +ARM_INSTRUCTION_SET =3D "arm"
> > +
> >   CFLAGS +=3D "-fPIC"
> >
> >   export CC
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GPOl6LAGMgeiWDic
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEARECAAYFAk0uqm0ACgkQN1Ujt2V2gBy6UQCfT8AtPwRu991lGancFS/qcnJP
6IIAnjjXTaMTFTHFzXHBv63vjSCPqGH+
=OtFn
-----END PGP SIGNATURE-----

--GPOl6LAGMgeiWDic--
