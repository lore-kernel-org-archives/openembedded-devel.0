Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGCyV-0002Ks-Gr
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 18:57:12 +0200
Received: by bkat8 with SMTP id t8so1135576bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 09:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nSf5WiR3N6tkW3hCRBSbVho1caXhe4vpRcBekxovowQ=;
	b=wgqH/Nocy8xvfUlTGuRuTaoZBlNqxSUQ0UidqDp5AUgp2k5qRh8vvAukZzBgRXMDxR
	lRLLHM09zmAhIe0Bg1yTa6WhWqwqlE4YW2S7si33hNUfgbYMjM098H4pIGOVl6LT7SBX
	KTfQxblzXvh7Pl8GBzVxzg5iOLkrA5cx3LkpM=
Received: by 10.204.154.156 with SMTP id o28mr2390242bkw.12.1318956681314;
	Tue, 18 Oct 2011 09:51:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id rc12sm2841375bkb.10.2011.10.18.09.51.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 09:51:20 -0700 (PDT)
Date: Tue, 18 Oct 2011 18:51:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018165107.GA17242@jama.jama.net>
References: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
	<c4b964c5a17f463645b3e9cb7a8351bbe62eef9a.1318946821.git.Martin.Jansa@gmail.com>
	<1318949469.3538.34.camel@mattotaupa>
	<20111018162433.GJ20678@jama.jama.net>
	<j7ka5s$ioi$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j7ka5s$ioi$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl 3/3] lightmediascanner: Add version 0.4.4 (initial recipe)
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
X-List-Received-Date: Tue, 18 Oct 2011 16:57:12 -0000
X-Groupsio-MsgNum: 34873
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 06:40:28PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 18-10-11 18:24, Martin Jansa schreef:
> > On Tue, Oct 18, 2011 at 04:51:09PM +0200, Paul Menzel wrote:
> >> Am Dienstag, den 18.10.2011, 16:10 +0200 schrieb Martin Jansa:
> >>> From: pespin <pespin.shar@gmail.com>
> >>=20
> >> The name is still not correct. Although the Signed-off-by line is.=20
> >> Please correct that.
> >=20
> > Thanks for catching that, fixed in jansa/pull branch.
> >=20
> >>> * Copied from oe-classic
> >>> <http://git.openembedded.org/openembedded/commit/?id=3D63d3969b0f839f=
c4b7bf7fe836daec729d9d3c53>
> >>>
> >>>=20
> * Remove PE=3D1
> >>> * Add LIC_FILES_CHKSUM * Builds fine using SHR distro * JaMa: removed
> >>> PR
> >>=20
> >> Was the recipe tested somehow?
> >=20
> > Tested on om-gta02 after building it with SHR and added=20
> > RDEPENDS_${PN}-test =3D "glibc-gconv-utf-16"
>=20
> Could you please change that to something like:
>=20
> RDEPENDS_${PN}_append_libc-glibc " glibc-gconv-utf-16"

because of eglibc or uclibc?
SHR root@gjama ~ $ opkg info eglibc-gconv-utf-16
Provides: glibc-gconv-utf-16

I'm using eglibc and it worked fine, but I haven't tested with uclibc..

But if I add:
RDEPENDS_${PN}-test_libc-uclibc =3D ""
then I guess it will fail in runtime like for me without
eglibc-gconv-utf-16.

Someone with uclibc please test in runtime?

I'm aware of:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-August/034467.=
html
but it says nothing about runtime behavior on uclibc..

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6drnsACgkQN1Ujt2V2gByHdQCggSxnT98JESYBTeo1IoOQuU8d
uvsAn1I+0EZRhx/xHXoYjOYs3IX7Yk3C
=POg8
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
