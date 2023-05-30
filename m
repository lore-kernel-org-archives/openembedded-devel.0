Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB87DC77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 08:22:20 +0000 (UTC)
Subject: [meta-networking] openvpn: Why does SRC_URI use http?
To: openembedded-devel@lists.openembedded.org
From: "Jermain Horsman" <jermain.horsman@nedap.com>
X-Originating-Location: Groenlo, Gelderland, NL (87.249.123.12)
X-Originating-Platform: Windows Firefox 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 30 May 2023 01:22:13 -0700
Message-ID: <XhYZ.1685434933513203786.cv1s@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 May 2023 08:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102894

I had updated meta-openembedded to include the latest openvpn changes (on d=
unfell in this case).
Unfortunately this caused a fetcher failure, which is likely caused by the =
network policy on my end.
However updating the SRC_URI to https did prevent the issue, which is why I=
 wondered why this is not the default?

Sincerely,

Jermain Horsman

