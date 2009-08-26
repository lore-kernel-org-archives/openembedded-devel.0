Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1MgOsG-0002Dq-Op
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 22:13:41 +0200
Received: by bwz21 with SMTP id 21so385070bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 12:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=fdKXtpVl5XK5fQL8InpvLcoXUHBZg5JN17CFwMROgkY=;
	b=mqpyv4eRy2ybpnK3TuSLMttH1/BDQf/v6xJeUGY5l2yuqvHDO6YfFimXvvEQyWta3G
	PmsNtW9DUzcjey8PT853paBntDHZRYasy+voM/pOZPv/Oqpvpdx2d7meQ3+7s+J3IFDJ
	5O52RccVkJMpELJ0S62JQXea9IhJfUr4Dg7nA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=gz22cgluSQuoU0pufYCLdzW4xNWBlSP0ks1XZXj5c1OineXkw2WWRkdsFvvlqsg+Nv
	MyCriCLYGYCfEil21RYDv4rPZwGgdOzyx6SfUR4mYbNd6ly6UCjLJTqCbxX4X/G7CUKR
	KL77MbkAohaNpoInYguynxpFQbT+5cjiTJ1Lg=
Received: by 10.103.126.27 with SMTP id d27mr3847403mun.56.1251316539877;
	Wed, 26 Aug 2009 12:55:39 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm8764157muo.3.2009.08.26.12.55.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Aug 2009 12:55:38 -0700 (PDT)
Date: Wed, 26 Aug 2009 21:55:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090826195516.GB31617@jama>
References: <20090820032802.GA32010@denix.org>
	<200908200752.58210.holger+oe@freyther.de>
	<20090820071052.GA459@denix.org> <h6j1rj$nvf$1@ger.gmane.org>
	<20090820090136.GD459@denix.org> <20090820094642.GA16618@jama>
MIME-Version: 1.0
In-Reply-To: <20090820094642.GA16618@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Use AUTOREV and have revision/commit number in package name?
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
X-List-Received-Date: Wed, 26 Aug 2009 20:13:43 -0000
X-Groupsio-MsgNum: 12793
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline

--+nBD6E3TurpgldQp
Content-Type: multipart/mixed; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline

--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2009 at 11:46:42AM +0200, Martin Jansa wrote:
> Just out of my curiosity:
>=20
> How are PREFERRED_VERSION_pkg supposed to work when I prefer pkg with
> autoreved revision.
>=20
> bbfile will be named like pkg_git.bb
> inside will be PV=3D"1.0.0+gitr${SRCPV}" and DEFAULT_PREFERENCE=3D-1
>=20
> I would like to force using this _git version even when there will be
> pkg_1.1.0.bb with PV=3D"1.1.0"
>=20
> For fixed revision ie from sane-srcrevs i can bump PREFERRED_VERSION_pkg
> with every revision bump in sane-srcrevs, but it also suboptimal :/.
>=20
> With autorev I cannot set PREFERRED_VERSION_pkg at all, if I understand
> it right, because I never know which string will be in ${SRCPV} and
> using just PREFERRED_VERSION_pkg=3D"1.0.0+git" or "git" ends with
> "preferred version is not available". Setting PREFERRED_VERSION_pkg to
> "1.0.0+gitr${SRCPV}" is not expanded and ends with a bit confusing=20
> bitbake exception about SRC_URI not referencing some SCM.
>=20
> I've asked on IRC and they said that its common practise to remove
> PREFERRED_VERSION_pkg and adjust DEFAULT_PREFERENCE or blacklist all
> other versions (like that with PV=3D"1.1.0").
>=20
> Now I solved my problem with updating PV in recipies which weren't
> preferred by bitbake to latest version from all available (moved to
> PV=3D"1.1.0+gitr${SRCPV}" when pkg_1.1.0.bb is commited and removed
> DEFAULT_PREFERENCE=3D-1.
>=20
> Could it be solved better? Something like:
> 1) use .bb file with exact the same PV
> 2) use .bb file where PV starts with the same string as is in
> PREFERRED_VERSION_pkg if exact is not found and print warning.

What about this small patch in attachment?

Is there better character for wildchar ('*')?

For this type of PVs is wildchar usefull only in the end of
PREFERRED_VERSION_pkg, would someone need it somewhere else?

Testing regexp match seems like too much for me, at least because
preferred versions contain '.' now and it would be confusing to use
regexp without escaping them.

Regards,

--=20
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr=20
JaMa                        =20

--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-Allow-as-wildcard-in-the-end-of-PREFERRED_VERSION_pk.patch"
Content-Transfer-Encoding: quoted-printable

From b65bb3e5bf29c59f2f1da297a89af6c02a1a2a4f Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 26 Aug 2009 21:49:33 +0200
Subject: [PATCH] Allow % as wildcard in the end of PREFERRED_VERSION_pkg

---
 lib/bb/providers.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/bb/providers.py b/lib/bb/providers.py
index 8970fb3..b2a9fea 100644
--- a/lib/bb/providers.py
+++ b/lib/bb/providers.py
@@ -96,7 +96,7 @@ def findPreferredProvider(pn, cfgData, dataCache, pkg_pn =
=3D None, item =3D None):
         for file_set in pkg_pn:
             for f in file_set:
                 pe,pv,pr =3D dataCache.pkg_pepvpr[f]
-                if preferred_v =3D=3D pv and (preferred_r =3D=3D pr or pre=
ferred_r =3D=3D None) and (preferred_e =3D=3D pe or preferred_e =3D=3D None=
):
+                if (pv =3D=3D preferred_v or (preferred_v !=3D None and pr=
eferred_v.endswith('%') and pv.startswith(preferred_v[:len(preferred_v)-1])=
)) and (pr =3D=3D preferred_r or preferred_r =3D=3D None) and (pe =3D=3D pr=
eferred_e or preferred_e =3D=3D None):
                     preferred_file =3D f
                     preferred_ver =3D (pe, pv, pr)
                     break
--=20
1.6.4


--GID0FwUMdk1T2AWN--

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAkqVkyQACgkQN1Ujt2V2gBy97wCfYlu1HB4LDNfZLBJG6HGBvwSF
QBUAnA7BiAjRNBPG6W4WzV9/WKhD8r8R
=Sk5N
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
