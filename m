Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 06C2965FC5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 10:01:21 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so2547958eei.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 03:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HeUcEbpGaeP1P+y0K49z7ACTtrrFM6CMuQOtjItKrWY=;
	b=bxnu5tFe9i0Hzw28b1+YbtEntIVzGvUH1g0KYdDe0n32pJoHz39A/Ck+9RHCg6u1S0
	cRQosfL7tc2mjOfnDXkJsV18T5kwzL3OERL3VPBzQ1Y8Iu9NptJl2KKbkgAxUd6E+sA9
	oLvXM2RIJ0+PBL4PPsXP99BcHUn35yRCsA13prElBu4AB7B4ePxAw+/dUKEM4uerfASj
	sP9KiKXCoJPAtno7de3wFtpJ02zVmviGaUtnS5CJVlUwQlva8ZackSeqGISF/v4ovWiK
	ovK73s+32BTMYBg1HSjD2lYKnTAEuq2M+JGaiSonEpxVnz57G+r/NwQi8MUDRhYvZD3V
	jNgg==
X-Received: by 10.15.91.77 with SMTP id r53mr8763673eez.70.1399370482297;
	Tue, 06 May 2014 03:01:22 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id 45sm37139274eeh.9.2014.05.06.03.01.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 03:01:21 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Tue, 6 May 2014 10:01:18 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Chong Lu <Chong.Lu@windriver.com>
Message-ID: <20140506100118.GC12987@gmail.com>
References: <cover.1397816030.git.Chong.Lu@windriver.com>
	<deccbaa80823665caeaa2763f587303595cc6115.1397816030.git.Chong.Lu@windriver.com>
	<20140505214541.GB12987@gmail.com> <53684F1A.7000100@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53684F1A.7000100@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] vim: add dependency and selinux and acl support control
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
X-List-Received-Date: Tue, 06 May 2014 10:01:25 -0000
X-Groupsio-MsgNum: 49714
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline

--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2014 at 10:55:22AM +0800, Chong Lu wrote:
>=20
> On 05/06/2014 05:45 AM, Paul Barker wrote:
> >On Fri, Apr 18, 2014 at 06:16:30PM +0800, Chong Lu wrote:
> >>  FILES_${PN}-data =3D "${datadir}/${PN}"
> >>+FILES_${PN}-common =3D " \
> >>+    ${datadir}/${PN}/${VIMDIR}/*.vim \
> >>+    ${datadir}/${PN}/${VIMDIR}/autoload \
> >>+    ${datadir}/${PN}/${VIMDIR}/colors \
> >>+    ${datadir}/${PN}/${VIMDIR}/compiler \
> >>+    ${datadir}/${PN}/${VIMDIR}/ftplugin \
> >>+    ${datadir}/${PN}/${VIMDIR}/indent \
> >>+    ${datadir}/${PN}/${VIMDIR}/keymap \
> >>+    ${datadir}/${PN}/${VIMDIR}/lang \
> >>+    ${datadir}/${PN}/${VIMDIR}/macros \
> >>+    ${datadir}/${PN}/${VIMDIR}/plugin \
> >>+    ${datadir}/${PN}/${VIMDIR}/print \
> >>+    ${datadir}/${PN}/${VIMDIR}/spell \
> >>+    ${datadir}/${PN}/${VIMDIR}/tools \
> >>+"
> >>  # Recommend that runtime data is installed along with vim
> >>  RRECOMMENDS_${PN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimr=
c ${PN}-data"
> >Sorry to reply to an old commit but this has broke things for me. Instal=
ling vim
> >after this commit gives:
> >
> >     vim: unsatisfied recommendation for vim-data
> >
> >As everything that was in vim-data is now in vim-common. Your commit mes=
sage
> >says "Split binary file into vim package and put others in vim-common.",=
 but
> >this split was already in effect with everything in vim-data. It then got
> >installed by default as vim-data is in RRECOMMENDS_vim, but could be dis=
abled by
> >adding things to BAD_RECOMMENDS.
> >
> >What is the benefit of moving things to vim-common? I'm probably just
> >misunderstanding what this change is aiming to solve.
> I just refer to Ubuntu splitting package policy.***
> <https://bbs.archlinux.org/viewtopic.php?id=3D173515>*
> >
> >As vim-data is now left empty, can we remove it from PACKAGES and
> >RRECOMMENDS_vim and instead add vim-common to RRECOMMENDS_vim? Just want=
 to make
> >sure that won't break anything for you before I send a patch.
> Sorry for my mistake. we should remove vim-data from PACKAGES and
> RRECOMMENDS_vim and
> add vim-common to RRECOMMENDS_vim.

No problem, it's an easy fix. I'll put together a patch later this week unl=
ess
you'd like to do it.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTaLLuAAoJEBwoJlo7UPQDEbEH/jYcWGf8xHzlCVSy6sGqKcQJ
UjHk2f7UgOg1NR6Da/0PIHzKX6hUBIuNxZaBp4sFlzdYnpqHZvr2Os9klupjSk1Z
HDiZuU95LbDyuDOoz6H2k50llzCU/HrdyeEZvN27UTlxxwzIiRcSlO2aEkF5P0cX
oovwsC/l9bugm4EMnaV/Q1MWM//Ye+HSzY/TET1328urKkap6AUkCg/B30OaHhHE
USQrK5I/STo9FWgjmc5yj3TRgFtPmLKQEr9WhxdF/O/Gj2esPRDwwJaotCZUiXAL
NLYgJ3h8OHDFpFN8UXkHQZ//1kGaYfmcegvA/bBYra1817CClvYfUzoLpfWResY=
=TSdu
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
