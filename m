Return-Path: <psaavedra@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FE0CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 09:39:49 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web10.35226.1756978787508860806
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 02:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=Z6ns4PBv;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2Hth2XJFUyYbQ9KLPDLw99yfOZfsSchciPtgSM/VL1U=; b=Z6ns4PBvEN8fqzR3r9tpBHiXOp
	QKTo4Bf52e2RwNB4JrvclHCw6A3r4M0TFTAwZ1uN2mCphVRtUF6DmJJ3WOnXzEhTon+r14qg57tx5
	L1bjtgG6eZ2QsPk8pnLtHWBuLz9WBARy1OKc9j5aU91a+K5hCSnaIbbfzCE946+Oh8jsqhqetk+8Z
	e4fDmFUfYd09Jv40hjjntZL30sfbRKTXuMpCiCx2gs+JMXHyOkZCiiRcIuWONsTbk1HBUSV2U5nYP
	K04K2RMUM42ifZ5geHnmE45hgEpxWXl1rnLHPBsKuV6hqo64L94WoHUREVVRJ6a12rqo8N29fJa5u
	3FIc6/VA==;
Received: from [192.168.12.210]
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uu6RV-006haa-06; Thu, 04 Sep 2025 11:39:45 +0200
Message-ID: <771bbccbea73d39f7115823a54e27c17a4cc0b18.camel@igalia.com>
Subject: Re: [oe][meta-gnome][PATCH] sysprof: upgrade 48.0 -> 48.1
From: Pablo Saavedra <psaavedra@igalia.com>
To: skandigraun@gmail.com, openembedded-devel@lists.openembedded.org
Date: Thu, 04 Sep 2025 11:39:44 +0200
In-Reply-To: <d2ad629f-b190-4b30-8745-f2210e802ba6@gmail.com>
References: <20250903160848.3840533-1-psaavedra@igalia.com>
	 <1861D377B6A35864.8194@lists.openembedded.org>
	 <d2ad629f-b190-4b30-8745-f2210e802ba6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 09:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119277

Thanks for the review and sorry for send it with a better verification
of the status of the patches.=20

For 0005 and 0006 I asked for some updates about why this feature is
needed and if we can iterate over this to get it ready if that is the
case.


I will send a v2 of the patches ASAP.


On Wed, 2025-09-03 at 18:50 +0200, Gyorgy Sarvari via
lists.openembedded.org wrote:
> On 9/3/25 18:43, Gyorgy Sarvari via lists.openembedded.org wrote:
> > On 9/3/25 18:08, Pablo Saavedra Rodi=C3=B1o via lists.openembedded.org
> > wrote:
> > > Changes:
> > >=20
> > > * libsysprof-capture: Clean ring buffer memory for counters
> > >=20
> > > Also:
> > >=20
> > > * Make PolKit usage a build-time option
> > > * sysprofd: Check that remote user is root when PolKit is
> > > =C2=A0 disabled
> > > * Make elf loader search for debug links in .debug dirs
> > >=20
> > > Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> > > ---
> > > =C2=A0...libunwind-instead-of-libunwind-gener.patch |=C2=A0=C2=A0 8 +=
-
> > > =C2=A0...oke-the-commands-to-update-the-icon-.patch |=C2=A0=C2=A0 6 +=
-
> > > =C2=A0...-for-unw_set_caching_policy-before-u.patch |=C2=A0=C2=A0 2 +=
-
> > > =C2=A0...ake-PolKit-usage-a-build-time-option.patch | 154
> > > ++++++++++++++++++
> > > =C2=A0...hat-remote-user-is-root-when-PolKit-.patch |=C2=A0 81 ++++++=
+++
> > > =C2=A0...search-for-debug-links-in-.debug-dir.patch |=C2=A0 47 ++++++
> > > =C2=A0.../{sysprof_48.0.bb =3D> sysprof_48.1.bb}=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> > > =C2=A07 files changed, 294 insertions(+), 9 deletions(-)
> > > =C2=A0create mode 100644 meta-gnome/recipes-
> > > gnome/sysprof/sysprof/0005-Make-PolKit-usage-a-build-time-
> > > option.patch
> > > =C2=A0create mode 100644 meta-gnome/recipes-
> > > gnome/sysprof/sysprof/0006-sysprofd-Check-that-remote-user-is-
> > > root-when-PolKit-.patch
> > > =C2=A0create mode 100644 meta-gnome/recipes-
> > > gnome/sysprof/sysprof/0007-Make-elf-loader-search-for-debug-
> > > links-in-.debug-dir.patch
> > The patch statuses look incorrect. 0005 and 0006 seem to be
> > "Denied"
> > (while it seems upstream isn't against the idea, it looks the don't
> > like
> > the implementation), and 0007 is "Backport".
> >=20
> Actually re-reading that conversation for the patches 0005 and
> 0006...
> does this work at runtime as it should, at least in OE?
> The maintainer does raise some concerns about some credential call
> always returning NULL, which sounds scary, though at this moment it's
> a
> bit over my head, gotta admit.
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119262):
> https://lists.openembedded.org/g/openembedded-devel/message/119262
> Mute This Topic: https://lists.openembedded.org/mt/115048000/3619072
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub=C2=A0[
> psaavedra@igalia.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


