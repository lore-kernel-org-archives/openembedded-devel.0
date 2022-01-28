Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C697C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 17:15:24 +0000 (UTC)
Subject: Re: [meta-gnome][PATCH] folks: make some dependencies optional
To: openembedded-devel@lists.openembedded.org
From: "Ross Burton" <ross@burtonini.com>
X-Originating-Location: Cambridge, England, GB (217.140.99.251)
X-Originating-Platform: Mac Safari 15.3
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 28 Jan 2022 09:15:23 -0800
References: <20220125181339.114315-1-f_l_k@t-online.de>
In-Reply-To: <20220125181339.114315-1-f_l_k@t-online.de>
Message-ID: <26359.1643390123448861343@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 17:15:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95149

+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,python3-dbusmock-=
native"

You don't install the tests, so this serves no purpose.

Just set -Dtests=3Dfalse explicitly, unless you install the tests and do th=
e ptest integration.

Also the dbusmock test in folks is broken, it should be cross-aware.  As yo=
u can't check for target python modules it should avoid the check in cross =
builds.

Ross

