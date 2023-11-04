Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC41AC10DC2
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:21 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.2285.1699061895183596183
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e84Bbunr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=InOPgx7S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b97fb0ccf-8bc83846-9348-4015-b767-cc19d0497fcd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=po/RNfXYbKyuLpRVQd0zkM2zFpEZ8c/vxPeJ1LLcsuc=;
	b=e84Bbunror3VfnrULd9VZVLHXeQfXw0F3Q0phDcVE64IKqfyr2qfrZ5dWNjE9zQ1
	HE09Hps72YwVd86oXiHwUXnvAq3sI8xIYfjv4h2qbGXOPMlrxohsAJR+cMfVBQzNuG3
	/gCwmehoShb77ln0Ye5DnAlc6/a0Rv0881NIWxG4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=po/RNfXYbKyuLpRVQd0zkM2zFpEZ8c/vxPeJ1LLcsuc=;
	b=InOPgx7StTeU3zywjMkUo5nvIWTYAbZxVNqxjqu8RIaEVEBhAR2n/fivxjSYDpaj
	qF2VtSb1iSUOdrpp5fb7ctfYO2dUOa5uPakpR7KzqIt+yfjStmVg1Bs8xn6muMCEYCY
	A+SFAxFKvRWwPboz88Zf3K/0GZB0/DPr5GiumiWc=
Content-Type: multipart/mixed; boundary="===============4439920906554310630=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-eth-typing: upgrading to 3.5.1 SUCCEEDED
Message-ID: <0101018b97fb0ccf-8bc83846-9348-4015-b767-cc19d0497fcd-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106117

--===============4439920906554310630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-eth-typing* to *3.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-eth-typing-upgrade-3.5.0-3.5.1.patch
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
From 47b6cbd1a2be588e811e5ac4e699890647f2989d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 20:54:42 +0000
Subject: [PATCH] python3-eth-typing: upgrade 3.5.0 -> 3.5.1

---
 ...{python3-eth-typing_3.5.0.bb => python3-eth-typing_3.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-typing_3.5.0.bb => python3-eth-typing_3.5.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_3.5.0.bb b/meta-python/recipes-devtools/python/python3-eth-typing_3.5.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-eth-typing_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-typing_3.5.1.bb
index 6a8bec7a5..3723b1931 100644
--- a/meta-python/recipes-devtools/python/python3-eth-typing_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_3.5.1.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "a92f6896896752143a4704c57441eedf7b1f65d5df4b1c20cb802bb4aa602d7e"
+SRC_URI[sha256sum] = "e21a8b0688581a6765f72fa184d86d06c3949e354d4af5293798abc0b4255989"
 
 inherit pypi setuptools3
-- 
2.39.2


--===============4439920906554310630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-eth-typing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/e/eth-typing/eth-typing-3.5.0.tar.gz;downloadfilename=eth-typing-3.5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/e/eth-typing/eth-typing-3.5.1.tar.gz;downloadfilename=eth-typing-3.5.1.tar.gz"
packages/core2-64-poky-linux/python3-eth-typing: PV changed from "3.5.0" to "3.5.1"
packages/core2-64-poky-linux/python3-eth-typing: PKGV changed from 3.5.0 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing-dbg: PV changed from "3.5.0" to "3.5.1"
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing-dbg: PKGV changed from 3.5.0 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing-dev: PV changed from "3.5.0" to "3.5.1"
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing-dev: PKGV changed from 3.5.0 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing-doc: PV changed from "3.5.0" to "3.5.1"
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing-doc: PKGV changed from 3.5.0 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing-locale: PV changed from "3.5.0" to "3.5.1"
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing-locale: PKGV changed from 3.5.0 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing-src: PV changed from "3.5.0" to "3.5.1"
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing-src: PKGV changed from 3.5.0 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing-staticdev: PV changed from "3.5.0" to "3.5.1"
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing-staticdev: PKGV changed from 3.5.0 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing: PV changed from "3.5.0" to "3.5.1"
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing: PKGSIZE changed from 62195 to 65094 (+5%)
packages/core2-64-poky-linux/python3-eth-typing/python3-eth-typing: PKGV changed from 3.5.0 [default] to 3.5.1 [default]
Changes to packages/core2-64-poky-linux/python3-eth-typing (sysroot):
  /usr/lib/python3.11/site-packages/eth_typing-3.5.0.dist-info moved to /usr/lib/python3.11/site-packages/eth_typing-3.5.1.dist-info

--===============4439920906554310630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-eth-typing (sysroot):
  /usr/lib/python3.11/site-packages/eth_typing-3.5.0.dist-info moved to /usr/lib/python3.11/site-packages/eth_typing-3.5.1.dist-info

--===============4439920906554310630==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-eth-typing-upgrade-3.5.0-3.5.1.patch"

RnJvbSA0N2I2Y2JkMWEyYmU1ODhlODExZTVhYzRlNjk5ODkwNjQ3ZjI5ODlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMDo1NDo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZXRoLXR5cGluZzogdXBncmFkZSAzLjUuMCAtPiAzLjUuMQoKLS0tCiAuLi57cHl0aG9u
My1ldGgtdHlwaW5nXzMuNS4wLmJiID0+IHB5dGhvbjMtZXRoLXR5cGluZ18zLjUuMS5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1ldGgtdHlwaW5n
XzMuNS4wLmJiID0+IHB5dGhvbjMtZXRoLXR5cGluZ18zLjUuMS5iYn0gKDc0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWV0aC10eXBp
bmdfMy41LjAuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWV0aC10eXBpbmdfMy41LjEuYmIKc2ltaWxhcml0eSBpbmRleCA3NCUKcmVuYW1lIGZyb20gbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ldGgtdHlwaW5nXzMuNS4w
LmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWV0aC10eXBpbmdfMy41LjEuYmIKaW5kZXggNmE4YmVjN2E1Li4zNzIzYjE5MzEgMTAwNjQ0Ci0t
LSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZXRoLXR5cGlu
Z18zLjUuMC5iYgorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWV0aC10eXBpbmdfMy41LjEuYmIKQEAgLTQsNiArNCw2IEBAIFNFQ1RJT04gPSAiZGV2ZWwv
cHl0aG9uIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT0zZDdiZGZlNjliMWZmYmRlMDczY2E2ZTk2ZjVjNTNmNyIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImE5MmY2ODk2ODk2NzUyMTQzYTQ3MDRjNTc0NDFlZWRmN2IxZjY1ZDVkZjRiMWMy
MGNiODAyYmI0YWE2MDJkN2UiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTIxYThiMDY4ODU4MWE2
NzY1ZjcyZmExODRkODZkMDZjMzk0OWUzNTRkNGFmNTI5Mzc5OGFiYzBiNDI1NTk4OSIKIAogaW5o
ZXJpdCBweXBpIHNldHVwdG9vbHMzCi0tIAoyLjM5LjIKCg==

--===============4439920906554310630==--

