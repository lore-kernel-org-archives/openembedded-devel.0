Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id CE948705A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 14:16:35 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so8141715wev.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mumZQg2mutV77hTK5t7f2rqU2Twgji5ARj5KJbQP8FQ=;
	b=J1xvYuePYN00rTyhw8aL+4nSBlNL7FUyn8LSq9wxiGRAWFeMQJbvSY8sG79Jm9Z+Cb
	tU1emZCuTAbXmQwp7kA+Qvrq+/7yrXTtcKeQe96Gjrsz3m8g6tc09vSAVaE17X/E089W
	qZ1mCKgokB62x5uEC14GOZ1j+TsPg7Cu+kFtNqrjBp6lR2npOSvEh4l22dR5PyQk/KCL
	iNrYIpb+x0VOC290J0Qq7bSFPxEvyIr/yvUAtY812VgAVmrWCsw0dsVEFFCP4RBuI/pF
	DLwLrr6qGyBRk1edrH+fd9Vs1F39Nsg4bkOS8GgDb/df46W3F+ZAPr7fNlX4Cmf4vH2e
	DZnw==
X-Received: by 10.194.92.177 with SMTP id cn17mr35174984wjb.71.1406038594197; 
	Tue, 22 Jul 2014 07:16:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pj6sm1313275wjb.21.2014.07.22.07.16.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 07:16:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Jul 2014 16:16:49 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140722141649.GS22875@jama>
References: <1405981786-9404-1-git-send-email-Martin.Jansa@gmail.com>
	<53CE6E5B.7080209@balister.org>
MIME-Version: 1.0
In-Reply-To: <53CE6E5B.7080209@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 1/2] zeroc-ice: blacklist, because it's not compatible with default db-6* version
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
X-List-Received-Date: Tue, 22 Jul 2014 14:16:36 -0000
X-Groupsio-MsgNum: 51178
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qndya+I13rh6QJ0p"
Content-Disposition: inline

--qndya+I13rh6QJ0p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2014 at 09:59:55AM -0400, Philip Balister wrote:
> How many recipes have issues with db6?

I know only about this one.

> Is there some standard guidance on fixing these issues?

I would look into upstream if they already fixed it in newer zeroc-ice
and upgrade to that version or backport that patch.

If they didn't then someone needs to check db API changes and adapt it
(and submit it upstream).

> I am on vacation for 2.5 weeks, when I get back I'll look into this.

OK, I'm merge the blacklist until it's fixed.

Better to document the issue in blacklist and let the build fail
immediately than wait for bitbake to fail.

Users still can set P_V for db together with empty PNBLACKLIST value to
build zeroc-ice.

> Philip
>=20
> On 07/21/2014 06:29 PM, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb | 10 +++++++=
+++
> >  1 file changed, 10 insertions(+)
> >=20
> > diff --git a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb =
b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
> > index 79d8b5a..e39aa18 100644
> > --- a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
> > +++ b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
> > @@ -10,6 +10,16 @@ SRC_URI =3D "http://www.zeroc.com/download/Ice/3.5/I=
ce-${PV}.tar.gz \
> >  SRC_URI[md5sum] =3D "f00c59983cc904bca977133c0a9b3e80"
> >  SRC_URI[sha256sum] =3D "989e51194c6adadbd156da3288e37bad847b93b3b87650=
2e83033b70493af392"
> > =20
> > +#| MapDb.cpp: In constructor 'Freeze::MapDb::MapDb(const ConnectionIPt=
r&, const string&, const string&, const string&, const KeyCompareBasePtr&, =
const std::vector<IceUtil::Handle<Freeze::MapIndexBase> >&, bool)':
> > +#| MapDb.cpp:138:46: error: call of overloaded 'set_bt_compare(int (*)=
(DB*, const DBT*, const DBT*))' is ambiguous
> > +#| MapDb.cpp:138:46: note: candidates are:
> > +#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/us=
r/include/db_cxx.h:272:14: note: virtual int Db::set_bt_compare(bt_compare_=
fcn_type) <near match>
> > +#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/us=
r/include/db_cxx.h:272:14: note:   no known conversion for argument 1 from =
'int (*)(DB*, const DBT*, const DBT*) {aka int (*)(__db*, const __db_dbt*, =
const __db_dbt*)}' to 'bt_compare_fcn_type {aka int (*)(__db*, const __db_d=
bt*, const __db_dbt*, long unsigned int*)}'
> > +#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/us=
r/include/db_cxx.h:273:14: note: virtual int Db::set_bt_compare(int (*)(Db*=
, const Dbt*, const Dbt*, size_t*)) <near match>
> > +#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/us=
r/include/db_cxx.h:273:14: note:   no known conversion for argument 1 from =
'int (*)(DB*, const DBT*, const DBT*) {aka int (*)(__db*, const __db_dbt*, =
const __db_dbt*)}' to 'int (*)(Db*, const Dbt*, const Dbt*, size_t*) {aka i=
nt (*)(Db*, const Dbt*, const Dbt*, long unsigned int*)}'
> > +#| make[3]: *** [MapDb.o] Error 1
> > +PNBLACKLIST[zeroc-ice] =3D "BROKEN: not compatible with default db ver=
sion"
> > +
> >  S =3D "${WORKDIR}/Ice-${PV}"
> > =20
> >  inherit python-dir pkgconfig
> >=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qndya+I13rh6QJ0p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPOclEACgkQN1Ujt2V2gBzPCwCgtQq19v4QqJH8cTu2EvvODdDl
Oa0An3umGKGZwS0QBs6ATo95zi7/29F4
=NZXJ
-----END PGP SIGNATURE-----

--qndya+I13rh6QJ0p--
