Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16058C18E0D
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:23 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2216.1699061899766438265
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LbIZGFpN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CTt+tnH8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b97fb1f52-aa7cd873-7530-4e33-b8e0-67cc56f8fec6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9n88eMa7f5HZtOyfCOFRednu7tnvTAsViZSWABVR8fQ=;
	b=LbIZGFpNAe339XcdLFQXLyVwbJ5ClccXbXN9bcjFXacGvq4Cf5s69BBt0S9ej0lO
	ezkdQVrMWM1h4sAYDxwdSZkGpojM7DhW26OBgMC+jbF0af2HnzIsNXPOYofR8VGGxr3
	a+P5rqkmOSnjd26JzDPohG+STqVkS1GZMY+qsCT4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9n88eMa7f5HZtOyfCOFRednu7tnvTAsViZSWABVR8fQ=;
	b=CTt+tnH8ekwJE96JmCXXOL3kETpHflHpBC8tourkSlpiGQKIGTf1/BthH3VeJ2U0
	SmikYWNEn02jc4Qk7GqU9Kwfov711uUizlkuOtUcOvgj9/9EnKZ2QPm+8vjbG9CH/IX
	nTXnnC+Pv4hDyuj8C3IGOMJcVUXKcxR7ijs1htfU=
Content-Type: multipart/mixed; boundary="===============2307578700351711485=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-traitlets: upgrading to 5.13.0 SUCCEEDED
Message-ID: <0101018b97fb1f52-aa7cd873-7530-4e33-b8e0-67cc56f8fec6-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:19 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106181

--===============2307578700351711485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-traitlets* to *5.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-traitlets-upgrade-5.11.2-5.13.0.patch
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
From dceddd0e7cc1028091b5cd01b1e69c2d3e610ad6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 00:53:51 +0000
Subject: [PATCH] python3-traitlets: upgrade 5.11.2 -> 5.13.0

---
 ...{python3-traitlets_5.11.2.bb => python3-traitlets_5.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.11.2.bb => python3-traitlets_5.13.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.11.2.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.13.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.11.2.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.13.0.bb
index f2f70b818..c16c1ef0e 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13bed0ee6f46a6f6dbf1f9f9572f250a"
 
-SRC_URI[sha256sum] = "7564b5bf8d38c40fa45498072bf4dc5e8346eb087bbf1e2ae2d8774f6a0f078e"
+SRC_URI[sha256sum] = "9b232b9430c8f57288c1024b34a8f0251ddcc47268927367a0dd3eeaca40deb5"
 
 inherit pypi python_hatchling
 
-- 
2.39.2


--===============2307578700351711485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-traitlets: PKGV changed from 5.11.2 [default] to 5.13.0 [default]
packages/core2-64-poky-linux/python3-traitlets: PV changed from "5.11.2" to "5.13.0"
packages/core2-64-poky-linux/python3-traitlets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/traitlets/traitlets-5.11.2.tar.gz;downloadfilename=traitlets-5.11.2.tar.gz" to "https://files.pythonhosted.org/packages/source/t/traitlets/traitlets-5.13.0.tar.gz;downloadfilename=traitlets-5.13.0.tar.gz"
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets-dbg: PKGV changed from 5.11.2 [default] to 5.13.0 [default]
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets-dbg: PV changed from "5.11.2" to "5.13.0"
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets-dev: PKGV changed from 5.11.2 [default] to 5.13.0 [default]
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets-dev: PV changed from "5.11.2" to "5.13.0"
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets-doc: PKGV changed from 5.11.2 [default] to 5.13.0 [default]
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets-doc: PV changed from "5.11.2" to "5.13.0"
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets-locale: PKGV changed from 5.11.2 [default] to 5.13.0 [default]
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets-locale: PV changed from "5.11.2" to "5.13.0"
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets-src: PKGV changed from 5.11.2 [default] to 5.13.0 [default]
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets-src: PV changed from "5.11.2" to "5.13.0"
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets-staticdev: PKGV changed from 5.11.2 [default] to 5.13.0 [default]
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets-staticdev: PV changed from "5.11.2" to "5.13.0"
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets: PKGV changed from 5.11.2 [default] to 5.13.0 [default]
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets: PV changed from "5.11.2" to "5.13.0"
packages/core2-64-poky-linux/python3-traitlets/python3-traitlets: PKGSIZE changed from 695516 to 717223 (+3%)
Changes to packages/core2-64-poky-linux/python3-traitlets (sysroot):
  /usr/lib/python3.11/site-packages/traitlets-5.11.2.dist-info moved to /usr/lib/python3.11/site-packages/traitlets-5.13.0.dist-info

--===============2307578700351711485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-traitlets (sysroot):
  /usr/lib/python3.11/site-packages/traitlets-5.11.2.dist-info moved to /usr/lib/python3.11/site-packages/traitlets-5.13.0.dist-info

--===============2307578700351711485==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-traitlets-upgrade-5.11.2-5.13.0.patch"

RnJvbSBkY2VkZGQwZTdjYzEwMjgwOTFiNWNkMDFiMWU2OWMyZDNlNjEwYWQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMDo1Mzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJhaXRsZXRzOiB1cGdyYWRlIDUuMTEuMiAtPiA1LjEzLjAKCi0tLQogLi4ue3B5dGhv
bjMtdHJhaXRsZXRzXzUuMTEuMi5iYiA9PiBweXRob24zLXRyYWl0bGV0c181LjEzLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdHJhaXRsZXRz
XzUuMTEuMi5iYiA9PiBweXRob24zLXRyYWl0bGV0c181LjEzLjAuYmJ9ICg3NiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cmFpdGxl
dHNfNS4xMS4yLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My10cmFpdGxldHNfNS4xMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNzYlCnJlbmFtZSBmcm9tIG1l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJhaXRsZXRzXzUuMTEu
Mi5iYgpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My10cmFpdGxldHNfNS4xMy4wLmJiCmluZGV4IGYyZjcwYjgxOC4uYzE2YzFlZjBlIDEwMDY0NAot
LS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyYWl0bGV0
c181LjExLjIuYmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy10cmFpdGxldHNfNS4xMy4wLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRw
Oi8vaXB5dGhvbi5vcmciCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTEzYmVkMGVlNmY0NmE2ZjZkYmYxZjlmOTU3MmYyNTBh
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzU2NGI1YmY4ZDM4YzQwZmE0NTQ5ODA3MmJmNGRj
NWU4MzQ2ZWIwODdiYmYxZTJhZTJkODc3NGY2YTBmMDc4ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI5YjIzMmI5NDMwYzhmNTcyODhjMTAyNGIzNGE4ZjAyNTFkZGNjNDcyNjg5MjczNjdhMGRkM2Vl
YWNhNDBkZWI1IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjM5LjIK
Cg==

--===============2307578700351711485==--

