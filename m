Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id BA1696C1C7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 15:17:19 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id 96so808097wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 07:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oG8Z+5ypsT2mi7iR/n+GqiKN/pujmhUC+3KSg5m8nwc=;
	b=MfBqNrHb/s2F1mu917U/5W310enemtxtcAbYIGcdmk6IhTffMvnDFr/HLW/9cVS3b2
	T7nqVKEYgmBc6O1GoVcQNFNFkWhXWa1ohzCf29OYuJkAH6pIlD9jQqxgD8+sUoaWy38S
	zF1ZTjKDs+iFlV09SCgQ/M4TZGuoRS/zLyOknSwvpP4BNMRgjMJwDQlCnmYeV8r4BMJ0
	jdBIhmzHlA3/jfazGgoN+ZqRxPsLRTCoTvvXfmfnOqRK5yEW6j9UrBuIBN9TVei97H2u
	P7ia+Fx07kMGlDZPKPy+oK788NHnQf9GIONY2ZEVuQLYqTVFVRfr02NVb+s4l72Xn8vA
	V2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oG8Z+5ypsT2mi7iR/n+GqiKN/pujmhUC+3KSg5m8nwc=;
	b=X8Kue1rkXkopI7yvzhYdXzIsNNEEQOpGvJFwl2NI00dYoxzPLysf0kP0jVlcoT88db
	QC43bmpTPMLRpPp2BAnjASJ3wJJe6BKz795a8xP3Ha3b7QMNC6jlHgl2nv7f2BX5L8Sc
	BtUFskj7fuG7if2DNuhg7l9cRobPrZcvravXQJHUCl2L6K6gnOAC7h5S83rjFdDTk7ww
	RFC7dV0qrCP5HUhVmyp3GbvDPoL/ghtgZcocaHNOBexoNQGb4LBi87t6WSu77nLUzWVw
	DZ+/lgsQqYA7jXEoxwLBwTVaB+Fq90C5pt74bntXjVrt7X1DzGmuErdHRvAhygbNL0aH
	Y5cQ==
X-Gm-Message-State: AGRZ1gKGVcTP9vyzQt2TSBfeKT8/GTBY0NDPXI0u4jchGwSvg2b9fpos
	Z8kH+nlptwvfsPvqaOE+VV4=
X-Google-Smtp-Source: AJdET5djyOlpaY8CXR30qF+Kf1ROV5Tfae6N9fMhk1bofk9CudjkoUWq24/j1WNZJ730VI+LVWESNA==
X-Received: by 2002:a5d:424a:: with SMTP id
	s10-v6mr2166670wrr.260.1542208640286; 
	Wed, 14 Nov 2018 07:17:20 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q11-v6sm20061038wrj.7.2018.11.14.07.17.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 14 Nov 2018 07:17:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 14 Nov 2018 16:17:23 +0100
To: akuster808 <akuster808@gmail.com>
Message-ID: <20181114151723.GA1417@jama>
References: <1542148831-30197-1-git-send-email-akuster808@gmail.com>
	<CA+chaQfCoBFsOzLj6Vdf2tFX4hebD4bpqdXOMU4JstMScnJrBQ@mail.gmail.com>
	<9c0a4188-2393-aa18-6139-d6600d2507f7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9c0a4188-2393-aa18-6139-d6600d2507f7@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meta-oe: add selftest for sources.oe.org
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2018 15:17:20 -0000
X-Groupsio-MsgNum: 75383
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2018 at 03:27:39PM -0800, akuster808 wrote:
>=20
> On 11/13/18 2:55 PM, Martin Jansa wrote:
> > Is this the right URL?=A0http://sources.openembedded.org/mirror/sources/
> > returns 404
>=20
> I thought it was.
>=20
> I get 404 with http://sources.openembedded.org/
> <http://sources.openembedded.org/mirror/sources/>

This link is http://sources.openembedded.org/mirror/sources/, that's why
it's 404, with http://sources.openembedded.org/ you get 403, which is
fine.
>=20
> >
> > meta/classes/mirrors.bbclass also uses:
> > cvs://.*/.*=A0 =A0 =A0http://sources.openembedded.org/ \n \
> > svn://.*/.*=A0 =A0 =A0http://sources.openembedded.org/ \n \
> > git://.*/.*=A0 =A0 =A0http://sources.openembedded.org/ \n \
> > hg://.*/.*=A0 =A0 =A0 http://sources.openembedded.org/ \n \
> > bzr://.*/.*=A0 =A0 =A0http://sources.openembedded.org/ \n \
> > p4://.*/.*=A0 =A0 =A0 http://sources.openembedded.org/ \n \
> > osc://.*/.*=A0 =A0 =A0http://sources.openembedded.org/ \n \
> > https?$://.*/.* http://sources.openembedded.org/ \n \
> > ftp://.*/.*=A0 =A0 =A0http://sources.openembedded.org/ \n \
> > npm://.*/?.*=A0 =A0 http://sources.openembedded.org/ \n \
> >
> I will change the URL's. thanks.
> > without the /mirror/sources suffix, maybe it's copy & paste issue from
> > downloads.yoctoproject.org <http://downloads.yoctoproject.org> which
> > uses /mirror/sources?
> > git://.*/.*=A0 =A0 =A0http://downloads.yoctoproject.org/mirror/sources/=
 \n \
> >
> > But if the test works for you, then something even worse is going on :).
>=20
>=20
> it found:
>=20
> Summary: 5 tasks failed:
> =A0
> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-gra=
phics/pango/pango_1.42.4.bb:do_fetch
> =A0
> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-gra=
phics/jpeg/libjpeg-turbo_2.0.0.bb:do_fetch
> =A0
> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-ker=
nel/dtc/dtc_1.4.7.bb:do_fetch
> =A0
> virtual:native:/home/akuster/OE/master/meta-openembedded/meta-networking/=
recipes-support/c-ares/c-ares_1.14.0.bb:do_fetch
> =A0
> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-dev=
tools/binutils/binutils_2.31.bb:do_fetch
>=20
> with url changes i see:
>=20
> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-gra=
phics/jpeg/libjpeg-turbo_2.0.0.bb:do_fetch
> =A0
> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-gra=
phics/pango/pango_1.42.4.bb:do_fetch
> =A0
> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-dev=
tools/elfutils/elfutils_0.174.bb:do_fetch
> =A0
> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-ext=
ended/libarchive/libarchive_3.3.3.bb:do_fetch
> =A0
> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-sup=
port/mpfr/mpfr_4.0.1.bb:do_fetch
> =A0
> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-ker=
nel/dtc/dtc_1.4.7.bb:do_fetch
> =A0
> virtual:native:/home/akuster/OE/master/meta-openembedded/meta-networking/=
recipes-support/c-ares/c-ares_1.14.0.bb:do_fetch
> =A0
> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-dev=
tools/binutils/binutils_2.31.bb:do_fetch
>=20
> maybe the OE system needs to be checked out.

I've checked it yesterday and it's broken since Aug 6.

See IRC log from earlier today:
00:14 < armpit> sources.openembedded.org needs updating ; )
00:17 < JaMa> armpit: khem: the builder lost access to the fileserver as sh=
own in
http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-rsync/475/conso=
le
00:18 < JaMa> something changed between Aug 6th and 9th

>=20
>=20
> - armin
>=20
> >
> > On Tue, Nov 13, 2018 at 11:40 PM Armin Kuster <akuster808@gmail.com
> > <mailto:akuster808@gmail.com>> wrote:
> >
> >     Signed-off-by: Armin Kuster <akuster808@gmail.com
> >     <mailto:akuster808@gmail.com>>
> >     ---
> >     =A0meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py | 30
> >     ++++++++++++++++++++++
> >     =A01 file changed, 30 insertions(+)
> >     =A0create mode 100644 meta-oe/lib/oeqa/selftest/cases/meta_oe_sourc=
es.py
> >
> >     diff --git a/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
> >     b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
> >     new file mode 100644
> >     index 0000000..79bebf5
> >     --- /dev/null
> >     +++ b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
> >     @@ -0,0 +1,30 @@
> >     +import os
> >     +import re
> >     +import glob as g
> >     +import shutil
> >     +import tempfile
> >     +from oeqa.selftest.case import OESelftestTestCase
> >     +from oeqa.utils.commands import runCmd, bitbake, get_bb_var,
> >     get_bb_vars
> >     +
> >     +class MetaOESourceMirroring(OESelftestTestCase):
> >     +=A0 =A0 # Can we download everything from the OpenEmbedded Sources
> >     Mirror over http only
> >     +=A0 =A0 def test_oe_source_mirror(self):
> >     +=A0 =A0 =A0 =A0 self.write_config("""
> >     +BB_ALLOWED_NETWORKS =3D " sources.openembedded.org
> >     <http://sources.openembedded.org>"
> >     +MIRRORS =3D ""
> >     +DL_DIR =3D "${TMPDIR}/test_oe_downloads"
> >     +PREMIRRORS =3D "\\
> >     +=A0 =A0 bzr://.*/.*=A0 =A0http://sources.openembedded.org/mirror/s=
ources/
> >     \\n \\
> >     +=A0 =A0 cvs://.*/.*=A0 =A0http://sources.openembedded.org/mirror/s=
ources/
> >     \\n \\
> >     +=A0 =A0 git://.*/.*=A0 =A0http://sources.openembedded.org/mirror/s=
ources/
> >     \\n \\
> >     +=A0 =A0 gitsm://.*/.* http://sources.openembedded.org/mirror/sourc=
es/
> >     \\n \\
> >     +=A0 =A0 hg://.*/.*=A0 =A0 http://sources.openembedded.org/mirror/s=
ources/
> >     \\n \\
> >     +=A0 =A0 osc://.*/.*=A0 =A0http://sources.openembedded.org/mirror/s=
ources/
> >     \\n \\
> >     +=A0 =A0 p4://.*/.*=A0 =A0 http://sources.openembedded.org/mirror/s=
ources/
> >     \\n \\
> >     +=A0 =A0 svn://.*/.*=A0 =A0http://sources.openembedded.org/mirror/s=
ources/
> >     \\n \\
> >     +=A0 =A0 ftp://.*/.*=A0 =A0 =A0
> >     http://sources.openembedded.org/mirror/sources/ \\n \\
> >     +=A0 =A0 http://.*/.*=A0 =A0
> >     =A0http://sources.openembedded.org/mirror/sources/ \\n \\
> >     +=A0 =A0 https://.*/.*=A0 =A0
> >     http://sources.openembedded.org/mirror/sources/ \\n"
> >     +=A0 =A0 """)
> >     +
> >     +=A0 =A0 =A0 =A0 bitbake("world --runall fetch")
> >     --=20
> >     2.7.4
> >
> >     --=20
> >     _______________________________________________
> >     Openembedded-devel mailing list
> >     Openembedded-devel@lists.openembedded.org
> >     <mailto:Openembedded-devel@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW+w8ggAKCRA3VSO3ZXaA
HJmCAJwMhpcwWr54solrFtJNET3Uoh6FbwCaAxZ+mzMnL6IHgyiS+2sASvF0dW8=
=9mOE
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
