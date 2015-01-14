Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 34E5871634
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2015 12:18:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 14 Jan 2015 04:14:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,755,1413270000"; d="scan'208";a="637139482"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.23.139])
	by orsmga001.jf.intel.com with ESMTP; 14 Jan 2015 04:18:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Boszormenyi Zoltan <zboszor@pr.hu>
Date: Wed, 14 Jan 2015 12:18:23 +0000
Message-ID: <27871649.cr5e5TgsPA@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <5476192C.2030204@pr.hu>
References: <5476192C.2030204@pr.hu>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Escaping in PACKAGECONFIG
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
X-List-Received-Date: Wed, 14 Jan 2015 12:18:39 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Zolt=E1n,

On Wednesday 26 November 2014 19:17:16 Boszormenyi Zoltan wrote:
> what is the proper way of escaping a comma in the string specified fo=
r
> PACKAGECONFIG? I would like to use something like the below in my cus=
tom
> PHP recipe:
>=20
> PACKAGECONFIG[mysql] =3D ' \
>                         --enable-mysqlnd=3D"shared" \
>                         --with-mysql=3D"shared,mysqlnd" \
>                         --with-mysqli=3D"shared,mysqlnd" \
>                       =20
> --with-mysql-sock=3D${localstatedir}/lib/mysql/mysql.sock \
> --with-pdo-mysql=3D"shared,mysqlnd" \
>                         , \
>                         ,mysql5'
>=20
> With ...=3D"shared,mysqlnd", ...=3D"shared\,mysqlnd" or ...=3D"shared=
\\,mysqlnd" I
> get:
>=20
> ERROR: Only enable,disable,depend,rdepend can be specified!
>=20
> and
>=20
> ERROR: Nothing PROVIDES 'mysqlnd"' (but .../php/php_5.6.3.bb DEPENDS =
on or
> otherwise requires it). Close matches:
>   mysql5
> ERROR: Required build target 'php' has no buildable providers.
> Missing or unbuildable dependency chain was: ['php', 'mysqlnd"']
>=20
> But, this works:
>=20
> MYSQLND=3D"shared,mysqlnd"
> PACKAGECONFIG[mysql] =3D ' \
>                         --enable-mysqlnd=3D"shared" \
>                         --with-mysql=3D${MYSQLND} \
>                         --with-mysqli=3D${MYSQLND} \
>                       =20
> --with-mysql-sock=3D${localstatedir}/lib/mysql/mysql.sock \
> --with-pdo-mysql=3D${MYSQLND} \
>                         , \
>                         ,mysql5'
>=20
> Why?

Sorry for the delayed response. Basically, if you look at how PACKAGECO=
NFIG is=20
implemented in meta/classes/base.bbclass, we simply do a python split()=
 call=20
on the value of each varflag value (i.e. each individual PACKAGECONFIG[=
xyz]=20
value). However, because we get that value using getVarFlags() without =
passing=20
True for the "expand" parameter, the value is unexpanded, so variable=20=

references such as ${MYSQLND} above won't have been expanded when the s=
tring=20
gets split. I'm not sure if that was intentional but it is how it has b=
een=20
implemented; I don't think anyone has given much thought to cases like =
this=20
where you need to have commas in the value since it's relatively uncomm=
on.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

