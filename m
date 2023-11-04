Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7867C15504
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2196.1699061893494096279
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eKNxoS5n;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QYtgkGfE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b97fb0d79-1e013d6e-86b9-48de-969e-dac775fcf230-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/+cXzfubugxaIhz4Iy1MgdhVNvtIgjmuGRY7HK/Tcgs=;
	b=eKNxoS5n9BHbheCROCksQmuUiySgiZPiTLsQzyGQy+0IZ20oKspI6FSjvysFR7eT
	dnLL/LUyGOzjN0MVYywynNoszxOgwpjDh+oEAhkKVDJSNtEwYOLsOegfrTVsxUY504P
	ijTzImuJVoeHXjLCheNf47OYdd8wD07qlEMaw6ZU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/+cXzfubugxaIhz4Iy1MgdhVNvtIgjmuGRY7HK/Tcgs=;
	b=QYtgkGfETOlDi5A4WA7IDTwFtGH2Wat0D2SL8v6plr/St+N5FsL31W9i70wQc1TH
	SH3RvkIne8cwWpSoNHgHjZoO/Rr/F1wFv2sAL4HUiHHKj9My1GanZXsmmrYoSDmnUL2
	36FzR/SiHaoyc4IgHvWhS9DRRMvRGQKgdxze8Lzc=
Content-Type: multipart/mixed; boundary="===============6203995623251014518=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-filelock: upgrading to 3.13.1 SUCCEEDED
Message-ID: <0101018b97fb0d79-1e013d6e-86b9-48de-969e-dac775fcf230-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106110

--===============6203995623251014518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-filelock* to *3.13.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-filelock-upgrade-3.12.4-3.13.1.patch
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
From d1609753d0b9c9ccc7462537dba5bb59883b1e77 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 21:06:33 +0000
Subject: [PATCH] python3-filelock: upgrade 3.12.4 -> 3.13.1

---
 .../{python3-filelock_3.12.4.bb => python3-filelock_3.13.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.12.4.bb => python3-filelock_3.13.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb b/meta-python/recipes-devtools/python/python3-filelock_3.13.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.13.1.bb
index 49a9d956a..444c48441 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.12.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.13.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "2e6f249f1f3654291606e046b09f1fd5eac39b360664c27f5aad072012f8bcbd"
+SRC_URI[sha256sum] = "521f5f56c50f8426f5e03ad3b281b490a87ef15bc6c526f168290f0c7148d44e"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.39.2


--===============6203995623251014518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-filelock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/f/filelock/filelock-3.12.4.tar.gz;downloadfilename=filelock-3.12.4.tar.gz" to "https://files.pythonhosted.org/packages/source/f/filelock/filelock-3.13.1.tar.gz;downloadfilename=filelock-3.13.1.tar.gz"
packages/core2-64-poky-linux/python3-filelock: PKGV changed from 3.12.4 [default] to 3.13.1 [default]
packages/core2-64-poky-linux/python3-filelock: PV changed from "3.12.4" to "3.13.1"
packages/core2-64-poky-linux/python3-filelock/python3-filelock-dbg: PKGV changed from 3.12.4 [default] to 3.13.1 [default]
packages/core2-64-poky-linux/python3-filelock/python3-filelock-dbg: PV changed from "3.12.4" to "3.13.1"
packages/core2-64-poky-linux/python3-filelock/python3-filelock-dev: PKGV changed from 3.12.4 [default] to 3.13.1 [default]
packages/core2-64-poky-linux/python3-filelock/python3-filelock-dev: PV changed from "3.12.4" to "3.13.1"
packages/core2-64-poky-linux/python3-filelock/python3-filelock-doc: PKGV changed from 3.12.4 [default] to 3.13.1 [default]
packages/core2-64-poky-linux/python3-filelock/python3-filelock-doc: PV changed from "3.12.4" to "3.13.1"
packages/core2-64-poky-linux/python3-filelock/python3-filelock-locale: PKGV changed from 3.12.4 [default] to 3.13.1 [default]
packages/core2-64-poky-linux/python3-filelock/python3-filelock-locale: PV changed from "3.12.4" to "3.13.1"
packages/core2-64-poky-linux/python3-filelock/python3-filelock-src: PKGV changed from 3.12.4 [default] to 3.13.1 [default]
packages/core2-64-poky-linux/python3-filelock/python3-filelock-src: PV changed from "3.12.4" to "3.13.1"
packages/core2-64-poky-linux/python3-filelock/python3-filelock-staticdev: PKGV changed from 3.12.4 [default] to 3.13.1 [default]
packages/core2-64-poky-linux/python3-filelock/python3-filelock-staticdev: PV changed from "3.12.4" to "3.13.1"
packages/core2-64-poky-linux/python3-filelock/python3-filelock: PKGV changed from 3.12.4 [default] to 3.13.1 [default]
packages/core2-64-poky-linux/python3-filelock/python3-filelock: PKGSIZE changed from 53699 to 56958 (+6%)
packages/core2-64-poky-linux/python3-filelock/python3-filelock: PV changed from "3.12.4" to "3.13.1"
Changes to packages/core2-64-poky-linux/python3-filelock (sysroot):
  /usr/lib/python3.11/site-packages/filelock-3.12.4.dist-info moved to /usr/lib/python3.11/site-packages/filelock-3.13.1.dist-info

--===============6203995623251014518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-filelock (sysroot):
  /usr/lib/python3.11/site-packages/filelock-3.12.4.dist-info moved to /usr/lib/python3.11/site-packages/filelock-3.13.1.dist-info

--===============6203995623251014518==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-filelock-upgrade-3.12.4-3.13.1.patch"

RnJvbSBkMTYwOTc1M2QwYjljOWNjYzc0NjI1MzdkYmE1YmI1OTg4M2IxZTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMTowNjozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZmlsZWxvY2s6IHVwZ3JhZGUgMy4xMi40IC0+IDMuMTMuMQoKLS0tCiAuLi4ve3B5dGhv
bjMtZmlsZWxvY2tfMy4xMi40LmJiID0+IHB5dGhvbjMtZmlsZWxvY2tfMy4xMy4xLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1maWxlbG9ja18z
LjEyLjQuYmIgPT4gcHl0aG9uMy1maWxlbG9ja18zLjEzLjEuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1maWxlbG9ja18z
LjEyLjQuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZp
bGVsb2NrXzMuMTMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZpbGVsb2NrXzMuMTIuNC5iYgpy
ZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1maWxl
bG9ja18zLjEzLjEuYmIKaW5kZXggNDlhOWQ5NTZhLi40NDRjNDg0NDEgMTAwNjQ0Ci0tLSBhL21l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmlsZWxvY2tfMy4xMi40
LmJiCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmls
ZWxvY2tfMy4xMy4xLmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5LWZp
bGVsb2NrLnJlYWR0aGVkb2NzLmlvLyIKIExJQ0VOU0UgPSAiVW5saWNlbnNlIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9OTExNjkwZjUxYWYzMjI0NDAyMzdhMjUzZDY5
NWQxOWYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyZTZmMjQ5ZjFmMzY1NDI5MTYwNmUwNDZi
MDlmMWZkNWVhYzM5YjM2MDY2NGMyN2Y1YWFkMDcyMDEyZjhiY2JkIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjUyMWY1ZjU2YzUwZjg0MjZmNWUwM2FkM2IyODFiNDkwYTg3ZWYxNWJjNmM1MjZmMTY4
MjkwZjBjNzE0OGQ0NGUiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIGlu
aGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCi0tIAoyLjM5LjIKCg==

--===============6203995623251014518==--

