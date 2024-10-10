Return-Path: <ccasciato@21sw.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7249D24442
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 20:06:34 +0000 (UTC)
Subject: Re: coreutils over uutils-coreutils when selinux in DISTRO_FEATURES
To: openembedded-devel@lists.openembedded.org
From: "Clayton Casciato" <ccasciato@21sw.us>
X-Originating-Location: Denver, Colorado, US (174.29.219.139)
X-Originating-Platform: Linux Firefox 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 10 Oct 2024 13:06:27 -0700
References: <16462.1704064686810817972@lists.openembedded.org>
In-Reply-To: <16462.1704064686810817972@lists.openembedded.org>
Message-ID: <13199.1728590787704780404@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="DJun67tpPQ8gEbcyFvoV"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 20:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112780

--DJun67tpPQ8gEbcyFvoV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks for posting this, Vincent!

I solved this in a uutils-coreutils-%.bbappend:
PROVIDES:remove =3D "coreutils"
RPROVIDES:${PN}:remove =3D "coreutils"

--DJun67tpPQ8gEbcyFvoV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks for posting this, Vincent!</div>
<div>&nbsp;</div>
<div>I solved this in a uutils-coreutils-%.bbappend:</div>
<div>PROVIDES:remove =3D "coreutils"<br />RPROVIDES:${PN}:remove =3D "coreu=
tils"</div>

--DJun67tpPQ8gEbcyFvoV--

