Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A16C05032
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:05 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.3560.1699067574940473118
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OZUxLsCW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hMaEb0EY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b9851b822-e67cddcd-3a80-4c4e-be49-ba5c28362132-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BS5y3l3OH4NDLHn3mfItxow7/9VWtPeOpL/q/66o6mw=;
	b=OZUxLsCWny/qy0hawfofsqpPsxldGehBMczAA3m//zJGbVbCg2rErbo4LOJ1oTA9
	eD1atNV1lR6OCLugB0I8JX/+mxu3N4f8ogCpVj94ZPYaHskn+JW7eHt/QdYGYFzx5Fr
	yfXSu0DwbAN0V2DUnIt50Q++1Om/dLI0vWgU56jc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BS5y3l3OH4NDLHn3mfItxow7/9VWtPeOpL/q/66o6mw=;
	b=hMaEb0EYOqQMoxAtTJsvwZPxiyzYrlTLKnvTdFhRuvcfrIWiEMigxYayDugaeJA8
	ODB5smmD2gyNvm4YjKDKDoW4MtFIUGroKuFX8sruqnsHnGHlPtQETPq/23sjpi3avYi
	EbttZC5FWc2mf0r3+Mu1kdd5vgGFtSvJl5smsUkk=
Content-Type: multipart/mixed; boundary="===============5632964840883486718=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] nng: upgrading to 12 SUCCEEDED
Message-ID: <0101018b9851b822-e67cddcd-3a80-4c4e-be49-ba5c28362132-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106212

--===============5632964840883486718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nng* to *12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nng-upgrade-1.5.2-12.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 7bf24c9e4d3b2ed1cd9cff5b8a4293f48123fae5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 02:35:52 +0000
Subject: [PATCH] nng: upgrade 1.5.2 -> 12

---
 .../recipes-connectivity/nanomsg/{nng_1.5.2.bb => nng_12.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nng_1.5.2.bb => nng_12.bb} (100%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb b/meta-networking/recipes-connectivity/nanomsg/nng_12.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb
rename to meta-networking/recipes-connectivity/nanomsg/nng_12.bb
-- 
2.39.2


--===============5632964840883486718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nng: PKGV changed from 1.5.2 [default] to 12 [default]
packages/core2-64-poky-linux/nng: PV changed from "1.5.2" to "12"
packages/core2-64-poky-linux/nng/nng-dbg: PKGV changed from 1.5.2 [default] to 12 [default]
packages/core2-64-poky-linux/nng/nng-dbg: PKGSIZE changed from 1703568 to 1703168 (-0%)
packages/core2-64-poky-linux/nng/nng-dbg: PV changed from "1.5.2" to "12"
packages/core2-64-poky-linux/nng/nng-dev: PKGV changed from 1.5.2 [default] to 12 [default]
packages/core2-64-poky-linux/nng/nng-dev: PV changed from "1.5.2" to "12"
packages/core2-64-poky-linux/nng/nng-doc: PKGV changed from 1.5.2 [default] to 12 [default]
packages/core2-64-poky-linux/nng/nng-doc: PV changed from "1.5.2" to "12"
packages/core2-64-poky-linux/nng/nng-locale: PKGV changed from 1.5.2 [default] to 12 [default]
packages/core2-64-poky-linux/nng/nng-locale: PV changed from "1.5.2" to "12"
packages/core2-64-poky-linux/nng/nng-src: PKGV changed from 1.5.2 [default] to 12 [default]
packages/core2-64-poky-linux/nng/nng-src: PV changed from "1.5.2" to "12"
packages/core2-64-poky-linux/nng/nng-staticdev: PKGV changed from 1.5.2 [default] to 12 [default]
packages/core2-64-poky-linux/nng/nng-staticdev: PV changed from "1.5.2" to "12"
packages/core2-64-poky-linux/nng/nng-tools: PKGV changed from 1.5.2 [default] to 12 [default]
packages/core2-64-poky-linux/nng/nng-tools: PV changed from "1.5.2" to "12"
packages/core2-64-poky-linux/nng/nng: PKGV changed from 1.5.2 [default] to 12 [default]
packages/core2-64-poky-linux/nng/nng: PV changed from "1.5.2" to "12"

--===============5632964840883486718==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-nng-upgrade-1.5.2-12.patch"

RnJvbSA3YmYyNGM5ZTRkM2IyZWQxY2Q5Y2ZmNWI4YTQyOTNmNDgxMjNmYWU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMjozNTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5u
ZzogdXBncmFkZSAxLjUuMiAtPiAxMgoKLS0tCiAuLi4vcmVjaXBlcy1jb25uZWN0aXZpdHkvbmFu
b21zZy97bm5nXzEuNS4yLmJiID0+IG5uZ18xMi5iYn0gICAgICB8IDAKIDEgZmlsZSBjaGFuZ2Vk
LCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1uZXR3b3JraW5n
L3JlY2lwZXMtY29ubmVjdGl2aXR5L25hbm9tc2cve25uZ18xLjUuMi5iYiA9PiBubmdfMTIuYmJ9
ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9uYW5vbXNnL25uZ18xLjUuMi5iYiBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9uYW5vbXNnL25uZ18xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L25hbm9tc2cvbm5nXzEuNS4yLmJi
CnJlbmFtZSB0byBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmFub21zZy9u
bmdfMTIuYmIKLS0gCjIuMzkuMgoK

--===============5632964840883486718==--

