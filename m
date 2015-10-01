Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id EEAFD77089
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 11:20:40 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so24732241wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 04:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MOf41LyqQtNNwVL7YyL8vrVHpUV9+LZTPu5T8dXI8B0=;
	b=qxwNnbMmvfYm0dUiaO5smQcoHYu+FPYvMkqsGuvlND84xwxDLu37sh0K9oYOTDX6Tc
	RlNettMQWV5DqAO4f3kHHNbRRNfULl1O6SZQkh8MPZRT6zVnh4lFwGuNOZzonQ9YmOF2
	KTZXCPPiAw4MCKQ1ajGk8NkRd/TKJv9OcMmw5PxKpXLt4nqETZB4A3HRjnOgt9sMMWaQ
	YjkFqnRi+l8Lr/cqYIarQt560EtJJ3tBMyhBIP3d/7AWx1ZSEh61BoGKlATgVuxBR0Z1
	EpZfUmIXxI4e/H9qMOTIDyOhM5VYEQSNf4O3AHq+n5h45Mbr2kaY6XFUhDoU2rXMUTtj
	CYiA==
X-Received: by 10.180.9.74 with SMTP id x10mr2545089wia.61.1443698440254;
	Thu, 01 Oct 2015 04:20:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h6sm2666338wiy.14.2015.10.01.04.20.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 04:20:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 1 Oct 2015 13:21:38 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151001112138.GA2403@jama>
References: <1443602914-22199-1-git-send-email-adrian.ratiu@ni.com>
	<1443611744-32468-1-git-send-email-adrian.ratiu@ni.com>
	<394DAAF7-103E-46D8-8495-F4209BE5857C@gmail.com>
	<560CFA68.2030208@ni.com>
MIME-Version: 1.0
In-Reply-To: <560CFA68.2030208@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH V2] meta-oe: recipes-devtools: add libubox recipe
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
X-List-Received-Date: Thu, 01 Oct 2015 11:20:42 -0000
X-Groupsio-MsgNum: 57617
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline

--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2015 at 12:18:32PM +0300, Ioan-Adrian Ratiu wrote:
> On 30.09.2015 18:24, Khem Raj wrote:
> >
> >> On Sep 30, 2015, at 4:15 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> w=
rote:
> >>
> >> libubox contains C utility functions used by OpenWrt projects
> >>
> >> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> >> ---
> >> meta-oe/recipes-devtools/libubox/libubox_git.bb | 32 +++++++++++++++++=
++++++++
> >> 1 file changed, 32 insertions(+)
> >> create mode 100644 meta-oe/recipes-devtools/libubox/libubox_git.bb
> >>
> >> diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe=
/recipes-devtools/libubox/libubox_git.bb
> >> new file mode 100644
> >> index 0000000..4be3ac1
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
> >> @@ -0,0 +1,32 @@
> >> +DESCRIPTION =3D "C utility functions for OpenWrt"
> >> +SECTION =3D "libs"
> >> +LICENSE =3D "libubox-custom-license=E2=80=9D
> >
> > where is the license file ?
> >
>=20
> There is no global license file, only the license headers specified per=
=20
> files, of which I tried to list all the unique ones in the=20
> LIC_FILES_CHKSUM. I'm still at a loss what to put in the LICENSE=20
> variable. Any suggestions?
>=20
> >> +LIC_FILES_CHKSUM =3D "\
> >> +    file://avl.c;endline=3D39;md5=3D00810155fed3d604816ec5814523d60a \
> >> +    file://avl-cmp.c;endline=3D15;md5=3D1603e6094b432a5f3f320877a06f4=
1b5 \
> >> +    file://base64.c;endline=3D61;md5=3D51fdff010d45b0086ac0a6e035693d=
c0 \
> >> +    file://blobmsg.c;endline=3D15;md5=3D7ed64c1570e8c9b46c4fc6fbd16c4=
89e \
> >> +    file://list.h;endline=3D28;md5=3D2d5f5475fbd0f08741354c5a99c2e983=
 \
> >> +    file://md5.h;endline=3D39;md5=3D048bf9f68963c207a0c2b3a94c9d2aaa \
> >> +    file://md5.c;endline=3D51;md5=3D0a448eea0bcbc89e3c7e6608f2d119a0 \
> >> +    file://usock.h;endline=3D18;md5=3Df0dfdc8de858e66d66d74036611bba1=
4 \
> >> +"
> >> +
> >> +PACKAGES =3D "${PN} ${PN}-dbg ${PN}-dev ${PN}-staticdev=E2=80=9D
> >
> > why override default PACKAGES ?
> >
>=20
> This is related with the issue below, please see my explanation there.
>=20
> >> +
> >> +DEPENDS =3D "json-c"
> >> +
> >> +SRC_URI =3D "git://git.openwrt.org/project/libubox.git"
> >> +
> >> +SRCREV =3D "136a5196266d03d537f822c4e67d2fde2ed59505"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +inherit cmake
> >> +
> >> +EXTRA_OECMAKE =3D "-DBUILD_EXAMPLES=3DOFF -DBUILD_LUA=3DOFF"
> >> +
> >> +FILES_${PN} +=3D "\
> >> +    ${libdir}/libubox.so \
> >> +    ${libdir}/libblobmsg_json.so \
> >
> > can they be versioned ?
> >
>=20
> My initial problem in patch v1 was that I was getting this dev-deps=20
> error (I used INSANE_SKIP to suppress it):
>=20
> ERROR: QA Issue: libubox rdepends on libubox-dev [dev-deps]
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
>=20
> Martin J. told me to fix the issue properly for these recipes.
>=20
> Now, in v2, I've made it go away by reordering ${PN} in front of=20
> ${PN}-dev in PACKAGES and explicitly adding these files to FILES_${PN}.=
=20
> If I use the default PACKAGES variable, or do not add the libraries to=20
> FILES_${PN}, that error reappears.
>=20
> I don't have a level of knowledge-depth of the OE packaging mechanism to=
=20
> fully understand what is happening here and I couldn't find more info in=
=20
> the docs... So any help on this is very much appreciated :)

I'm surprised that there are still many people confused by this and that
the docs aren't clear enough.

I'm not tech. writer, but I would explain it like this:

Packaging rules:

1) Each installed file (in ${D} directory), should be packaged in exactly
one package. If it matches in multiple FILES_<pkg> patterns, then first
package wins (see bellow), if it isn't matched in any FILES_<pkg>
variable, then it's not packaged at all and QA warning
installed-not-packaged is shown.
2) Files are "moved" to packages in order of PACKAGES variable, so if
FILES_<pkg1> has more generic pattern than FILES_<pkg2> then pkg1 needs
to be _after_ pkg2 in PACKAGES variable or pkg1 will get all files and
pkg2 none.

To apply this on your problem, if you really want to move all .so files
to PN (normally they are symlinks to versioned .so.X.Y.Z and really
belong to PN-dev). Typical exception to this rule are some .so modules
loaded by the application itself instead of normal shlib loader.

You have 2 options (first one is better)

1) restrict FILES_${PN}-dev to prevent it from "eating" these .so. I
prefer to set FILES_SOLIBSDEV instead of redefinition of whole
FILES_${PN}-dev

2) change order of PACKAGES by re-defining it in the recipe - harder to
introduce new global PACKAGES

Regards,

>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYNFwMACgkQN1Ujt2V2gBzPlgCggg4S4awhnFvbxZSwTh42hMnO
WwAAniAl/jagMCoKXQHcyDgumc3stOUw
=shkb
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
