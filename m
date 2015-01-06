Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id CB1057291F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 11:25:02 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id q59so9431049wes.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 03:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=I4qowaVagnM9JoebzkBgxM2j4zwjkRUeWmsAb6Vi1nk=;
	b=zDWjbTqdlEyNciVZ1WZp7L5wz1Tnko7aKYQ5mVeo2WMUKUfx25V4SGl3T6xMr7CIVE
	CFTEcnCCao1snUxSaBGtD5RH9ewOnh72Gnbq3eEELhNZtFf1mghynX60vHMkh1Z2mk/X
	FPP3lUgjtrBuyTtw5xQRsZUif14WnwoQ2rK8zozxSLCURB9IHkqiMyRP9Q18S0sk3Obe
	WJAPhTmD6TVmGiHoqDS0cHadbdVcnQlbMcwEOvUmL0trd/ljwntbO6OKWalvQ2bVnh1U
	WaZhBVDZHTC0ytBv93+5EUGG1NMrShh6FQhpFcibimuAvyFmv0RoYsxXDFGCHhUu8GaQ
	c0vA==
X-Received: by 10.194.63.169 with SMTP id h9mr167998721wjs.23.1420543501712;
	Tue, 06 Jan 2015 03:25:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hn2sm79070110wjc.5.2015.01.06.03.25.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 03:25:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Jan 2015 12:25:02 +0100
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150106112502.GE19402@jama>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
	<a0ff960271975254d1c2760e4af4d83996a6b388.1420455602.git.paul.eggleton@linux.intel.com>
	<20150105123552.GK2484@jama>
	<2344737.AuP89X4c5h@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2344737.AuP89X4c5h@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 03/10] ddrescue: update to 1.19
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jan 2015 11:25:05 -0000
X-Groupsio-MsgNum: 53686
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="brEuL7wsLY8+TuWz"
Content-Disposition: inline

--brEuL7wsLY8+TuWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2015 at 01:31:15PM +0000, Paul Eggleton wrote:
> On Monday 05 January 2015 13:35:52 Martin Jansa wrote:
> > On Mon, Jan 05, 2015 at 11:00:47AM +0000, Paul Eggleton wrote:
> > > * License changed to GPLv2+
> > > * Upstream now only releases .lz files for new releases
> >=20
> > Is .lz working correctly now with current bitbake+oe-core (it didn't
> > last time I've re-tried)? Shouldn't we wait for base.bbclass change to
> > be merged as you mention above do_unpack?
>=20
> Well, it worked for me, but you do need the lzip recipe which we do have =
in=20
> meta-oe. We don't necessarily have to wait since even when base.bbclass h=
as=20
> been updated the line I added won't cause any issues.
>=20
> > Duplicates http://patchwork.openembedded.org/patch/82165/
> > can you send incremental patch on top of this if needed?
>=20
> Ah, I missed that. As it happens, the only difference is the aforemention=
ed=20
> depends line.

Rebasing your change on top of Koen's shows bigger diff:

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb b/meta-oe/r=
ecipes-extended/ddrescue/ddrescue_1.19.bb
index a605249..dc485b3 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb
@@ -13,30 +13,9 @@ SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
 SRC_URI[md5sum] =3D "ed6b5b82d74cbd925db2b829350e74b1"
 SRC_URI[sha256sum] =3D "ed8d0c9d9aac80a9110e9cb0d0a91a7390d3bf9f816b67a62c=
a4eb140f4747b8"
=20
-CONFIGUREOPTS =3D "\
-    '--srcdir=3D${S}' \
-    '--prefix=3D${prefix}' \
-    '--exec-prefix=3D${exec_prefix}' \
-    '--bindir=3D${bindir}' \
-    '--datadir=3D${datadir}' \
-    '--infodir=3D${infodir}' \
-    '--sysconfdir=3D${sysconfdir}' \
-    'CXX=3D${CXX}' \
-    'CPPFLAGS=3D${CPPFLAGS}' \
-    'CXXFLAGS=3D${CXXFLAGS}' \
-    'LDFLAGS=3D${LDFLAGS}' \
-"
-EXTRA_OEMAKE =3D ""
+# This isn't already added by base.bbclass
+do_unpack[depends] +=3D "lzip-native:do_populate_sysroot"
=20
-do_configure () {
-    ${S}/configure ${CONFIGUREOPTS}
-}
-
-do_install () {
-    oe_runmake 'DESTDIR=3D${D}' install
-    # Info dir listing isn't interesting at this point so remove it if it =
exists.
-    if [ -e "${D}${infodir}/dir" ]; then
-        rm -f ${D}${infodir}/dir
-    fi
-}
+inherit autotools
=20
+EXTRA_OECONF =3D "'CXX=3D${CXX}' 'CPPFLAGS=3D${CPPFLAGS}' 'CXXFLAGS=3D${CX=
XFLAGS}' 'LDFLAGS=3D${LDFLAGS}'"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--brEuL7wsLY8+TuWz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSrxg4ACgkQN1Ujt2V2gBwqlwCfYluc8odNC3LeM+iYXM1JyQUO
S1AAoLRk/CVzEyQ95a1+oKvqRu3697KX
=Tttj
-----END PGP SIGNATURE-----

--brEuL7wsLY8+TuWz--
