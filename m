Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F51C070C3
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2283.1699061894758132512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gpytQirk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=j+mlmVgn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b97fb16e0-731cab5f-7130-49a1-a966-c0ae712c1603-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gLld+Si5qI5KTc1VeWoueSQ0hjtldKM+F3H3PszmPzk=;
	b=gpytQirkfonuZAmhvJjUmWCsu5CVcotr7tkYl+qS7f4IEpNrXXZ8nnA4/QegDAQG
	N6p9X8amS7fMBTxTSgswWzVTPgy8El4ye1L3zxEuBkqQmPeLSH0laE67ux/PhfCJx0p
	JY8WoNWCnzYZjvlyNZ/UM4FJOIvZPcxc8WUEM12c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061897;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gLld+Si5qI5KTc1VeWoueSQ0hjtldKM+F3H3PszmPzk=;
	b=j+mlmVgnfgo8KeeoAtch6vzHaSyphVNOq8vq1x6tHrsQfNVEKe7HmoAyH0hCyehi
	STj7lQkPJAYZlgf7YIr35OOQxM7hO78YEqiKCNzUiOxA8F6GSslsqhSqniYb/8eMgc0
	AauLjpNg4x8E3mpOk/wb1LSuoySMqEtCVIcg1dIE=
Content-Type: multipart/mixed; boundary="===============6605085186251064246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pymisp: upgrading to 2.4.178 SUCCEEDED
Message-ID: <0101018b97fb16e0-731cab5f-7130-49a1-a966-c0ae712c1603-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106149

--===============6605085186251064246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pymisp* to *2.4.178* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pymisp-upgrade-2.4.176-2.4.178.patch
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
From aba7d9cdc153197ef84b8c5eeb4f8de15394f313 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 23:53:54 +0000
Subject: [PATCH] python3-pymisp: upgrade 2.4.176 -> 2.4.178

---
 .../{python3-pymisp_2.4.176.bb => python3-pymisp_2.4.178.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.176.bb => python3-pymisp_2.4.178.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.176.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.178.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.176.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.178.bb
index 56f34d412..e969dbe5b 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.176.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.178.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "249cf20f3516100cea0adb0396635e2c13d7695d"
+SRCREV = "3a3096664109639322bff7285956ef7cc376a260"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.39.2


--===============6605085186251064246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pymisp: PKGV changed from 2.4.176 [default] to 2.4.178 [default]
packages/core2-64-poky-linux/python3-pymisp: PV changed from "2.4.176" to "2.4.178"
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp-dbg: PKGV changed from 2.4.176 [default] to 2.4.178 [default]
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp-dbg: PV changed from "2.4.176" to "2.4.178"
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp-dev: PKGV changed from 2.4.176 [default] to 2.4.178 [default]
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp-dev: PV changed from "2.4.176" to "2.4.178"
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp-doc: PKGV changed from 2.4.176 [default] to 2.4.178 [default]
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp-doc: PV changed from "2.4.176" to "2.4.178"
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp-locale: PKGV changed from 2.4.176 [default] to 2.4.178 [default]
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp-locale: PV changed from "2.4.176" to "2.4.178"
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp-src: PKGV changed from 2.4.176 [default] to 2.4.178 [default]
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp-src: PV changed from "2.4.176" to "2.4.178"
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp-staticdev: PKGV changed from 2.4.176 [default] to 2.4.178 [default]
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp-staticdev: PV changed from "2.4.176" to "2.4.178"
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pymisp-2.4.176.dist-info -> /usr/lib/python3.11/site-packages/pymisp-2.4.178.dist-info, removed "/usr/lib/python3.11/site-packages/README.md"
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp: PKGSIZE changed from 1383886 to 1379366 (-0%)
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp: PKGV changed from 2.4.176 [default] to 2.4.178 [default]
packages/core2-64-poky-linux/python3-pymisp/python3-pymisp: PV changed from "2.4.176" to "2.4.178"
Changes to packages/core2-64-poky-linux/python3-pymisp (sysroot):
  /usr/lib/python3.11/site-packages/pymisp-2.4.176.dist-info moved to /usr/lib/python3.11/site-packages/pymisp-2.4.178.dist-info
  /usr/lib/python3.11/site-packages/README.md was removed

--===============6605085186251064246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pymisp/python3-pymisp: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pymisp-2.4.176.dist-info -> /usr/lib/python3.11/site-packages/pymisp-2.4.178.dist-info, removed "/usr/lib/python3.11/site-packages/README.md"
Changes to packages/core2-64-poky-linux/python3-pymisp (sysroot):
  /usr/lib/python3.11/site-packages/pymisp-2.4.176.dist-info moved to /usr/lib/python3.11/site-packages/pymisp-2.4.178.dist-info
  /usr/lib/python3.11/site-packages/README.md was removed

--===============6605085186251064246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pymisp-upgrade-2.4.176-2.4.178.patch"

RnJvbSBhYmE3ZDljZGMxNTMxOTdlZjg0YjhjNWVlYjRmOGRlMTUzOTRmMzEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMzo1Mzo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHltaXNwOiB1cGdyYWRlIDIuNC4xNzYgLT4gMi40LjE3OAoKLS0tCiAuLi4ve3B5dGhv
bjMtcHltaXNwXzIuNC4xNzYuYmIgPT4gcHl0aG9uMy1weW1pc3BfMi40LjE3OC5iYn0gICAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weW1pc3BfMi40
LjE3Ni5iYiA9PiBweXRob24zLXB5bWlzcF8yLjQuMTc4LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBh
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHltaXNwXzIuNC4x
NzYuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5bWlz
cF8yLjQuMTc4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHltaXNwXzIuNC4xNzYuYmIKcmVuYW1l
IHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHltaXNwXzIu
NC4xNzguYmIKaW5kZXggNTZmMzRkNDEyLi5lOTY5ZGJlNWIgMTAwNjQ0Ci0tLSBhL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHltaXNwXzIuNC4xNzYuYmIKKysr
IGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weW1pc3BfMi40
LjE3OC5iYgpAQCAtNCw3ICs0LDcgQEAgTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UiCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1hMzYzOWNmNTc4MGY3MWIxMjVkM2U5ZDFk
YzEyN2MyMCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL01JU1AvUHlNSVNQLmdpdDtw
cm90b2NvbD1odHRwczticmFuY2g9bWFpbiIKLVNSQ1JFViA9ICIyNDljZjIwZjM1MTYxMDBjZWEw
YWRiMDM5NjYzNWUyYzEzZDc2OTVkIgorU1JDUkVWID0gIjNhMzA5NjY2NDEwOTYzOTMyMmJmZjcy
ODU5NTZlZjdjYzM3NmEyNjAiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBpbmhlcml0IHB5dGhv
bl9wb2V0cnlfY29yZQotLSAKMi4zOS4yCgo=

--===============6605085186251064246==--

