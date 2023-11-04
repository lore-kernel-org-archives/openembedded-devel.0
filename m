Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A03C05022
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.4708.1699074742117486678
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J2TzDRIQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=R4xIX8sB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b98bf134b-8bbe0a9a-9ecb-4e27-8b64-92b755623ee4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zPsP7IvTozx2jta7kMAZtild8kXy8eMVsVf5Q3BqHE4=;
	b=J2TzDRIQtDqzTz1J93iifEQ0rcvRtT0555kjrwrzre/1aI045xufVICdqXx5IleD
	VwBQ5OGwA/eykoplXbR8wV3GhAF7MU01ZFEJJyPC1AEULjB7fI8CeTtm9RZcj6NlwUa
	7OD7eLkNKpdMRfHt9omOpPsz2qNiR0j7qbIo1CPM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zPsP7IvTozx2jta7kMAZtild8kXy8eMVsVf5Q3BqHE4=;
	b=R4xIX8sBbss1TfNz8Z47eqVb3Dt7u/VHuibt0GjigaOcbREJJAURazy1PqEt1BI6
	VnS8CpHUeSe4brnVedtv9Hn8I0ASAA9HimLu0Dg+ivzi8fX+V0llbrN5p5zWXiAlLr0
	yiBwKClvxi0rACtUVJ0XJVOx9yJuW+Ml5BikzOOI=
Content-Type: multipart/mixed; boundary="===============2629879057579109705=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gnome-chess: upgrading to 44.0 SUCCEEDED
Message-ID: <0101018b98bf134b-8bbe0a9a-9ecb-4e27-8b64-92b755623ee4-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106277

--===============2629879057579109705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnome-chess* to *44.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnome-chess-upgrade-43.2-44.0.patch
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
From baeb331388f9e9fea4e0d3df3d2bce321625d4b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:28:34 +0000
Subject: [PATCH] gnome-chess: upgrade 43.2 -> 44.0

---
 .../gnome-chess/{gnome-chess_43.2.bb => gnome-chess_44.0.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_43.2.bb => gnome-chess_44.0.bb} (100%)

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
similarity index 100%
rename from meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
rename to meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
-- 
2.39.2


--===============2629879057579109705==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnome-chess-upgrade-43.2-44.0.patch"

RnJvbSBiYWViMzMxMzg4ZjllOWZlYTRlMGQzZGYzZDJiY2UzMjE2MjVkNGIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDoyODozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
b21lLWNoZXNzOiB1cGdyYWRlIDQzLjIgLT4gNDQuMAoKLS0tCiAuLi4vZ25vbWUtY2hlc3Mve2du
b21lLWNoZXNzXzQzLjIuYmIgPT4gZ25vbWUtY2hlc3NfNDQuMC5iYn0gICAgICB8IDAKIDEgZmls
ZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1n
bm9tZS9yZWNpcGVzLWdub21lL2dub21lLWNoZXNzL3tnbm9tZS1jaGVzc180My4yLmJiID0+IGdu
b21lLWNoZXNzXzQ0LjAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEtZ25vbWUvcmVjaXBl
cy1nbm9tZS9nbm9tZS1jaGVzcy9nbm9tZS1jaGVzc180My4yLmJiIGIvbWV0YS1nbm9tZS9yZWNp
cGVzLWdub21lL2dub21lLWNoZXNzL2dub21lLWNoZXNzXzQ0LjAuYmIKc2ltaWxhcml0eSBpbmRl
eCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9nbm9tZS1jaGVzcy9n
bm9tZS1jaGVzc180My4yLmJiCnJlbmFtZSB0byBtZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvZ25v
bWUtY2hlc3MvZ25vbWUtY2hlc3NfNDQuMC5iYgotLSAKMi4zOS4yCgo=

--===============2629879057579109705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gnome-chess/gnome-chess-dbg: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-dbg: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-dev: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-dev: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-doc: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-doc: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ab: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ab: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-af: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-af: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-am: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-am: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ar: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ar: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-as: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-as: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ast: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ast: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-az: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-az: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-be: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-be: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-bg: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-bg: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-bn-in: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-bn-in: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-bn: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-bn: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-br: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-br: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-bs: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-bs: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ca+valencia: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ca+valencia: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ca: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ca: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-cs: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-cs: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-cy: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-cy: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-da: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-da: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-de: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-de: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-dz: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-dz: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-el: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-el: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-en+shaw: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-en+shaw: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-en-ca: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-en-ca: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-en-gb: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-en-gb: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-eo: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-eo: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-es: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-es: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-et: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-et: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-eu: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-eu: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-fa: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-fa: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-fi: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-fi: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-fr: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-fr: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-fur: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-fur: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ga: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ga: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-gl: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-gl: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-gu: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-gu: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-he: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-he: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-hi: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-hi: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-hr: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-hr: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-hu: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-hu: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-id: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-id: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-is: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-is: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-it: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-it: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ja: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ja: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ka: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ka: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-kk: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-kk: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-km: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-km: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-kn: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-kn: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ko: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ko: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ku: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ku: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-lt: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-lt: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-lv: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-lv: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-mai: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-mai: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-mk: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-mk: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ml: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ml: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-mn: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-mn: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-mr: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-mr: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ms: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ms: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-nb: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-nb: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ne: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ne: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-nl: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-nl: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-nn: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-nn: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-oc: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-oc: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-or: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-or: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-pa: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-pa: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-pl: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-pl: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-pt-br: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-pt-br: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-pt: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-pt: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ro: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ro: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ru: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ru: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-rw: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-rw: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-si: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-si: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-sk: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-sk: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-sl: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-sl: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-sq: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-sq: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-sr+latin: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-sr+latin: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-sr: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-sr: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-sv: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-sv: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ta: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ta: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-te: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-te: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-tg: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-tg: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-th: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-th: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-tr: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-tr: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ug: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-ug: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-uk: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-uk: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-vi: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-vi: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-wa: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-wa: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-xh: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-xh: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-zh-cn: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-zh-cn: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-zh-hk: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-zh-hk: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-zh-tw: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-locale-zh-tw: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-src: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-src: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess-staticdev: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess-staticdev: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess/gnome-chess: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess/gnome-chess: PKGV changed from 43.2 [default] to 44.0 [default]
packages/core2-64-poky-linux/gnome-chess: PV changed from "43.2" to "44.0"
packages/core2-64-poky-linux/gnome-chess: PKGV changed from 43.2 [default] to 44.0 [default]

--===============2629879057579109705==--

