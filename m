Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE89C05020
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:57 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.4240.1699071647909717525
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V1l712fk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=f0rGgsgQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b988fddff-7f362b4e-db7e-479a-a226-07797b13c93d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dcWWPkEcP0S1paPtJx+HRpVUTSn4tgpb20HXjAGaO6g=;
	b=V1l712fkSEAGZicdkqsu4+cNQ98C8S5JKSKgNDEbr4K6LgbBontqkrX7U4ijQI52
	i8Qu0kHSynUWQ3CmDBg3HzfQ57yh3Fj2hIX4sAz6UiqV6SYEmGIAELtKNuLShAQSYuv
	dLuLVcnfAyvVm1lUtIdPJQA33vsQKrUYddROSDjI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dcWWPkEcP0S1paPtJx+HRpVUTSn4tgpb20HXjAGaO6g=;
	b=f0rGgsgQA65Vua70IVirnagq+glJeLf2AhQbXrcmUJxlFFifY0Ysr96sguqiqkxL
	t3x0aCs9LeEtsyvSVLpLm9sz8zZC4a2WFhKeH6Fl9W0fORlb7e5Jf8qIjUvg5pG2MMG
	yweqaUC7L9DnOOVM2Ss6sdqFcsrkpI9H7K5KYaWE=
Content-Type: multipart/mixed; boundary="===============3930272734172411983=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] pipewire: upgrading to 0.3.84 SUCCEEDED
Message-ID: <0101018b988fddff-7f362b4e-db7e-479a-a226-07797b13c93d-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106268

--===============3930272734172411983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pipewire* to *0.3.84* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pipewire-upgrade-0.3.83-0.3.84.patch
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
From ba4bb928b746047002e573e710b5b1b9a6266ba2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:05:47 +0000
Subject: [PATCH] pipewire: upgrade 0.3.83 -> 0.3.84

---
 .../pipewire/{pipewire_0.3.83.bb => pipewire_0.3.84.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.83.bb => pipewire_0.3.84.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.83.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.83.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb
index 2414f1397..34c4a68ee 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.83.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "dbus ncurses"
 
-SRCREV = "6fd7f39dbec9c3a65aa2de0123c6bfbda7c53a85"
+SRCREV = "cf46c4f5af6fc026881dbd4e837e71d8e507beef"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============3930272734172411983==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pipewire-upgrade-0.3.83-0.3.84.patch"

RnJvbSBiYTRiYjkyOGI3NDYwNDcwMDJlNTczZTcxMGI1YjFiOWE2MjY2YmEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDowNTo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
cGV3aXJlOiB1cGdyYWRlIDAuMy44MyAtPiAwLjMuODQKCi0tLQogLi4uL3BpcGV3aXJlL3twaXBl
d2lyZV8wLjMuODMuYmIgPT4gcGlwZXdpcmVfMC4zLjg0LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1t
dWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9waXBld2lyZS97cGlwZXdpcmVfMC4zLjgzLmJi
ID0+IHBpcGV3aXJlXzAuMy44NC5iYn0gKDk5JSkKCmRpZmYgLS1naXQgYS9tZXRhLW11bHRpbWVk
aWEvcmVjaXBlcy1tdWx0aW1lZGlhL3BpcGV3aXJlL3BpcGV3aXJlXzAuMy44My5iYiBiL21ldGEt
bXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvcGlwZXdpcmUvcGlwZXdpcmVfMC4zLjg0LmJi
CnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEtbXVsdGltZWRpYS9yZWNpcGVz
LW11bHRpbWVkaWEvcGlwZXdpcmUvcGlwZXdpcmVfMC4zLjgzLmJiCnJlbmFtZSB0byBtZXRhLW11
bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL3BpcGV3aXJlL3BpcGV3aXJlXzAuMy44NC5iYgpp
bmRleCAyNDE0ZjEzOTcuLjM0YzRhNjhlZSAxMDA2NDQKLS0tIGEvbWV0YS1tdWx0aW1lZGlhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9waXBld2lyZS9waXBld2lyZV8wLjMuODMuYmIKKysrIGIvbWV0YS1t
dWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9waXBld2lyZS9waXBld2lyZV8wLjMuODQuYmIK
QEAgLTEzLDcgKzEzLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICIgXAogCiBERVBFTkRTID0gImRi
dXMgbmN1cnNlcyIKIAotU1JDUkVWID0gIjZmZDdmMzlkYmVjOWMzYTY1YWEyZGUwMTIzYzZiZmJk
YTdjNTNhODUiCitTUkNSRVYgPSAiY2Y0NmM0ZjVhZjZmYzAyNjg4MWRiZDRlODM3ZTcxZDhlNTA3
YmVlZiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9waXBld2lyZS9w
aXBld2lyZS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKIAogUyA9ICIke1dPUktE
SVJ9L2dpdCIKLS0gCjIuMzkuMgoK

--===============3930272734172411983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pipewire/gstreamer1.0-pipewire: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/gstreamer1.0-pipewire: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/libpipewire: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/libpipewire: FILELIST: removed "/usr/lib/libpipewire-0.3.so.0.383.0", added "/usr/lib/libpipewire-0.3.so.0.384.0"
packages/core2-64-poky-linux/pipewire/libpipewire: PKGSIZE changed from 1038011 to 1042107 (+0%)
packages/core2-64-poky-linux/pipewire/libpipewire: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-aes67: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-aes67: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-alsa-card-profile: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-alsa-card-profile: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-alsa: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-alsa: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-dbg: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-dbg: FILELIST: removed "/usr/lib/.debug/libpipewire-0.3.so.0.383.0", added "/usr/lib/.debug/libpipewire-0.3.so.0.384.0"
packages/core2-64-poky-linux/pipewire/pipewire-dbg: PKGSIZE changed from 34368032 to 34408472 (+0%)
packages/core2-64-poky-linux/pipewire/pipewire-dbg: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-dev: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-dev: PKGSIZE changed from 809058 to 809406 (+0%)
packages/core2-64-poky-linux/pipewire/pipewire-dev: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-doc: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-doc: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-jack: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-jack: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-af: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-af: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-as: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-as: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-be: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-be: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-bg: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-bg: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-bn-in: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-bn-in: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-ca: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-ca: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-cs: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-cs: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-da: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-da: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-de-ch: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-de-ch: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-de: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-de: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-el: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-el: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-eo: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-eo: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-es: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-es: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-fi: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-fi: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-fr: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-fr: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-gl: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-gl: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-gu: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-gu: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-he: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-he: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-hi: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-hi: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-hr: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-hr: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-hu: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-hu: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-id: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-id: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-it: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-it: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-ja: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-ja: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-ka: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-ka: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-kk: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-kk: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-kn: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-kn: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-ko: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-ko: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-lt: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-lt: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-ml: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-ml: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-mr: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-mr: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-my: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-my: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-nl: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-nl: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-nn: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-nn: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-oc: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-oc: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-or: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-or: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-pa: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-pa: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-pl: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-pl: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-pt-br: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-pt-br: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-pt: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-pt: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-ro: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-ro: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-ru: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-ru: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-si: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-si: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-sk: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-sk: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-sr+latin: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-sr+latin: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-sr: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-sr: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-sv: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-sv: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-ta: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-ta: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-te: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-te: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-tr: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-tr: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-uk: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-uk: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-zh-cn: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-zh-cn: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-locale-zh-tw: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-locale-zh-tw: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-access: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-access: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-adapter: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-adapter: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-avb: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-avb: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-client-device: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-client-device: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-client-node: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-client-node: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-combine-stream: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-combine-stream: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-echo-cancel: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-echo-cancel: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-fallback-sink: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-fallback-sink: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-filter-chain: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-filter-chain: PKGSIZE changed from 209440 to 223872 (+7%)
packages/core2-64-poky-linux/pipewire/pipewire-modules-filter-chain: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-jack-tunnel: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-jack-tunnel: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-jackdbus-detect: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-jackdbus-detect: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-link-factory: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-link-factory: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-loopback: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-loopback: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-meta: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-meta: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-metadata: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-metadata: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-netjack2-driver: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-netjack2-driver: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-netjack2-manager: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-netjack2-manager: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-pipe-tunnel: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-pipe-tunnel: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-portal: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-portal: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-profiler: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-profiler: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-protocol-native: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-protocol-native: PKGSIZE changed from 346184 to 350280 (+1%)
packages/core2-64-poky-linux/pipewire/pipewire-modules-protocol-native: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-protocol-pulse: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-protocol-pulse: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-protocol-simple: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-protocol-simple: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-pulse-tunnel: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-pulse-tunnel: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-raop-discover: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-raop-discover: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-raop-sink: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-raop-sink: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-rt: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-rt: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-rtp-sap: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-rtp-sap: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-rtp-session: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-rtp-session: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-rtp-sink: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-rtp-sink: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-rtp-source: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-rtp-source: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-session-manager: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-session-manager: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-spa-device-factory: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-spa-device-factory: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-spa-device: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-spa-device: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-spa-node-factory: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-spa-node-factory: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-spa-node: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-spa-node: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-vban-recv: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-vban-recv: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-vban-send: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-vban-send: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules-zeroconf-discover: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules-zeroconf-discover: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-modules: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-modules: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-pulse: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-pulse: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-aec-null: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-aec-null: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-aec-webrtc: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-aec-webrtc: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-alsa: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-alsa: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-audioconvert: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-audioconvert: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-audiomixer: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-audiomixer: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-audiotestsrc: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-audiotestsrc: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-avb: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-avb: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-bluez5: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-bluez5: PKGSIZE changed from 966581 to 970677 (+0%)
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-bluez5: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-codec-bluez5-aac: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-codec-bluez5-aac: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-codec-bluez5-faststream: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-codec-bluez5-faststream: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-codec-bluez5-opus: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-codec-bluez5-opus: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-codec-bluez5-sbc: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-codec-bluez5-sbc: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-control: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-control: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-dbus: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-dbus: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-ffmpeg: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-ffmpeg: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-jack: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-jack: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-journal: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-journal: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-libcamera: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-libcamera: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-meta: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-meta: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-support: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-support: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-v4l2: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-v4l2: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-videoconvert: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-videoconvert: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-videotestsrc: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-videotestsrc: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-volume: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-volume: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-vulkan: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins-vulkan: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-plugins: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-spa-tools: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-spa-tools: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-src: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-src: PKGSIZE changed from 8840829 to 8863125 (+0%)
packages/core2-64-poky-linux/pipewire/pipewire-src: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-staticdev: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-staticdev: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-tools: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-tools: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire-v4l2: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire-v4l2: PV changed from "0.3.83" to "0.3.84"
packages/core2-64-poky-linux/pipewire/pipewire: PKGV changed from 0.3.83 [default] to 0.3.84 [default]
packages/core2-64-poky-linux/pipewire/pipewire: PKGSIZE changed from 74674 to 74744 (+0%)
packages/core2-64-poky-linux/pipewire/pipewire: PV changed from "0.3.83" to "0.3.84"
Changes to packages/core2-64-poky-linux/pipewire (sysroot):
  /usr/lib/libpipewire-0.3.so.0 changed symlink target from libpipewire-0.3.so.0.383.0 to libpipewire-0.3.so.0.384.0
  /usr/lib/libpipewire-0.3.so.0.383.0 moved to /usr/lib/libpipewire-0.3.so.0.384.0

--===============3930272734172411983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4896 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3053 cached, 2 parsed). 4885 targets, 143 skipped, 0 masked, 0 errors.
Removing 129 recipes from the core2-64 sysroot...done.
Removing 130 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:4dfc7c0e4c772c176b474b9e9a78e8c52e89f9dd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 995 Local 967 Mirrors 0 Missed 28 Current 217 (97% match, 97% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 223 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb:do_populate_lic_setscene)
NOTE: Running setscene task 235 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 236 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 237 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 238 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb:do_create_spdx_setscene)
NOTE: Running setscene task 239 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 240 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 241 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 246 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 250 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 252 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 253 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 254 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 255 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 256 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libexecinfo-1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe jack-1.19.22-r0: task do_create_spdx_setscene: Started
NOTE: recipe abseil-cpp-20230802.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libopus-1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wireplumber-0.4.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pipewire-0.3.84-r0: task do_populate_lic_setscene: Started
NOTE: recipe ffmpeg-6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libopus-1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libexecinfo-1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 257 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: recipe pipewire-0.3.84-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wireplumber-0.4.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 306 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.15.bb:do_recipe_qa_setscene)
NOTE: recipe abseil-cpp-20230802.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 307 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 1212 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 310 of 1212 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-lxml_4.9.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 311 of 1212 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-lxml_4.9.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libevent-2.1.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 1212 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-ply_3.11.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe jack-1.19.22-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 379 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 380 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 384 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 385 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_packagedata_setscene)
NOTE: recipe ffmpeg-6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 386 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pulseaudio-16.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 389 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe wireplumber-0.4.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe abseil-cpp-20230802.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-lxml-native-4.9.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-lxml-native-4.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcamera-1_0.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libexecinfo-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ply-native-3.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libexecinfo-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe abseil-cpp-20230802.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pipewire-0.3.84-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe jack-1.19.22-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 390 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb:do_populate_sysroot_setscene)
NOTE: recipe wireplumber-0.4.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 391 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb:do_packagedata_setscene)
NOTE: recipe fdk-aac-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-lxml-native-4.9.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 393 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb:do_packagedata_setscene)
NOTE: recipe lua-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pipewire-0.3.84-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 395 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb:do_recipe_qa_setscene)
NOTE: recipe abseil-cpp-20230802.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libcamera-1_0.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 399 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 400 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-ply-native-3.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe jack-1.19.22-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 402 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_create_spdx_setscene)
NOTE: recipe libexecinfo-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libopus-1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libopus-1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/jack/1.19.22/temp/log.do_packagedata_setscene.1202912
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 410 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb:do_package_setscene)
NOTE: recipe libexecinfo-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcamera-1_0.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pipewire-0.3.84-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_create_spdx_setscene: Started
NOTE: recipe abseil-cpp-20230802.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fdk-aac-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libopus-1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-lxml-native-4.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pipewire-0.3.84-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcamera-1_0.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe jack-1.19.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libopus-1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 414 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 417 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 420 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 421 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 422 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 423 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 432 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx_setscene)
NOTE: Running setscene task 433 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 447 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 454 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_packagedata_setscene)
NOTE: recipe libexecinfo-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe abseil-cpp-20230802.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libopus-1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe ffmpeg-6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ffmpeg-6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata_setscene: Started
NOTE: recipe abseil-cpp-20230802.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 455 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libopus-1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libexecinfo-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 456 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 459 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe libusb-compat-1_0.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 460 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 472 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 481 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 483 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ffmpeg-6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 497 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libevent-2.1.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 498 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 499 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: recipe libevent-2.1.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 1212 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 510 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 512 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_create_spdx_setscene)
NOTE: recipe jack-1.19.22-r0: task do_package_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 521 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_recipe_qa_setscene)
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 1212 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-lxml_4.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 526 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe ffmpeg-6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 529 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 531 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 532 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: recipe libevent-2.1.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-lxml-native-4.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ffmpeg-6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 538 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 539 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 540 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 542 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-lxml-native-4.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 546 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ffmpeg-6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 548 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 549 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 553 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe jack-1.19.22-r0: task do_package_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 564 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 566 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 569 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 572 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe jack-1.19.22-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 578 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 581 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 582 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 583 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 587 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe jack-1.19.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 588 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe ofono-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 589 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 599 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 601 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ofono-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ofono-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 606 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 608 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_recipe_qa_setscene)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ell/ell_0.59.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ell/ell_0.59.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 616 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 620 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe ofono-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ell-0.59-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 623 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.59-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 624 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 632 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 636 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.59-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.59-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 643 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ell/ell_0.59.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 646 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 647 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 651 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.59-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 652 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 657 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 661 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 664 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.59-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 665 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 667 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 669 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 675 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 677 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 678 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_setscene)
NOTE: Running setscene task 688 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 695 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 700 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 701 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 702 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 703 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 705 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 717 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 725 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 727 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 731 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 733 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 750 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 751 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 752 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 756 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 760 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 764 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 765 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 767 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 769 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 771 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 775 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 781 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 783 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 785 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 786 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 789 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 790 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 796 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 800 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 801 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 803 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 810 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 813 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 815 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 816 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 819 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 821 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 827 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 828 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 833 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 837 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 839 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 841 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 843 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 845 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 846 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 847 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 849 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 851 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 857 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 858 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 862 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 870 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 874 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 876 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 877 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 878 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 880 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 881 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 884 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 885 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 886 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 893 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 895 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 896 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 898 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 899 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 900 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 905 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 908 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 911 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 913 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 914 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 916 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 917 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 919 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 921 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 923 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 927 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 931 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 935 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 936 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 938 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 939 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 940 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 945 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 949 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 951 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 952 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 955 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 957 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 959 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 960 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 975 of 1212 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1212 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1212 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-ply_3.11.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1035 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1037 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-ply-native-3.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1041 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1043 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1045 of 1212 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-ply-native-3.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1047 of 1212 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-ply_3.11.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1050 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1052 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1053 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1054 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1055 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ply-native-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1059 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1060 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1061 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1062 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1063 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1064 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1065 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1066 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-ply-native-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1068 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1070 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1072 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1073 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1075 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1078 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1080 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1081 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1084 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1090 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1092 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1094 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1096 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 953 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1099 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1100 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1102 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1104 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1106 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1107 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1109 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1111 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1183 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1114 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1610 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_fetch)
NOTE: Running task 1613 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_fetch)
NOTE: Running task 1614 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_fetch)
NOTE: Running task 1664 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1116 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1734 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_write_config)
NOTE: Running task 1738 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_write_config)
NOTE: Running task 1754 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1757 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb:do_write_config)
NOTE: Running task 1760 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.15.bb:do_fetch)
NOTE: Running task 1798 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.15.bb:do_write_config)
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fdk-aac-2.0.1-r0: task do_fetch: Started
NOTE: Running setscene task 1118 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1119 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1120 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1121 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcamera-1_0.1.0-r0: task do_fetch: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_fetch: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_fetch: Succeeded
NOTE: recipe pipewire-0.3.84-r0: task do_fetch: Started
NOTE: Running setscene task 1123 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: Running setscene task 1124 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_write_config: Started
NOTE: recipe libcamera-1_0.1.0-r0: task do_write_config: Started
NOTE: recipe wireplumber-0.4.15-r0: task do_fetch: Started
NOTE: recipe pipewire-0.3.84-r0: task do_write_config: Started
NOTE: recipe wireplumber-0.4.15-r0: task do_write_config: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1125 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcamera-1_0.1.0-r0: task do_fetch: Succeeded
NOTE: recipe pipewire-0.3.84-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1126 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1127 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 1128 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe libcamera-1_0.1.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1129 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1862 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_unpack)
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_write_config: Succeeded
NOTE: recipe wireplumber-0.4.15-r0: task do_write_config: Succeeded
NOTE: recipe pipewire-0.3.84-r0: task do_write_config: Succeeded
NOTE: recipe wireplumber-0.4.15-r0: task do_fetch: Succeeded
NOTE: Running task 1863 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_unpack)
NOTE: Running task 1864 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_unpack)
NOTE: Running task 1865 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb:do_unpack)
NOTE: Running task 1866 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1867 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.15.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1132 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fdk-aac-2.0.1-r0: task do_unpack: Started
NOTE: Running setscene task 1135 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1136 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1137 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe libcamera-1_0.1.0-r0: task do_unpack: Started
NOTE: recipe pipewire-0.3.84-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1141 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wireplumber-0.4.15-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1143 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1881 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fdk-aac-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1148 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1149 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1151 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1897 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_patch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_patch: Succeeded
NOTE: recipe pipewire-0.3.84-r0: task do_unpack: Succeeded
NOTE: Running task 1904 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_patch: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe pipewire-0.3.84-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wireplumber-0.4.15-r0: task do_unpack: Succeeded
NOTE: Running task 1911 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.15.bb:do_patch)
NOTE: recipe pipewire-0.3.84-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1153 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1154 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1155 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1157 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe wireplumber-0.4.15-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wireplumber-0.4.15-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcamera-1_0.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1932 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_patch)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1162 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1164 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1167 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libcamera-1_0.1.0-r0: task do_patch: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcamera-1_0.1.0-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1169 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1171 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1172 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1174 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1175 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1177 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1179 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1180 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1181 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1183 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1185 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1187 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1193 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1195 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1196 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1199 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1201 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1202 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1204 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1212 of 1212 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2925 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2928 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2929 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3038 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb:do_packagedata)
NOTE: Running task 3177 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_collect_spdx_deps)
NOTE: recipe fdk-aac-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3180 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_collect_spdx_deps)
NOTE: Running task 3181 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_collect_spdx_deps)
NOTE: recipe libcamera-1_0.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe jack-1.19.22-r0: task do_packagedata: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcamera-1_0.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3189 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_configure)
NOTE: recipe fdk-aac-2.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fdk-aac-2.0.1-r0: task do_configure: Started
NOTE: recipe jack-1.19.22-r0: task do_packagedata: Succeeded
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3191 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_configure)
NOTE: recipe libcamera-1_0.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcamera-1_0.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3192 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_configure)
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_configure: Started
NOTE: recipe libcamera-1_0.1.0-r0: task do_configure: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_configure: Succeeded
NOTE: Running task 3193 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_compile)
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_compile: Started
NOTE: recipe libcamera-1_0.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3194 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_compile)
NOTE: recipe libcamera-1_0.1.0-r0: task do_compile: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 3195 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_compile)
NOTE: recipe fdk-aac-2.0.1-r0: task do_compile: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 3196 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_install)
NOTE: recipe fdk-aac-2.0.1-r0: task do_install: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_compile: Succeeded
NOTE: Running task 3197 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_install)
NOTE: recipe libcamera-1_0.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3198 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_install)
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_install: Started
NOTE: recipe libcamera-1_0.1.0-r0: task do_install: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 3199 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_populate_sysroot)
NOTE: Running task 3200 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_package)
NOTE: recipe fdk-aac-2.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_package: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_install: Succeeded
NOTE: Running task 3201 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_populate_sysroot)
NOTE: Running task 3202 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_package)
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_package: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcamera-1_0.1.0-r0: task do_install: Succeeded
NOTE: Running task 3203 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_populate_sysroot)
NOTE: Running task 3204 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_package)
NOTE: recipe libcamera-1_0.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libcamera-1_0.1.0-r0: task do_package: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcamera-1_0.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3205 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb:do_prepare_recipe_sysroot)
NOTE: recipe pipewire-0.3.84-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pipewire-0.3.84-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3206 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb:do_configure)
NOTE: recipe pipewire-0.3.84-r0: task do_configure: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 3207 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_packagedata)
NOTE: recipe fdk-aac-2.0.1-r0: task do_packagedata: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_package: Succeeded
NOTE: Running task 3208 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_packagedata)
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_packagedata: Started
NOTE: recipe libcamera-1_0.1.0-r0: task do_package: Succeeded
NOTE: Running task 3209 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_packagedata)
NOTE: recipe libcamera-1_0.1.0-r0: task do_packagedata: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3210 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb:do_create_spdx)
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_create_spdx: Started
NOTE: recipe libcamera-1_0.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3211 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb:do_create_spdx)
NOTE: recipe libcamera-1_0.1.0-r0: task do_create_spdx: Started
NOTE: recipe webrtc-audio-processing-1-1.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libcamera-1_0.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe pipewire-0.3.84-r0: task do_configure: Succeeded
NOTE: Running task 3212 of 3236 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb:do_compile)
NOTE: recipe pipewire-0.3.84-r0: task do_compile: Started
NOTE: recipe fdk-aac-2.0.1-r0: task do_packagedata: Failed
NOTE: recipe pipewire-0.3.84-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3212 tasks of which 3159 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104040421.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104040421.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_packagedata
Summary: There were 19 ERROR messages, returning a non-zero exit code.
ERROR: jack-1.19.22-r0 do_packagedata_setscene: QA Issue: Package version for package jack-src went backwards which would break package feeds (from 0:2-r0 to 0:1.19.22-r0) [version-going-backwards]
ERROR: jack-1.19.22-r0 do_packagedata_setscene: QA Issue: Package version for package jack-dbg went backwards which would break package feeds (from 0:2-r0 to 0:1.19.22-r0) [version-going-backwards]
ERROR: jack-1.19.22-r0 do_packagedata_setscene: QA Issue: Package version for package libjack went backwards which would break package feeds (from 0:2-r0 to 0:1.19.22-r0) [version-going-backwards]
ERROR: jack-1.19.22-r0 do_packagedata_setscene: QA Issue: Package version for package jack-server went backwards which would break package feeds (from 0:2-r0 to 0:1.19.22-r0) [version-going-backwards]
ERROR: jack-1.19.22-r0 do_packagedata_setscene: QA Issue: Package version for package jack-utils went backwards which would break package feeds (from 0:2-r0 to 0:1.19.22-r0) [version-going-backwards]
ERROR: jack-1.19.22-r0 do_packagedata_setscene: QA Issue: Package version for package jack-staticdev went backwards which would break package feeds (from 0:2-r0 to 0:1.19.22-r0) [version-going-backwards]
ERROR: jack-1.19.22-r0 do_packagedata_setscene: QA Issue: Package version for package jack-dev went backwards which would break package feeds (from 0:2-r0 to 0:1.19.22-r0) [version-going-backwards]
ERROR: jack-1.19.22-r0 do_packagedata_setscene: QA Issue: Package version for package jack-doc went backwards which would break package feeds (from 0:2-r0 to 0:1.19.22-r0) [version-going-backwards]
ERROR: jack-1.19.22-r0 do_packagedata_setscene: QA Issue: Package version for package jack-locale went backwards which would break package feeds (from 0:2-r0 to 0:1.19.22-r0) [version-going-backwards]
ERROR: jack-1.19.22-r0 do_packagedata_setscene: QA Issue: Package version for package jack went backwards which would break package feeds (from 0:2-r0 to 0:1.19.22-r0) [version-going-backwards]
ERROR: jack-1.19.22-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: fdk-aac-2.0.1-r0 do_packagedata: QA Issue: Package version for package fdk-aac-src went backwards which would break package feeds (from 0:2.0.2-r0 to 0:2.0.1-r0) [version-going-backwards]
ERROR: fdk-aac-2.0.1-r0 do_packagedata: QA Issue: Package version for package fdk-aac-dbg went backwards which would break package feeds (from 0:2.0.2-r0 to 0:2.0.1-r0) [version-going-backwards]
ERROR: fdk-aac-2.0.1-r0 do_packagedata: QA Issue: Package version for package fdk-aac-staticdev went backwards which would break package feeds (from 0:2.0.2-r0 to 0:2.0.1-r0) [version-going-backwards]
ERROR: fdk-aac-2.0.1-r0 do_packagedata: QA Issue: Package version for package fdk-aac-dev went backwards which would break package feeds (from 0:2.0.2-r0 to 0:2.0.1-r0) [version-going-backwards]
ERROR: fdk-aac-2.0.1-r0 do_packagedata: QA Issue: Package version for package fdk-aac-doc went backwards which would break package feeds (from 0:2.0.2-r0 to 0:2.0.1-r0) [version-going-backwards]
ERROR: fdk-aac-2.0.1-r0 do_packagedata: QA Issue: Package version for package fdk-aac-locale went backwards which would break package feeds (from 0:2.0.2-r0 to 0:2.0.1-r0) [version-going-backwards]
ERROR: fdk-aac-2.0.1-r0 do_packagedata: QA Issue: Package version for package fdk-aac went backwards which would break package feeds (from 0:2.0.2-r0 to 0:2.0.1-r0) [version-going-backwards]
ERROR: fdk-aac-2.0.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux-musl/fdk-aac/2.0.1/temp/log.do_packagedata.1225726
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb:do_packagedata) failed with exit code '1'

--===============3930272734172411983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/pipewire/libpipewire: FILELIST: removed "/usr/lib/libpipewire-0.3.so.0.383.0", added "/usr/lib/libpipewire-0.3.so.0.384.0"
Changes to packages/core2-64-poky-linux/pipewire (sysroot):
  /usr/lib/libpipewire-0.3.so.0 changed symlink target from libpipewire-0.3.so.0.383.0 to libpipewire-0.3.so.0.384.0
  /usr/lib/libpipewire-0.3.so.0.383.0 moved to /usr/lib/libpipewire-0.3.so.0.384.0

--===============3930272734172411983==--

