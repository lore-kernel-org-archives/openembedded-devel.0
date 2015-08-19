Return-Path: <joe@deserted.net>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id DBD7B73CC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 19:02:36 +0000 (UTC)
Received: by igxp17 with SMTP id p17so112825487igx.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 12:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=QDcxvPDygcdz8FMROnR652h+Evh6SsyGh/ut75jGza0=;
	b=MWgCdcYiCRoabYorb7UCOloBRUrhQXp90kKk3cNvnhAUXxB6000OAz3V0oSVis4VZ5
	INyjPvt46i6FGwrU5RP41gFkmBKhVzkXVwH3P0BNeuGMSiIfkmC9IcB70UAc1L1F2dO0
	fN7Xwu09WJKJN4fmvbSzd9DPSyeRi4qPzMWyX6YLIO2Ppg5J8OzKGDLo4Dn8NEffSAH5
	pqAn5IhxOEX6WOcjAU0ZWHZ3oEpAbtdMp0HEXdOOHFvif3Ew4z2Mc9ascF87+asda3td
	ywXOIp8+No0SZahljCYrQqH5OW9e47TZrgvVOWVHwayIgVJmQ+KZlHFQXoZ+NPnn7VRq
	Ik4g==
X-Gm-Message-State: ALoCoQneGSveWF9n18VV0Hkrx7mF9BGLPr8jHv7t4LgNPH14Er68JHZVXkbbNjfBLAKD+6SZ6xIH
X-Received: by 10.50.110.103 with SMTP id hz7mr31931390igb.91.1440010956614;
	Wed, 19 Aug 2015 12:02:36 -0700 (PDT)
Received: from deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id y6sm1295868igl.17.2015.08.19.12.02.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Aug 2015 12:02:35 -0700 (PDT)
Date: Wed, 19 Aug 2015 15:01:46 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150819190146.GA5444@deserted.net>
References: <1439868248-25769-1-git-send-email-joe_macdonald@mentor.com>
	<55D2A776.4020701@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55D2A776.4020701@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] netcf: support multilib builds
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
X-List-Received-Date: Wed, 19 Aug 2015 19:02:39 -0000
X-Groupsio-MsgNum: 56811
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] netcf: support multilib builds] On 15.08=
=2E18 (Tue 11:33) Rongqing Li wrote:

>=20
>=20
> On 2015=E5=B9=B408=E6=9C=8818=E6=97=A5 11:24, Joe MacDonald wrote:
> >When doing a multilib build, /usr/lib is still created but not collected
> >into FILES_${PN} by default, resulting in a QA error.  Adding both
> >${libdir} and ${nonarch_libdir} catches all scenarios.
> >
> >It also turns out that the previous do_install_append would throw an err=
or
> >in a multilib build since systemd always installs to .../lib/... but
> >${libdir] would point at .../lib64/...
> >
> >Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> >---
> >  meta-networking/recipes-support/netcf/netcf_git.bb | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> >diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-n=
etworking/recipes-support/netcf/netcf_git.bb
> >index d47bb3b..8a8963e 100644
> >--- a/meta-networking/recipes-support/netcf/netcf_git.bb
> >+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
> >@@ -32,12 +32,22 @@ do_configure_prepend() {
> >  do_install_append() {
> >      if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false',=
 d)}; then
> >         install -d ${D}${systemd_unitdir}/system
> >-       mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
> >-       rm -rf ${D}${libdir}/systemd/
> >+       if [ -d "${D}${libdir}/systemd/system" ]; then
> >+           mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/sys=
tem/
> >+           rm -rf ${D}${libdir}/systemd/
> >+       else
> >+           mv ${D}${nonarch_libdir}/systemd/system/* ${D}${systemd_unit=
dir}/system/
> >+           rm -rf ${D}${nonarch_libdir}/systemd/
> >+       fi
> >      else
> >         mv ${D}${sysconfdir}/rc.d/init.d/ ${D}${sysconfdir}
> >         rm -rf ${D}${sysconfdir}/rc.d/
> >      fi
> >  }
> >
> >+FILES_${PN} +=3D " \
> >+        ${libdir} \
> >+        ${nonarch_libdir} \
> >+        "
> >+
>=20
> a similar fix has been submitted,
>=20
> =E3=80=90oe] [PATCH][meta-networking] netcf: align the systemd file path =
with
> Makefile

I looked at that fix but from what I can tell it unconditionally deletes
the 32-bit netcf shared and static libs in a multilib configuration.
That squelches the QA warning, but it's probably not what we want.

-J.

>=20
>=20
> =EF=BC=8DRoy
>=20
> >  SYSTEMD_SERVICE_${PN} =3D "netcf-transaction.service"
> >
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li
--=20
-Joe MacDonald.
:wq

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlXU0o4ACgkQwFvcllog0XzU4QCeIiAMkWx8PpAoIYjkbdEbG+tK
LhsAn2Y99Pu38NzKmmw1Av0QE2srRkJb
=2Pbz
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
