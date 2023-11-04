Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE2EC4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 02:05:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2727.1699063504206679432
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 19:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AHbH47g4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kOJ0q7pV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b981399d6-ec018e0e-ece9-4e0e-9432-edebfc8bbb51-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699063503;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ayMK+0JMhLwbMIaYwUieSNS3na8IR0Xz2mIvTl83YJg=;
	b=AHbH47g4MtqlZrCVc48iUV96+mfC200kytZe56pNwQTI0wZQRD2o/cM4gHsrrPdz
	cVgvLdYaQBLsJOnY8HFBaEk86TMcftRqK7N1WaApXQJSveI9HM6C1KYwu9g2e5ybiNF
	78OF7/NWhFpmbA0YY3yF5RId3FB/EZQ0WyzAsu/g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699063503;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ayMK+0JMhLwbMIaYwUieSNS3na8IR0Xz2mIvTl83YJg=;
	b=kOJ0q7pVX0eeV6pYNfLlcmzmZZk9bSMRnQrCllkmhwZSmCf4WM11ChkRCbdMyGR6
	ZFIYqcsIB3pLfUXl5lBHakAKFQ0E7u7a40J9AxUPKe1Bp4QvJoVY1FjOzodCXic/Ayt
	K1sebwjh3EdOiPElS9Fzr1ADu4IqarrGl53p5d9Q=
Content-Type: multipart/mixed; boundary="===============3418753659151519983=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libcgi-perl: upgrading to 4.60 SUCCEEDED
Message-ID: <0101018b981399d6-ec018e0e-ece9-4e0e-9432-edebfc8bbb51-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 02:05:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 02:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106186

--===============3418753659151519983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcgi-perl* to *4.60* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcgi-perl-upgrade-4.57-4.60.patch
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
From 55dac38f801452084904afd3d9f4a49de0675aa5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 01:39:37 +0000
Subject: [PATCH] libcgi-perl: upgrade 4.57 -> 4.60

---
 .../libcgi/{libcgi-perl_4.57.bb => libcgi-perl_4.60.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.57.bb => libcgi-perl_4.60.bb} (93%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.57.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.60.bb
similarity index 93%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.57.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.60.bb
index dea5f7a45..7e330c370 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.57.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.60.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "4e6ca634fe0d5621bb55b0fce5c1d08e6f643c65eecdfffbb4b344fd51b963ac"
+SRC_URI[sha256sum] = "c2f6330bcc7cacda0c905f57ca0d31da1b19a2e4e5babede648c49b13803ee11"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.39.2


--===============3418753659151519983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libcgi-perl: PKGV changed from 4.57 [default] to 4.60 [default]
packages/core2-64-poky-linux/libcgi-perl: PV changed from "4.57" to "4.60"
packages/core2-64-poky-linux/libcgi-perl: SRC_URI changed from "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-4.57.tar.gz file://ptest-perl/run-ptest" to "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-4.60.tar.gz file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-dbg: PKGV changed from 4.57 [default] to 4.60 [default]
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-dbg: PV changed from "4.57" to "4.60"
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-dev: PKGV changed from 4.57 [default] to 4.60 [default]
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-dev: PV changed from "4.57" to "4.60"
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-doc: PKGV changed from 4.57 [default] to 4.60 [default]
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-doc: PV changed from "4.57" to "4.60"
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-locale: PKGV changed from 4.57 [default] to 4.60 [default]
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-locale: PV changed from "4.57" to "4.60"
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-ptest: PKGV changed from 4.57 [default] to 4.60 [default]
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-ptest: PKGSIZE changed from 149750 to 149589 (-0%)
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-ptest: PV changed from "4.57" to "4.60"
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-ptest: FILELIST: removed "/usr/lib/libcgi-perl/ptest/t/changes.t"
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-src: PKGV changed from 4.57 [default] to 4.60 [default]
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-src: PV changed from "4.57" to "4.60"
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-staticdev: PKGV changed from 4.57 [default] to 4.60 [default]
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-staticdev: PV changed from "4.57" to "4.60"
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl: PKGV changed from 4.57 [default] to 4.60 [default]
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl: PKGSIZE changed from 317340 to 317117 (-0%)
packages/core2-64-poky-linux/libcgi-perl/libcgi-perl: PV changed from "4.57" to "4.60"

--===============3418753659151519983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libcgi-perl/libcgi-perl-ptest: FILELIST: removed "/usr/lib/libcgi-perl/ptest/t/changes.t"

--===============3418753659151519983==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcgi-perl-upgrade-4.57-4.60.patch"

RnJvbSA1NWRhYzM4ZjgwMTQ1MjA4NDkwNGFmZDNkOWY0YTQ5ZGUwNjc1YWE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMTozOTozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNnaS1wZXJsOiB1cGdyYWRlIDQuNTcgLT4gNC42MAoKLS0tCiAuLi4vbGliY2dpL3tsaWJjZ2kt
cGVybF80LjU3LmJiID0+IGxpYmNnaS1wZXJsXzQuNjAuYmJ9ICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLXBl
cmwvcmVjaXBlcy1wZXJsL2xpYmNnaS97bGliY2dpLXBlcmxfNC41Ny5iYiA9PiBsaWJjZ2ktcGVy
bF80LjYwLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEtcGVybC9yZWNpcGVzLXBlcmwvbGli
Y2dpL2xpYmNnaS1wZXJsXzQuNTcuYmIgYi9tZXRhLXBlcmwvcmVjaXBlcy1wZXJsL2xpYmNnaS9s
aWJjZ2ktcGVybF80LjYwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEt
cGVybC9yZWNpcGVzLXBlcmwvbGliY2dpL2xpYmNnaS1wZXJsXzQuNTcuYmIKcmVuYW1lIHRvIG1l
dGEtcGVybC9yZWNpcGVzLXBlcmwvbGliY2dpL2xpYmNnaS1wZXJsXzQuNjAuYmIKaW5kZXggZGVh
NWY3YTQ1Li43ZTMzMGMzNzAgMTAwNjQ0Ci0tLSBhL21ldGEtcGVybC9yZWNpcGVzLXBlcmwvbGli
Y2dpL2xpYmNnaS1wZXJsXzQuNTcuYmIKKysrIGIvbWV0YS1wZXJsL3JlY2lwZXMtcGVybC9saWJj
Z2kvbGliY2dpLXBlcmxfNC42MC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT00MTVmYzQ5YWJlZDI3MjhmOTQ4MGNkMzJjOGQ2N2JlYiIK
IAogU1JDX1VSSSA9ICJodHRwOi8vc2VhcmNoLmNwYW4ub3JnL0NQQU4vYXV0aG9ycy9pZC9ML0xF
L0xFRUpPL0NHSS0ke1BWfS50YXIuZ3oiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZTZjYTYz
NGZlMGQ1NjIxYmI1NWIwZmNlNWMxZDA4ZTZmNjQzYzY1ZWVjZGZmZmJiNGIzNDRmZDUxYjk2M2Fj
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImMyZjYzMzBiY2M3Y2FjZGEwYzkwNWY1N2NhMGQzMWRh
MWIxOWEyZTRlNWJhYmVkZTY0OGM0OWIxMzgwM2VlMTEiCiAKIFMgPSAiJHtXT1JLRElSfS9DR0kt
JHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============3418753659151519983==--

