Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2A260167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 11:57:11 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id x13so16221387wgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 03:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sqLuzHysVu7spgMxnThSzuaP6msaRltUMmtEUMNsyro=;
	b=K/fsUPF5CV/MdJYv51iK9aWfSdjn5uro77TpCePE4a1E5aFm3CLN0ImBe7pwwv66w5
	wQ8TZv1tIdy/mhlJAS8fmXk4KVpO8wdhe6fOWeU7jgSMJRXbTDBY5QzGkrx72eLU97fj
	4MRiCN5JL5T9rxKtof2aXJPEoLiepa6brjoGLHmxqPlKFqwasgPRQ49SpJlH5cd/4JRe
	/YHLqZvG4TsHi20+iJQWeSdy3a9a3HKVaI1uFEEfG2+h4qO8C7MrxuvXz8OQA3905J3c
	090lcTfgP4Z0VznyJVGnMoI2j1h+sId2RCBRbYA2Nkj6mnvLvCA7hR4TowMzejN1oqHI
	+tnQ==
X-Received: by 10.194.234.40 with SMTP id ub8mr17955769wjc.100.1423828632291; 
	Fri, 13 Feb 2015 03:57:12 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a13sm6677128wic.3.2015.02.13.03.57.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Feb 2015 03:57:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Feb 2015 12:57:17 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150213115717.GA2297@jama>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
	<1423776119-14981-2-git-send-email-schnitzeltony@googlemail.com>
	<20150212222204.GJ2272@jama>
	<CALbNGRR=AJAqS2MD=Ve7VMSi5qiCPaxHtRBVKBmhMEQvpURR5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRR=AJAqS2MD=Ve7VMSi5qiCPaxHtRBVKBmhMEQvpURR5A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 01/19] libmbim: initial add 1.12.2
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
X-List-Received-Date: Fri, 13 Feb 2015 11:57:15 -0000
X-Groupsio-MsgNum: 54277
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 11:35:36PM +0100, Andreas M=FCller wrote:
> On Thu, Feb 12, 2015 at 11:22 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Thu, Feb 12, 2015 at 10:21:41PM +0100, Andreas M=FCller wrote:
> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >> ---
> >>  meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb | 15 +++++++++=
++++++
> >>  1 file changed, 15 insertions(+)
> >>  create mode 100644 meta-oe/recipes-connectivity/libmbim/libmbim_1.12.=
2.bb
> >>
> >> diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb b/=
meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
> >> new file mode 100644
> >> index 0000000..17cfba2
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
> >> @@ -0,0 +1,15 @@
> >> +SUMMARY =3D "libmbim is a glib-based library for talking to WWAN mode=
ms and devices which speak the Mobile Interface Broadband Model (MBIM) prot=
ocol"
> >
> > SUMMARY should be short, please change to short SUMMARY + longer
> > DESCRIPTION.
> >
> >> +HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/libmbim/"
> >> +LICENSE =3D "GPLv2 & LGPLv2.1"
> >> +LIC_FILES_CHKSUM =3D " \
> >> +    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> >> +    file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> >> +"
> >> +
> >> +DEPENDS =3D "glib-2.0 udev"
> >> +
> >> +inherit autotools pkgconfig
> >> +
> >> +SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.=
tar.xz"
> >> +SRC_URI[md5sum] =3D "921fb5ab3f13f1e00833e009d8f3b4f6"
> >> +SRC_URI[sha256sum] =3D "949351d3e3d69b81e40a49f1d187944c26149e0647a41=
5f0227ccdc112047b29"
> >> --
> >> 1.9.3
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> Wow - I don't care for this but want to be a good boy: What is maximum
> length of SUMMARY?

72
http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-SUM=
MARY

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTd5p0ACgkQN1Ujt2V2gBx9EQCgnq7G5vilTApx4nv2NT/5/o10
2t8AoJn7i1ygsUrAG84IS8qjuscIAkn0
=hr/z
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
