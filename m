Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EF9C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 05:27:47 +0000 (UTC)
Subject: Re: [meta-oe][PATCH v2] opencv: install test and sample binaries, rename /usr/bin/shape
To: openembedded-devel@lists.openembedded.org
From: "Keerthivasan Raghavan" <kraghava@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.48)
X-Originating-Platform: Windows Chrome 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 22:27:43 -0700
References: <CAMKF1sqCSo3rA65a0d9ScACF_amGmAuF92oXfMqAzAbAwdRn=Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqCSo3rA65a0d9ScACF_amGmAuF92oXfMqAzAbAwdRn=Q@mail.gmail.com>
Message-ID: <24681.1753853263526986820@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 05:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118763

The usage part is complex as tracking down every consumer would be impossib=
le.
Could this be mitigated with change/release notes ?
Between installing all binaries in the /usr/bin/opencv directory vs renamin=
g just the affected
file/directory the later minimizes the impact. If opencv cmake list files c=
hanges the installation
it is still the same problem originating from a different file/owner. symli=
nk based migration also
does not help as the files would still collide.=20

Regarding the bindir change, I will raise a new patch addressing it.

