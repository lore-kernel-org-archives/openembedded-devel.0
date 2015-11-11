Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id B41E876294
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 03:26:00 +0000 (UTC)
Received: by pasz6 with SMTP id z6so18150046pas.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 19:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=f4JAoWNVLwdixkVy2F2LhXA71lusd75NhTsi7N5pWF0=;
	b=ry0V4Fha9gkBEcZM4573adLERW+cTRuZqgQS8o4Wf+FbH5CodvzValbXmuHJvD2Wv0
	X3owQzoLhuOJSuqmDDIcyMQdubJIwg1+t/PCS/8ffeWZ8CbzjKg0sj81XSrWRTwe6Xmz
	VnywxJrcM+KgUHsqgp78jz+GWAmNMvUj/7DHdkwUNaAGy2878P5qXv49Y9EiiSPYptpT
	Gi5kDFfKvzp9qe9NrNZukGYthC4v516AlRQXymEuRcIM/AlD1baMfi3txub4R6ZwH5BM
	tZMpdEiCkAMj0qHQan9nVWlSgmaAtpmYlLH3S9rmSCjmqUlb5A9oc07ZNXflmdjqG10O
	tbDA==
X-Received: by 10.68.178.229 with SMTP id db5mr11102266pbc.79.1447212360620;
	Tue, 10 Nov 2015 19:26:00 -0800 (PST)
Received: from [192.168.0.45] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	yq2sm6807342pbb.39.2015.11.10.19.25.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Nov 2015 19:26:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3108\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <33A5922B-6B36-4862-8261-4F59E0AF12AD@gmail.com>
Date: Tue, 10 Nov 2015 19:26:01 -0800
Message-Id: <892C1CD0-EAD9-4692-A296-B5635FE35385@gmail.com>
References: <33A5922B-6B36-4862-8261-4F59E0AF12AD@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3108)
Cc: =?utf-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: Re: [meta-oe][PATCH 3/3] libldb: make openldap optional, but default
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
X-List-Received-Date: Wed, 11 Nov 2015 03:26:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 10, 2015, at 1:26 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>=20
>=20
> Since openldap isn't required, but used when found, allow qualified
> users to disable the requirement to save some space.
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
> meta-oe/recipes-support/libldb/libldb_1.1.17.bb | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb =
b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> index 44f061a..07a839d 100644
> --- a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> +++ b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> @@ -4,9 +4,12 @@ SECTION =3D "libs"
> LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
>=20
> DEPENDS +=3D "libtdb talloc libtevent popt"
> -RDEPENDS_${PN} +=3D "libtevent popt libtalloc openldap"
> +RDEPENDS_${PN} +=3D "libtevent popt libtalloc"
> RDEPENDS_pyldb +=3D "python libtdb libtalloc"
>=20
> +PACKAGECONFIG ??=3D "ldap"
> +PACKAGECONFIG[ldap] =3D ",,openldap"
> +
> SRC_URI =3D "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
>            =
file://do-not-import-target-module-while-cross-compile.patch \
>           "
> --=20
> 1.9.1
>=20
> This results from analysing why there's still an openldap ...
>=20
> I know, having no knob to disable ldap is dirty, but there is no such =
switch.
> Even more dirty, the switch in samba_4% is for embedded samba3 =
source-base only,
> the ldb bundled with samba4 just uses ldap when found.
>=20
> The patch relies on the idea of qualified users - those who know that =
they
> don't want ldap, disable it everywhere and whistle.

it seems to not fix the problem completely, for exact reasons that some =
other package may bring in openldap and stage it before this recipe is =
built so you
have exact same problem again. I think if this package is patched to add =
a knob to disable/enable openldap support explicitly then the fix will =
be complete and I am sure upstream will also accept such a patch.

>=20
> Cheers
> --=20
> Jens Rehsack - rehsack@gmail.com
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


