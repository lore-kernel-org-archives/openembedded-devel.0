Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2250560557
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 01:18:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4A1IVvH003707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 May 2017 18:18:31 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([fe80::fcbe:9b7:1141:89a1]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Tue, 9 May 2017 18:18:31 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Thread-Topic: [oe] [meta-networking][PATCH 2/8] freeradius: add new recipe
Thread-Index: AQHSyOJvL4i9IKCHyESDjO7i0D0XIKHswj1w
Date: Wed, 10 May 2017 01:18:30 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B766CB2@ALA-MBC.corp.ad.wrs.com>
References: <7107637a8dd9779404a39e2cc586ff132cbf5309.1493194374.git.jackie.huang@windriver.com>
	<20170509163629.GA24456@mentor.com>
In-Reply-To: <20170509163629.GA24456@mentor.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.94]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/8] freeradius: add new recipe
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
X-List-Received-Date: Wed, 10 May 2017 01:18:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> Sent: Wednesday, May 10, 2017 00:37
> To: Huang, Jie (Jackie)
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH 2/8] freeradius: add new recipe
>=20
> Sorry to resurrect a v1 patch but I've lost the v2 and the list seems
> to have eaten my original reply to that one.  Here's my comments from it
> (and the reason why the current patch has been marked rejected in
> patchwork: https://patchwork.openembedded.org/patch/139452/)
>=20
> [[oe] [meta-networking][PATCH 2/8 v2] freeradius: add new recipe] On 17.0=
4.26
> (Wed 16:22) jackie.huang@windriver.com wrote:
>=20
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > FreeRADIUS is an Internet authentication daemon,
> > which implements the RADIUS protocol, as defined
> > in RFC 2865 (and others).
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../freeradius/files/freeradius                    | 110 ++++++++++
> >  .../freeradius-avoid-searching-host-dirs.patch     | 194 +++++++++++++=
++++
> >  ...radius-configure.ac-add-option-for-libcap.patch |  70 ++++++
> >  ...dius-configure.ac-allow-cross-compilation.patch |  31 +++
> >  .../files/freeradius-enble-user-in-conf.patch      |  28 +++
> >  ...eeradius-fix-error-for-expansion-of-macro.patch |  61 ++++++
> >  ...ius-fix-issues-related-to-m4-include-path.patch | 236
> +++++++++++++++++++++
> >  .../freeradius-fix-quoting-for-BUILT_WITH.patch    |  55 +++++
> >  .../files/freeradius-libtool-detection.patch       |  89 ++++++++
> >  .../freeradius-libtool-do-not-use-jlibtool.patch   | 160 +++++++++++++=
+
> >  .../freeradius-rlm_python-add-PY_INC_DIR.patch     |  33 +++
> >  .../freeradius/files/radiusd-volatiles.conf        |   2 +
> >  .../freeradius/files/radiusd.service               |  16 ++
> >  .../freeradius/files/volatiles.58_radiusd          |   3 +
> >  .../freeradius/freeradius_3.0.12.bb                | 223 +++++++++++++=
++++++
>=20
> This is an old version of freeradius, as evinced by your SRC_URI:
>=20
> > +SRC_URI =3D "ftp://ftp.freeradius.org/pub/freeradius/old/freeradius-se=
rver-
> ${PV}.tar.bz2 \
>=20
> Why not bring the current version (3.0.13) in since it's a new recipe
> and save a later update?

Sorry I missed checking this one, I will update it to 3.0.13 and re-send.

>=20
> > diff --git a/meta-networking/recipes-connectivity/freeradius/files/free=
radius-
> avoid-searching-host-dirs.patch b/meta-networking/recipes-
> connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch
> > new file mode 100644
> > index 000000000..8ab23d3ef
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-
> avoid-searching-host-dirs.patch
> > @@ -0,0 +1,194 @@
> > +From dc41591d5ceb18900ec85894f8f7b7bb44bb3bd9 Mon Sep 17 00:00:00
> 2001
> > +From: Jackie Huang <jackie.huang@windriver.com>
> > +Date: Mon, 4 Jan 2016 01:44:04 -0500
> > +Subject: [PATCH] avoid searching host dirs
> > +
> > +Upstream-Status: Inappropriate [cross-compile specific]
>=20
> I don't know if that's specifically a reason to be inappropriate for
> upstream.  :-)
>=20
> Anyway, given that some of the patches were submitted upstream, as you
> noted elsewhere, it may be that the current version won't need them at
> all.

I will check with the current version.

Thanks,
Jackie

>=20
> --
> -Joe MacDonald.
> :wq

