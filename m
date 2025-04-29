Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FEBC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 08:56:46 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] lmsensors: Fix build without sensord
To: openembedded-devel@lists.openembedded.org
From: "Jonas Gorski" <jonas.gorski@bisdn.de>
X-Originating-Location: DE (62.80.99.152)
X-Originating-Platform: Linux Firefox 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 29 Apr 2025 01:56:35 -0700
References: <20250424125034.73053-1-l.anderweit@phytec.de>
In-Reply-To: <20250424125034.73053-1-l.anderweit@phytec.de>
Message-ID: <5570.1745916995927239072@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 08:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117232

On Thu, Apr 24, 2025 at 02:50 PM, Leonard Anderweit wrote:
>
> When building with sensord disabled (PACKAGECONFIG =3D ""), do_install
> would fail because it tried to build sensord which was skiped in
> do_compile.
> Error log:
> make: *** No rule to make target 'rrd.h', needed by 'prog/sensord/rrd.rd'=
.
> Stop.
>=20
> Avoid building sensord in do_install by explicitly setting PROG_EXTRA.
>=20
> Fixes: 86b20b84ec27 (lmsensors: Clean stale files for sensord to avoid
> incorrect GCC header dependencies)
>=20
> Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>

Can confirm it fixes the build in kirkstone as well (which currently is als=
o broken), so

Tested-by: Jonas Gorski <jonas.gorski@bisdn.de>

