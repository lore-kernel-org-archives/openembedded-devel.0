Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765CDC433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 15:57:15 +0000 (UTC)
Subject: Re: [meta-python] [PATCH] python3-cbor2: upgrade 5.4.2 -> 5.4.3
To: openembedded-devel@lists.openembedded.org
From: "Ross Burton" <ross.burton@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.99.251)
X-Originating-Platform: Mac Safari 15.4
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 16 May 2022 08:57:08 -0700
References: <27367.1652715703703621650@lists.openembedded.org>
In-Reply-To: <27367.1652715703703621650@lists.openembedded.org>
Message-ID: <12467.1652716628672205912@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 15:57:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97136

So this breaks silently because we don't yet check build dependencies when =
doing the build, which I'm working on.

The recipe is missing a dependency on setuptools-scm, and our setuptools re=
cipe needs an upgrade.

Definitely revert this until those are fixed.

Ross

